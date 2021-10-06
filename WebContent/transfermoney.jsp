
<%@page import="utils.UtilDB"%>
<%
String name = (String) session.getAttribute("username");
int amount = Integer.parseInt(request.getParameter("amount"));
String to = request.getParameter("distname");
String msg = "";
if (name == null || name == ""){
	request.setAttribute("again", "Login Again To Acess Website");	
	request.getRequestDispatcher("index.jsp").forward(request, response);
	response.sendRedirect("index.jsp");
} else{
if (UtilDB.isUer(name)){;
	System.out.println("love1" + UtilDB.getRow(name));
	if (UtilDB.getRow(name) > amount){
		if (UtilDB.isUer(to)){
			int x = UtilDB.updateAccount(name, amount, '-');
			int y = UtilDB.updateAccount(to, amount, '+');
			msg = (x > 0 && y > 0) ? "Mony Send Succsessfuly" + x : "Not Send" + y;
		} else{
			msg = "Not User To Send To Him";
		} 
		
		}else {
			msg = " Your Mony Don't Alot";
	}
} else {
	response.sendRedirect("index.jsp");
}
request.setAttribute("msg", msg);
request.getRequestDispatcher("transfer.jsp").forward(request, response);
}
%>
<%= msg %>