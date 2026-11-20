package vn.iotstar.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.service.UserService;
import vn.iotstar.service.impl.UserServiceImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/reset-password")
public class ResetPasswordController extends HttpServlet {
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("reset_otp") == null) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }
        req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("reset_otp") == null || session.getAttribute("reset_email") == null) {
            resp.sendRedirect(req.getContextPath() + "/forgot-password");
            return;
        }

        String inputOtp = req.getParameter("otp");
        String newPassword = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        String sessionOtp = (String) session.getAttribute("reset_otp");
        String email = (String) session.getAttribute("reset_email");

        if (inputOtp == null || !inputOtp.trim().equals(sessionOtp)) {
            req.setAttribute("alert", "Mã OTP không chính xác!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }

        if (newPassword == null || newPassword.trim().isEmpty() || !newPassword.equals(confirmPassword)) {
            req.setAttribute("alert", "Mật khẩu xác nhận không khớp hoặc rỗng!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            return;
        }

        boolean isUpdated = userService.resetPassword(email, newPassword);

        if (isUpdated) {
            session.removeAttribute("reset_otp");
            session.removeAttribute("reset_email");
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("alert", "Lỗi cập nhật mật khẩu!");
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
        }
    }
}