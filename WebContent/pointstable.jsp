<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Points Table</title>
<link rel = "stylesheet"
   type = "text/css"
   href = "style.css" />
</head>
<body>

	<center>
		<h2>POINTS TABLE</h2>
		<table>
			<tr>
				
				<td>Team Name</td>
				
				<td>Points</td>
			
				<td>View Team</td>
			</tr>
			<%
			String cupId=request.getParameter("cupId");
		    	databaseConnector dc = new databaseConnector();
				ResultSet rs = null;
				rs = databaseConnector.points(cupId);
		    	while(rs.next())
		    	{
		    		%>
			<tr>
				<td><%= rs.getString("teamName")%></td>
				<td><%=rs.getString("points") %></td>
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