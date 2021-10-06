<%@page import="utils.UtilDB"%>
<%
String name = (String) session.getAttribute("username");
if (name == null || name.equals("")){
	response.sendRedirect("index.jsp");
} else if (name.equals("admin")) {String userName = request.getParameter("username");
try{
int amount = Integer.parseInt(request.getParameter("amount"));
boolean isUser = UtilDB.isUer(userName);
int added = UtilDB.updateAccount(userName, amount, '+');
if (!isUser){
	request.setAttribute("deposit_status", "Not User To Deposit To It's Account");
	request.getRequestDispatcher("deposit.jsp").forward(request, response);
}
if (added > 0){
	request.setAttribute("deposit_status", "Amount Is Added Sucssessfuly");
	request.getRequestDispatcher("deposit.jsp").forward(request, response);
} else {
	request.setAttribute("deposit_status", "Amount Not Added There Is Error");
	request.getRequestDispatcher("deposit.jsp").forward(request, response);
}
} catch(Exception e){
	request.setAttribute("deposit_status", "Amount Not Valid");
	request.getRequestDispatcher("deposit.jsp").forward(request, response);
	response.sendRedirect("error.jsp");
}
} else{
	response.sendRedirect("index.jsp");
}
%>