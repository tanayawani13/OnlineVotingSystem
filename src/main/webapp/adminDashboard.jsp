<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminlogin.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/modern.css">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
        }

        .dashboard-wrapper {
            max-width: 1000px;
            margin: 60px auto;
            text-align: center;
        }

        .dashboard-title {
            font-size: 30px;
            font-weight: 600;
            margin-bottom: 40px;
            color: #333;
        }

        /* GRID for perfect alignment */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 30px;
            padding: 0 20px;
        }

        .card {
            background: #fff;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            transition: 0.3s;
            border: 1.5px solid #9aa4b2;  /* ✅ soft dark grey */
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-bottom: 20px;
            color: #444;
        }

        /* BUTTON STYLE (same as result.jsp vibe) */
        .btn {
            display: inline-block;
            padding: 10px 18px;
            border-radius: 8px;
            background: linear-gradient(to right, #4facfe, #00c6ff);
            color: white;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .logout {
            margin-top: 40px;
        }

        .logout a {
            background: linear-gradient(to right, #ff6a6a, #ff3d3d);
        }

    </style>
</head>

<body>

<div class="dashboard-wrapper">

    <div class="dashboard-title">
        Admin Dashboard
    </div>

    <div class="card-grid">

       <!-- Add Category -->
<div class="card">
    <h3>Add Category</h3>
    <a href="<%= request.getContextPath() %>/addCategory.jsp" class="btn">Open</a>
</div>

<!-- Add Nominee -->
<div class="card">
    <h3>Add Nominee</h3>
    <a href="<%= request.getContextPath() %>/addNominee.jsp" class="btn">Open</a>
</div>

<!-- Delete Nominee -->
<div class="card">
    <h3>Delete Nominee</h3>
    <a href="<%= request.getContextPath() %>/deleteNominee.jsp" class="btn">Open</a>
</div>


<!-- Delete category -->
<div class="card">
    <h3>Delete Category</h3>
    <a href="deleteCategory.jsp" class="btn">Open</a>
</div>

<!-- View Votes -->
<div class="card">
    <h3>View Votes</h3>
    <a href="<%= request.getContextPath() %>/stats.jsp" class="btn">View</a>
</div>


<!-- Logout -->
<div class="logout">
   <a href="<%= request.getContextPath() %>/AdminLogoutServlet" class="btn">Logout</a>
</div>

</div>

</body>
</html>