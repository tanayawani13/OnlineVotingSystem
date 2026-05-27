<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<%
if(session.getAttribute("admin")==null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Delete Nominee</title>
<link rel="stylesheet" href="css/modern.css">
</head>
<body>

<div class="register-card">
<h2>Delete Nominee</h2>

<form action="DeleteNomineeServlet" method="post">

<select name="id" required style="width:100%;padding:10px;">
<option value="">Select Nominee</option>

<%
try{
Connection con = DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement("select * from nominees");

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<option value="<%=rs.getInt("id")%>">
<%=rs.getString("nominee_name")%>
</option>

<%
}
}catch(Exception e){
out.println(e);
}
%>

</select>

<br><br>

<button type="submit" class="register-btn">
Delete Nominee
</button>

</form>

</div>

</body>
</html>