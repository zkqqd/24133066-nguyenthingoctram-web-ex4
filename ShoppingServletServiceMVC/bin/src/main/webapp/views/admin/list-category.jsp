<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý danh mục</title>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="text-primary"><i class="fa-solid fa-list"></i> Danh sách danh mục</h2>
            <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-success">
                <i class="fa-solid fa-plus"></i> Thêm danh mục mới
            </a>
        </div>
        <div class="card shadow-sm">
            <div class="card-body p-0">
                <table class="table table-hover table-bordered mb-0 align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th style="width: 80px;">STT</th>
                            <th class="text-start">Tên danh mục</th>
                            <th style="width: 220px;">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${cateList}" var="cate" varStatus="STT">
                            <tr>
                                <td>${STT.index + 1}</td>
                                <td class="text-start">${cate.categoryName}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.categoryId}" class="btn btn-sm btn-warning text-dark">
                                        <i class="fa-solid fa-pen-to-square"></i> Sửa
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.categoryId}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc muốn xóa?')">
                                        <i class="fa-solid fa-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>