<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sửa danh mục</title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-header bg-warning text-dark">
                        <h4 class="mb-0"><i class="fa-solid fa-pen-to-square"></i> Chỉnh sửa danh mục</h4>
                    </div>
                    <div class="card-body p-4">
                        <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" class="needs-validation" novalidate>
                            <input type="hidden" name="id" value="${category.categoryId}">
                            <input type="hidden" name="icon" value="${fn:escapeXml(category.images)}">

                            <div class="mb-3">
                                <label class="form-label fw-bold" for="catename">Tên danh mục <span class="text-danger">*</span></label>
                                <input type="text" id="catename" name="catename"
                                       class="form-control ${not empty errors.catename ? 'is-invalid' : ''}"
                                       value="${fn:escapeXml(category.categoryName)}"
                                       required minlength="2" maxlength="100"
                                       data-msg-required="Vui lòng nhập tên danh mục">
                                <div class="invalid-feedback" data-for="catename">${errors.catename}</div>
                            </div>

                            <div class="d-flex justify-content-end gap-2 mt-4">
                                <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-secondary">Hủy</a>
                                <button type="submit" class="btn btn-warning"><i class="fa-solid fa-save"></i> Cập nhật</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>