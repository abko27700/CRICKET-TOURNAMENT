<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upcoming World cup Matches</title>
<link rel="stylesheet" type="text/css" href="boxes.css" />
</head>
</head>

<body>

	<div class="row">
		<div class="wrapper">
			
			<center>
				<h2>
					<strong>UPCOMING</strong>
				</h2>
				<div class="cards">
					<%
						databaseConnector dc = new databaseConnector();
					ResultSet rs = null;
					rs = databaseConnector.getCupMatches(request.getParameter("cupId"),"notStarted"); 
					while (rs.next()) {
						 
					%>
					<figure class="card">
						<center>
							<h3 style="color: white;"><%=rs.getString("team1")%>
								vs
								<%=rs.getString("team2")%></h3>
													</center>
					</figure>
					<%
						
					}
					%>
				</div>
		</div>

	<p><%=request.getParameter("cupId")+request.getParameter("type")%></p>




	</div>

</body>
</html>