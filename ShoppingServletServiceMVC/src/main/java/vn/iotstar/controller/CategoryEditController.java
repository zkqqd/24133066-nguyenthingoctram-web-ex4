package vn.iotstar.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.model.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/admin/category/edit" })
public class CategoryEditController extends HttpServlet {
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = cateService.findById(id);
        req.setAttribute("category", category);
        req.getRequestDispatcher("/views/admin/edit-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Category category = new Category();
        
        category.setCategoryId(Integer.parseInt(req.getParameter("id")));
        category.setCategoryName(req.getParameter("catename"));
        category.setImages(req.getParameter("icon"));
        category.setStatus(1); 
        
        cateService.update(category);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}