<%@page import="utils.UtilDB"%>
<%
String name = (String) session.getAttribute("username");
if (name == null){
	response.sendRedirect("index.jsp");
}
else{
	String deleteName = request.getParameter("username");
	String msg  = UtilDB.deleteUser(deleteName);
	if (msg.equals("notfound")){
		request.setAttribute("delete_status", "Name Not Exist Account To Delete");
	} else if (msg.equals("delete")){
		request.setAttribute("delete_status", "Account Delete Succsessfully");
		
	} else if (msg.equals("nodelete")){
		session.setAttribute("delete_status", "Account Not Delete");
	}
	request.getRequestDispatcher("delete.jsp").forward(request, response);
}
%>