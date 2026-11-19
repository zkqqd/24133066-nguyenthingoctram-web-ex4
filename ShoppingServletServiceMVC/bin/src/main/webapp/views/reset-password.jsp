<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đặt lại mật khẩu</title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm">
                    <div class="card-header bg-warning text-dark text-center">
                        <h4 class="mb-0"><i class="fa-solid fa-unlock-keyhole"></i> Đặt lại mật khẩu</h4>
                    </div>
                    <div class="card-body p-4">
                        <c:if test="${not empty alert}">
                            <div class="alert alert-danger py-2">${alert}</div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/reset-password" method="post" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="otp">Mã OTP <span class="text-danger">*</span></label>
                                <input type="text" id="otp" name="otp" inputmode="numeric"
                                       class="form-control ${not empty errors.otp ? 'is-invalid' : ''}"
                                       placeholder="Nhập mã OTP 6 số" value="${fn:escapeXml(param.otp)}"
                                       required pattern="[0-9]{6}" maxlength="6"
                                       data-msg-required="Vui lòng nhập mã OTP"
                                       data-msg-pattern="Mã OTP gồm đúng 6 chữ số">
                                <div class="invalid-feedback" data-for="otp">${errors.otp}</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="password">Mật khẩu mới <span class="text-danger">*</span></label>
                                <input type="password" id="password" name="password"
                                       class="form-control ${not empty errors.password ? 'is-invalid' : ''}"
                                       placeholder="Mật khẩu mới" required minlength="6" maxlength="50" pattern="\S{6,50}"
                                       data-msg-required="Vui lòng nhập mật khẩu mới"
                                       data-msg-pattern="Mật khẩu 6-50 ký tự, không chứa khoảng trắng">
                                <div class="invalid-feedback" data-for="password">${errors.password}</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="confirmPassword">Nhập lại mật khẩu mới <span class="text-danger">*</span></label>
                                <input type="password" id="confirmPassword" name="confirmPassword"
                                       class="form-control ${not empty errors.confirmPassword ? 'is-invalid' : ''}"
                                       placeholder="Nhập lại mật khẩu mới" required data-match="#password"
                                       data-msg-required="Vui lòng nhập lại mật khẩu"
                                       data-msg-match="Mật khẩu nhập lại không khớp">
                                <div class="invalid-feedback" data-for="confirmPassword">${errors.confirmPassword}</div>
                            </div>
                            <button type="submit" class="btn btn-warning w-100">Đổi mật khẩu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>