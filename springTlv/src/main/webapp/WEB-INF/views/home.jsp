<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<title>Home</title>
</head>
<body>
<h1>
	TLV parser tool
</h1>
	
	
		<div>
			<input id="hexa" name="hexa" type="text"/>
		<button id="pas" onclick="button1_click();">PARSING</button>
		</div>
		<br>
		<br><br>
		
		<div>
			<textarea rows="30" cols="30" readonly="readonly" id="result"></textarea>	
		</div>
		
		
		<script type="text/javascript">
			
			function button1_click(){
				
				var text = $("#hexa").val();
				
				$.ajax({
					url:"/",
					type:"GET",
					data:{"text":text},
					success:function(data){
						alert("C");
					},
					error:function(data){
						alert("d");
					}
					
				});
				
				return false;				
				
			}
		
		
		
		
		</script>
	
	

	
	

</body>
</html>
