<div class="container">
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Vote Count</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<h2 style="color: cyan;">All Vote Counts</h2>

<table border="1">
<tr>
    <th>Category</th>
    <th>Nominee</th>
    <th>Votes</th>
</tr>

<%
try {
    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
        "SELECT c.name, n.nominee_name, n.vote_count " +
        "FROM nominees n JOIN categories c ON n.category_id = c.id " +
        "ORDER BY c.id, n.vote_count DESC"
    );

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
%>

<tr>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("nominee_name") %></td>
    <td><%= rs.getInt("vote_count") %></td>
</tr>

<%
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>

</table>

<br>
<a href="index.jsp">Back to Home</a>

</body>
</html>
</div>