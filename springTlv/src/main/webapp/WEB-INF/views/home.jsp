<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.3.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	TLV parser tool
</h1>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
		
		<div>
			<input id="hexa" name="hexa" type="text"/>
		<input type="button" id="pass" name="pass" value="PARSING" onclick="check();"/>
		</div>
		<br>
		<br><br>
		
		<div>
			<table id="tb">
				<tr>
					<td>
						<pre id="result"></pre>
					</td>
				</tr>
			</table>
			
		</div>
		
		
		<script type="text/javascript">
			
		function check(){
			
			var hex = $("#hexa").val();
			var tlv = null;
			
	       

			
		 	$.ajax({
				url:"parser.pa",
				type:"post",
				data:{hex:hex},
				success:function(data){
					
					console.log(data.result);
					/* $("#result").text(data.result); */
					
					var list = data.result[0];
				    console.log(list.tag);
	
				    
				    var tb = $("#tb");
					var tap = 0;
					var enter = 0;
					var dept = "<td></td>";
					var tr = document.createElement("TR");
			    	var td = document.createElement("TD");
			    	
			    	var result = typeof list.tag  === 'string';
			    	
			    	console.log(result);

					td.append(list.tag);
					td.append(list.length);
					td.append(list.stringValue);
					
					tr.append(td);			
					tb.append(tr);
						
						
				    	/* td.appned(list.tag);
						td.appned(list.length);
						td.append(list.stringValue);

						tr.append(td);							
						tb.append(tr); */
						
						/* if(list[i].value typeof Object === Object){
						
							tr.append(td);							
							tb.append(tr);
							
							var tr = document.createElement("tr");
							var td = document.createElement("td");
							
						}else{
							 
						}*/
						
				
					
				},
				error:function(data){
				}
			}); 
			
			return false;
			
		}
		
		</script>
		
		
	

	
	

</body>
</html>
