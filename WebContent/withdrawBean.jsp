<%@page import="utils.UtilDB"%>
<%
String name = (String) session.getAttribute("username");
int amount =  Integer.parseInt(request.getParameter("amount"));
String msg = "";
if (UtilDB.isUer(name)){
	if (UtilDB.getRow(name) > amount){
		int x = UtilDB.updateAccount(name, amount, '-');
		msg = (x > 0) ? "You Get Mony Sucsessfuly": "No Mony Got";
	} else {
		msg = "You Don't Have All This Mony To Get It";
	}
} else{
	msg = "You Don't User To Get Mony";
}
request.setAttribute("msg", msg);
%>
<jsp:forward page="withdraw.jsp"/>