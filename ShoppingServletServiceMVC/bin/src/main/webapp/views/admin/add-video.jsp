<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Video Mới</title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0"><i class="fa-solid fa-plus-circle"></i> Thêm Video Mới</h4>
                    </div>
                    <div class="card-body p-4">
                        <form method="post" action="${pageContext.request.contextPath}/admin/video/insert"
                              enctype="multipart/form-data" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label fw-bold" for="videoId">Mã Video (Video ID) <span class="text-danger">*</span></label>
                                <input type="text" id="videoId" name="videoId"
                                       class="form-control ${not empty errors.videoId ? 'is-invalid' : ''}"
                                       placeholder="VD: VID_001" value="${fn:escapeXml(param.videoId)}"
                                       required minlength="3" maxlength="20" pattern="[A-Za-z0-9_\-]{3,20}"
                                       data-msg-required="Vui lòng nhập mã video"
                                       data-msg-pattern="Mã video 3-20 ký tự, chỉ gồm chữ không dấu, số, - và _">
                                <div class="invalid-feedback" data-for="videoId">${errors.videoId}</div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold" for="title">Tiêu đề (Title) <span class="text-danger">*</span></label>
                                <input type="text" id="title" name="title"
                                       class="form-control ${not empty errors.title ? 'is-invalid' : ''}"
                                       placeholder="Nhập tiêu đề video..." value="${fn:escapeXml(param.title)}"
                                       required minlength="3" maxlength="255"
                                       data-msg-required="Vui lòng nhập tiêu đề">
                                <div class="invalid-feedback" data-for="title">${errors.title}</div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold" for="description">Mô tả (Description)</label>
                                <textarea id="description" name="description" rows="4" maxlength="2000"
                                          class="form-control ${not empty errors.description ? 'is-invalid' : ''}"
                                          placeholder="Nhập mô tả...">${fn:escapeXml(param.description)}</textarea>
                                <div class="invalid-feedback" data-for="description">${errors.description}</div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold" for="poster">Chọn file video/poster upload <span class="text-danger">*</span></label>
                                <input type="file" id="poster" name="poster" accept="video/*,image/*"
                                       class="form-control ${not empty errors.poster ? 'is-invalid' : ''}" required
                                       data-msg-required="Vui lòng chọn file video/poster"
                                       data-extensions="mp4,webm,ogg,mov,jpg,jpeg,png,gif,webp" data-max-size="10485760">
                                <div class="invalid-feedback" data-for="poster">${errors.poster}</div>
                                <div class="form-text">Video MP4/WEBM/OGG/MOV hoặc ảnh, tối đa 10 MB.</div>
                            </div>
                            
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <a href="${pageContext.request.contextPath}/admin/videos" class="btn btn-secondary">Hủy</a>
                                <button type="submit" class="btn btn-primary"><i class="fa-solid fa-cloud-arrow-up"></i> Upload Video</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>