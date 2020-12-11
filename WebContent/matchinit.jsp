<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>

<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"
   type = "text/css"
   href = "style.css" />
<meta charset="ISO-8859-1">
<title>Match Initialize</title>
</head>
<body>
	<%String id1=request.getParameter("team1");%>
<%String id2=request.getParameter("team2");%>
<%String matchid=request.getParameter("matchid");%>
	<h2><%=id1%> VS <%=id2%>  </h2>
	<form method="post" action="matchdeploy">
	<table>
	<tr>
		<td>Toss Won By</td>
		<td><select  name="tosswonby">
			<option value="<%=id1%>"><%=id1%></option>
			<option value="<%=id2%>"><%=id2%></option>
			</select>
		</td>
	</tr>
	<tr>
		<td>Innings</td>
		<td><input type="hidden" value="<%=request.getParameter("matchtype")%>" name="matchtype"><input type="hidden" value="1" name="innings">1</td>
		
	</tr>
	<tr>
		<td>
		Choose to
		</td>
		<td>
		<select  name="chooseto">
			<option value="Bat">Bat</option>
			<option value="Field">Field</option>
			</select>
		</td>
	</tr>
	<tr>
	<td>Match Status</td>
	<td><input type="hidden" value="Started" name="matchstatus">Started
	<input type="hidden" value="cup" name="from">
	<input type="hidden" value="<%=id1%>" name="team1">
	<input type="hidden" value="<%=id2 %>" name="team2">
	<input type="hidden" value="0/0" name="score">
	<input type="hidden" value="0" name="target">
	<input type="hidden" value="0.0" name="overs">
	<input type="hidden" value="null" name="matchwonby">
	<input type="hidden" value="<%=matchid%>" name="matchid">
	</td>
	</tr>
	</table>
	<br>
	<input type="submit" value="Initialize">
</form>
</body>
</html>