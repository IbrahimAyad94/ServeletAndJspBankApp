<%
String name = (String) session.getAttribute("username");
%>

<jsp:include page="home-header.jsp"/>
<div class="con" style="width: 90%">
<%
if (name != null){
%>
<h2 style="color: #2398db"> welcome <%= name %> </h2>
<jsp:include page="words.jsp"></jsp:include>
	<!-- Start Of Content Of Index 
		<div class="all">
	<div class="left">
		<p>
			Online banking is the practice of making bank transactions
			 or paying bills via the Internet. Thanks to technology, and
			 the Internet in particular, people no longer have to leave the
			 house to shop, communicate, or even do their banking. Banking
			 online allows a customer to make deposits, withdrawals, and 
			 pay bills all with the click of a mouse.
		</p>
		<p>
			Online banking is the practice of making bank transactions
			 or paying bills via the Internet. Thanks to technology, and
			 the Internet in particular, people no longer have to leave the
			 house to shop, communicate, or even do their banking. Banking
			 online allows a customer to make deposits, withdrawals, and 
			 pay bills all with the click of a mouse.
		</p>
		<p>
			Online banking is the practice of making bank transactions
			 or paying bills via the Internet. Thanks to technology, and
			 the Internet in particular, people no longer have to leave the
			 house to shop, communicate, or even do their banking. Banking
			 online allows a customer to make deposits, withdrawals, and 
			 pay bills all with the click of a mouse.
		</p>
	</div>
	<div class="right">
		<p>
			 * Online banking is the practice of making bank transactions
			 or paying bills via the Internet. Thanks to technology, and
			 the Internet in particular, people no longer have to leave the
		</p>
		<p>
			 * Online banking is the practice of making bank transactions
			 or paying bills via the Internet. Thanks to technology, and
			 the Internet in particular, people no longer have to leave the
		</p>
		<p>
			* Online banking is the practice of making bank transactions
			 or paying bills via the Internet. Thanks to technology, and
			 the Internet in particular, people no longer have to leave the
		</p>
		
	</div>

</div>
		
	
	
	 End Of Content Of Index -->

<% } else {%>
Welocome Gest
<% }
String again = (String)request.getAttribute("again");
if (again != null){
%>
<h2 style="color: red"> <%= again %></h2>
<% 	
}
%>
<br>
	<% if (name == null || name.equals("")) { %>
	Login: 
	<jsp:include page="login.jsp"></jsp:include>
	<%} else{ %>
		Index Page
	<%} %>
</div>

<jsp:include page="footer.jsp"></jsp:include>