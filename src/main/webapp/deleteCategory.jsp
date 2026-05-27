<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Delete Category</title>
<link rel="stylesheet" href="css/modern.css">

<style>
body{
font-family:Arial;
background:#f2f4f8;
}

.container{
width:700px;
margin:50px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 10px rgba(0,0,0,0.1);
text-align:center;
}

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
}

th,td{
padding:12px;
border-bottom:1px solid #ddd;
}

th{
background:#4facfe;
color:white;
}

.delete-btn{
padding:8px 15px;
border:none;
border-radius:8px;
background:red;
color:white;
cursor:pointer;
}

.delete-btn:hover{
opacity:0.9;
}
</style>

</head>
<body>

<div class="container">

<h2>Delete Categories</h2>

<table>

<tr>
<th>ID</th>
<th>Category Name</th>
<th>Action</th>
</tr>

<%
Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement("select * from categories order by id");
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("name") %></td>
<td>
<a href="DeleteCategoryServlet?id=<%= rs.getInt("id") %>">
<button class="delete-btn">Delete</button>
</a>
</td>
</tr>

<%
}
%>

</table>

<br><br>

<a href="adminDashboard.jsp">
<button class="modern-btn">Back</button>
</a>

</div>

</body>
</html>