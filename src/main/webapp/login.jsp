

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/modern.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    
  
</head>

<body>

<div class="register-card">

    <h2>LOGIN</h2>
    <p class="subtitle">Login to continue voting</p>

 <img src="<%= request.getContextPath() %>/images/avtar.jpg" class="profile-img">
    
   <%
String error = request.getParameter("error");

if ("invalid".equals(error)) {
%>
    <p style="color:red; text-align:center; margin-bottom:10px;">Invalid Email or Password!</p>
<%
}
%>

    <form action="LoginServlet" method="post">

        <div class="input-box">
            <i class="fa fa-envelope"></i>
            <input type="email" name="email" placeholder="Enter your email" required>
        </div>

        <!-- PASSWORD -->
        <div class="input-box password-field">
            <i class="fa fa-lock"></i>

            <input type="password" id="loginPassword" name="password" placeholder="Enter Password" required>

            <span class="toggle-password" onclick="togglePassword('loginPassword', this)">
                <i class="fa fa-eye"></i>
            </span>
        </div>

        <button type="submit" class="register-btn">Login</button>

    </form>

    <p class="login-text">
        Don't have an account? <a href="register.jsp">Register</a>
    </p>

</div>

<script>
function togglePassword(fieldId, icon) {
    let input = document.getElementById(fieldId);
    let eyeIcon = icon.querySelector("i");

    if (input.type === "password") {
        input.type = "text";
        eyeIcon.classList.remove("fa-eye");
        eyeIcon.classList.add("fa-eye-slash");
    } else {
        input.type = "password";
        eyeIcon.classList.remove("fa-eye-slash");
        eyeIcon.classList.add("fa-eye");
    }
}
</script>

</body>
</html>