<!DOCTYPE html>
<html>
<head>
    <title>Success</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="css/modern.css">

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f2f4f8;
            font-family: 'Segoe UI', sans-serif;
        }

        .success-box {
            background: #ffffff;
            padding: 55px;              /* ✅ increased padding */
            border-radius: 18px;
            text-align: center;

            width: 520px;               /* ✅ bigger width */

            border: 1.5px solid #9aa4b2;
            box-shadow: 0 12px 30px rgba(0,0,0,0.08);
        }

        .success-box h1 {
            color: #4facfe;
            margin-bottom: 18px;
            font-size: 26px;
            white-space: nowrap;
        }

        .success-box p {
            margin-bottom: 30px;
            color: #555;
            font-size: 16px;
        }

        .vote-btn {
            padding: 12px 25px;
            border-radius: 10px;
            border: none;
            background: linear-gradient(to right, #4facfe, #00c6ff);
            color: white;
            cursor: pointer;
            font-size: 15px;
        }

        .vote-btn:hover {
            opacity: 0.9;
        }
    </style>

    <!-- ✅ AUTO REDIRECT SCRIPT -->
    <script>
        setTimeout(function() {
            window.location.href = "index.jsp";
        }, 3000); // 3 seconds
    </script>

</head>

<body>

<div class="success-box">

    <h1>&#127881; Thank You for Voting!</h1>

    <p>Your vote has been successfully submitted.</p>

   <!-- <a href="index.jsp">
        <button class="vote-btn">Back to Home</button>
    </a>  -->

</div>

</body>
</html>