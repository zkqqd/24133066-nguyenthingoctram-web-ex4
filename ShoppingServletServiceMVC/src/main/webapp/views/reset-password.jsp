<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Đặt lại mật khẩu</title>

<div class="row justify-content-center">
    <div class="col-md-5">
        <div class="card p-4">
            <h4 class="text-center fw-bold text-primary mb-4">
                <i class="bi bi-key me-2"></i>Đặt lại mật khẩu
            </h4>

            <c:if test="${not empty alert}">
                <div class="alert alert-danger">${alert}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/reset-password" method="post"
                  class="needs-validation" novalidate
                  oninput="confirmPassword.setCustomValidity(confirmPassword.value !== password.value ? 'Mật khẩu không khớp' : '')">
                <div class="mb-3">
                    <label class="form-label fw-semibold">Mã OTP <span class="text-danger">*</span></label>
                    <input type="text" name="otp" class="form-control" placeholder="Nhập mã OTP 6 số"
                           required pattern="^[0-9]{6}$">
                    <div class="invalid-feedback">Mã OTP phải gồm đúng 6 chữ số.</div>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold">Mật khẩu mới <span class="text-danger">*</span></label>
                    <input type="password" name="password" id="password" class="form-control"
                           placeholder="Nhập mật khẩu mới" required minlength="6">
                    <div class="invalid-feedback">Mật khẩu phải có ít nhất 6 ký tự.</div>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-semibold">Xác nhận mật khẩu mới <span class="text-danger">*</span></label>
                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-control"
                           placeholder="Nhập lại mật khẩu mới" required>
                    <div class="invalid-feedback">Mật khẩu xác nhận không khớp.</div>
                </div>

                <button type="submit" class="btn btn-primary w-100 fw-semibold">Đổi mật khẩu</button>
            </form>
        </div>
    </div>
</div>