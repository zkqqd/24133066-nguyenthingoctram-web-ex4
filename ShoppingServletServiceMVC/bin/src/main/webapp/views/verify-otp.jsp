<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác thực OTP</title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm">
                    <div class="card-header bg-success text-white text-center">
                        <h4 class="mb-0"><i class="fa-solid fa-shield-halved"></i> Xác thực OTP</h4>
                    </div>
                    <div class="card-body p-4">
                        <p class="text-muted small text-center">Nhập mã OTP 6 chữ số đã được gửi tới Email của bạn.</p>

                        <form action="${pageContext.request.contextPath}/verify-otp" method="post" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="otp">Mã OTP <span class="text-danger">*</span></label>
                                <input type="text" id="otp" name="otp" inputmode="numeric"
                                       class="form-control ${not empty error ? 'is-invalid' : ''}"
                                       required pattern="[0-9]{6}" maxlength="6"
                                       placeholder="Nhập mã 6 chữ số"
                                       data-msg-required="Vui lòng nhập mã OTP"
                                       data-msg-pattern="Mã OTP phải gồm đúng 6 chữ số">
                                <div class="invalid-feedback" data-for="otp">${error}</div>
                            </div>
                            <button type="submit" class="btn btn-success w-100">Xác nhận</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>