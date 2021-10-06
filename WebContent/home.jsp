<%
String name = (String) session.getAttribute("username");
if (name == null){
	response.sendRedirect("index.jsp");
} else {
	if (name.equals("admin")){
	response.sendRedirect("register.jsp");
}
%>
<jsp:include page="home-header.jsp"></jsp:include>
 <div class="cont-home" style="padding: 30px">
 	<h2 style="color: #2398db"> Welcome <%= name %> </h2> 
 	 <jsp:include page="words.jsp"></jsp:include>
 </div>

 
 <jsp:include page="footer.jsp"></jsp:include>
 <%}%>