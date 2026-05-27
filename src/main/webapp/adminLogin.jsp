<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f2f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-card {
            width: 350px;
            padding: 30px;
            background: #e9ecf1;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            border: 1.5px solid #9aa4b2;  /* ✅ soft dark grey */
        }

        h2 {
            margin-bottom: 5px;
        }

        .subtitle {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }

        .avatar {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: #dfe3ea;
            margin: 0 auto 20px;
            box-shadow: inset 0 0 10px rgba(0,0,0,0.1);
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 10px;
            border: none;
            outline: none;
            background: #f5f6fa;
        }

        /* ✅ PASSWORD WRAPPER FIX */
        .password-wrapper {
            position: relative;
            width: 100%;
        }

        .password-wrapper input {
            padding-right: 40px;
        }

        .toggle-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 16px;
        }

        .toggle-password i {
            color: #555;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border: none;
            border-radius: 10px;
            color: white;
            background: linear-gradient(to right, #4facfe, #00c6ff);
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            transform: scale(1.03);
        }

        .error {
            color: red;
            font-size: 13px;
        }
        
        .avatar-wrapper {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    margin: 0 auto 20px;
    overflow: hidden; /* Ensures the image stays circular */
    border: 3px solid #dfe3ea;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.avatar-img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* Prevents the image from stretching */
}


    </style>
</head>

<body>

<div class="login-card">

    <h2>ADMIN LOGIN</h2>
    <div class="subtitle">Login to manage system</div>

   <div class="avatar-wrapper">
    <img src="<%= request.getContextPath() %>/images/avtar.jpg" alt="Admin Avatar" class="avatar-img">
</div>

    <!-- ERROR MESSAGE -->
    <%
        if(request.getParameter("error") != null) {
    %>
        <p class="error">Invalid username or password</p>
    <%
        }
    %>

    <form action="AdminLoginServlet" method="post">

        <input type="text" name="username" placeholder="Enter username" required>

        <!-- ✅ FIXED PASSWORD FIELD -->
        <div class="password-wrapper">
            <input type="password" id="adminPassword" name="password" placeholder="Enter Password" required>

            <span class="toggle-password" onclick="togglePassword('adminPassword', this)">
                <i class="fa fa-eye"></i>
            </span>
        </div>

        <button type="submit">Login</button>

    </form>

</div>

<!-- ✅ JS -->
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