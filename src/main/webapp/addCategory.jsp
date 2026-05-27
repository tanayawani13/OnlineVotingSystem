<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminlogin.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Category</title>
    <link rel="stylesheet" href="css/modern.css">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
        }

        .form-container {
            width: 350px;
            margin: 80px auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: center;
            border: 1.5px solid #9aa4b2;  /* ✅ soft dark grey */
        }

        .form-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .form-subtitle {
            font-size: 14px;
            color: #777;
            margin-bottom: 25px;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .input-group label {
            font-size: 13px;
            color: #555;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #ccc;
            outline: none;
            transition: 0.3s;
        }

        .input-group input:focus {
            border-color: #4facfe;
        }

        .btn {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            background: linear-gradient(to right, #4facfe, #00c6ff);
            color: white;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .back-link {
            margin-top: 15px;
            display: block;
            font-size: 13px;
        }

        .back-link a {
            text-decoration: none;
            color: #3498db;
        }

    </style>
</head>

<body>

<div class="form-container">

    <div class="form-title">Add Category</div>
    <div class="form-subtitle">Create a new voting category</div>

    <form action="AddCategoryServlet2" method="post">

        <div class="input-group">
            <label>Category Name</label>
            <input type="text" name="categoryName" placeholder="Enter category name" required>
        </div>

        <button type="submit" class="btn">Add Category</button>

    </form>

    <div class="back-link">
    <a href="<%= request.getContextPath() %>/adminDashboard.jsp">Back to Dashboard</a>
</div>

</div>

</body>
</html>