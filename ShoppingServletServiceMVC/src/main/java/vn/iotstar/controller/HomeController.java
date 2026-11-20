package vn.iotstar.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.model.Video;
import vn.iotstar.service.VideoService;
import vn.iotstar.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/home" })
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final VideoService videoService = new VideoServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Video> latestVideos;
        try {
            latestVideos = videoService.findLatestVideos(10);
        } catch (Exception e) {
            e.printStackTrace();
            latestVideos = Collections.emptyList();
            req.setAttribute("error", "Không thể tải danh sách video. Vui lòng thử lại sau.");
        }
        req.setAttribute("videos", latestVideos);

        req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
    }
}