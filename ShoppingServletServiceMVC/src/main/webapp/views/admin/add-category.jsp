<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Thêm danh mục</title>

<div class="row justify-content-center">
    <div class="col-lg-6">
        <div class="card p-4">
            <h4 class="fw-bold text-primary mb-4"><i class="bi bi-folder-plus me-2"></i>Thêm danh mục mới</h4>

            <form action="add" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Tên danh mục <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="catename" placeholder="Nhập tên danh mục" required minlength="2" maxlength="100">
                    <div class="invalid-feedback">Vui lòng nhập tên danh mục (từ 2 đến 100 ký tự).</div>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-semibold">Ảnh đại diện <span class="text-danger">*</span></label>
                    <input type="file" name="icon" accept="image/*" class="form-control" required>
                    <div class="invalid-feedback">Vui lòng chọn ảnh đại diện cho danh mục.</div>
                </div>

                <div class="d-flex justify-content-end gap-2">
                    <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Hủy</a>
                    <button type="submit" class="btn btn-primary px-4">Thêm</button>
                </div>
            </form>
        </div>
    </div>
</div>