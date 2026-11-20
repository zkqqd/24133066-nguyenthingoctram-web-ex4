package vn.iotstar.controller.admin;

import vn.iotstar.model.Video;
import vn.iotstar.service.VideoService;
import vn.iotstar.service.impl.VideoServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/video/edit"})
public class VideoEditFormController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    VideoService videoService = new VideoServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String videoId = req.getParameter("id");
        Video video = videoService.findById(videoId);
        req.setAttribute("video", video);
        req.getRequestDispatcher("/views/admin/edit-video.jsp").forward(req, resp);
    }
}