<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>Sửa danh mục</title>

<div class="row justify-content-center">
    <div class="col-lg-6">
        <div class="card p-4">
            <h4 class="fw-bold text-primary mb-4"><i class="bi bi-pencil-square me-2"></i>Chỉnh sửa danh mục</h4>

            <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="id" value="${category.categoryId}">
                <input type="hidden" name="icon" value="${category.images}">

                <div class="mb-4">
                    <label class="form-label fw-semibold">Tên danh mục <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="catename" value="${category.categoryName}" required minlength="2" maxlength="100">
                    <div class="invalid-feedback">Vui lòng nhập tên danh mục (từ 2 đến 100 ký tự).</div>
                </div>

                <div class="d-flex justify-content-end gap-2">
                    <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Hủy</a>
                    <button type="submit" class="btn btn-primary px-4">Cập nhật</button>
                </div>
            </form>
        </div>
    </div>
</div>