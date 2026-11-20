package vn.iotstar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.CloudinaryUtil;
import vn.iotstar.util.EmailUtil;

import java.io.IOException;
import java.util.Random;

@WebServlet(urlPatterns = {"/profile", "/profile/verify-email"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
        maxFileSize = 1024 * 1024 * 10,       // 10MB
        maxRequestSize = 1024 * 1024 * 20     // 20MB
)
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String path = req.getServletPath();
        if ("/profile/verify-email".equals(path)) {
            handleVerifyEmailOtp(req, resp, session);
        } else {
            handleUpdateProfile(req, resp, session);
        }
    }

    private void handleUpdateProfile(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
            throws ServletException, IOException {
        User currentUser = (User) session.getAttribute("account");

        String fullname = req.getParameter("fullname") != null ? req.getParameter("fullname").trim() : "";
        String phone = req.getParameter("phone") != null ? req.getParameter("phone").trim() : "";
        String newEmail = req.getParameter("email") != null ? req.getParameter("email").trim() : "";

        if (fullname.length() < 2) {
            req.setAttribute("error", "Họ tên phải có ít nhất 2 ký tự.");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }
        if (!phone.matches("^(0[35789])[0-9]{8}$")) {
            req.setAttribute("error", "Số điện thoại không hợp lệ (gồm 10 số, bắt đầu bằng 03, 05, 07, 08, 09).");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }
        if (!newEmail.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            req.setAttribute("error", "Định dạng email không hợp lệ.");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }

        try {
            Part imagePart = req.getPart("imageFile");
            if (imagePart != null && imagePart.getSize() > 0) {
                String contentType = imagePart.getContentType();
                if (contentType == null || !contentType.startsWith("image/")) {
                    req.setAttribute("error", "Chỉ chấp nhận file hình ảnh (JPG, PNG, WEBP).");
                    req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
                    return;
                }
                String imageUrl = CloudinaryUtil.uploadImage(imagePart);
                if (imageUrl != null) {
                    currentUser.setImages(imageUrl);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Upload ảnh lên Cloudinary thất bại: " + e.getMessage());
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }

        currentUser.setFullname(fullname);
        currentUser.setPhone(phone);

        boolean emailChanged = !newEmail.equalsIgnoreCase(currentUser.getEmail());
        if (emailChanged) {
            userService.update(currentUser);
            session.setAttribute("account", currentUser);

            String otp = String.format("%06d", new Random().nextInt(999999));
            session.setAttribute("pendingNewEmail", newEmail);
            session.setAttribute("emailUpdateOtp", otp);
            session.setAttribute("emailOtpExpire", System.currentTimeMillis() + 5 * 60 * 1000); // 5 phút

            try {
                EmailUtil.sendEmail(newEmail, "Xác nhận đổi Email - VideoHub",
                        "Mã OTP xác nhận đổi email mới của bạn là: " + otp + "\nMã có hiệu lực trong 5 phút.");
                req.setAttribute("showOtpForm", true);
                req.setAttribute("message", "Đã lưu thông tin cơ bản. Vui lòng nhập mã OTP vừa gửi tới email mới: " + newEmail);
            } catch (Exception e) {
                req.setAttribute("error", "Không thể gửi OTP tới email mới: " + e.getMessage());
            }
        } else {
            userService.update(currentUser);
            session.setAttribute("account", currentUser);
            req.setAttribute("message", "Cập nhật hồ sơ thành công!");
        }

        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }

    private void handleVerifyEmailOtp(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
            throws ServletException, IOException {
        String inputOtp = req.getParameter("otp") != null ? req.getParameter("otp").trim() : "";
        String savedOtp = (String) session.getAttribute("emailUpdateOtp");
        String pendingNewEmail = (String) session.getAttribute("pendingNewEmail");
        Long expireTime = (Long) session.getAttribute("emailOtpExpire");

        if (savedOtp == null || pendingNewEmail == null || expireTime == null) {
            req.setAttribute("error", "Phiên xác nhận OTP không tồn tại. Vui lòng thử lại.");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }

        if (System.currentTimeMillis() > expireTime) {
            session.removeAttribute("emailUpdateOtp");
            session.removeAttribute("pendingNewEmail");
            req.setAttribute("error", "Mã OTP đã hết hạn. Vui lòng gửi lại.");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }

        if (!savedOtp.equals(inputOtp)) {
            req.setAttribute("showOtpForm", true);
            req.setAttribute("error", "Mã OTP không chính xác.");
            req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
            return;
        }

        User currentUser = (User) session.getAttribute("account");
        currentUser.setEmail(pendingNewEmail);
        userService.update(currentUser);
        session.setAttribute("account", currentUser);

        session.removeAttribute("emailUpdateOtp");
        session.removeAttribute("pendingNewEmail");
        session.removeAttribute("emailOtpExpire");

        req.setAttribute("message", "Xác nhận OTP thành công! Email mới đã được cập nhật.");
        req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
    }
}