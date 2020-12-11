<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
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
		databaseConnector dc = new databaseConnector();
		ResultSet rs = null;
	%>	<div class="row">
		<div class="wrapper">
			<% 
HashMap<String,String>map=new HashMap<>();
			rs = databaseConnector.getCupMatches( cupId,type);
			while(rs.next())
			{
				if(rs.getString("matchid").contains("_sf1"))
				{
							map.put("Semi Final 1",rs.getString("matchwonby"));
				}
				else if(rs.getString("matchid").contains("_sf2"))
				{
					map.put("Semi Final 2",rs.getString("matchwonby"));
				}
				else if(rs.getString("matchid").contains("_f"))
				{
					map.put("Finals",rs.getString("matchwonby"));
				}
			}
			%>
			<p></p>
			<center>
			<h2>
					<strong>WINNER  : <%=map.get("Finals") %></strong>
				</h2>
				<h2>
					<strong>Match Outcomes</strong>
				</h2>
				<div class="cards">
					<%
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
			
</body>
</html>