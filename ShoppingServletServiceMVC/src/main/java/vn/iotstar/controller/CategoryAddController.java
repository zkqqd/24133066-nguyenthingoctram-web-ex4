package vn.iotstar.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import vn.iotstar.model.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.service.impl.CategoryServiceImpl;

@SuppressWarnings("serial")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, 
    maxFileSize = 1024 * 1024 * 5, 
    maxRequestSize = 1024 * 1024 * 5 * 5
)
@WebServlet(urlPatterns = { "/admin/category/add" })
public class CategoryAddController extends HttpServlet {
    
    CategoryService cateService = new CategoryServiceImpl();
    
    private static final String UPLOAD_DIRECTORY = "E:\\upload";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/add-category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Category category = new Category();
    
        String categoryname = req.getParameter("catename");
        category.setCategoryName(categoryname); 
        
        category.setStatus(1); 
        
        String fname = "";
        String uploadPath = UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        try {
            Part part = req.getPart("icon"); 
            if (part.getSize() > 0) {
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                int index = filename.lastIndexOf(".");
                String ext = filename.substring(index + 1);
                fname = System.currentTimeMillis() + "." + ext;
            
                part.write(uploadPath + "/" + fname);

                category.setImages(fname);
            } else {

                category.setImages("avata.png");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        cateService.insert(category);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}