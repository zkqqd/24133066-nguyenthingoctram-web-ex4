<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Đăng nhập</title>

<div class="row justify-content-center">
    <div class="col-md-5">
        <div class="card p-4">
            <h3 class="text-center fw-bold text-primary mb-4">Đăng nhập</h3>

            <c:if test="${not empty alert}">
                <div class="alert alert-danger">${alert}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="post" class="needs-validation" novalidate>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Tên đăng nhập</label>
                    <input type="text" name="username" class="form-control" required minlength="3">
                    <div class="invalid-feedback">Vui lòng nhập tên đăng nhập (ít nhất 3 ký tự).</div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Mật khẩu</label>
                    <input type="password" name="password" class="form-control" required minlength="6">
                    <div class="invalid-feedback">Vui lòng nhập mật khẩu (ít nhất 6 ký tự).</div>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="form-check">
                        <input type="checkbox" name="remember" class="form-check-input" id="remember">
                        <label class="form-check-label" for="remember">Ghi nhớ đăng nhập</label>
                    </div>
                    <a href="${pageContext.request.contextPath}/forgot-password" class="small text-decoration-none">Quên mật khẩu?</a>
                </div>
                <button type="submit" class="btn btn-primary w-100 fw-semibold">Đăng nhập</button>
            </form>

            <div class="text-center mt-3 small">
                Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register" class="fw-semibold text-decoration-none">Đăng ký ngay</a>
            </div>
        </div>
    </div>
</div>