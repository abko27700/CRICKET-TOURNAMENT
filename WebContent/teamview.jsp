<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teams View</title>
<link rel = "stylesheet"
   type = "text/css"
   href = "style.css" />
</head>
<body>

	<center>
		<h2>TEAMS VIEW</h2>
		<table>
			<tr>
				<td>Team Id</td>
				<td>Team Name</td>
				<td>ODI Rank</td>
				<td>Test Rank</td>
				<td>ODI Points</td>
				<td>T20 Points</td>
				<td>Cups Won</td>
				<td>View Team</td>
			</tr>
			<%
		    	databaseConnector dc = new databaseConnector();
				ResultSet rs = null;
				rs = databaseConnector.teamnames();
		    	while(rs.next())
		    	{
		    		%>
			<tr>
				<td><%= rs.getString("teamId")%></td>
				<td><%= rs.getString("teamName")%></td>
				<td><%= rs.getString("odiRank")%></td>
				<td><%= rs.getString("testRank")%></td>
				
				<td><%=rs.getString("odipoints") %></td>
				<td><%=rs.getString("t20points") %></td>
				<td><%= rs.getString("cupsWon")%></td>
				<td>
					<form action="userplayers.jsp">
						<input type="hidden" value="<%=rs.getString("teamName") %> "
							name="team_name"> <input type="submit" value="View Team">
					</form>
				</td>
			</tr>
			<%
		    	}
			
		   
		%>


		</table>


	</center>
</body>
</html>