<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>TO-DO-LIST</title>
<link rel="stylesheet" type="text/css"  href="css/todo.css">
</head>
<body>
      <header>
	        <h1>나의 해야할 일들</h1>
	        <h4>새로운 TODO 등록</h4>
      </header>
      <section id="wrap">
	      <div class="frm">
	       <div>
		        <h2>TODO</h2>
			        <c:forEach var="todo" items="${todoList}">
				        <c:if test="${todo.type eq 'TODO'}">
					        <div class="web">        
						         <h5>
							            ${todo.title}<br>
							          <small>등록날짜:${todo.regdate},</small>
							          <small>${todo.name },</small>
							          <small>우선순위: ${todo.sequence} </small>${todo.type }
							          <small><button onclick="btn_click(${todo.id},'${todo.type}')"> ></button></small> 
						          </h5>   
					        </div>
				        </c:if>
			        </c:forEach>
	        </div>
	        </div>
	        <div class="frm">
			    	<div>
				        <h2>DOING</h2>
					        <c:forEach var="todo"  items="${todoList }">
					        	<c:if test="${todo.type eq 'DOING'}">
					        		<div class="web">        
					         			<h5>
								            ${todo.title}<br>
								          <small>등록날짜:${todo.regdate},</small>
								          <small>${todo.name },</small>
								          <small>우선순위: ${todo.sequence} </small>
								          <small><button onclick="btn_click(${todo.id},'${todo.type}')"> ></button></small> 
					         		 </h5>   
					        	</div>
				        	</c:if>
			        	</c:forEach>
	       		</div>
	        </div>
	        <div class="frm">
		         <div>
		        	<h2>DONE</h2>
				        <c:forEach var="todo"  items="${todoList }">
				        	<c:if test="${todo.type eq 'DONE'}">
				        		<div class="web">        
				         			<h5>
							            ${todo.title}<br>
							          <small>등록날짜:${todo.regdate},</small>
							          <small>${todo.name },</small>
							          <small>우선순위: ${todo.sequence} </small>
				         		 </h5>   
				       		 </div>
				        	</c:if>
				        </c:forEach>
		        </div>
	        </div>
     </section>
</body>
<script type="text/javascript" src="js/todo.js"></script>
</html>