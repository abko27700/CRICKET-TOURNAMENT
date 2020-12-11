<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@ page import="virtusaproject.databaseConnector"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Matches View</title>
<link rel="stylesheet" type="text/css" href="page.css" />
</head>
<body>
<%String cupId=request.getParameter("cupId");
 String type=request.getParameter("type");
%>
<%if(type.equals("Started"))
{
	%>
	<div class="cards-list">
   <div class="row feature" >
   <a href="cupDisplay.jsp?type=started&cupId=<%=cupId%>">
		<div class="col-md-3 featurebox card 1">
        			<div class="card_image">
            			<img src="1w.png" >
         			</div>
        			<div class="card_title title-black">
          				<p>Ongoing</p>
        			</div>
      			</div>
		</a>
					<a href="cupDisplay.jsp?type=notStarted&cupId=<%=cupId%>">
		<div class="col-md-3 featurebox card 1">
        			<div class="card_image">
            			<img src="1w.png" >
         			</div>
        			<div class="card_title title-black">
          				<p>Upcoming</p>
        			</div>
      			</div>
      	</a>
      	<a href="cupDisplay.jsp?type=finished&cupId=<%=cupId%>">
      	<div class="col-md-3 featurebox card 1">
        			<div class="card_image">
            			<img src="1w.png" >
         			</div>
        			<div class="card_title title-black">
          				<p>Completed</p>
        			</div>
      	</div>
      	</a>
      	<a href="pointstable.jsp?cupId=<%=cupId%>">
      	<div class="col-md-3 featurebox card 1">
        			<div class="card_image">
            			<img src="1w.png" >
         			</div>
        			<div class="card_title title-black">
          				<p>Points Table</p>
        			</div>
      	</div>
      	</a>
      	
      			</div>
      			</div>
	<% 
	
	
}
%>
<%
if(type.equals("notStarted"))
{
	%>
	<jsp:forward page="matchnotinit.jsp"> 
	<jsp:param name="type" value="started" /> 
	<jsp:param name="cupId" value="<%=cupId %>" /> 
</jsp:forward>
<% 
}
%>

</body>
</html>