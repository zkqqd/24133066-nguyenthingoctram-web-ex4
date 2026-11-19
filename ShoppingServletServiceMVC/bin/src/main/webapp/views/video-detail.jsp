<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${video.title}</title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-9">
                <div class="card shadow-sm mb-4">
                    <div class="ratio ratio-16x9 bg-dark">
                        <video controls autoplay>
                            <source src="${pageContext.request.contextPath}/uploads/${video.poster}" type="video/mp4">
                            Trình duyệt của bạn không hỗ trợ thẻ video.
                        </video>
                    </div>
                    <div class="card-body">
                        <h3 class="card-title text-primary">${video.title}</h3>
                        <p class="text-muted"><i class="fa-solid fa-eye"></i> ${video.views} lượt xem</p>
                        <hr>
                        <h5>Mô tả video:</h5>
                        <p class="card-text" style="white-space: pre-line;">${video.description}</p>
                    </div>
                    <div class="card-footer bg-white">
                        <a href="javascript:history.back()" class="btn btn-outline-secondary"><i class="fa-solid fa-arrow-left"></i> Quay lại</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>