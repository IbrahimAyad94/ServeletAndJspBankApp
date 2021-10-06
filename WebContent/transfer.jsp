<%
String name = (String) session.getAttribute("username");
String transfer_status = (String) session.getAttribute("transfer_status");
if (name == null){
response.sendRedirect("index.jsp");
}
else{
	if (!name.equals("admin")){
%>

<script>
	function check(form){
		 for(var i=0; i < form.elements.length; i++)
		   {
				if(form.elements[i].value == "")
				{
				   alert("Fill out all Fields");
				   document.f.amount.focus();
				   return false
				}
		   }
		 if (isNaN(document.f.amount.value)){
			 alert('Amount Is Number Only');
			 document.f.amount.focus();
			 return false;
		 }
		 if (!isNaN(document.f.distname.value)){
			 alert('Distination  Is Chars Not Number Or Null');
			 document.f.distname.focus();
			 return false;
		 }
		 if (document.f.distname.value != document.f.redistname.value){
			 alert('Distination Not Match With ReDistintaiton Name');
			 document.f.redistname.focus();
			 return false;
		 }
		
	}
</script>
<jsp:include page="home-header.jsp"/>
<div class="transferform">
<h2 style="color: #2398db ;margin: -31px 0 50px 0;" > Welcome <%= name %> </h2>
<% 
String msg = (String) request.getAttribute("msg"); 
if (msg != null){ %>
	<h2 style="color: red;"> <%= msg %></h2>
<% } %>

	<form method="post" onsubmit="return check(this)" name="f" action="transfermoney.jsp">
		<table>
			<tr>
				<td> Amount </td>
				<td> <input type="text" name="amount"> </td>
			 </tr>
			 <tr>
				<td> Distination Name </td>
				<td> <input type="text" name="distname"> </td>
			 </tr>
			 <tr>
				<td> Re-Type Distination Name </td>
				<td>  <input type="text" name="redistname"> </td>
			 </tr>
			 <tr>
				<td> <input type="submit" value="Send"> </td>
				<td> <input type="reset" value="Clear"> </td>
			 </tr>
		</table>
	</form>
	</div>
	<jsp:include page="footer.jsp"/>
<% }else{
	response.sendRedirect("index.jsp");
	}
}%>
