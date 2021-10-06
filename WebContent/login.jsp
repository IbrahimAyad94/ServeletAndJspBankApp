<%
String name = (String) session.getAttribute("username");
if (name == null){
%>
<div class="login-form">
	<form action="loginbean.jsp" method="post" name="f">
		<table>
			<tr>
				<td> User Name </td>
				<td> <input type="text" name="username"> </td>
			 </tr>
			 <tr>
			 	<td> Password </td>
			 	<td> <input type="password" name="password"> </td>
			 </tr>
			 <tr>
			 	<td align="center"> <input type="submit" value="Login"> </td>
			 	<td align="center"> <input type="reset" value="clear"> </td>
			 </tr>
		</table>
	</form>
</div>
<%} else 
response.sendRedirect("index.jsp");
%>