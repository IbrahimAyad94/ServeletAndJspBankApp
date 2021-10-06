<%
String name = (String) session.getAttribute("username");
if (name == null){
	response.sendRedirect("index.jsp");
} else if (!name.equals("admin")){
%>
<jsp:include page="home-header.jsp"></jsp:include>
<script>
function valid(form){
	if (document.f.amount.value == ""){
		//alert("Empty Amount Or Not Number Plz Try Agin");
		document.f.amount.focus();
		document.getElementById('love').innerHTML = "Error: Empty Amount";
		return false;
	} 
	else if(isNaN(document.f.amount.value)){
		//alert("Empty Amount Or Not Number Plz Try Agin");
		document.f.amount.focus();
		document.getElementById('love').innerHTML = "Error: Not Number This Amount";
		return false;
	}
	else if(document.f.amount.value > 100000000){
		//alert("Empty Amount Or Not Number Plz Try Agin");
		document.f.amount.focus();
		document.getElementById('love').innerHTML = "Error: Amount Large";
		return false;
	}
	return true;
}
</script>
<div class="content-take">
<h2 style="color: #2398db ;margin: -31px 0 50px 0;" > Welcome <%= name %> </h2>

<% 
String msg = (String) request.getAttribute("msg"); 
if (msg != null){ %>
	<h2 style="color: red;"> <%= msg %></h2>
<% } %>
	<form onsubmit="return valid(this)" name="f" method="post" action="withdrawBean.jsp">
		Amount <input type="text" name="amount"> <span style="color: red" id="love"> </span>
		<br>
		<input type="submit" value="Take">
		<input type="reset" value="Clear">
	</form>
</div>
<<jsp:include page="footer.jsp"></jsp:include>
<%} else{
	response.sendRedirect("index.jsp");
}%>