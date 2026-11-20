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
@WebServlet(urlPatterns = "/verify-otp")
public class VerifyOtpController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        String inputOtp = req.getParameter("otp");
        HttpSession session = req.getSession();
        
        String sessionOtp = (String) session.getAttribute("otp");
        
        if (inputOtp != null && inputOtp.equals(sessionOtp)) {
            String username = (String) session.getAttribute("reg_username");
            String password = (String) session.getAttribute("reg_password");
            String email = (String) session.getAttribute("reg_email");
            String fullname = (String) session.getAttribute("reg_fullname");
            String phone = (String) session.getAttribute("reg_phone");

            UserService service = new UserServiceImpl();
            boolean isSuccess = service.register(username, password, email, fullname, phone);
            	
            if (isSuccess) {
                session.removeAttribute("otp");
                session.removeAttribute("reg_username");
                session.removeAttribute("reg_password");
                session.removeAttribute("reg_email");
                session.removeAttribute("reg_fullname");
                session.removeAttribute("reg_phone");
                resp.sendRedirect(req.getContextPath() + "/login");
            } else {
                req.setAttribute("error", "Lỗi hệ thống khi đăng ký!");
                req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("error", "Mã OTP không chính xác!");
            req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
        }
    }
}