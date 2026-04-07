<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>E-Hotels</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <!-- Google Font (like React vibe) -->
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;600&display=swap" rel="stylesheet">

    <style>
        .home {
            text-align: center;
            padding-top: 140px;
            min-height: 80vh;
            font-family: 'Fredoka', sans-serif;
        }

        .home h1 {
            font-weight: 600;
            color: #3a565d;
            margin-bottom: 10px;
        }

        .home h6 {
            font-weight: 500;
            color: #5a6f7a;
            margin-bottom: 30px;
        }

        /* Card section */
        .home-card {
            margin: auto;
            max-width: 400px;
            background: white;
            padding: 25px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        /* Buttons */
        .home-btn {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 12px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: 600;
            color: #3a505d;
            background-color: #c1e8ff;
            transition: 0.3s;
        }

        .home-btn:hover {
            background-color: rgb(105, 220, 255);
            color: white;
        }
    </style>
</head>

<body>
<div class="wrapper">

    <!-- NAVBAR -->
    <jsp:include page="/components/navbar.jsp" />

    <!-- HOME CONTENT -->
    <div class="home">

        <h1>Welcome to e-Hotels</h1>
        <h6>Search, book, and rent hotel rooms across North America.</h6>

        <!-- Card / Action Section -->
        <div class="home-card">

            <a href="customer/search.jsp" class="home-btn">
                🔎 Search Rooms
            </a>

            <a href="employee/employeeDashboard.jsp" class="home-btn">
                👨‍💼 Employee Portal
            </a>

        </div>

    </div>

    <!-- FOOTER -->
    <jsp:include page="/components/footer.jsp" />

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>