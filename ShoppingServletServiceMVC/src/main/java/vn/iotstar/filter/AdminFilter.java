package vn.iotstar.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.model.User;

@WebFilter(urlPatterns = { "/admin/*", "/views/admin/*" })
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        Object account = (session != null) ? session.getAttribute("account") : null;

        if (account == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        if (((User) account).getRoleid() != 1) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }
        chain.doFilter(request, response);
    }
}