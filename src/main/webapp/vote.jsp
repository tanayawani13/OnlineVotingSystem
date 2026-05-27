<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<%
if (session.getAttribute("userId") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Voting Panel</title>
    <link rel="stylesheet" href="css/modern.css">
    <meta charset="UTF-8">
</head>

<body>

<div class="vote-container">

<h2>Voting Panel</h2>

<!-- ✅ PROGRESS -->
<div class="progress" id="progressBar"></div>

<form action="FinalVoteServlet" method="post" onsubmit="return confirmVote()">

<%
try {
    Connection con = DBConnection.getConnection();

    PreparedStatement ps1 = con.prepareStatement("SELECT * FROM categories");
    ResultSet catRs = ps1.executeQuery();

    while(catRs.next()) {

        int categoryId = catRs.getInt("id");
        String categoryName = catRs.getString("name");

        // 🎭 ICON LOGIC
        String icon = "";
if(categoryName.equalsIgnoreCase("Best Movie")) icon="🎬";
else if(categoryName.equalsIgnoreCase("Best Actor")) icon="🎭";
else if(categoryName.equalsIgnoreCase("Best Actress")) icon="💃";
else if(categoryName.equalsIgnoreCase("Best Villain")) icon="😈";
%>

<div class="category-block">

    <h3 class="category-title"><%= icon %> <%= categoryName %></h3>

    <div class="vote-grid">

<%
    PreparedStatement ps2 = con.prepareStatement(
        "SELECT * FROM nominees WHERE category_id=?"
    );
    ps2.setInt(1, categoryId);
    ResultSet nomRs = ps2.executeQuery();

    while(nomRs.next()) {
%>

<label class="vote-card">

    <input type="radio" 
           name="category_<%= categoryId %>" 
           value="<%= nomRs.getInt("id") %>" 
           onchange="updateProgress()"
           required>

    <img src="<%= nomRs.getString("image_path") %>">

    <span class="tick">✔</span>

    <div class="vote-name">
        <%= nomRs.getString("nominee_name") %>
    </div>

</label>

<%
    }
%>

    </div>
</div>

<%
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>

<br>

<button type="submit" class="vote-btn">Submit Vote</button>

</form>
</div>

<!-- 🔥 JS -->
<script>
function confirmVote() {
    return confirm("Submit vote? You cannot change later!");
}

// 📊 PROGRESS
function updateProgress() {
    let radios = document.querySelectorAll("input[type=radio]:checked");
    let total = document.querySelectorAll(".category-block").length;

    let progress = document.getElementById("progressBar");
    progress.innerHTML = "";

    for(let i=0; i<total; i++){
        let span = document.createElement("span");

        if(i < radios.length){
            span.classList.add("done");
            span.innerHTML = "&#10004;"; // ✔
        } else {
        	span.innerHTML = "&#10006;"; // ✖
        }

        progress.appendChild(span);
    }
}
</script>

</body>
</html>