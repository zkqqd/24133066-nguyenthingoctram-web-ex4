<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4 shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home"><i class="fa-solid fa-play"></i> IOTSTAR Video</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home"><i class="fa-solid fa-house"></i> Trang Chủ</a>
                </li>
                <c:if test="${not empty sessionScope.account}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/video"><i class="fa-solid fa-film"></i> Video Của Tôi</a>
                    </li>
                    <c:if test="${sessionScope.account.roleid == 1}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="adminMenu" role="button" data-bs-toggle="dropdown">
                                <i class="fa-solid fa-user-shield"></i> Quản Lý (Admin)
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/videos"><i class="fa-solid fa-video"></i> Quản Lý Video</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/category/list"><i class="fa-solid fa-list"></i> Quản Lý Danh Mục</a></li>
                            </ul>
                        </li>
                    </c:if>
                </c:if>
            </ul>

            <ul class="navbar-nav">
                <%-- Chưa đăng nhập: menu Tài khoản --%>
                <c:if test="${empty sessionScope.account}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="accountMenu" role="button" data-bs-toggle="dropdown">
                            <i class="fa-regular fa-circle-user"></i> Tài khoản
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login"><i class="fa-solid fa-right-to-bracket"></i> Đăng nhập</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/register"><i class="fa-solid fa-user-plus"></i> Đăng ký</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/forgot-password"><i class="fa-solid fa-key"></i> Quên mật khẩu</a></li>
                        </ul>
                    </li>
                </c:if>

                <%-- Đã đăng nhập: hiển thị tên + vai trò + đăng xuất --%>
                <c:if test="${not empty sessionScope.account}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-warning" href="#" id="userMenu" role="button" data-bs-toggle="dropdown">
                            <i class="fa-regular fa-circle-user"></i> ${sessionScope.account.fullname}
                            <c:choose>
                                <c:when test="${sessionScope.account.roleid == 1}">
                                    <span class="badge bg-danger ms-1">Admin</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary ms-1">User</span>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><span class="dropdown-item-text small text-muted">@${sessionScope.account.username}</span></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>