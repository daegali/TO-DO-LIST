<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="css/todo.css">
</head>
<body>
		<div>
      <header>
        <h1>���� �ؾ��� �ϵ�</h1>
        <h4>���ο� TODO ���</h4>
      </header>
      <section>
        <ul>
          <li id="todo">TODO</li>
          <li id="doing">DOING</li>
          <li>DONE</li>
        </ul>
        <c:forEach var="todo" items="${todoList}">
        <div class="web">        
         <h5>
            ${todo.title}<br>
          <small>��ϳ�¥:${todo.regdate},</small>
          <small>${todo.name },</small>
          <small>�켱����: ${todo.sequence}</small>
          <small><button>></button></small>
          </h5>
         
        </div>
        </c:forEach>
      </section>
      <footer></footer>
    </div>
  </body>
</body>
</html>