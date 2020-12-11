<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Host a new Cup</title>
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
	<form action="NewCup" method="post">
		<table>
			<tr>

				<td>Cup Type :</td>
				<td>
						<select id="type" name="type">
							<option value="ODI">ODI</option>
							<option value="T-20">T-20</option>
						</select>
				</td>
			</tr>
			<tr>
				<td>No of Teams :</td>
				<td><input type="text" name="limit"></td>
			</tr>
			<tr>
				<td>CupID</td>
				<td><input type="text" name="CupId" value="Ex: 2020"></td>
			</tr>
		</table>
		<input type="submit">
	</form>
</body>
</html>