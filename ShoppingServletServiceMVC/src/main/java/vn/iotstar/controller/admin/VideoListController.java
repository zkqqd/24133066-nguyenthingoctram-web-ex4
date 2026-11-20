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
import java.util.List;

@WebServlet(urlPatterns = {"/admin/videos"})
public class VideoListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    VideoService videoService = new VideoServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Video> videos = videoService.findLatestVideos(1000); 
        req.setAttribute("videos", videos);
        req.getRequestDispatcher("/views/admin/list-video.jsp").forward(req, resp);
    }
}