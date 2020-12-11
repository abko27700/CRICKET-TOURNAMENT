<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>

<%@page import="java.util.*"%>
<%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Matches View</title>
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
<center>
	<%
	int c1=0;
	int c2=0;
		String cupId = request.getParameter("cupId");
	%>
	<h2><%=cupId.substring(5, cupId.length())%>
		WORLDCUP
		<%=cupId.substring(0, 4)%></h2>
	<%
		databaseConnector dc = new databaseConnector();
	%>
	<%
		ResultSet rs1 = databaseConnector.getCupMatches(cupId, request.getParameter("type"));
		int i=1;
	%>
	<%
		if (rs1 != null&&request.getParameter("type").equals("notStarted"))
		{
			%>
	<table>
		<tr>
			<td>Matches</td>
		</tr>
		<%
				while(rs1.next())
				{
					%>
		<tr>
			<td><%=i++ %>. <%=rs1.getString("team1") %> vs <%=rs1.getString("team2") %></td>
		</tr>
		<%
				}
				%>
	</table>
	<%
		}
		else if(request.getParameter("type").equals("Started"))
		{
			
			int k=0;
			i=1;
			
			while(rs1.next())
			{
				if(rs1.getString("matchstatus").equals("started"))
				{
					c1=1;
					if(k++==0)
					{
						%>
					
						<h2>Ongoing Matches</h2>
						<table>
						<tr>
						<td>Team 1</td>
						<td>Team 2</td>
						<td>Innings</td>
						<td>Batting</td>
						<td>Score</td>
						<td>Overs</td>
						<td>Target</td>
						<td>Match Status</td>
						<td>Winner</td>
						<td>Update</td>
						</tr>
						<%
					}
					int cur=Integer.parseInt(rs1.getString("innings"));
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
			<td><%=rs1.getString("team1") %></td>
			<td><%=rs1.getString("team2") %></td>
			<form action="cupMatchUpdate" method="post">
			<td>
				<select name="innings">
					<option value=<%=cur%>><%=cur%></option>
					<option value=<%=temp%>><%=temp%></option>
				</select>
			</td>
			<td>
			<%	String batting="";
				if(rs1.getInt("innings")==1)
				{
					if(rs1.getString("tosswonby")==rs1.getString("team1"))
					{
						if(rs1.getString("chooseto")=="Bat")
						{
							batting=rs1.getString("team1");
						}
						else{
							batting=rs1.getString("team2");
						}
					}
					else{
						if(rs1.getString("chooseto")=="Bat")
						{
							batting=rs1.getString("team1");
						}
						else{
							batting=rs1.getString("team2");
						}
					}
				}
				else
				{
					if(rs1.getString("tosswonby")==rs1.getString("team1"))
					{
						if(rs1.getString("chooseto")=="Bat")
						{
							batting=rs1.getString("team2");
						}
						else{
							batting=rs1.getString("team1");
						}
					}
					else{
						if(rs1.getString("chooseto")=="Bat")
						{
							batting=rs1.getString("team1");
						}
						else{
							batting=rs1.getString("team2");
						}
					}
				}
			%>
			<%=batting%>
			<%
			String matchtype;
				if(rs1.getString("cupid").contains("ODI"))
				{
					matchtype="ODI";
				}
				else{
					matchtype="t20";
				}
			%>
			</td>
			<td><input type="text" name="score" value="<%= rs1.getString("score")%> "size="4"></td>
			<td><input type="text" name="overs" value="<%= rs1.getString("overs")%>"size="4"></td>
			<td><input type="text" name="target" value="<%= rs1.getString("target")%>"size="4"></td>
			<td>
				<select name="matchstatus">
				<option value="started">Ongoing</option>
					<option value="finished">Finished</option>
					<option value="notStarted">Upcoming</option>
				</select>
			</td>	
			<td>
				<select name="winner">
					<option value="null">null</option>
					<option value="<%=rs1.getString("team1")%>"><%=rs1.getString("team1")%></option>
					<option value="<%=rs1.getString("team2")%>"><%=rs1.getString("team2")%></option>
				</select>
			</td>
			<input type="hidden" name="cupId" value="<%=rs1.getString("cupid")%>">
			<input type="hidden" name="id" value="<%=rs1.getString("matchid") %>">
			<input type="hidden" name="from" value="cup">
			<input type="hidden" name="matchtype" value="<%=matchtype%>">
			<input type="hidden" name="team1" value="<%=rs1.getString("team1")%>">
			<input type="hidden" name="team2" value="<%=rs1.getString("team2")%>">
			<td><input type="submit" value="Update"></td>
			</form>
			
			</tr>
			<%
						
					}
					
				}
			
					k=0;
					i=1;
					rs1 = databaseConnector.getCupMatches(cupId, request.getParameter("type"));
			
			while(rs1.next())
			{
				if(rs1.getString("matchstatus").equals("notStarted"))
				{
					
					c2=1;
					if(k==0)
					{
						%>
												<table>
							<tr>
								<td>Match no.</td>
								<td>Team1</td>
								<td>Team2</td>
								<td>Initialize</td>
							</tr>
						<%
						k++;
					}
					%>
						<tr>
							<td>
							<%
							int x=0;
							if(rs1.getString("matchid").contains("f"))
								{
								x=1;
								if(rs1.getString("matchid").contains("sf1"))
								{
									%><p>SemiFinal 1</p><%
								}
								else if(rs1.getString("matchid").contains("sf2"))
								{
									%><p>SemiFinal 2</p><%
								}
								else {
									%><p>Final</p><%
								}
							}
							%>
							<%if(x==0)
							{
							%>
							<%=i++%><% 
							}%>
							<td><%=rs1.getString("team1") %></td>
							<td><%= rs1.getString("team2")%></td>
							<td>	
								<form action="matchinit.jsp" method="post">
									<input type="hidden" name="team1" value="<%=rs1.getString("team1") %>">
									<input type="hidden" name="team2" value="<%=rs1.getString("team2") %>">
									<input type="hidden" name="matchid" value="<%=rs1.getString("matchid")%>">
									<input type="submit" value="Start">
								</form>
							</td>
						</tr>
					<%
				%>
					
				<%
				}
				
			}
			if(c1==0&&c2==0)
			{
				
				ResultSet rs=databaseConnector.qualifier(cupId);
				ResultSet temp=rs;
				ArrayList<String>al=new ArrayList<>();
				if(rs==null)
				{
					al=databaseConnector.gettop(cupId);
					
					String team1=al.get(0);
					String team2=al.get(2);
					String team3=al.get(1);
					String team4=al.get(3);
					String match1=cupId+"_sf1";
					String match2=cupId+"_sf2";
					databaseConnector.insertdirect(team1,team2,match1,cupId);
					databaseConnector.insertdirect(team3,team4,match2,cupId);
					
				}
				else
				{
					
					k=0;
					if(k==0)
					{
						rs = databaseConnector.getCupMatches(cupId,"finished");
						ArrayList<String>var=new ArrayList<>();
						boolean noneed=false;
						while(rs.next())
						{
							if(rs.getString("matchid").contains("sf"))
							{
								if(rs.getString("matchid").equals(cupId+"_f"))
								{
									noneed=true;
								}
								var.add(rs.getString("matchwonby"));		
							}
						}
						if(noneed==false)
						{
						String team1=var.get(0);
						String team2=var.get(1);
						String match=cupId+"_f";
						databaseConnector.insertdirect(team1,team2,match,cupId);
						}
					}
				}
			}
			%>
			</table>
			<%
			}
		
	%>
	</center>
</body>
</html>