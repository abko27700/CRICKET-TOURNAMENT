<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP List Users Records</title>
<style>* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
  background-image: url('background2.png');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}

/* Float four columns side by side */
.column {
  float: left;
  width: 33%;
  padding: 0 10px;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;
		row-gap:	20px;
	}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  row-gap:	20px;
  
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 200px) {
  .column {
    width: 33%;
    display: block;
    margin-bottom: 20px;
    row-gap:	20px;
    
  }
}

/* Style the counter cards */
.card {
 width: 70%;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
  background-color: #;
  row-gap:	20px;
  
}
</style>

</head>
<body>

	<center>
	<h2>TEAMS VIEW</h2>
	<div class="row">
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
		    	query="select * from virtusa.teams";
		    	rs=stmt.executeQuery(query);
		    	int j=0;
		    	while(rs.next())
		    	{
		    		%>
		    		<div class="column">
    					<div class="card">
      						<h3><%= rs.getString("teamName")%></h3>
      						<p>ODI Rank:<%= rs.getString("odiRank")%></p>
      						<p>Test Rank:<%= rs.getString("testRank")%></p>
      						<p>Cups Won:<%= rs.getString("cupsWon")%></p>
    					</div>
  					</div>
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
	</div>
	</center>
</body>
</html>