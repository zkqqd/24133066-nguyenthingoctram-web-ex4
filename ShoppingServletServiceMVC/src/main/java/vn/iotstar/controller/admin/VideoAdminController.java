package vn.iotstar.controller.admin;

import vn.iotstar.model.Video;
import vn.iotstar.service.VideoService;
import vn.iotstar.service.impl.VideoServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/video/insert", "/admin/video/update", "/admin/video/delete"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
                 maxFileSize = 1024 * 1024 * 10,      
                 maxRequestSize = 1024 * 1024 * 50)   
public class VideoAdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    VideoService videoService = new VideoServiceImpl();

    public static final String UPLOAD_DIRECTORY = "D:\\uploads"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        if (action.equals("/admin/video/insert")) {
            insertVideo(request, response);
        } else if (action.equals("/admin/video/update")) {
            updateVideo(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getServletPath().equals("/admin/video/delete")) {
            try {
                videoService.delete(request.getParameter("id"));
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/admin/videos");
        }
    }

    private void insertVideo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Video video = new Video();
        video.setVideoId(request.getParameter("videoId"));
        video.setTitle(request.getParameter("title"));
        video.setDescription(request.getParameter("description"));
        
        File uploadDir = new File(UPLOAD_DIRECTORY); 
        if (!uploadDir.exists()) uploadDir.mkdir(); 
        
        try {
            Part part = request.getPart("poster"); 
            String fileName = getFileName(part); 
            if (fileName != null && !fileName.isEmpty() && !fileName.equals("default.file")) { 
                part.write(UPLOAD_DIRECTORY + File.separator + fileName); 
                video.setPoster(fileName);
            }
            videoService.insert(video);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/videos");
    }

    private void updateVideo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String videoId = request.getParameter("videoId");
            Video video = videoService.findById(videoId);
            
            if (video != null) {
                video.setTitle(request.getParameter("title"));
                video.setDescription(request.getParameter("description"));
                
                File uploadDir = new File(UPLOAD_DIRECTORY); 
                if (!uploadDir.exists()) uploadDir.mkdir(); 
                
                Part part = request.getPart("poster"); 
                if (part != null && part.getSize() > 0) { 
                    String fileName = getFileName(part); 
                    if (fileName != null && !fileName.isEmpty() && !fileName.equals("default.file")) { 
                        part.write(UPLOAD_DIRECTORY + File.separator + fileName); 
                        video.setPoster(fileName);
                    }
                }
                
                videoService.update(video);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/videos");
    }

    private String getFileName(Part part) { 
        for (String content : part.getHeader("content-disposition").split(";")) { 
            if (content.trim().startsWith("filename")) { 
                return content.substring(content.indexOf("=") + 2, content.length() - 1); 
            }
        }
        return "default.file"; 
    }
}