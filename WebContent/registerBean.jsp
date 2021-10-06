<%@page import="com.beans.Register"%>
<%@page import="utils.UtilDB"%>
<%
String name = (String) session.getAttribute("username");
if (name == null || name == ""){
	response.sendRedirect("index.jsp");
} else if (name.equals("admin")){
int amount = 0;
String userName = request.getParameter("userName").trim();
String password = request.getParameter("password");
String repassword = request.getParameter("repassword");

try{
amount = Integer.parseInt(request.getParameter("amount").trim());
String address = request.getParameter("address").trim();
String phone = request.getParameter("phone").trim();
/*
request.setAttribute("username_value", userName);
request.setAttribute("amount_value", amount);
request.setAttribute("address_value", address);
request.setAttribute("phone_value", phone);

//validation
if (userName.length() < 7){
	request.setAttribute("username_status", "name at least 8 chars");
	request.getRequestDispatcher("register.jsp").forward(request, response);
}
if (password.length() < 7){
	request.setAttribute("password_status", "password at least 8 chars");
	request.getRequestDispatcher("register.jsp").forward(request, response);
}
if (!password.equals(repassword)){
	request.setAttribute("repassword_status", "password and repassword don't identical");
	request.getRequestDispatcher("register.jsp").forward(request, response);
}
if (address.length() < 11){
	request.setAttribute("address_status", "Address at least 10 chars");
	request.getRequestDispatcher("register.jsp").forward(request, response);
}
	
if (phone.length() < 12){
		request.setAttribute("phone_status", "phone at least 10 numbers");
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}
*/
//validation


Register u = new Register(userName, password, amount, address, phone);

String x = UtilDB.addUser(u);
if (x.equals("found")){
	request.setAttribute("register_status", "Account Exist Choose Another Name");
	request.getRequestDispatcher("register.jsp").forward(request, response);
} else if (x.equals("added")){
	request.setAttribute("register_status", "Congraduration Account Is Done");
	request.getRequestDispatcher("register.jsp").forward(request, response);
	
} else if (x.equals("notAdded")){
	request.setAttribute("register_status", "Account Not Added plz Try Again");
	request.getRequestDispatcher("register.jsp").forward(request, response);
}

} catch(Exception e){
	out.println("can't convert");
	out.println("<a href='index.jsp'> Home </a>");
	request.getRequestDispatcher("error.jsp").forward(request, response);
}
} else {
	response.sendRedirect("index.jsp");
}
%>

