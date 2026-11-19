<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm danh mục</title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0"><i class="fa-solid fa-folder-plus"></i> Thêm danh mục mới</h4>
                    </div>
                    <div class="card-body p-4">
                        <form action="${pageContext.request.contextPath}/admin/category/add" method="post"
                              enctype="multipart/form-data" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label fw-bold" for="catename">Tên danh mục <span class="text-danger">*</span></label>
                                <input type="text" id="catename" name="catename"
                                       class="form-control ${not empty errors.catename ? 'is-invalid' : ''}"
                                       placeholder="Nhập tên danh mục" value="${fn:escapeXml(param.catename)}"
                                       required minlength="2" maxlength="100"
                                       data-msg-required="Vui lòng nhập tên danh mục">
                                <div class="invalid-feedback" data-for="catename">${errors.catename}</div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold" for="icon">Ảnh đại diện</label>
                                <input type="file" id="icon" name="icon" accept=".jpg,.jpeg,.png,.gif,.webp"
                                       class="form-control ${not empty errors.icon ? 'is-invalid' : ''}"
                                       data-extensions="jpg,jpeg,png,gif,webp" data-max-size="5242880">
                                <div class="invalid-feedback" data-for="icon">${errors.icon}</div>
                                <div class="form-text">Không bắt buộc. Ảnh JPG/PNG/GIF/WEBP, tối đa 5 MB.</div>
                            </div>

                            <div class="d-flex justify-content-end gap-2 mt-4">
                                <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Hủy</a>
                                <button type="submit" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Thêm</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>