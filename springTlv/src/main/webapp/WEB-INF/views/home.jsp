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
						<pre id="result"></pre>
			<table id="tb" border="1px solid black">
				
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
					
					var list = data.result;
				    console.log(list.tag);
	
				    
				    var tb = $("#tb");
					var tap = 0;
					var enter = 0;
					var dept = "<td></td>";
					
					
			    	
					var table = document.createElement("table");
					var inTr = document.createElement("TR");
					var inTdTag = document.createElement("TD");
			    	var inTdLength = document.createElement("TD");
			    	var inTdValue = document.createElement("TD");
					
					var result = typeof list.tag  === 'string';
			    	
			    	console.log(result);
			    	console.log(list[0].value);
			    	
			    	
			    	for (var i = 0; i < list.length; i++) {
			    		
			    		var tr = document.createElement("TR");	
			    		
				    	var tdTag = document.createElement("TD");
					    var tdLength = document.createElement("TD");
					    var tdValue = document.createElement("TD");
			    		
			    		tdTag.append(list[i].tag);
						
			    		tdLength.append(list[i].length);
				    	tr.append(tdTag);			
				    	tr.append(tdLength);	

				    	if(typeof list[i].value === 'string'){
				    		
				    		tdValue.append(list[i].stringValue);
				    		tr.append(tdValue);			
				    		tb.append(tr);
						
				    	}else{
				    		
				    		var consList = list[i].value;
				    		
				    	intable = function(consList){
								
						    		var intable = document.createElement("table");
						    		
									var inList = list[i].value;
							    	
							    	for (var i = 0; i < inList.length; i++) {
															    		
										var inTr = document.createElement("TR");
										var inTdTag = document.createElement("TD");
								    	var inTdLength = document.createElement("TD");
								    	var inTdValue = document.createElement("TD");
							    		
								    	inTdTag.appned(inList.tag);
								    	inTdLength.appned(inList.length);
								    	inTdValue.appned(inList.Stringvalue);
							    	
								    	inTr.appned(inTdTag);
								    	inTr.appned(inTdLength);
								    	inTr.appned(inTdValue);
										intable.appned(inTr);
							    	}
									return intable;
								};
														
						tdValue.append(intable);
						tr.append(tdValue);			
			    		tb.append(tr);
							
						}
				    	
				    		tap++;
				    	
			    	}
				    		
				    	/* 	if( typeof list[i]  === 'string'){
				    	}else{
				    			tr.append(tdTag);			
								tr.append(tdLength);	
				    			tb.append(tr);
				    			
								
					    		inTdTag.appned(list[i].value[0].tag);
					    		inTdLength.appned(list[i].value[0].length);
					    		inTdValue.appned(list[i].value[0].stringValue);
					    		
					    		inTr.appned(inTdTag);
					    		inTr.appned(inTdLength);
					    		inTr.appned(inTdValue);
					    		
					    		table.append(inTr);
					    		
					    		tdValue.append(table);
					    		
							tr.append(tdValue);			
							tb.append(tr);
				    	} */
					
				},
				error:function(data){
				}
			}); 
			
			return false;
			
		}
		
		
		function valueList(Array){
			
			var inList = Array;
			
	    	
	    	for (var i = 0; i < inList.length; i++) {
	    		
	    		var intable = document.createElement("table");					
				var inTr = document.createElement("TR");
				var inTdTag = document.createElement("TD");
		    	var inTdLength = document.createElement("TD");
		    	var inTdValue = document.createElement("TD");
	    		
		    	inTdTag.appned(inList[i].tag);
		    	inTdLength.appned(inList[i].length);
		    	inTdValue.appned(inList[i].Stringvalue);
	    		
			}
			
	    	return intable;
		}
		
		
		</script>
		
		
	

	
	

</body>
</html>
