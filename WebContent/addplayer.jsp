<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD PLAYER</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<center>
		<form action="playeradd" method="post" enctype="multipart/form-data">
			<h2>ENTER PLAYER DATA</h2>
			<table>
				<tr>
					<td>Player Name:</td>
					<td><input type="text"
						style="border: 1px solid #000; background: transparent; color: black;"
						name="player_name"></td>
				</tr>
				<tr>
					<td>Team Name:</td>
					<td><select id="team_name" name="team_name">
							<%
								databaseConnector dc = new databaseConnector();
							ResultSet rs = null;
							rs = databaseConnector.teamnames();
							while (rs.next()) {
							%>
							<option value="<%=rs.getString("teamName")%>"><%=rs.getString("teamName")%></option>
							<%
								}
							%>
					</select></td>
				</tr>

				<tr>
					<td>Age:</td>
					<td><input type="text"
						style="border: 1px solid #000; background: transparent; color: black;"
						name="player_age"></td>
				</tr>
				<td>ODI Rank:</td>
				<td><input type="text"
					style="border: 1px solid #000; background: transparent; color: black;"
					name="player_odi_rank"></td>
				</tr>
				<tr>
					<td>T-20 Rank:</td>
					<td><input type="text"
						style="border: 1px solid #000; background: transparent; color: black;"
						name="player_test_rank"></td>
				</tr>
				<tr>
					<td>Centuries</td>
					<td><input type="text"
						style="border: 1px solid #000; background: transparent; color: black;"
						name="player_centuries"></td>
				</tr>

				<td>SUBMIT DATA</td>
				<td><input type="submit" value="ADD PLAYER"></td>
				</tr>
			</table>
	</center>
	</form>
	<br>
	<br>
	<br>
	<center>
		<a href="playerview.jsp">
			<button>View Players</button>
		</a>
	</center>
</body>
</html>
