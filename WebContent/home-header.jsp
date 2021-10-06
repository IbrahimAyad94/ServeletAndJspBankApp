<%!
String name = null;
String admin = "admin";
%>
<%
	 name = (String) session.getAttribute("username");
%>
<link href="css.css" rel="stylesheet">
<div class="header">
	<div class="img">
		<img src="images/logo.jpg" alt="no image">
	</div>
	<div class="nav">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<%
				if (name != null && !name.equals("admin") && name != "") {
			%>
			<li><a href="transfer.jsp">Transfer Money</a></li>
			<li><a href="withdraw.jsp">Withdraw Money</a></li>
			<li><a href="view.jsp">View Account</a></li>
			<li><a href="logout.jsp">Logout</a></li>
			<%
				} else if (name != null && name.equals("admin") && name != ""){
			%>
			<li><a href="register.jsp">Open Account</a></li>
			<li><a href="delete.jsp">Close Account</a></li>
			<li><a href="deposit.jsp">Deposit</a></li>
			<li><a href="allaccounts.jsp">Show All Accounts</a></li>
			<li><a href="logout.jsp">Logout</a></li>
			<%} else{
				response.sendRedirect("index.jsp");
			}
			%>
			
			<li><a href="about.jsp">About</a></li>
			<li><a href="contact.jsp">Contact</a></li>
		</ul>
	</div>
</div>