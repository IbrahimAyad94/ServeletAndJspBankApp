<%@page import="com.connect.DBConnection"%>
<%@page import="utils.UtilDB"%>
<%@page import="com.beans.Register"%>
<link rel="stylesheet" href="css.css">
<style>
.pbcon{
overflow: hidden;
}

.pb{
float: left;
position: relative;
}
.pb form{
position: absolute;
top: 230px;
left: 60px;
display: one;
}
input[type=submit]{
display: none;
}
.pb img{
margin: 10px 40px;
border: 5px solid #DDD;

}
.con{
float: right;
}
.dis{
display: block;
}
</style>
<script>
function change(){
	var x = document.getElementById('save').val;
	console.log(x);
	if (x != null || x != ""){
		 document.getElementById('save').style.display = 'block';
		 //document.getElementById('save').type="file";
		 
	}
}
</script>
<%
	String name = (String) session.getAttribute("username");
	Register u = UtilDB.getInfo(name);
	if (name == null) {
		response.sendRedirect("index.jsp");
	} else {
		if (!name.equals("admin")) {
%>
<jsp:include page="home-header.jsp" />
<div class="pbcon">
<div class="pb">
	<form action="SavePhoto" method="post" style="margin-top: 20px;"
		enctype="multipart/form-data">
		<input type="file" name="photo" onchange="change()"> 
		<input type="submit" value="save" id='save'>
	</form>
	<% //if (session.getAttribute("photo") != null){
		if (UtilDB.havePhoto(name) == true){
		%>
	<img src="GetPhoto" width="300" height="300" alt="No Image">
	<%} else { UtilDB.havePhoto(name);%>
		<img src="images//nophoto.jpg" width="200" height="200"/>
	<%} %>

</div>
<div class="con" style="margin: 0px 150px;">
	<table border="1px">
		<tr>
			<td>User Name</td>
			<td><%=u.getUserName()%></td>
		</tr>
		<tr>
			<td>Password</td>
			<td>********</td>
		</tr>
		<tr>
			<td>Amount</td>
			<td><%=u.getAmount()%></td>
		</tr>
		<tr>
			<td>User Address</td>
			<td><%=u.getAddress()%></td>
		</tr>
		<tr>
			<td>User Phone</td>
			<td><%=u.getPhone()%></td>
		</tr>
	</table>
	<br>
</div>
</div>
<jsp:include page="footer.jsp" />
<%
	} else {
			response.sendRedirect("index.jsp");
		}
	}
%>