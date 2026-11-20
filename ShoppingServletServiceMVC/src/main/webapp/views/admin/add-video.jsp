<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Thêm Video mới</title>

<div class="row justify-content-center">
    <div class="col-lg-7">
        <div class="card p-4">
            <h4 class="fw-bold text-primary mb-4"><i class="bi bi-plus-circle me-2"></i>Thêm Video mới</h4>

            <form action="${pageContext.request.contextPath}/admin/video/add" method="post"
                  enctype="multipart/form-data" class="needs-validation" novalidate>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Tiêu đề Video <span class="text-danger">*</span></label>
                    <input type="text" name="title" class="form-control" required minlength="3" maxlength="200">
                    <div class="invalid-feedback">Tiêu đề phải từ 3 đến 200 ký tự.</div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Mô tả <span class="text-danger">*</span></label>
                    <textarea name="description" rows="4" class="form-control" required minlength="10"></textarea>
                    <div class="invalid-feedback">Mô tả phải có ít nhất 10 ký tự.</div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Ảnh Poster <span class="text-danger">*</span></label>
                    <input type="file" name="poster" accept="image/*" class="form-control" required>
                    <div class="invalid-feedback">Vui lòng chọn ảnh poster cho video.</div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">File Video <span class="text-danger">*</span></label>
                    <input type="file" name="videoFile" accept="video/*" class="form-control" required>
                    <div class="invalid-feedback">Vui lòng chọn file video cần tải lên.</div>
                </div>
                <div class="form-check form-switch mb-4">
                    <input class="form-check-input" type="checkbox" name="active" value="true" id="active" checked>
                    <label class="form-check-label" for="active">Hiển thị công khai</label>
                </div>
                <div class="d-flex gap-2 justify-content-end">
                    <a href="${pageContext.request.contextPath}/admin/videos" class="btn btn-secondary">Hủy</a>
                    <button type="submit" class="btn btn-primary px-4">Thêm Video</button>
                </div>
            </form>
        </div>
    </div>
</div>