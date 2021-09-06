<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TODO LIST</title>
<link rel="stylesheet" type="text/css"  href="css/main.css">
</head>
<body>
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
		      <button id="${todo.id}#${todo.type}" class="nextType" onclick="buttonDelete(id)">X</button>
		    </section>
		</c:if>
  		</c:forEach>
  </section>
  
</section>
     <script type="text/javascript"  src="js/todo.js">
</script>
</body>
</html>