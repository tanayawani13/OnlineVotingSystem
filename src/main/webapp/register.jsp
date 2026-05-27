<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/modern.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>

<div class="register-card">

    <h2>REGISTER</h2>
    <p class="subtitle">Create your account, it's free and only takes a minute.</p>

   <img src="<%= request.getContextPath() %>/images/avtar.jpg" class="profile-img">

    <form action="RegisterServlet" method="post">

        <div class="input-box">
            <i class="fa fa-user"></i>
            <input type="text" name="fullname" placeholder="Full Name" required>
        </div>

        <div class="input-box">
            <i class="fa fa-envelope"></i>
            <input type="email" name="email" placeholder="Enter your email address" required>
        </div>

        <!-- PASSWORD -->
        <div class="input-box password-field">
            <i class="fa fa-lock"></i>

            <input type="password" id="password" name="password"
placeholder="Password"
pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,10}$"
title="8-10 chars with Capital, Small, Number, Special Symbol"
required>
            <span class="toggle-password" onclick="togglePassword('password', this)">
                <i class="fa fa-eye"></i>
            </span>
        </div>

        <!-- CONFIRM PASSWORD -->
        <div class="input-box password-field">
            <i class="fa fa-lock"></i>

            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>

            <span class="toggle-password" onclick="togglePassword('confirmPassword', this)">
                <i class="fa fa-eye"></i>
            </span>
        </div>

        <button type="submit" class="register-btn">Register</button>

    </form>

    <p class="login-text">
        Already have an account? <a href="login.jsp">Login</a>
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