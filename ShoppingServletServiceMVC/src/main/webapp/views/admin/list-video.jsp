<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Quản Lý Video</title>

<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-4">
    <h2 class="text-primary fw-bold mb-0"><i class="bi bi-camera-video me-2"></i>Quản Lý Video</h2>
    <a href="${pageContext.request.contextPath}/views/admin/add-video.jsp" class="btn btn-success">
        <i class="bi bi-plus-lg me-1"></i>Thêm Video Mới
    </a>
</div>

<div class="card shadow-sm overflow-hidden">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover table-bordered align-middle mb-0">
                <thead class="table-dark">
                    <tr>
                        <th class="text-center" width="10%">Video ID</th>
                        <th class="text-center" width="15%">Poster</th>
                        <th width="35%">Tiêu đề</th>
                        <th class="text-center" width="12%">Lượt xem</th>
                        <th class="text-center" width="28%">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${videos}" var="video">
                        <tr>
                            <td class="text-center fw-bold">${video.videoId}</td>
                            <td class="text-center">
                                <video class="rounded bg-dark" style="height: 60px; max-width: 100px; object-fit: cover;" preload="metadata" muted>
                                    <source src="${pageContext.request.contextPath}/uploads/${video.poster}" type="video/mp4">
                                </video>
                            </td>
                            <td class="fw-semibold">${video.title}</td>
                            <td class="text-center">${video.views}</td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/video/detail?id=${video.videoId}" class="btn btn-sm btn-info text-white">
                                    <i class="bi bi-eye me-1"></i>Xem
                                </a>
                                <a href="${pageContext.request.contextPath}/admin/video/edit?id=${video.videoId}" class="btn btn-sm btn-warning text-dark">
                                    <i class="bi bi-pencil-square me-1"></i>Sửa
                                </a>
                                <a href="${pageContext.request.contextPath}/admin/video/delete?id=${video.videoId}" class="btn btn-sm btn-danger"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa video này?');">
                                    <i class="bi bi-trash me-1"></i>Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>