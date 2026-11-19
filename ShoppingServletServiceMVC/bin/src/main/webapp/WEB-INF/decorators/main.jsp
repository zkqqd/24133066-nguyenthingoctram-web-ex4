<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><sitemesh:write property="title"/> - IOTSTAR Video</title>

    <!-- Bootstrap 5.3 CSS & Font Awesome 6 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        .card { border-radius: .75rem; }
        .card-header:first-child { border-radius: .75rem .75rem 0 0; }
        .invalid-feedback { font-size: .85rem; }
    </style>

    <sitemesh:write property="head"/>
</head>
<body class="bg-light d-flex flex-column min-vh-100">

    <!-- Header / Topbar -->
    <jsp:include page="/common/topbar.jsp" />

    <!-- Main Body Content -->
    <main class="flex-grow-1">
        <sitemesh:write property="body"/>
    </main>

    <!-- Footer -->
    <footer class="bg-dark text-white-50 py-3 mt-5">
        <div class="container d-flex flex-column flex-md-row justify-content-between align-items-center small">
            <span><i class="fa-solid fa-play text-warning"></i> <strong>IOTSTAR Video</strong> &copy; 2026</span>
            <span>Servlet/JSP MVC &bull; SiteMesh Decorator 3 &bull; Bootstrap 5</span>
        </div>
    </footer>

    <!-- Bootstrap 5.3 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Script Validation phía Client -->
    <script src="${pageContext.request.contextPath}/assets/js/validation.js"></script>
</body>
</html>