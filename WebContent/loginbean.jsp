<%@page import="utils.UtilDB"%>
<%@page import="com.beans.Register"%>
<%
String name = request.getParameter("username").trim();
String password = request.getParameter("password");
Register u = new Register(name, password);
	session.setAttribute("transfer_status","null");
	session.setAttribute("withdraw_status","null");
	session.setAttribute("delete_status","null");
	session.setAttribute("register_status","null");
	session.setAttribute("deposit_status","null"); 
	
	////
	request.setAttribute("transfer_status","null");
	request.setAttribute("withdraw_status","null");
	request.setAttribute("delete_status","null");
	request.setAttribute("register_status","null");
	request.setAttribute("deposit_status","null"); 
	
String txt = UtilDB.validUser(u);
if (txt.equals("home")){
	session.setAttribute("username", name);
	session.setAttribute("password", password);
	response.sendRedirect("home.jsp");
} else if (txt.equals("errorpage")){
	response.sendRedirect("errorpage.jsp");
} else if (txt.equals("index")){
	response.sendRedirect("index.jsp");
}
%>