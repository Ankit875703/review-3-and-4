<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="dbconfig.jsp" %>
<%@ page import="java.sql.*" %>

<%
HttpSession ses = request.getSession();
String id = ses.getAttribute("userID").toString(); 

String bgcolor = null;
String btncolor = null;
String member_type = null;

Statement stmt = con.createStatement();
String sql = "select member_type from member where ID = '" +id+ "'";

ResultSet res = stmt.executeQuery(sql);
   
   if (res.next()) {
	   member_type = res.getString("member_type");
	   ses.setAttribute("member_type", member_type);
	   
	   if (member_type.equals("Gold")){
		   bgcolor = "bg-warning";
	   		btncolor = "btn-warning";}
	   else if (member_type.equals("Silver")){
		   bgcolor = "bg-light";
		   btncolor = "btn-light";}
	   else if (member_type.equals("Platinum")){
		   bgcolor = "bg-secondary";
		   btncolor = "btn-secondary";}
	   else if (member_type.equals("Bronze")){
		   bgcolor = "bg-danger";
		   btncolor = "btn-danger";}
   }%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>TITLE</title>
	<meta charset="UTF-8">
	 <!-- Defining a description for the web page -->
	<meta name="description" content="Web tutorials">
	<!-- Defining keywords for search engines -->
	<meta name="keywords" content="HTML,CSS,XML,JavaScript">
	<!-- Defining the author of a page -->
	<meta name="author" content="HTML">
	<!-- Setting the viewport to make the webpage compatible on all devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- STYLE SHEETS -->
	<!-- Bootstrap 3.3.7 -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
	<!-- Bootstrap 4.0 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- END OF STYLE SHEETS -->

	<style type="text/css">
	
		.nav a{
			color: black;
			text-decoration: none;
			font-size: 15px;
			font-weight: 500;
		}

		.desktop {
			    display: none;
			  }
		/*Medium devices (tablets, 768px and up)*/
		@media (min-width: 768px) {
			.desktop {
			    display: block;
			  }
		 }

	</style>

</head>
<body>


	<div class="desktop">
	<!-- All the content below is defined under a main col-12 class [main-column] -->
	<div class="col-12">

		<!-- All the page content is defined under a main row class [main-row]-->
		<div class="row">

			<!-- left side nav bar -->
			<div class="col-md-2 bg-dark fixed-top" style="height: 100vh;">

				<div class="row nav">

					<a class="col-md-12 py-4 text-left rounded-0 border-right-0 border-left-0 border-top-0 border-bottom border-dark btn btn-info" href="Profile.jsp">HOME</a>

					<div class="bg-dark col-md-12 py-5"></div>

					<a class="col-md-12 py-4 text-left rounded-0 border-right-0 border-left-0 border-top-0 border-bottom border-dark btn btn-info" href="SelectSportsOrGym.jsp">MAKE SCHEDULE</a>
					<a class="col-md-12 py-4 text-left rounded-0 border-right-0 border-left-0 border-top-0 border-bottom border-dark btn btn-info" href="viewSportsBooking.jsp">VIEW SPORTS BOOKINGS</a>
					<a class="col-md-12 py-4 text-left rounded-0 border-right-0 border-left-0 border-top-0 border-bottom border-dark btn btn-info" href="viewBooking.jsp">VIEW GYM BOOKINGS</a>
					<a class="col-md-12 py-4 text-left rounded-0 border-right-0 border-left-0 border-top-0 border-bottom border-dark btn btn-info" href="search.jsp">SEARCH BOOKINGS</a>
					<a class="col-md-12 py-4 text-left rounded-0 border-right-0 border-left-0 border-top-0 border-bottom border-dark btn btn-info" href="/Fire_Fitness/Payment">CONFIRM BOOKINGS</a>

				</div>

			</div> <!-- End of left side nav bar -->



			<!-- Middle content -->
			<div class="col-8 offset-2 px-0">
		
				
	<div class="container">
			<center>
			<h3 class="mt-4"> Update My Details </h3>
		</center>
		<form action="Update" method="post" name="myform"  onsubmit="return validate();" class="mt-5">
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1","root",""); // create connection  
	
			if(request.getParameter("edit")!=null) 
			{
				String Id=request.getParameter("edit");
		
				String User,password,email,Member_type,gender,age;
		
				PreparedStatement ps=null; // create statement
				
		//		out.println("Hi sexy");
				
				ps=con.prepareStatement("select * from member where ID=?"); // sql select query
				ps.setString(1,id);
				ResultSet rs=ps.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					id=rs.getString(1);
					User=rs.getString(2);
					password=rs.getString(3);
					email=rs.getString(7);
					Member_type=rs.getString(4);
					gender=rs.getString(5);
					age=rs.getString(6);
			%>
			<div class="form-row pt-3">
		    <div class="form-group col-md-3 offset-3">
		      <label for="user">Username</label>
		      <input type="text" class="form-control" name="user" value="<%=User%>">
		    </div>
			
			<div class="form-group col-md-2">
		      <label for="gender">Gender</label>
		      <input type="text" class="form-control" name="gender" value="<%=gender %>">
		    </div>

		    <div class="form-group col-md-1">
		      <label for="age">Age</label>
		      <input type="text" class="form-control" name="age" value="<%=age %>">
		    </div>
		  </div>
			
			<div class="form-row">
		  	<div class="form-group col-md-6 offset-3">
		      <label for="passw">Password</label>
		      <input type="text" class="form-control"  name="passw" value="<%=password%>">
		    </div>
		  </div>
			
			
			<div class="form-row pt-3">
		  <div class="form-group col-md-6 offset-3">
		    <label for="email">Email Address</label>
		    <input type="text" class="form-control" name="email"  value="<%=email %>">
		  </div>
		  </div>

		<div class="form-row pt-3">
		  	<div class="form-group col-md-6 offset-5">
		  <input  type="submit" name ="update " class="btn btn-success px-4 ml-5" value="Update">
		  </div>
		  </div>
				
	<input type="hidden" name="hide" value="<%=id%>">
				
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		
	</form>
				
			</div> <!-- End of middle content -->




			<!-- Right side nav bar -->
			<div class="col-md-2 offset-10 <%=bgcolor %> fixed-top" style="height: 100vh">

				<div class="row nav">

					<div class="<%=bgcolor %> col-md-12 py-4"></div>

					<div class="pl-5">
					<img src="avatar.jpeg" class="img-fluid rounded-circle" style="height: 250px">
				</div>

					<div class="<%=bgcolor %> col-md-12 py-3"></div>

					<div class="<%=bgcolor %> col-md-12 py-0 text-center pl-5"><span style=" font-weight: 500">MEMBER ID :  ${userID}</span></div>


					<div class="<%=bgcolor %> col-md-12 py-0 text-center pl-5"><span style="font-weight: 500">WELCOME</span></div>

					<% HttpSession s = request.getSession();
					   Object userID = (s.getAttribute("userID"));
					   String ID = userID.toString();
					   //out.println(id);
					   //int i = Integer.parseInt(id);
					   Statement st = con.createStatement();
					   ResultSet r = st.executeQuery("select fName from member where ID = '" + ID + "'");
					   
					   while (r.next()) {
					   s.setAttribute("name", r.getString("fName")); %>
					<div class="<%=bgcolor %> col-md-12 pb-4 text-center pl-5"><span style="font-weight: 500"><%=r.getString("fName") %></span></div>
					<% } %>
					
					<a class="col-md-12 py-4 text-left rounded-0 border-right-0 border-left-1 border-top-0 border-bottom-0 border-dark btn <%=btncolor %>" href="Update.jsp?edit=<%=id %>">UPDATE PROFILE</a>
					<a class="col-md-12 py-4 text-left rounded-0 border-right-0 border-left-1 border-top-0 border-bottom-0 border-dark btn <%=btncolor %>" href="logoutProcess.jsp">LOGOUT</a>
					
					

				</div>

			</div> <!-- End of right-side nav bar -->


		</div> <!-- End of [main-row] -->

	</div> <!-- End of [main-column] -->
</div>








	<!-- SCRIPTS -->
	<!-- jQuery Library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 javascript -->
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	<!-- popper Library -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<!-- Bootstrap 4.0 javascript -->
	<script src="js/bootstrap.bundle.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- END OF SCRIPTS -->
</body>
</html>