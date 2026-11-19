<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tạo Tài Khoản</title>
</head>
<body>
    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-header bg-success text-white text-center">
                        <h4 class="mb-0"><i class="fa-solid fa-user-plus"></i> Tạo Tài Khoản Mới</h4>
                    </div>
                    <div class="card-body p-4">
                        <c:if test="${not empty alert}">
                            <div class="alert alert-danger py-2">${alert}</div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="username">Tài khoản <span class="text-danger">*</span></label>
                                <input type="text" id="username" name="username"
                                       class="form-control ${not empty errors.username ? 'is-invalid' : ''}"
                                       placeholder="VD: nguyenvana" value="${fn:escapeXml(param.username)}"
                                       required minlength="4" maxlength="30" pattern="[A-Za-z0-9_]{4,30}"
                                       data-msg-required="Vui lòng nhập tài khoản"
                                       data-msg-pattern="Tài khoản 4-30 ký tự, chỉ gồm chữ không dấu, số, dấu _">
                                <div class="invalid-feedback" data-for="username">${errors.username}</div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="password">Mật khẩu <span class="text-danger">*</span></label>
                                    <input type="password" id="password" name="password"
                                           class="form-control ${not empty errors.password ? 'is-invalid' : ''}"
                                           placeholder="Mật khẩu" required minlength="6" maxlength="50" pattern="\S{6,50}"
                                           data-msg-required="Vui lòng nhập mật khẩu"
                                           data-msg-pattern="Mật khẩu 6-50 ký tự, không chứa khoảng trắng">
                                    <div class="invalid-feedback" data-for="password">${errors.password}</div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="confirmPassword">Nhập lại mật khẩu <span class="text-danger">*</span></label>
                                    <input type="password" id="confirmPassword" name="confirmPassword"
                                           class="form-control ${not empty errors.confirmPassword ? 'is-invalid' : ''}"
                                           placeholder="Nhập lại mật khẩu" required data-match="#password"
                                           data-msg-required="Vui lòng nhập lại mật khẩu"
                                           data-msg-match="Mật khẩu nhập lại không khớp">
                                    <div class="invalid-feedback" data-for="confirmPassword">${errors.confirmPassword}</div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="fullname">Họ tên <span class="text-danger">*</span></label>
                                <input type="text" id="fullname" name="fullname"
                                       class="form-control ${not empty errors.fullname ? 'is-invalid' : ''}"
                                       placeholder="Họ tên" value="${fn:escapeXml(param.fullname)}"
                                       required minlength="2" maxlength="50"
                                       data-msg-required="Vui lòng nhập họ tên">
                                <div class="invalid-feedback" data-for="fullname">${errors.fullname}</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="email">Email <span class="text-danger">*</span></label>
                                <input type="email" id="email" name="email"
                                       class="form-control ${not empty errors.email ? 'is-invalid' : ''}"
                                       placeholder="VD: abc@gmail.com" value="${fn:escapeXml(param.email)}"
                                       required maxlength="100"
                                       data-msg-required="Vui lòng nhập email"
                                       data-msg-type="Email không đúng định dạng">
                                <div class="invalid-feedback" data-for="email">${errors.email}</div>
                                <div class="form-text">Mã OTP xác thực sẽ được gửi tới email này.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="phone">Số điện thoại <span class="text-danger">*</span></label>
                                <input type="tel" id="phone" name="phone"
                                       class="form-control ${not empty errors.phone ? 'is-invalid' : ''}"
                                       placeholder="VD: 0912345678" value="${fn:escapeXml(param.phone)}"
                                       required pattern="(0|\+84)[0-9]{9}"
                                       data-msg-required="Vui lòng nhập số điện thoại"
                                       data-msg-pattern="Số điện thoại gồm 10 số, bắt đầu bằng 0 (hoặc +84)">
                                <div class="invalid-feedback" data-for="phone">${errors.phone}</div>
                            </div>
                            <button type="submit" class="btn btn-success w-100">Tạo tài khoản</button>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>