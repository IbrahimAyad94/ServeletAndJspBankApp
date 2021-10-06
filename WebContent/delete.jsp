<%
String name = (String) session.getAttribute("username");
if (name == null){
	response.sendRedirect("index.jsp");
} else{
%>
<jsp:include page="home-header.jsp"></jsp:include>


<div class="con" style="margin: 100px auto">
<div align="center">
	<% 
		String msg = (String) request.getAttribute("delete_status"); 
		if (msg != null){ %>
	<h2 style="color: red;"> <%= msg %></h2>
<% } %>
</div>
	<form action="deletebean.jsp" method="post" name="f" onsubmit="return valid(this)" >
		User Name 
		<input type="text" name="username" />
		<br>
		 <input type="submit" value="Delete" />
		
		<input type="reset" value="Clear" />
	</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<%} %>
<script>
function valid(form){
	if (!isNaN(document.f.username.value)){
		alert("User Name Not Number And Not Empty");
		document.f.username.focus();
		return false;
	}
	return true;
}
</script>