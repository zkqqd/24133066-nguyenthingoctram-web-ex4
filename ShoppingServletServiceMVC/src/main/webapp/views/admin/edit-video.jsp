<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Chỉnh sửa Video</title>

<div class="row justify-content-center">
    <div class="col-lg-7">
        <div class="card p-4">
            <h4 class="fw-bold text-primary mb-4"><i class="bi bi-pencil-square me-2"></i>Chỉnh sửa Video</h4>

            <form action="${pageContext.request.contextPath}/admin/video/edit" method="post"
                  enctype="multipart/form-data" class="needs-validation" novalidate>
                <input type="hidden" name="videoId" value="${video.videoId}">

                <div class="mb-3">
                    <label class="form-label fw-semibold">Tiêu đề Video <span class="text-danger">*</span></label>
                    <input type="text" name="title" class="form-control" value="${video.title}" required minlength="3" maxlength="200">
                    <div class="invalid-feedback">Tiêu đề phải từ 3 đến 200 ký tự.</div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Mô tả <span class="text-danger">*</span></label>
                    <textarea name="description" rows="4" class="form-control" required minlength="10">${video.description}</textarea>
                    <div class="invalid-feedback">Mô tả phải có ít nhất 10 ký tự.</div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Đổi ảnh Poster (bỏ trống nếu giữ nguyên)</label>
                    <input type="file" name="poster" accept="image/*" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Đổi File Video (bỏ trống nếu giữ nguyên)</label>
                    <input type="file" name="videoFile" accept="video/*" class="form-control">
                </div>
                <div class="form-check form-switch mb-4">
                    <input class="form-check-input" type="checkbox" name="active" value="true" id="active" ${video.active ? 'checked' : ''}>
                    <label class="form-check-label" for="active">Hiển thị công khai</label>
                </div>
                <div class="d-flex gap-2 justify-content-end">
                    <a href="${pageContext.request.contextPath}/admin/videos" class="btn btn-secondary">Hủy</a>
                    <button type="submit" class="btn btn-primary px-4">Lưu thay đổi</button>
                </div>
            </form>
        </div>
    </div>
</div>