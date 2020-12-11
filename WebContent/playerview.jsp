<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP List Users Records</title>
<style>
table, td, th {  
  border: 2px solid #000;
  text-align: left;
}

table {
  border-collapse: collapse;
  width: 60%;
}

th, td {
  padding: 15px;
}
tr:hover {background-color: #D7FFFF	;}
body {
  background-image: url('background2.png');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}
</style>

</head>
<body>

	<center>
	<h2>TEAMS VIEW</h2>
	<table>
		<tr>
		 
		<td>PLayer Name</td>
		<td>Age</td>
		
		<td>Team Name</td>
		<td>ODI Rank</td>
		<td>Test Rank</td>
		<td>Centuries:</td>
		<td>Remove Player</td>
		</tr>
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
		    	query="select * from virtusa.players order by teamName";
		    	rs=stmt.executeQuery(query);
		    	int j=0;
		    	while(rs.next())
		    	{
		    		%>
		    		<tr>
		    		
		    		<td><%= rs.getString("playerName")%></td>
		    		<td><%= rs.getString("age")%></td>
		    		<td><%= rs.getString("teamName")%></td>
		    		<td><%= rs.getString("playerodiRank")%></td>
		    		<td><%= rs.getString("playertestRank")%></td>
		    		<td><%= rs.getString("centuries")%></td>
		    		<td>
		    		<form method="post" action="deleteplayer">
		    			<input type="hidden" value="<%=rs.getString("playerName")%>" name="playerName">
		    			<input type="submit" value="Delete">
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
<form action="addplayer.html">
    <input type="submit" value="ADD PLAYER" />
</form>
	</center>
</body>
</html>