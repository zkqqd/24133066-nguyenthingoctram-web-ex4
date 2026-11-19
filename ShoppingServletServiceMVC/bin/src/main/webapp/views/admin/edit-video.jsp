<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sửa Video</title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-warning text-dark">
                        <h4 class="mb-0"><i class="fa-solid fa-pen-to-square"></i> Cập Nhật Video</h4>
                    </div>
                    <div class="card-body p-4">
                        <form method="post" action="${pageContext.request.contextPath}/admin/video/update"
                              enctype="multipart/form-data" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label fw-bold" for="videoId">Mã Video (Video ID):</label>
                                <input type="text" id="videoId" class="form-control bg-light" name="videoId"
                                       value="${fn:escapeXml(video.videoId)}" readonly />
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold" for="title">Tiêu đề (Title) <span class="text-danger">*</span></label>
                                <input type="text" id="title" name="title"
                                       class="form-control ${not empty errors.title ? 'is-invalid' : ''}"
                                       value="${fn:escapeXml(video.title)}"
                                       required minlength="3" maxlength="255"
                                       data-msg-required="Vui lòng nhập tiêu đề">
                                <div class="invalid-feedback" data-for="title">${errors.title}</div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold" for="description">Mô tả (Description)</label>
                                <textarea id="description" name="description" rows="4" maxlength="2000"
                                          class="form-control ${not empty errors.description ? 'is-invalid' : ''}">${fn:escapeXml(video.description)}</textarea>
                                <div class="invalid-feedback" data-for="description">${errors.description}</div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold">File video/poster hiện tại:</label>
                                <div><span class="badge bg-secondary">${fn:escapeXml(video.poster)}</span></div>
                                <label class="form-label fw-bold mt-2" for="poster">Đổi file khác (Bỏ trống nếu giữ nguyên):</label>
                                <input type="file" id="poster" name="poster" accept="video/*,image/*"
                                       class="form-control ${not empty errors.poster ? 'is-invalid' : ''}"
                                       data-extensions="mp4,webm,ogg,mov,jpg,jpeg,png,gif,webp" data-max-size="10485760">
                                <div class="invalid-feedback" data-for="poster">${errors.poster}</div>
                            </div>
                            
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <a href="${pageContext.request.contextPath}/admin/videos" class="btn btn-secondary">Hủy</a>
                                <button type="submit" class="btn btn-warning"><i class="fa-solid fa-save"></i> Lưu Thay Đổi</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>