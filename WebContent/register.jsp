<%
String name = (String) session.getAttribute("username");
if (name == null){
	response.sendRedirect("index.jsp");
} else if (name.equals("admin")){
%>
<jsp:include page="home-header.jsp"></jsp:include>
<script>
function valid(form){
	for(var i=0; i<form.elements.length; i++)
	   {
			if(form.elements[i].value == "")
			{
			   alert("Fill out all Fields")
			   document.f.userName.focus()
			   return false
			}
	   }
	if (!isNaN(document.f.userName.value)){
		alert("User Name Not Number And Not Empty");
		document.f.userName.focus();
		return false;
	}
	if (document.f.password.value != document.f.repassword.value){
		alert("Password And Re-Password Not Identical");
		document.f.repassword.focus();
		return false;
	}
	if (isNaN(document.f.amount.value)){
		alert("Amount Not String Or Empty");
		document.f.amount.focus();
		return false;
	}
	
	if (!isNaN(document.f.address.value)){
		alert("Address Not Number Or Empty");
		document.f.address.focus();
		return false;
	}
	if (document.f.phone.value > 012999999999 || document.f.phone.value < 01000000000 || (isNaN(document.f.phone.value))){
		alert("Not Phone Number");
		document.f.phone.focus();
		return false;
	}
	return true;
}
function clear(f){
	f.nextSibling.nextSibling.innerHTML = '';
}

</script>
<div class="con">
<div align="center"> 
<% 
String msg = (String) request.getAttribute("register_status"); 
if (msg != null){ %>
	<h2 style="color: red;"> <%= msg %></h2>
<% }
/*
String username = (String) request.getAttribute("username_value");
String address = (String) request.getAttribute("address_value");
String phone = (String) request.getAttribute("phone_value");
String amount = (String) request.getAttribute("amount_value");
*/
%>
</div>
	<form name='f' method="post" action="registerBean.jsp" onsubmit="return valid(this)">
		<table>
			<tr>
				<td> User Name </td>
				<td> <input type="text" name="userName" value=""> </td>
				<td> 
				<%if (request.getAttribute("username_status") != null){ %>
				<span style="color: red"> <%= request.getAttribute("username_status") %></span>
				<% } %>
				</td>
			 </tr>
			 <tr>
				<td> Password </td>
				<td> <input type="password" name="password"></td>
				<td> 
				<%
				if ((request.getAttribute("password_status")) != null ){ %>
				<span style="color: red"> <%= request.getAttribute("password_status") %></span>
				</td>
				<%} %>
			 </tr>
			 <tr>
				<td> Re-Password </td>
				<td> <input type="password" name="repassword"> </td>
				<td> 
				<%if (request.getAttribute("repassword_status") != null){ %>
				<span style="color: red"> <%= request.getAttribute("username_status") %></span>
				<% } %>
				</td>
			 </tr>
			 <tr>
				<td> Amount </td>
				<td> <input type="text" name="amount"> </td>
			 </tr>
			 <tr>
				<td> Address </td>
				<td> <input type="text" name="address"> </td>
				<td> 
				<%if (request.getAttribute("address_status") != null){ %>
				<span style="color: red"> <%= request.getAttribute("username_status") %></span>
				<% } %>
				</td>
			 </tr>
			 <tr>
				<td> Phone </td>
				<td> <input type="text" name="phone"> </td>
				<td> 
				<%if (request.getAttribute("phone_status") != null){ %>
				<span style="color: red"> <%= request.getAttribute("username_status") %></span>
				<% } %>
				</td>
			 </tr>
			 <tr>
				<td> <input type="submit" value="Add"> </td>
				<td> <input type='reset' value="Clear"> </td>
			 </tr>
		</table>
	</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<% } else{
response.sendRedirect("index.jsp");
}
%>