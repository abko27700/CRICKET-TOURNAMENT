<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit match details</title>
<link rel = "stylesheet"
   type =   "text/css"
   href =   "style.css" />
</head>
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
<%
		databaseConnector dc = new databaseConnector();
		ResultSet rs = null;
		rs = databaseConnector.matches();
%>
 
<h2>Upcoming Matches</h2>
<table>
	<tr>
		<td>Team 1</td>
		<td>Team 2</td>
		<td>Match Type</td>
		<td>Match Status</td>
		<td>Update Status</td>
		<td>Remove Match</td>
		
	</tr>
	<%
		while(rs.next())
		{
			if(rs.getString("matchstatus").charAt(0)=='n')
			{
			%>
			<tr>
			<td><%=rs.getString("team1") %></td>
			<td><%=rs.getString("team2") %></td>
			<td><%=rs.getString("matchtype")%></td>
			
			<td>
			<form action="MatchStatusUpdate" method="post">
				<select name="matchstatus">
					<option value="notstarted">Upcoming</option>
					<option value="started">Ongoing</option>
				</select>
			</td>
			<td>
				<input type="hidden" name="id" value="<%=rs.getString("id") %>">
				<input type="submit" value="Update">
				</form>
			</td>
			<td>
			<form action="MatchRemove" method="post">
			<input type="hidden" name="id" value="<%=rs.getString("id") %>">
			<input type="submit" value="Remove">
			</form>
			</td>
			</tr>
			<% 
			}
		}
	%>
	<%
	rs = databaseConnector.matches();
	%>
</table>
<h2>Ongoing Matches</h2>
	<table>
		<tr>
		<td>Team 1</td>
		<td>Team 2</td>
		<td>Match Type</td>
		<td>Innings</td>
		<td>Batting</td>
		<td>Score</td>
		<td>Overs</td>
		<td>Target</td>
		<td>Match Status</td>
		<td>Winner</td>
		<td>Update</td>
		<td>Remove Match</td>
		</tr>
		<%
		while(rs.next())
		{
			if(rs.getString("matchstatus").charAt(0)=='s')
			{
			%>
			<%
			int cur=Integer.parseInt(rs.getString("innings"));
			int temp;
			if(cur==1)
			{
				temp=2;
			}
			else{
				temp=1;
			}
			%>
			<tr>
			<td><%=rs.getString("team1") %></td>
			<td><%=rs.getString("team2") %></td>
			<td><%=rs.getString("matchtype")%></td>
			<form action="MatchUpdate" method="post">
			<td>
				<select name="innings">
					<option value=<%=cur%>><%=cur%></option>
					<option value=<%=temp%>><%=temp%></option>
				</select>
			</td>
			<td>
			<%	String batting="";
				if(rs.getInt("innings")==1)
				{
					if(rs.getString("tosswonby")==rs.getString("team1"))
					{
						if(rs.getString("chooseto")=="Bat")
						{
							batting=rs.getString("team1");
						}
						else{
							batting=rs.getString("team2");
						}
					}
					else{
						if(rs.getString("chooseto")=="Bat")
						{
							batting=rs.getString("team1");
						}
						else{
							batting=rs.getString("team2");
						}
					}
				}
				else
				{
					if(rs.getString("tosswonby")==rs.getString("team1"))
					{
						if(rs.getString("chooseto")=="Bat")
						{
							batting=rs.getString("team2");
						}
						else{
							batting=rs.getString("team1");
						}
					}
					else{
						if(rs.getString("chooseto")=="Bat")
						{
							batting=rs.getString("team1");
						}
						else{
							batting=rs.getString("team2");
						}
					}
				}
			%>
			<%=batting%>
			</td>
			<td><input type="text" name="score" value="<%= rs.getString("score")%> "size="4"></td>
			<td><input type="text" name="overs" value="<%= rs.getString("overs")%>"size="4"></td>
			<td><input type="text" name="target" value="<%= rs.getString("target")%>"size="4"></td>
			<td>
				<select name="matchstatus">
				<option value="started">Ongoing</option>
					<option value="finished">Finished</option>
					<option value="notstarted">Upcoming</option>
				</select>
			</td>
			<td>
				<select name="winner">
					<option value="null">null</option>
					<option value="<%=rs.getString("team1")%>"><%=rs.getString("team1")%></option>
					<option value="<%=rs.getString("team2")%>"><%=rs.getString("team2")%></option>
				</select>
			</td>
				<input type="hidden" name="from" value="general">
			<input type="hidden" name="id" value="<%=rs.getString("id") %>">
			<input type="hidden" name="matchtype" value="<%=rs.getString("matchtype")%>">
			<input type="hidden" name="team1" value="<%=rs.getString("team1")%>">
			<input type="hidden" name="team2" value="<%=rs.getString("team2")%>">
			<td><input type="submit" value="Update"></td>
			</form>
			<td>
			<form action="MatchRemove" method="post">
			<input type="hidden" name="id" value="<%=rs.getString("id") %>">
			<input type="submit" value="Remove">
			</form>
			</td>
			</tr>
			<%
			}
		}
		%>
	</table>
	<%
	rs = databaseConnector.matches();
	%>
	</table>
<h2>Finished Matches</h2>
	<table>
		<tr>
		<td>Team 1</td>
		<td>Team 2</td>
		<td>Match Type</td>
		<td>Innings</td>
		<td>Batting</td>
		<td>Score</td>
		<td>Overs</td>
		<td>Target</td>
		<td>Match Status</td>
		<td>Winner</td>
		<td>Update</td>
		<td>Remove Match</td>
		</tr>
		<%
		while(rs.next())
		{
			if(rs.getString("matchstatus").charAt(0)=='f')
			{
			%>
			<%
			int cur=Integer.parseInt(rs.getString("innings"));
			int temp;
			if(cur==1)
			{
				temp=2;
			}
			else{
				temp=1;
			}
			%>
			<tr>
			<td><%=rs.getString("team1") %></td>
			<td><%=rs.getString("team2") %></td>
			<td><%=rs.getString("matchtype")%></td>
			<form action="MatchUpdate" method="post">
			<td>
				<select name="innings">
					<option value=<%=cur%>><%=cur%></option>
					<option value=<%=temp%>><%=temp%></option>
				</select>
			</td>
			<td>
			<%	String batting="";
				if(rs.getInt("innings")==1)
				{
					if(rs.getString("tosswonby")==rs.getString("team1"))
					{
						if(rs.getString("chooseto")=="Bat")
						{
							batting=rs.getString("team1");
						}
						else{
							batting=rs.getString("team2");
						}
					}
					else{
						if(rs.getString("chooseto")=="Bat")
						{
							batting=rs.getString("team1");
						}
						else{
							batting=rs.getString("team2");
						}
					}
				}
				else
				{
					if(rs.getString("tosswonby")==rs.getString("team1"))
					{
						if(rs.getString("chooseto")=="Bat")
						{
							batting=rs.getString("team2");
						}
						else{
							batting=rs.getString("team1");
						}
					}
					else{
						if(rs.getString("chooseto")=="Bat")
						{
							batting=rs.getString("team1");
						}
						else{
							batting=rs.getString("team2");
						}
					}
				}
			%>
			<%=batting%>
			</td>
			<td><input type="text" name="score" value="<%= rs.getString("score")%> "size="4"></td>
			<td><input type="text" name="overs" value="<%= rs.getString("overs")%>"size="4"></td>
			<td><input type="text" name="target" value="<%= rs.getString("target")%>"size="4"></td>
			<td>
				<select name="matchstatus">
				<option value="finished">Finished</option>
				<option value="started">Ongoing</option>
					<option value="notstarted">Upcoming</option>
				</select>
			</td>
			<td>
				<select name="winner">
					<option value="<%=rs.getString("matchwonby")%>"><%=rs.getString("matchwonby")%></option>
					<option value="null">null</option>
								</select>
			</td>
			<input type="hidden" name="id" value="<%=rs.getString("id") %>">
			<input type="hidden" name="matchtype" value="<%=rs.getString("matchtype")%>">
			<input type="hidden" name="team1" value="<%=rs.getString("team1")%>">
			<input type="hidden" name="team2" value="<%=rs.getString("team2")%>">
			<td><input type="submit" value="Update"></td>
			</form>
			<td>
			<form action="MatchRemove" method="post">
			<input type="hidden" name="id" value="<%=rs.getString("id") %>">
			<input type="submit" value="Remove">
			</form>
			</td>
			</tr>
			<%
			}
		}
		%>
	</table>
	
</body>
</html>