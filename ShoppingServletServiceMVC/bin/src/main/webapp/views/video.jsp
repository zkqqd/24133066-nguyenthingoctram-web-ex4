<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="video-list">
    <c:forEach items="${videos}" var="video">
        <div class="video-item">
            <a href="${pageContext.request.contextPath}/video/detail?id=${video.videoId}">
                <h3>${video.title}</h3>
            </a>
			<video class="card-img-top" style="height: 180px; object-fit: cover;" preload="metadata" muted 
			       onmouseover="this.play()" onmouseout="this.pause(); this.currentTime=0;">
			    <source src="${pageContext.request.contextPath}/uploads/${video.poster}" type="video/mp4">
			</video>
        </div>
    </c:forEach>
</div>

<div class="pagination">
    <c:if test="${currentPage > 1}">
        <a href="?page=${currentPage - 1}">Previous</a>
    </c:if>
    <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
    </c:forEach>
    <c:if test="${currentPage < totalPages}">
        <a href="?page=${currentPage + 1}">Next</a>
    </c:if>
</div>