<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="64kb" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property="title" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { background-color: #f4f6f9; min-height: 100vh; display: flex; flex-direction: column; }
        .navbar-brand { font-weight: 700; letter-spacing: 0.5px; }
        .main-content { flex: 1; padding: 2rem 0; }
        .card { border: none; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.06); }
        .avatar-nav { width: 32px; height: 32px; object-fit: cover; border-radius: 50%; border: 2px solid #fff; }
        footer { background: #1e293b; color: #cbd5e1; }
    </style>
    <sitemesh:write property="head" />
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm sticky-top">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                <i class="bi bi-play-circle-fill me-2"></i>VideoHub
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="mainNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/home">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/video">Video của tôi</a>
                    </li>
                    <c:if test="${sessionScope.account != null && sessionScope.account.roleid == 1}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Quản trị</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/videos">Quản lý Video</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/category/list">Quản lý Danh mục</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
                <ul class="navbar-nav ms-auto align-items-center">
                    <c:choose>
                        <c:when test="${sessionScope.account != null}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle d-flex align-items-center gap-2" href="#" data-bs-toggle="dropdown">
                                    <img src="${not empty sessionScope.account.images ? sessionScope.account.images : 'https://ui-avatars.com/api/?name=' += sessionScope.account.fullname}"
                                         alt="Avatar" class="avatar-nav">
                                    <span>${sessionScope.account.fullname}</span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile"><i class="bi bi-person-circle me-2"></i>Hồ sơ cá nhân</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-2"></i>Đăng xuất</a></li>
                                </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-light btn-sm text-primary fw-semibold" href="${pageContext.request.contextPath}/register">Đăng ký</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Body -->
    <main class="main-content container">
        <sitemesh:write property="body" />
    </main>

    <!-- Footer -->
    <footer class="py-3 mt-auto">
        <div class="container text-center small">
            &copy; 2026 VideoHub - ShoppingServletServiceMVC. Powered by Bootstrap 5 &amp; SiteMesh 3.
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        (() => {
            'use strict';
            const forms = document.querySelectorAll('.needs-validation');
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>