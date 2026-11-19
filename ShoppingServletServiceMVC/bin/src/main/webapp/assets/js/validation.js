(function () {
    'use strict';

    function customCheck(input) {
        input.setCustomValidity('');

        // Không cho phép nhập toàn khoảng trắng đối với trường bắt buộc
        if (input.required && input.type !== 'file' && input.type !== 'checkbox'
                && typeof input.value === 'string' && input.value.trim() === '') {
            input.setCustomValidity(input.dataset.msgRequired || 'Trường này không được để trống');
            return;
        }

        // Kiểm tra khớp mật khẩu (data-match="#password")
        if (input.dataset.match) {
            var other = document.querySelector(input.dataset.match);
            if (other && input.value !== other.value) {
                input.setCustomValidity(input.dataset.msgMatch || 'Mật khẩu nhập lại không khớp');
                return;
            }
        }

        // Kiểm tra định dạng và dung lượng file upload
        if (input.type === 'file' && input.files && input.files.length > 0) {
            var file = input.files[0];
            if (input.dataset.extensions) {
                var allow = input.dataset.extensions.toLowerCase().split(',');
                var ext = file.name.split('.').pop().toLowerCase();
                if (allow.indexOf(ext) < 0) {
                    input.setCustomValidity('Chỉ chấp nhận định dạng: ' + allow.join(', '));
                    return;
                }
            }
            if (input.dataset.maxSize && file.size > parseInt(input.dataset.maxSize, 10)) {
                var mb = (parseInt(input.dataset.maxSize, 10) / 1024 / 1024).toFixed(0);
                input.setCustomValidity('Dung lượng file tối đa ' + mb + ' MB');
                return;
            }
        }
    }

    function messageOf(input) {
        var v = input.validity, d = input.dataset;
        if (v.customError) return input.validationMessage;
        if (v.valueMissing) return d.msgRequired || 'Trường này không được để trống';
        if (v.typeMismatch) return d.msgType || 'Định dạng không hợp lệ';
        if (v.tooShort) return d.msgMinlength || ('Vui lòng nhập tối thiểu ' + input.minLength + ' ký tự');
        if (v.tooLong) return d.msgMaxlength || ('Vui lòng nhập tối đa ' + input.maxLength + ' ký tự');
        if (v.patternMismatch) return d.msgPattern || 'Giá trị không đúng định dạng yêu cầu';
        return input.validationMessage;
    }

    function showFeedback(input) {
        customCheck(input);
        var holder = input.closest('.input-group') || input;
        var fb = holder.parentElement.querySelector('.invalid-feedback[data-for="' + input.name + '"]');
        if (!fb) {
            fb = document.createElement('div');
            fb.className = 'invalid-feedback';
            fb.setAttribute('data-for', input.name);
            holder.insertAdjacentElement('afterend', fb);
        }
        if (input.checkValidity()) {
            input.classList.remove('is-invalid');
            input.classList.add('is-valid');
            fb.classList.remove('d-block');
            fb.style.display = 'none';
        } else {
            input.classList.remove('is-valid');
            input.classList.add('is-invalid');
            fb.textContent = messageOf(input);
            fb.style.display = 'block';
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('form.needs-validation').forEach(function (form) {
            var fields = form.querySelectorAll('input:not([type=hidden]):not([type=checkbox]):not([readonly]), textarea, select');

            fields.forEach(function (input) {
                var evt = input.type === 'file' ? 'change' : 'input';
                input.addEventListener(evt, function () {
                    if (form.classList.contains('was-submitted') || input.classList.contains('is-invalid')) {
                        showFeedback(input);
                    }
                    if (input.id) {
                        form.querySelectorAll('[data-match="#' + input.id + '"]').forEach(function (m) {
                            if (form.classList.contains('was-submitted') || m.classList.contains('is-invalid')) {
                                showFeedback(m);
                            }
                        });
                    }
                });
            });

            form.addEventListener('submit', function (e) {
                form.classList.add('was-submitted');
                var ok = true;
                fields.forEach(function (input) {
                    showFeedback(input);
                    if (!input.checkValidity()) ok = false;
                });
                if (!ok) {
                    e.preventDefault();
                    e.stopPropagation();
                    var first = form.querySelector('.is-invalid');
                    if (first) first.focus();
                }
            });
        });
    });
})();