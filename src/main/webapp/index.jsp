<!DOCTYPE html>
<html>
<head>
    <title>Online Award Voting</title>
    <meta charset="UTF-8">

    <!-- Modern CSS -->
    <link rel="stylesheet" href="css/modern.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
           background: linear-gradient(to right, #eef2f3, #dfe9f3);
           
        }

        .main-container {
            max-width: 900px;
            margin: 50px auto;
            text-align: center;
        }

        .title {
            font-size: 32px;
            font-weight: 600;
            color: #333;
        }

        .subtitle {
            font-size: 18px;
            color: #666;
            margin-bottom: 25px;
        }

        .trophy {
            width: 90px;
            margin-bottom: 10px;
        }

        .card {
            background: #fff;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            margin-bottom: 20px;
            text-align: left;
            border: 1.5px solid #9aa4b2;  /* ✅ soft dark grey */
        }

        .card h3 {
            margin-bottom: 10px;
            color: #444;
        }

        .tagline {
            font-size: 16px;
            margin-bottom: 20px;
            text-align: center;
        }

        .highlight {
            color: #4facfe;
            font-weight: 600;
        }

        /* BUTTONS */
        .actions {
            margin-top: 25px;
        }

        .btn {
            display: inline-block;
            padding: 10px 18px;
            margin: 8px;
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

        .footer {
            margin-top: 40px;
            font-size: 13px;
            color: #777;
        }
        
        .trophy-container {
    text-align: center;
    margin-top: 30px;
}

.trophy-img {
    width: 80px;
    height: auto;
    filter: drop-shadow(0 0 10px gold);
    animation: float 2s ease-in-out infinite;
}

/* Smooth floating animation */
@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-8px); }
    100% { transform: translateY(0px); }
}

.home-bg {
   background-color: #eaf4fc;   /* light blue */
    min-height: 100vh;
}

    </style>
</head>

<body>
<div class="home-bg">

<%
    String msg = request.getParameter("msg");

    if ("success".equals(msg)) {
%>
<script>
    alert("Your vote has been submitted successfully!");
</script>
<%
    } else if ("already".equals(msg)) {
%>
<script>
    alert("You have already voted!");
</script>
<%
    }
%>

<div class="main-container">

    <!-- TROPHY + TITLE -->
   <div class="trophy-container">
    <img src="images/trophy.png" alt="Trophy" class="trophy-img">
</div>

    <div class="title">Bollywood Hungama Awards 2026</div>
    <div class="subtitle">Online Voting System</div>

    <!-- TAGLINE -->
    <div class="tagline">
        Vote for your favorite 
        <span class="highlight">Movies</span>, 
        <span class="highlight">Actors</span>, 
        <span class="highlight">Actresses</span> & 
        <span class="highlight">Villains</span>
    </div>

    <!-- ABOUT -->
    <div class="card">
        <h3>About</h3>
        <p>
            The Online Award Voting System is a web-based platform designed
            to allow users to vote for their favorite movies, actors, actresses,
            and villains in a fair and transparent manner.
            <br><br>
            Each registered user can participate and cast their vote securely.
        </p>
    </div>

    <!-- RULES -->
    <div class="card">
        <h3>Rules</h3>
        <ul>
            <li>Only registered users can vote</li>
            <li>Each user can vote only once</li>
            <li>No duplicate voting allowed</li>
            <li>Results are public</li>
        </ul>
    </div>

    <!-- BUTTONS -->
    <div class="actions">
        <a href="register.jsp" class="btn">Register</a>
        <a href="login.jsp" class="btn">Login</a>
        <a href="result.jsp" class="btn">View Results</a>
        <a href="adminLogin.jsp" class="btn">Admin</a>
    </div>

    <!-- FOOTER -->
    <div class="footer">
        #Bollywood Hungama Awards 2026
    </div>

</div>
</div>

</body>
</html>