package vn.iotstar.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.HttpServletResponse;

public class ViewIncludeFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        if (request instanceof HttpServletRequest) {
            chain.doFilter(new ViewIncludeRequest((HttpServletRequest) request), response);
        } else {
            chain.doFilter(request, response);
        }
    }

    private static class ViewIncludeRequest extends HttpServletRequestWrapper {

        ViewIncludeRequest(HttpServletRequest request) {
            super(request);
        }

        @Override
        public RequestDispatcher getRequestDispatcher(String path) {
            final RequestDispatcher target = super.getRequestDispatcher(path);
            if (target == null || path == null || !path.startsWith("/views/")) {
                return target;
            }
            return new RequestDispatcher() {
                @Override
                public void forward(ServletRequest req, ServletResponse res)
                        throws ServletException, IOException {
                    if (res instanceof HttpServletResponse && !res.isCommitted()) {
                        res.resetBuffer();
                        res.setContentType("text/html;charset=UTF-8");
                    }
                    target.include(req, res);
                }

                @Override
                public void include(ServletRequest req, ServletResponse res)
                        throws ServletException, IOException {
                    target.include(req, res);
                }
            };
        }
    }
}