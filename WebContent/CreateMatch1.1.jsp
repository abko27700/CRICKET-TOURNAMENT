<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Initialize the match</title>
<link rel = "stylesheet"
   type = "text/css"
   href = "style.css" />
</head>
<body>
<%String id1=request.getParameter("team1");%>
<%String id2=request.getParameter("team2");%>
<%String matchid=request.getParameter("matchid");%>
<center>
<br>
<h1><%=request.getParameter("matchtype")%></h1>
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
	<td><input type="hidden" value="notstarted" name="matchstatus">Not Started</td>
	<input type="hidden" value="general" name="from">
	
	<input type="hidden" value="<%=id1%>" name="team1">
	<input type="hidden" value="<%=id2 %>" name="team2">
	<input type="hidden" value="0/0" name="score">
	<input type="hidden" value="0" name="target">
	<input type="hidden" value="0.0" name="overs">
	<input type="hidden" value="null" name="matchwonby">
	<input type="hidden" value="<%=matchid%>" name="matchid">
	</tr>
	</table>
	<br>
	<input type="submit" value="Initialize">
</form>
</center>
</body>
</html>