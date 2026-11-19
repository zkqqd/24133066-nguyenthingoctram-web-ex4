<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quên mật khẩu</title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm">
                    <div class="card-header bg-info text-white text-center">
                        <h4 class="mb-0"><i class="fa-solid fa-key"></i> Quên mật khẩu</h4>
                    </div>
                    <div class="card-body p-4">
                        <c:if test="${not empty alert}">
                            <div class="alert alert-danger py-2">${alert}</div>
                        </c:if>
                        <p class="text-muted small">Nhập email đã đăng ký, hệ thống sẽ gửi mã OTP để đặt lại mật khẩu.</p>

                        <form action="${pageContext.request.contextPath}/forgot-password" method="post" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="email">Email <span class="text-danger">*</span></label>
                                <input type="email" id="email" name="email"
                                       class="form-control ${not empty errors.email ? 'is-invalid' : ''}"
                                       placeholder="Nhập email của bạn" value="${fn:escapeXml(param.email)}"
                                       required maxlength="100"
                                       data-msg-required="Vui lòng nhập email"
                                       data-msg-type="Email không đúng định dạng">
                                <div class="invalid-feedback" data-for="email">${errors.email}</div>
                            </div>
                            <button type="submit" class="btn btn-info text-white w-100">Gửi mã OTP</button>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <a href="${pageContext.request.contextPath}/login"><i class="fa-solid fa-arrow-left"></i> Quay lại đăng nhập</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>