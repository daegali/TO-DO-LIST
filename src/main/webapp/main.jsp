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
<<<<<<< HEAD
    <header>
  <button class="new" onclick="location.href='http://localhost:8080/todo/TodoFormServlet'">할일 등록</button>
</header>
      <section id = "sec-body">
  <!-- 왼쪽 여백 -->
  <section id = "left" class="com" style="width:100px"></section>

  <!-- Type이 "TODO"인 할 일 목록만 출력 -->
  <section id = "TODO" class="com">
    <p class="title">TODO</p>
        <c:forEach var="todo" items="${todoList}">
		<c:if test="${todo.type eq 'TODO'}">
		    <section class="content">
		      <p class="content-title">${todo.title }</p>
		      <p class="content-data">등록날짜 : ${todo.regdate }, ${todo.name } 우선순위 : ${todo.sequence }</p>
		       <button class="nextType" onclick="btn_click(${todo.id},'${todo.type }')">-></button>
		    </section>
		</c:if>
  		</c:forEach>
  </section>
  
  <!-- Type이 "DOING"인 할 일 목록만 출력 -->
  <section id = "DOING" class="com">
    <p class="title">DOING</p>
        <c:forEach var="todo" items="${todoList}">
		<c:if test="${todo.type eq 'DOING'}">
		    <section class="content">
		      <p class="content-title">${todo.title }</p>
		      <p class="content-data">등록날짜 : ${todo.regdate }, ${todo.name } 우선순위 : ${todo.sequence }</p>
		       <button class="nextType" onclick="btn_click(${todo.id},'${todo.type }')">-></button>
		    </section>
		</c:if>
  		</c:forEach>
  </section>
  
  
  <!-- Type이 "DONE"인 할 일 목록만 출력 -->
  <section id = "DONE" class="com">
    <p class="title">DONE</p>
        <c:forEach var="todo" items="${todoList}">
		<c:if test="${todo.type eq 'DONE'}">
		    <section class="content">
		      <p class="content-title">${todo.title }</p>
		      <p class="content-data">등록날짜 : ${todo.regdate }, ${todo.name } 우선순위 : ${todo.sequence }</p>
		      <c:set var="vid3" scope="request" value="${todo.id }"/>
		      <button onclick="buttonDelete(${todo.id},'${todo.type }')">X</button>
		    </section>
		</c:if>
  		</c:forEach>
  </section>
  
</section>
     <script type="text/javascript"  src="js/todo.js">
</script>
=======
      <header>
	        <h1>���� �ؾ��� �ϵ�</h1>
	        <h4>���ο� TODO ���</h4>
      </header>
      <section id="wrap">
      <div class="box" >
      <div >TODO</div>
	      <div>       
		       <div class="frm">		       
				        <c:forEach var="todo" items="${todoList}">
					        <c:if test="${todo.type eq 'TODO'}">
						        <div >        
							         <h5 class="data">
								            ${todo.title}<br>
								          <small>��ϳ�¥:${todo.regdate},</small>
								          <small>${todo.name },</small>
								          <small>�켱����: ${todo.sequence} </small>${todo.type }
								          <small><button onclick="btn_click(${todo.id},'${todo.type}')"> ></button></small> 
							          </h5>   
						        </div>
					        </c:if>
				        </c:forEach>
		        </div>
	        </div>
	        </div> 
	        <div class="box">
	         <div >DOING</div>
	        <div >
			    	<div class="frm">
					        <c:forEach var="todo"  items="${todoList }">
					        	<c:if test="${todo.type eq 'DOING'}">
					        		<div >        
					         			<h5 class="data">
								            ${todo.title}<br>
								          <small>��ϳ�¥:${todo.regdate},</small>
								          <small>${todo.name },</small>
								          <small>�켱����: ${todo.sequence} </small>
								          <small><button onclick="btn_click(${todo.id},'${todo.type}')"> ></button></small> 
					         		 </h5>   
					        	</div>
				        	</c:if>
			        	</c:forEach>
	       		</div>
	        </div>
	        </div>
	        <div  class="box"> 
	        <div>DONE</div>
	        <div>        
	        <div class="frm">	         	
				        <c:forEach var="todo"  items="${todoList }">
				        	<c:if test="${todo.type eq 'DONE'}">
				        		<div >        
				         			<h5 class="data">
							            ${todo.title}<br>
							          <small>��ϳ�¥:${todo.regdate},</small>
							          <small>${todo.name },</small>
							          <small>�켱����: ${todo.sequence} </small>
				         		 </h5>   
				       		 </div>
				        	</c:if>
				        </c:forEach>
		        </div>
	        </div>
	        </div> 
     </section>
>>>>>>> parent of 27624fc (Ajax 비동기 처리 아직 미구현 차 후 공부 후 구현 할 예정)
</body>
<script type="text/javascript" src="js/todo.js"></script>
</html>