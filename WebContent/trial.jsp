<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP List Users Records</title>
<link rel = "stylesheet"
   type = "text/css"
   href = "style.css" />
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
	<center>
		<h2>TEAMS VIEW</h2>
		<table>
			<tr>
				<td>Team Id</td>
				<td>Team Name</td>
				<td>ODI Rank</td>
				<td>Test Rank</td>
				<td>Cups Won</td>
				<td>Remove team</td>
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
				<td><%= rs.getString("cupsWon")%></td>
				<td>
					<form action="deleteteam">
						<input type="hidden" value="<%=rs.getString("teamId")%>"
							name="team_id"> <input type="submit" value="Remove">
					</form>
				</td>
				<td>
					<form action="viewteam.jsp">
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