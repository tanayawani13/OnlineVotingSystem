<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Winners</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/modern.css">

    <!-- 🎉 CONFETTI -->
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>

    <style>

        body {
            text-align: center;
        }

        /* 🏆 TITLE */
        .title-box {
            margin-top: 20px;
        }

        .title-box img {
            width: 60px;
            vertical-align: middle;
        }

        .title-box h1 {
            display: inline-block;
            font-size: 36px;
            margin-left: 10px;
        }

        /* 🎯 GRID FIX */
        .winner-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            width: 90%;
            margin: 40px auto;
        }

        /* 🏆 CARD */
        .winner-card {
            padding: 20px;
            border-radius: 20px;
            background: white;
            border: 2px solid gold;
            box-shadow: 0 0 20px gold;
            transition: 0.3s;
        }

        .winner-card:hover {
            transform: scale(1.05);
        }

        .winner-img {
            width: 100%;
            height: 250px;
            border-radius: 15px;
            object-fit: cover;
        }

        .winner-title {
            font-size: 18px;
            margin-bottom: 10px;
            color: #555;
        }

        .winner-name {
            font-size: 22px;
            font-weight: bold;
            color: #4facfe;
        }

        .winner-votes {
            margin-top: 5px;
            font-size: 15px;
        }

        /* 🔙 BUTTON */
        .back-btn {
            margin: 30px;
        }

    </style>
</head>

<body>

<div class="main-wrapper">

<!-- 🏆 HEADER -->
<div class="title-box">
    <img src="images/trophy.png" class="trophy-icon">
    <h1 class="main-title">Winners</h1>
</div>

<!-- 🏆 CARDS -->
<div class="winner-container">

<%
try {
    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
        "SELECT c.name, n.nominee_name, n.vote_count, n.image_path " +
        "FROM nominees n " +
        "JOIN categories c ON n.category_id = c.id " +
        "WHERE n.vote_count = (" +
        "SELECT MAX(n2.vote_count) FROM nominees n2 WHERE n2.category_id = n.category_id)"
    );

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
%>

    <div class="winner-card">

        <div class="winner-title">
            <%= rs.getString("name") %>
        </div>

        <img src="<%= rs.getString("image_path") %>" class="winner-img">

        <div class="winner-name">
            <%= rs.getString("nominee_name") %>
        </div>

        <div class="winner-votes">
            Votes: <%= rs.getInt("vote_count") %>
        </div>

    </div>

<%
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>

</div>



<div class="bottom-btn">
    <a href="stats.jsp">
        <button class="modern-btn">View Detailed Stats </button>
    </a>
</div>


<!-- 🔙 BACK BUTTON AT BOTTOM -->
<div class="back-btn">
    <a href="index.jsp">
        <button class="modern-btn">Back to Home</button>
    </a>
</div>


<!-- 🎉 CONFETTI -->
<script>
window.onload = function() {
    confetti({
        particleCount: 150,
        spread: 90,
        origin: { y: 0.6 }
    });
};
</script>


</div>
</body>
</html>