<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MATCH VIEW</title>
<link rel = "stylesheet"
   type = "text/css"
   href = "style.css" />
</head>
</head>
<body>
<center>
<div class="row">
<h1>ADMIN VIEW</h1>
<h2>UPCOMING MATCHES</h2>
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
		con=DriverManager.getConnection(url,username,password);
    	stmt=con.createStatement();
    	query="select * from virtusa.cricket where matchstatus='notstarted'";
    	rs=stmt.executeQuery(query);
    	while(rs.next())
    	{
    		%>
    		<div class="column">
				<div class="card">
						<h3><%=rs.getString("team1")%> vs <%=rs.getString("team2")%></h3>
						<h3><%=rs.getString("matchtype")%></h3>
						
						<p><%= rs.getString("tosswonby")%> won the toss and</p>
						<p>choose to <%= rs.getString("chooseto")%></p>
						
				</div>
				</div>
    		<%
    	}
	
	%>
</div>
<br>
<h2>ONGOING MATCHES</h2>	
<div class="row">
<%query="select * from virtusa.cricket where matchstatus='started'";
rs=stmt.executeQuery(query); 
while(rs.next())
    	{
    		%>
    		<div class="column">
				<div class="card">
						<h3><%=rs.getString("team1")%> vs <%=rs.getString("team2")%></h3>
						<h3><%=rs.getString("matchtype")%></h3>
						
						<p><%= rs.getString("tosswonby")%> won the toss and choose to <b><%= rs.getString("chooseto")%></b></p>
						<p>Innings:<%=rs.getString("innings")%></p>
						<p>Score:<%=rs.getString("score") %> in <%=rs.getString("overs")%> Overs</p>
						<p>Target : <%=rs.getString("target") %></p>	
						<%if(rs.getString("innings")=="1")
						{
						%>
						<p>Target : <%=rs.getString("target") %></p>
						<% }%>
				</div>
				</div>
    		<%
    	}
%>
</div>
</center>
</body>
</html>