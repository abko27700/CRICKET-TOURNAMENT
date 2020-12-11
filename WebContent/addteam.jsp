<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD A NEW TEAM</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<%
		databaseConnector dc = new databaseConnector();
	    final int n = dc.newteamid();
	%>
	<center>
	<form action="teamadd" method="post" enctype="multipart/form-data" class="center">
			<br> <br> <br>
			<h2>ENTER TEAM DATA</h2>
			<table class="center">
				<tr>
					<td>Team Name:</td>
					<td>
					<input type="hidden" name="team_id" value=<%=n%>>
					<input type="text"
						style="border: 1px solid #000; background: transparent; color: black;"
						name="team_name"></td>
				</tr>
				<tr>
					<td>ODI Rank:</td>
					<td><input type="text"
						style="border: 1px solid #000; background: transparent; color: black;"
						name="team_odi_rank" value="0"></td>
				</tr>
				<tr>
					<td>Test Rank:</td>
					<td><input type="text"
						style="border: 1px solid #000; background: transparent; color: black;"
						name="team_test_rank" value="0"></td>
				</tr>
				<tr>
					<td>Cups Won:</td>
					<td><input type="text"
						style="border: 1px solid #000; background: transparent; color: black;"
						name="team_cups_won" value="0"></td>
				</tr>
				<td>SUBMIT DATA</td>
				<td><input type="submit" value="ADD TEAM"></td>
				</tr>
			</table>
	
	</form>
	</center>
	<br>
	<br>
	<br>
	<center>
		<a href="trial.jsp">
			<button>View Teams</button>
		</a>
	</center>
</body>
</html>