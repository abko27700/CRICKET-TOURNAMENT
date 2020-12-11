<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CREATE NEW MATCH</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div class="navbar">
  <a href="#home">Home</a>
  <div class="dropdown">
    <button class="dropbtn">General Matches
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="CreateMatch.jsp">Create Matches</a>
      <a href="boxestrial.jsp">View Matches</a>
      <a href="MatchEdit.jsp">Edit Matches</a>      
    </div>
  </div>
  <div class="dropdown">
    <button class="dropbtn">WorldCup
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
  		  
      <a href="AdminNewCup.jsp">New World Cup</a>  
      <a href="AdminOngoingCup.jsp">Ongoing</a>
      <a href="AdmingCompletedCup">Finished</a>
      <a href="AdminFutureCup.jsp">Upcoming</a>
    </div>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">Teams
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="trial.jsp">View Teams</a>
      <a href="#">Points Table</a>
    </div>
  </div>
</div>
	<br>
	<br>
	<br>
		<form action="CreateMatch1.1.jsp" method="post">
			<table>
				<tr>
					<td><labelfor"team1">Select Team 1:</label></td>
					<td><select id="team1" name="team1">
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
				<br>
				<br>
				<tr>
					<td><labelfor"team2">Select Team 2:</label></td>
					<td><select id="team2" name="team2">

							<%
								rs = databaseConnector.teamnames();
							while (rs.next()) {
							%>
							<option value="<%=rs.getString("teamName")%>"><%=rs.getString("teamName")%></option>
							<%
								}
							int n = dc.newmatchId();
							%>
					</select></td>
				</tr>
				<td>Match Type</td>
				<td><select id="type" name="matchtype">
						<option value="ODI">ODI</option>
						<option value="T-20">T-20</option>
				</select>
				</tr>
				<tr>
					<td>Create</td>
					<td><input type="hidden" name="matchid" value=<%=n%>> <input
						type="submit"></td>
				</tr>
				<tr>
			</table>

		</form>
</body>
</html>