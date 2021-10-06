
<%
	String name = (String) session.getAttribute("username");
	if (name == null) {
		response.sendRedirect("index.jsp");
	} else {
		if (name.equals("admin")){
%>
<jsp:include page="home-header.jsp"></jsp:include>
<script>
	function valid(form) {
		for (var i = 0; i < form.elements.length; i++) {
			if (form.elements[i].value == "") {
				alert("Fill All Feilds ... All Requird");
				document.f.username.focus();
				return false;
			}
		}
		if (!isNaN(document.f.username.value)) {
			alert("Name Chars Not Number Or Null");
			document.f.username.focus();
			return false;
		}
		if (isNaN(document.f.amount.value)) {
			alert("Amount Not Cahrs Or Null");
			document.f.amount.focus();
			return false;
		}
		
		return true;

	}
</script>

<div class="con">
	<div align="center">
		<%
			String msg = (String) request.getAttribute("deposit_status");
				if (msg != null) {
		%>
		<h2 style="color: red;">
			<%=msg%></h2>
		<%
			}
		%>
		</div>
		<form name="f" action="depositbean.jsp" method="post"
			onsubmit="return valid(this)">
			<table>
				<tr>
					<td>User Name</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Amount</td>
					<td><input type="text" name="amount"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Deposit"></td>
					<td><input type="reset" value="Clear"></td>
				</tr>
			</table>
		</form>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		}else
			response.sendRedirect("index.jsp");
		} 
	%>