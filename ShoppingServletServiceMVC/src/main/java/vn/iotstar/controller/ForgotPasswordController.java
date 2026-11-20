package vn.iotstar.controller;

import java.io.IOException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;
import vn.iotstar.util.EmailUtil;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/forgot-password")
public class ForgotPasswordController extends HttpServlet {
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");

        if (!userService.checkExistEmail(email)) {
            req.setAttribute("alert", "Email không tồn tại trong hệ thống!");
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
            return;
        }

        Random rnd = new Random();
        String otp = String.format("%06d", rnd.nextInt(999999));

        boolean isSent = EmailUtil.sendEmail(email, "Mã xác thực đổi mật khẩu", "Mã OTP khôi phục mật khẩu: " + otp);

        if (isSent) {
            HttpSession session = req.getSession();
            session.setAttribute("reset_otp", otp);
            session.setAttribute("reset_email", email);
            resp.sendRedirect(req.getContextPath() + "/reset-password");
        } else {
            req.setAttribute("alert", "Lỗi gửi email! Vui lòng thử lại sau.");
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
        }
    }
}