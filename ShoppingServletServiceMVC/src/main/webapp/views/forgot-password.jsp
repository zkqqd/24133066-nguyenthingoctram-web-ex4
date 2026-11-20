<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Quên mật khẩu</title>

<div class="row justify-content-center">
    <div class="col-md-5">
        <div class="card p-4">
            <h4 class="text-center fw-bold text-primary mb-3">Khôi phục mật khẩu</h4>
            <p class="text-muted text-center small mb-4">Nhập email đã đăng ký để nhận mã OTP đặt lại mật khẩu.</p>

            <c:if test="${not empty alert}">
                <div class="alert alert-danger">${alert}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/forgot-password" method="post" class="needs-validation" novalidate>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Địa chỉ Email</label>
                    <input type="email" name="email" class="form-control" placeholder="example@gmail.com" required>
                    <div class="invalid-feedback">Vui lòng nhập địa chỉ email hợp lệ.</div>
                </div>
                <button type="submit" class="btn btn-primary w-100 fw-semibold">Gửi mã OTP</button>
            </form>
        </div>
    </div>
</div>