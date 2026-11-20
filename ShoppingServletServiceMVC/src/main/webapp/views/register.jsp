<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Đăng ký tài khoản</title>

<div class="row justify-content-center">
    <div class="col-md-6">
        <div class="card p-4">
            <h3 class="text-center fw-bold text-primary mb-4">Tạo tài khoản mới</h3>

            <c:if test="${not empty alert}">
                <div class="alert alert-danger">${alert}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation" novalidate>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Tên đăng nhập</label>
                    <input type="text" name="username" class="form-control" required pattern="^[a-zA-Z0-9_]{4,20}$">
                    <div class="invalid-feedback">Tên đăng nhập từ 4–20 ký tự, chỉ gồm chữ, số và dấu gạch dưới.</div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Họ và tên</label>
                    <input type="text" name="fullname" class="form-control" required minlength="2">
                    <div class="invalid-feedback">Vui lòng nhập họ tên (ít nhất 2 ký tự).</div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Email</label>
                    <input type="email" name="email" class="form-control" required>
                    <div class="invalid-feedback">Vui lòng nhập đúng định dạng email.</div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Số điện thoại</label>
                    <input type="tel" name="phone" class="form-control" required pattern="^(0[35789])[0-9]{8}$">
                    <div class="invalid-feedback">Số điện thoại không hợp lệ (10 chữ số).</div>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Mật khẩu</label>
                    <input type="password" name="password" class="form-control" required minlength="6">
                    <div class="invalid-feedback">Mật khẩu phải có ít nhất 6 ký tự.</div>
                </div>
                <button type="submit" class="btn btn-primary w-100 fw-semibold">Đăng ký</button>
            </form>
        </div>
    </div>
</div>