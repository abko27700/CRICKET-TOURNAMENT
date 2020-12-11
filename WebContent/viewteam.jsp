<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIEW TEAM</title>

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
<%String n=request.getParameter("team_id"); 
String name=request.getParameter("team_name");
%>
<%
		String url="jdbc:mysql://localhost:3306/virtusa";
		String username="root";
		String password="ENDGAME1289";
		String dbdriver="com.mysql.jdbc.Driver";
		String query="";
		java.sql.Statement stmt = null;
	    ResultSet rs = null;
	    Connection con = null;
	    
			try {
				Class.forName(dbdriver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
		    	con=DriverManager.getConnection(url,username,password);
		    	stmt=con.createStatement();
		    	query="select * from virtusa.players where teamName='"+name+"';";
		    	rs=stmt.executeQuery(query);
		    	
		    	
		    	%>

<center>
<h2>TEAM  <%=name%> </h2>
	<table>
		<tr>
			<td><h2>Player Namer</h2></td>
			<td><h2>Age</h2></td>
			<td><h2>ODI RANK</h2></td>
			<td><h2>Test Rank</h2></td>
			<td><h2>Centuries</h2></td>
			<td><h2>Remove Player</h2></td>
		</tr>
		<%
		    	while(rs.next())
		    	{
		    		%>
		    		<tr>
		    		
		    		<td><%= rs.getString("playerName")%></td>
		    		<td><%= rs.getString("age")%></td>
		    		<td><%= rs.getString("playerodiRank")%></td>
		    		<td><%= rs.getString("playertestRank")%></td>
		    		<td><%= rs.getString("centuries")%></td>
		    		<td>
		    		<form method="post" action="deleteplayer">
		    			<input type="hidden" value="<%=rs.getString("playerName")%>" name="playerName">
		    			<input type="submit" value="Remove">
		    		</form>
		    		</td>
		    		</tr>
		    		<%
		      	}
		    			}
		    		    catch (SQLException e) {
		    				// TODO Auto-generated catch block
		    		    	out.println("SQLException caught: " + e.getMessage());		
		    		    	}
		    		    finally {
		    		    	try {
		    		            if (con != null) con.close();	
		    		          }
		    		          catch (SQLException ignored) { }
		    		    }
		    		%>	
		    		    		
		    		    	
		    		</table>
		    		<br>
		    		<button class="btn third" onclick="window.location.href='addplayer.jsp'">ADD PLAYER</button>
	</center>
</body>
</html>