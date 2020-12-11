<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MATCH VIEW</title>
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
					rs = databaseConnector.matches();

					while (rs.next()) {
						if (rs.getString("matchstatus").charAt(0) == 'n') {
					%>
					<figure class="card">
						<center>
							<h3 style="color: white;"><%=rs.getString("team1")%>
								vs
								<%=rs.getString("team2")%></h3>
							<h3 style="color: white;"><%=rs.getString("matchtype")%></h3>

							<p style="color: white;"><%=rs.getString("tosswonby")%>
								won the toss 
							</p>
							<p style="color: white;">
							<%=rs.getString("tosswonby")%> choose to  <%=rs.getString("chooseto")%>
							</p>

						
						</center>
					</figure>
					<%
						}
					}
					%>
				</div>
		</div>






	</div>

</body>
</html>