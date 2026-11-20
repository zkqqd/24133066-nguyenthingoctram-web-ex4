<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Hồ sơ cá nhân</title>

<div class="row justify-content-center">
    <div class="col-lg-8">
        <div class="card p-4">
            <h4 class="fw-bold mb-4 text-primary"><i class="bi bi-person-badge me-2"></i>Thông tin cá nhân</h4>

            <c:if test="${not empty message}">
                <div class="alert alert-success alert-dismissible fade show">${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show">${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <!-- Form cập nhật Profile -->
            <form action="${pageContext.request.contextPath}/profile" method="post"
                  enctype="multipart/form-data" class="needs-validation" novalidate>
                <div class="text-center mb-4">
                    <img id="avatarPreview"
                         src="${not empty sessionScope.account.images ? sessionScope.account.images : 'https://ui-avatars.com/api/?size=128&name=' += sessionScope.account.fullname}"
                         class="rounded-circle border border-3 border-primary shadow-sm"
                         style="width: 120px; height: 120px; object-fit: cover;" alt="Avatar">
                    <div class="mt-3">
                        <label for="imageFile" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-cloud-upload me-1"></i>Chọn ảnh đại diện (Cloudinary)
                        </label>
                        <input type="file" id="imageFile" name="imageFile" accept="image/*" class="d-none"
                               onchange="previewAvatar(event)">
                    </div>
                </div>

                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Tên đăng nhập</label>
                        <input type="text" class="form-control bg-light" value="${sessionScope.account.username}" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Họ và tên <span class="text-danger">*</span></label>
                        <input type="text" name="fullname" class="form-control"
                               value="${sessionScope.account.fullname}" required minlength="2">
                        <div class="invalid-feedback">Vui lòng nhập họ tên (ít nhất 2 ký tự).</div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Số điện thoại <span class="text-danger">*</span></label>
                        <input type="tel" name="phone" class="form-control"
                               value="${sessionScope.account.phone}" required pattern="^(0[35789])[0-9]{8}$">
                        <div class="invalid-feedback">Số điện thoại phải gồm 10 chữ số hợp lệ tại Việt Nam.</div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-semibold">Email <span class="text-danger">*</span></label>
                        <input type="email" name="email" class="form-control"
                               value="${sessionScope.account.email}" required>
                        <div class="form-text">Nếu đổi email mới, hệ thống sẽ gửi mã OTP xác nhận.</div>
                        <div class="invalid-feedback">Vui lòng nhập địa chỉ email hợp lệ.</div>
                    </div>
                </div>

                <div class="mt-4 d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary px-4">
                        <i class="bi bi-save me-1"></i>Lưu thay đổi
                    </button>
                </div>
            </form>

            <!-- Form xác nhận OTP khi đổi Email mới -->
            <c:if test="${showOtpForm || not empty sessionScope.pendingNewEmail}">
                <hr class="my-4">
                <div class="p-3 bg-light rounded border border-warning">
                    <h6 class="fw-bold text-warning-emphasis mb-2">
                        <i class="bi bi-shield-lock me-1"></i>Xác nhận OTP cho email mới: ${sessionScope.pendingNewEmail}
                    </h6>
                    <form action="${pageContext.request.contextPath}/profile/verify-email" method="post"
                          class="row g-2 align-items-center needs-validation" novalidate>
                        <div class="col-md-8">
                            <input type="text" name="otp" class="form-control" placeholder="Nhập mã OTP 6 chữ số"
                                   required pattern="^[0-9]{6}$">
                            <div class="invalid-feedback">Mã OTP phải gồm đúng 6 chữ số.</div>
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-warning w-100 fw-semibold">Xác nhận đổi Email</button>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script>
    function previewAvatar(event) {
        const file = event.target.files[0];
        if (file) {
            document.getElementById('avatarPreview').src = URL.createObjectURL(file);
        }
    }
</script>