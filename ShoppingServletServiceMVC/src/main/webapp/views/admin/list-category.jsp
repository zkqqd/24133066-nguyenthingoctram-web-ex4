<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Quản lý danh mục</title>

<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-4">
    <h2 class="text-primary fw-bold mb-0"><i class="bi bi-folder2-open me-2"></i>Danh sách danh mục</h2>
    <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-success">
        <i class="bi bi-plus-lg me-1"></i>Thêm danh mục mới
    </a>
</div>

<div class="card shadow-sm overflow-hidden">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover table-bordered align-middle mb-0">
                <thead class="table-dark">
                    <tr>
                        <th class="text-center" width="10%">STT</th>
                        <th width="65%">Tên danh mục</th>
                        <th class="text-center" width="25%">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cateList}" var="cate" varStatus="STT">
                        <tr>
                            <td class="text-center fw-bold">${STT.index + 1}</td>
                            <td class="fw-semibold">${cate.categoryName}</td>
                            <td class="text-center">
                                <a href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.categoryId}" class="btn btn-sm btn-warning text-dark">
                                    <i class="bi bi-pencil-square me-1"></i>Sửa
                                </a>
                                <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.categoryId}" class="btn btn-sm btn-danger"
                                   onclick="return confirm('Bạn có chắc muốn xóa?');">
                                    <i class="bi bi-trash me-1"></i>Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>