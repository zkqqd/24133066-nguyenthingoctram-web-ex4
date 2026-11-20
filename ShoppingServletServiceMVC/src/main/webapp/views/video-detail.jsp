<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Chi tiết Video</title>

<div class="row justify-content-center">
    <div class="col-lg-9">
        <c:if test="${not empty video}">
            <div class="card shadow-sm overflow-hidden">
                <video class="w-100 bg-dark" style="max-height: 500px;" controls autoplay>
                    <source src="${pageContext.request.contextPath}/uploads/${video.poster}" type="video/mp4">
                    Trình duyệt không hỗ trợ HTML5 video.
                </video>
                <div class="card-body p-4">
                    <h3 class="card-title text-primary fw-bold mb-2">${video.title}</h3>
                    <p class="text-muted small mb-3">
                        <i class="bi bi-eye me-1"></i>Lượt xem: ${video.views}
                    </p>
                    <hr>
                    <h5 class="fw-bold mb-2">Mô tả:</h5>
                    <p class="card-text mb-0" style="white-space: pre-wrap;">${video.description}</p>
                </div>
            </div>
        </c:if>
        <c:if test="${empty video}">
            <div class="alert alert-danger">
                <i class="bi bi-exclamation-triangle me-2"></i>Video không tồn tại hoặc đã bị xóa.
            </div>
        </c:if>
    </div>
</div>