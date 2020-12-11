<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@ page import="virtusaproject.databaseConnector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="page.css">
</head>
<body>
   <%String status=request.getParameter("status"); 
   status="Completed";
      String header;
      if(status.equals("notStarted"))
      {
    	  header="Upcoming World Cups";
      }
      else if(status.equals("Started"))
      {
    	  header="Ongoing World Cups";
      }
      else{
    	  header="World Cup History";
      }
      %>
      <h1><%=header%></h1>
<div class="cards-list">
   <div class="row feature" >
      
      <% 
	//databaseConnector dc=new databaseConnector(); 
	String query;

	databaseConnector dc = new databaseConnector();
	try{
	Connection con=databaseConnector.getConnection();
	query="select * from cup where status=?";
	PreparedStatement preparedStmt = con.prepareStatement(query);	    	
	preparedStmt.setString(1,status);
	ResultSet rs=null;
	rs=preparedStmt.executeQuery();
			while(rs!=null&&rs.next())
			{
				String cupId=rs.getString("cupId");
			%>
			<a href="completedView.jsp?type=Started&cupId=<%=cupId%>">
				<div class="col-md-3 featurebox card 1">
        			<div class="card_image">
            			<img src="1w.png" >
         			</div>
        			<div class="card_title title-black">
          				<p><%=cupId.substring(0,4)%> <%=cupId.substring(5,cupId.length())%></p>
        			</div>
      			</div>
      			</a>
			<%
			}
	}
	 catch (SQLException e) {
			e.printStackTrace();
 	}
		%>
</div>
</div>
</body>
</html>
