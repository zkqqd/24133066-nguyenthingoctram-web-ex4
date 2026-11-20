<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Trang Chủ</title>

<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-4">
    <h2 class="text-primary fw-bold mb-0"><i class="bi bi-fire me-2"></i>10 Video Mới Nhất</h2>
</div>

<c:if test="${not empty error}">
    <div class="alert alert-danger"><c:out value="${error}"/></div>
</c:if>

<div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4 mb-5">
    <c:forEach items="${videos}" var="video">
        <div class="col">
            <div class="card h-100 shadow-sm overflow-hidden">
                <a href="${pageContext.request.contextPath}/video/detail?id=${video.videoId}">
                    <video class="card-img-top bg-dark" style="height: 180px; object-fit: cover;" preload="metadata" muted
                           onmouseover="this.play()" onmouseout="this.pause(); this.currentTime=0;">
                        <source src="${pageContext.request.contextPath}/uploads/${video.poster}" type="video/mp4">
                    </video>
                </a>
                <div class="card-body d-flex flex-column">
                    <h6 class="card-title text-truncate fw-semibold" title="${video.title}">
                        <a href="${pageContext.request.contextPath}/video/detail?id=${video.videoId}" class="text-decoration-none text-dark">
                            ${video.title}
                        </a>
                    </h6>
                    <p class="card-text text-muted small mt-auto mb-0">
                        <i class="bi bi-eye me-1"></i>Lượt xem: ${video.views}
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
