<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@ include file="dbconfig.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Table</title>
<style>
div1{
		float:left;
		margin-top: 180px;
		margin-left:0px;
/* 		margin-right: 150px; */
		padding:0px;
		
	}
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
.button1{background-color: #f44336;}
	th,td {
		padding:5px;
	}
	
		ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 50px;
    background-color: #f1f1f1;
}

li a {
    display: block;
    color: #000;
    padding: 20px 90px;
      background-color:#008CBA;
    text-decoration: none;
}

/* Change the link color on hover */
li a:hover {
    background-color: #555;
    color: ;
}
li a:hover:not(.active) {
    background-color: #555;
    color: white;
}
	div {
		float:right;
		margin-top: 100px;
		margin-left:20px;
		margin-right:20px;
		padding:0px;
		
	}
</style>
</head>
<body>
<img src="Fire_Fitness_618112842253.png" class="img-responsive" alt="Responsive image" style="width:15%;height: auto;">
<div1>
<ul>
  <li><a class="active" href="admin.jsp">Dashboard</a></li>
  <li><a href="#home">Home</a></li>
  <li><a href="displayTable.jsp">Members List</a></li>
  <li><a href="displayTrainers.jsp">Trainers List</a></li>
  <li><a href="payment.jsp">Payment Confirmation</a></li>
</ul>
</div1>
	<% Statement st = con.createStatement();
	   ResultSet rs = st.executeQuery("select * from member");
	   
	   %>
	  
	<div><p style="color:brown;font-size:50px;text-align:center">Members list</p>
	<center><table style="position:relative">
		<tr>
			<th>Member ID</th>
			<th>Member name</th>
			<th>Member type</th>
			<th>Gender</th>
			<th>Age</th>
			<th>e mail</th>
		</tr>
		</div>
		<% while (rs.next()) { %>
		<tr>
			<td><% out.println(rs.getString(1)); %></td>
			<td><% out.println(rs.getString(2)); %></td>
			<td><% out.println(rs.getString(4)); %></td>
			<td><% out.println(rs.getString(5)); %></td>
			<td><% out.println(rs.getString(6)); %></td>
			<td><% out.println(rs.getString(7)); %></td>
			<td><a href="finalUpdate.jsp?update=<%=rs.getString(1)%>"><button class="button">update</button></a></td>
			<td><a href="finalDelete.jsp?delete=<%=rs.getString(1)%>"><button class="button button1">delete</button></a></td>
		</tr>
		<% } %>
	</table></center>

</body>
</html>