<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Xác thực OTP</title>

<div class="row justify-content-center">
    <div class="col-md-5">
        <div class="card p-4">
            <h4 class="text-center fw-bold text-primary mb-3">
                <i class="bi bi-shield-check me-2"></i>Xác thực OTP
            </h4>
            <p class="text-muted text-center small mb-4">Nhập mã OTP 6 chữ số đã được gửi qua Email của bạn.</p>

            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/verify-otp" method="post" class="needs-validation" novalidate>
                <div class="mb-4">
                    <label class="form-label fw-semibold">Mã OTP <span class="text-danger">*</span></label>
                    <input type="text" name="otp" class="form-control text-center fs-5"
                           placeholder="Nhập mã 6 chữ số" required pattern="^[0-9]{6}$">
                    <div class="invalid-feedback">Mã OTP phải gồm đúng 6 chữ số.</div>
                </div>
                <button type="submit" class="btn btn-primary w-100 fw-semibold">Xác nhận</button>
            </form>
        </div>
    </div>
</div>