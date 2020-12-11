<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Admin Ongoing WorldCups</title>
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
      <a href="AdmingCompletedCup.jsp">Finished</a>
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
<h3>Ongoing World Cups</h3>
<table>
		<tr>
			<td>Cup Name</td>
			<td>View Matches</td>
			<td>Match Status</td>
			<td>Update Status</td>
			<td>Delete Cup</td>
 
	<%
	//databaseConnector dc=new databaseConnector(); 
	String query="select * from cup where status="+"'Completed'";
	//ResultSet rs=databaseConnector.getcup(query);
	databaseConnector dc = new databaseConnector();
	ResultSet rs = null;
	rs = databaseConnector.getcup(query);
	
			while(rs.next())
			{
			%>
		<tr>
			<td><%=rs.getString("cupId")%></td>
			<td>
				<form action="completedView.jsp?type=Started&cupId=<%=rs.getString("cupId")%>">
				<input type="hidden" value="Completed" name="type">
					<input type="hidden" value="<%=rs.getString("cupId")%>"
						name="cupId"> <input type="submit" value="View Matches">
				</form>
			</td>
			<td>
			<form action="CupStatusUpdate" method="post">
				<select name="CupStatus">
					<option value="Started">Ongoing</option>
					<option value="Completed">Completed</option>
					<option value="notStarted">Upcoming</option>
					
				</select>
			</td>		
					
			<td>
				<input type="hidden" value="/AdminOngoingCup.jsp" name="From">
				<input type="hidden" value="CupStatusUpdate" name="type">
				<input type="hidden" value="<%=rs.getString("cupId")%>" name="cupId">
				<input type="submit" value="Update">
				</form>
			</td>
			<td>
				<form action="CupStatusUpdate" method="post">
					<input type="hidden" value="/AdminOngoingCup.jsp" name="From">
					<input type="hidden" value="<%=rs.getString("cupId")%>" name="cupId"> <input type="submit" value="Delete">
					<input type="hidden" value="CupDelete" name="type">
				</form>
			</td>
			<%
		    	}
			
		   
		%>


		</table>
</body>

</html>