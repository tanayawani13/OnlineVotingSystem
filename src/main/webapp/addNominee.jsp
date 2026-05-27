<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Nominee</title>
    <link rel="stylesheet" href="css/modern.css">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #eef2f3, #dfe9f3);
        }

        .form-container {
            width: 380px;
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
            margin-bottom: 18px;
            text-align: left;
        }

        .input-group label {
            font-size: 13px;
            color: #555;
        }

        .input-group input,
        .input-group select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #ccc;
            outline: none;
            transition: 0.3s;
        }

        .input-group input:focus,
        .input-group select:focus {
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

    <div class="form-title">Add Nominee</div>
    <div class="form-subtitle">Add nominee to a category</div>

    <form action="AddNomineeServlet" method="post">

        <!-- Category -->
        <div class="input-group">
            <label>Select Category</label>
            <select name="categoryId" required>
    <option value="">-- Select Category --</option>

<%
try{
    Connection con = DBConnection.getConnection();
    PreparedStatement ps =
        con.prepareStatement("SELECT * FROM categories");

    ResultSet rs = ps.executeQuery();

    while(rs.next()){
%>

<option value="<%= rs.getInt("id") %>">
    <%= rs.getString("name") %>
</option>

<%
    }

}catch(Exception e){
    out.println(e);
}
%>

</select>

</select>
        </div>

        <!-- Nominee Name -->
        <div class="input-group">
            <label>Nominee Name</label>
            <input type="text" name="nominee" placeholder="Enter nominee name" required>
        </div>

        <!-- Image Path -->
        <div class="input-group">
            <label>Image Path</label>
            <input type="text" name="image" placeholder="images/xyz.jpg" required>
        </div>

        <button type="submit" class="btn">Add Nominee</button>

    </form>

    <div class="back-link">
        <a href="<%= request.getContextPath() %>/adminDashboard.jsp"> Back to Dashboard</a>
    </div>

</div>

</body>
</html>