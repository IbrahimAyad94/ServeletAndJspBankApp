<script>
	function valid(form){
		for (i = 0; i < form.elements.length; i++){
			if (form.elements[i].value == ""){
				alert("Fill All Feilds ");
				document.f.email.focus();
				return false;
			}
		}
		return true;
	}
</script>

<jsp:include page="home-header.jsp"></jsp:include>
<div class="con">
	<h2> Contact To Us By This Form </h2>
	<form action="" method="post" name="f" onsubmit="return valid(this)">
		<table>
			<tr>
				<td>Email </td>
				<td> <input type="email" name="email"> </td>
			 </tr>
			<tr>
				<td> Message  </td>
				<td> <textarea rows="10" cols="20"></textarea></td>
			 </tr>
			 <tr> 
			 	<td> <input type="submit" value="Send"> </td>
			 	<td> <input type="reset" value="Clear"> </td>
			 </tr>
		</table>
	</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>