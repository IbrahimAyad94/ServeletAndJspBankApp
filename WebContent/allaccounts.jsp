<%@page import="com.beans.Register"%>
<%@page import="java.util.Iterator"%>
<%@page import="utils.UtilDB"%>
<%@page import="java.util.ArrayList"%>

<%
	String name = (String) session.getAttribute("username");
	if (name == null || name.equals("")) {
		response.sendRedirect("index.jsp");
	} else if (name.equals("admin")) {
		ArrayList users = UtilDB.getAll();
%>
<jsp:include page="home-header.jsp"></jsp:include>
<%
	if (users == null) {
			out.println("no Users");
		} else {
			Register u = null;
			Iterator<Register> it = users.iterator();
%>
<div class="con">
	<table border='1'>
		<tr>
			<th>User Name</th>
			<th>Amount</th>
			<th>Address</th>
			<th>Phone</th>
		</tr>
		<%
			while (it.hasNext()) {
						u = (Register) it.next();
		%>
		<tr>
			<td><%=u.getUserName()%></td>
			<td><%=u.getAmount()%></td>
			<td><%=u.getAddress()%></td>
			<td><%=u.getPhone()%></td>
		</tr>
		<%
			}
		%>
	</table>
</div>
<%
	}
	} else {
		response.sendRedirect("index.jsp");
	}
%>
<jsp:include page="footer.jsp"></jsp:include>