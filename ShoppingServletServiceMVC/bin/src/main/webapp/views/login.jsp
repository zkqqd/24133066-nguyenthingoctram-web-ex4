<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Nhập</title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white text-center">
                        <h4 class="mb-0"><i class="fa-solid fa-right-to-bracket"></i> Đăng Nhập Vào Hệ Thống</h4>
                    </div>
                    <div class="card-body p-4">
                        <c:if test="${not empty alert}">
                            <div class="alert alert-danger py-2">${alert}</div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/login" method="post" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="username">Tài khoản <span class="text-danger">*</span></label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
                                    <input type="text" id="username" name="username"
                                           class="form-control ${not empty errors.username ? 'is-invalid' : ''}"
                                           placeholder="Tài khoản" value="${fn:escapeXml(param.username)}"
                                           required maxlength="50"
                                           data-msg-required="Vui lòng nhập tài khoản">
                                </div>
                                <div class="invalid-feedback ${not empty errors.username ? 'd-block' : ''}" data-for="username">${errors.username}</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="password">Mật khẩu <span class="text-danger">*</span></label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
                                    <input type="password" id="password" name="password"
                                           class="form-control ${not empty errors.password ? 'is-invalid' : ''}"
                                           placeholder="Mật khẩu" required maxlength="50"
                                           data-msg-required="Vui lòng nhập mật khẩu">
                                </div>
                                <div class="invalid-feedback ${not empty errors.password ? 'd-block' : ''}" data-for="password">${errors.password}</div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember">
                                    <label class="form-check-label" for="remember">Nhớ tôi</label>
                                </div>
                                <a href="${pageContext.request.contextPath}/forgot-password" class="small">Quên mật khẩu?</a>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                        </form>

                        <div class="alert alert-secondary small mt-3 mb-0">
                            <i class="fa-solid fa-user-shield"></i>
                            Quản trị viên (Admin) đăng nhập bằng chính form này, hệ thống sẽ tự chuyển tới trang quản lý.
                        </div>
                    </div>
                    <div class="card-footer text-center">
                        Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>