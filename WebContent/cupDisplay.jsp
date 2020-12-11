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
	<%  
		String type=request.getParameter("type");
		String cupId=request.getParameter("cupId");
	%>
	<%
		if(type.equals("started"))
		{
			%>
				<div class="row">
		<div class="wrapper">
			<center>
				<h2>
					<strong>ONGOING</strong>
				</h2>
				<div class="cards">
					<%
					databaseConnector dc = new databaseConnector();
					ResultSet rs = null;
					rs = databaseConnector.getCupMatches( cupId,type);
					int j=0;		
					while (rs.next()) {
						if (rs.getString("matchstatus").charAt(0) == 's') {
							j=1;
					%>
					<figure class="card">
							<h3 style="color: white;"><%=rs.getString("team1")%>
								vs
								<%=rs.getString("team2")%></h3>
							<h3 style="color: white;"><%=cupId.substring(0,4)%> <%=cupId.substring(5,cupId.length())%></h3>

							<p style="color: white;"><%=rs.getString("tosswonby")%>
								won the toss and choose to <b><%=rs.getString("chooseto")%></b>
							</p>
							<p style="color: white;">
								Innings:<%=rs.getString("innings")%></p>
							<p style="color: white;">
								Score:<%=rs.getString("score")%>
								in
								<%=rs.getString("overs")%>
								Overs
							</p>
							<%
								if (rs.getString("innings").charAt(0) == '2') {
							%>
							<p style="color: white;">
								Target :
								<%=rs.getString("target")%></p>
							<%
								}
							%>
					</figure>
					<%
						}
						
					}
					if(j==0)
					{
						%>
						<h3 style="color: white;">No Ongoing Matches</h3>
						<% 
						
					}
					%>
				</div>
		</div>
			<% 
		}
		else if(type.equals("notStarted"))
		{
			%>
			<div class="row">
		<div class="wrapper">
			
			<center>
				<h2>
					<strong>UPCOMING</strong>
				</h2>
				<div class="cards">
					<%
					int i=1;
						databaseConnector dc = new databaseConnector();
					ResultSet rs = null;
					rs = databaseConnector.getCupMatches( cupId,"random");
int j=0;
					while (rs.next()) {
						if (rs.getString("matchstatus").charAt(0) == 'n') {
							j=1;
					%>
					<figure class="card">
						<center>
							<h3 style="color: white;"><%=rs.getString("team1")%>
								vs
								<%=rs.getString("team2")%></h3>
<h3 style="color: white;"><%=cupId.substring(0,4)%> <%=cupId.substring(5,cupId.length())%></h3>

							<p style="color: white;">Upcoming Match no <%=i++ %></p>
						
						
						</center>
					</figure>
					<%
						}
					}
					if(j==0)
					{
						%>
						<h3 style="color: white;">No Upcoming Matches</h3>
						<% 
						
					}
					%>
				</div>
		</div>
			<% 	
		}
		else{
			%>
			<div class="row">
		<div class="wrapper">
			
			<center>
				<h2>
					<strong>COMPLETED</strong>
				</h2>
				<div class="cards">
					<%
					databaseConnector dc = new databaseConnector();
					ResultSet rs = null;
					rs = databaseConnector.getCupMatches( cupId,type);
					int j=0;
					while (rs.next()) {
						if (rs.getString("matchstatus").charAt(0) == 'f') {
							j=1;
					%>
					<figure class="card">
						<center>
							<h3 style="color: white;"><%=rs.getString("team1")%>
								vs
								<%=rs.getString("team2")%></h3>
							<h3 style="color: white;"><%=cupId.substring(0,4)%> <%=cupId.substring(5,cupId.length())%></h3>

							<p style="color: white;"><%=rs.getString("tosswonby")%>
								won the toss and choose to <b><%=rs.getString("chooseto")%></b>
							</p>
							<p style="color: white;">
							<%=rs.getString("matchwonby")%> won the Match</p>
							<p style="color: white;">
								Score:<%=rs.getString("score")%>
								in
								<%=rs.getString("overs")%>
								Overs
							</p>

							<%
								if (rs.getString("innings").charAt(0) == '2') {
							%>
							<p style="color: white;">
								Target :
								<%=rs.getString("target")%></p>
							<%
								}
							%>
						</center>
					</figure>
					<%
						}
					}
					if(j==0)
					{
						%>
						<h3 style="color: white;">No Completed Matches</h3>
						<% 
						
					}
					%>
					
				</div>
		</div>

	</div>
			
			<% 
		}
	%>	 
</body>
</html>