<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ</title>
</head>
<body>
    <div class="container">
        <h2 class="border-bottom pb-2 mb-4 text-primary"><i class="fa-solid fa-fire"></i> 10 Video Mới Nhất</h2>
        <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4 mb-5">
            <c:forEach items="${videos}" var="video">
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <a href="${pageContext.request.contextPath}/video/detail?id=${video.videoId}">
                            <video class="card-img-top" style="height: 180px; object-fit: cover;" preload="metadata" muted 
                                   onmouseover="this.play()" onmouseout="this.pause(); this.currentTime=0;">
                                <source src="${pageContext.request.contextPath}/uploads/${video.poster}" type="video/mp4">
                            </video>
                        </a>
                        <div class="card-body d-flex flex-column">
                            <h6 class="card-title text-truncate" title="${video.title}">
                                <a href="${pageContext.request.contextPath}/video/detail?id=${video.videoId}" class="text-decoration-none text-dark">${video.title}</a>
                            </h6>
                            <p class="card-text text-muted small mt-auto"><i class="fa-regular fa-eye"></i> Lượt xem: ${video.views}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>