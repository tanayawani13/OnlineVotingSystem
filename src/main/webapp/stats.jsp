<meta charset="UTF-8">
<%@ page import="java.sql.*" %>
<%@ page import="dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Voting Analytics</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="css/modern.css">
        <meta charset="UTF-8">

    <style>
    
    /* 🚨 FORCE RESET (OVERRIDE EVERYTHING) */
body {
    display: block !important;
    text-align: center !important;
    margin: 0;
}

/* 🏆 TITLE FIX */
.title-section {
    width: 100% !important;
    text-align: center !important;
    margin-top: 20px;
}

/* 📊 GRID CENTER */
.chart-container {
    display: grid !important;
    grid-template-columns: repeat(2, 1fr);
    justify-items: center !important;
    gap: 20px;
    width: 80%;
    margin: 30px auto;
}

/* 🔙 BUTTON */
.back-btn {
    text-align: center !important;
    margin: 30px 0;
}


        body {
            font-family: Arial;
            text-align: center;
        }

/* 🔲 GRID FOR 4 CHARTS */
.chart-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr); /* 2 above, 2 below */
    gap: 30px;
    width: 80%;
    margin: 40px auto;
   
}


    .chart-box {
    background: white;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 0 10px rgba(0,0,0,0.15);
    width: 300px;          /* 🔥 reduce size */
    margin: auto;
    border: 1.5px solid #9aa4b2;  /* ✅ soft dark grey */
	}

        h2 {
            margin-top: 30px;
        }

        .back-btn {
            margin: 30px;
        }
        
        /* 🔥 FORCE FULL CENTER LAYOUT */
.main-wrapper {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;   /* 🔥 THIS FIXES RIGHT SHIFT */
}

/* 🏆 TITLE FIX */
.title-section {
    width: 100%;
    text-align: center;
    margin-top: 20px;
}

/* 📊 GRID FIX */
.chart-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    justify-items: center;
    gap: 20px;
    width: 80%;
    margin-top: 30px;
}

/* 🔙 BUTTON FIX */
.back-btn {
    text-align: center;
    margin: 30px 0;
}

    </style>
</head>

<body>

<div class="title-section">
    <h1 style="text-align:center;">Voting Statistics</h1>
</div>

<%
Connection con = DBConnection.getConnection();
%>

<div class="main-wrapper">

<div class="chart-container"> 

<!-- ================= MOVIE ================= -->
<div class="chart-box">
<h2>Best Movie</h2>
<canvas id="movieChart"></canvas>
</div>

<!-- ================= ACTOR ================= -->
<div class="chart-box">
<h2>Best Actor</h2>
<canvas id="actorChart"></canvas>
</div>

<!-- ================= ACTRESS ================= -->
<div class="chart-box">
<h2>Best Actress</h2>
<canvas id="actressChart"></canvas>
</div>

<!-- ================= VILLAIN ================= -->
<div class="chart-box">
<h2>Best Villain</h2>
<canvas id="villainChart"></canvas>
</div>


</div>

<%
/* FUNCTION TO FETCH DATA */
StringBuilder movieNames = new StringBuilder();
StringBuilder movieVotes = new StringBuilder();

PreparedStatement ps1 = con.prepareStatement("SELECT nominee_name, vote_count FROM nominees WHERE category_id=1");
ResultSet rs1 = ps1.executeQuery();
while(rs1.next()){
    movieNames.append("'").append(rs1.getString(1)).append("',");
    movieVotes.append(rs1.getInt(2)).append(",");
}

/* ACTOR */
StringBuilder actorNames = new StringBuilder();
StringBuilder actorVotes = new StringBuilder();

PreparedStatement ps2 = con.prepareStatement("SELECT nominee_name, vote_count FROM nominees WHERE category_id=2");
ResultSet rs2 = ps2.executeQuery();
while(rs2.next()){
    actorNames.append("'").append(rs2.getString(1)).append("',");
    actorVotes.append(rs2.getInt(2)).append(",");
}

/* ACTRESS */
StringBuilder actressNames = new StringBuilder();
StringBuilder actressVotes = new StringBuilder();

PreparedStatement ps3 = con.prepareStatement("SELECT nominee_name, vote_count FROM nominees WHERE category_id=3");
ResultSet rs3 = ps3.executeQuery();
while(rs3.next()){
    actressNames.append("'").append(rs3.getString(1)).append("',");
    actressVotes.append(rs3.getInt(2)).append(",");
}

/* VILLAIN */
StringBuilder villainNames = new StringBuilder();
StringBuilder villainVotes = new StringBuilder();

PreparedStatement ps4 = con.prepareStatement("SELECT nominee_name, vote_count FROM nominees WHERE category_id=4");
ResultSet rs4 = ps4.executeQuery();
while(rs4.next()){
    villainNames.append("'").append(rs4.getString(1)).append("',");
    villainVotes.append(rs4.getInt(2)).append(",");
}
%>

<script>

/* 🎬 MOVIE */
new Chart(document.getElementById("movieChart"), {
    type: 'pie',
    data: {
        labels: [<%= movieNames.toString() %>],
        datasets: [{
            data: [<%= movieVotes.toString() %>]
        }]
    }
});

/* 🎭 ACTOR */
new Chart(document.getElementById("actorChart"), {
    type: 'pie',
    data: {
        labels: [<%= actorNames.toString() %>],
        datasets: [{
            data: [<%= actorVotes.toString() %>]
        }]
    }
});

/* 👩 ACTRESS */
new Chart(document.getElementById("actressChart"), {
    type: 'pie',
    data: {
        labels: [<%= actressNames.toString() %>],
        datasets: [{
            data: [<%= actressVotes.toString() %>]
        }]
    }
});

/* 😈 VILLAIN */
new Chart(document.getElementById("villainChart"), {
    type: 'pie',
    data: {
        labels: [<%= villainNames.toString() %>],
        datasets: [{
            data: [<%= villainVotes.toString() %>]
        }]
    }
});

</script>

<div class="back-btn">
    <a href="result.jsp">
        <button class="modern-btn"> Back to Results</button>
    </a>
</div>

</div>

</body>
</html>