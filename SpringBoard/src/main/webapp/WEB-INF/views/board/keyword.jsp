<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mycom.myapp.BoardDAO, com.mycom.myapp.BoardVO, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #006bb3;
  color: white;
}
#list tr:first-child{background-color: dodgerblue;}
</style>
</head>
<body>
<h1 style="text-align: center;">검색결과게시판</h1>
<table id="list">
	<tr>
		<td>카테고리</td>
		<td>제목</td>
		<td>작성자</td>
		<td>내용</td>
		<td>작성일자</td>
	</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.category}</td>
		<td>${u.title}</td>
		<td>${u.writer}</td>
		<td>${u.content}</td>
		<td>${u.regdate}</td>
	</tr>
</c:forEach>
</table>
<button type="button" onclick="location.href='../list'">돌아가기</button>
</body>
</html>