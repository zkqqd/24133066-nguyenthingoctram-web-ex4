<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Video</title>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="text-primary"><i class="fa-solid fa-film"></i> Danh Sách Video</h2>
            <a href="${pageContext.request.contextPath}/admin/video/insert" class="btn btn-success"><i class="fa-solid fa-plus"></i> Thêm Video Mới</a>
        </div>

        <div class="card shadow-sm">
            <div class="card-body p-0">
                <table class="table table-hover table-bordered mb-0 align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Poster / Preview</th>
                            <th class="text-start">Tiêu Đề</th>
                            <th>Lượt Xem</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${videos}" var="video">
                            <tr>
                                <td class="fw-bold">${video.videoId}</td>
                                <td>
                                    <video width="120" height="70" style="object-fit: cover; border-radius: 5px;" preload="metadata" muted>
                                        <source src="${pageContext.request.contextPath}/uploads/${video.poster}" type="video/mp4">
                                    </video>
                                </td>
                                <td class="text-start">${video.title}</td>
                                <td><span class="badge bg-secondary">${video.views}</span></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/video/detail?id=${video.videoId}" class="btn btn-sm btn-info text-white"><i class="fa-solid fa-eye"></i> Xem</a>
                                    <a href="${pageContext.request.contextPath}/admin/video/edit?id=${video.videoId}" class="btn btn-sm btn-warning text-dark"><i class="fa-solid fa-pen-to-square"></i> Sửa</a>
                                    <a href="${pageContext.request.contextPath}/admin/video/delete?id=${video.videoId}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa video này?');"><i class="fa-solid fa-trash"></i> Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>