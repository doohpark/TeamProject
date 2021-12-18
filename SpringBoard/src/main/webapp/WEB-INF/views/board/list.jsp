<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD LIST</title>
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
<h1 style="text-align: center;">한동후기게시판 (관리자 권한)</h1>
<p style="text-align: center;"> 한동생활에 유용한 후기모음 게시판입니다~^^</p>
<h2 style="float:right;"><a href="../login/logout">Logout</a></h2>
<table id="list">
	<tr id="top">
		<td>카테고리</td>
		<td>제목</td>
		<td>작성자</td>
		<td>내용</td>
		<td>작성일자</td>
		<td><button type="button" onclick="location.href='add'"> 글쓰기</button></td>
	</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.category}</td>
		<td>${u.title}</td>
		<td>${u.writer}</td>
		<td>${u.content}</td>
		<td>${u.regdate}</td>
		<td><a href="editform/${u.seq}">수정</a>
		<a href="javascript:delete_ok('${u.seq}')">삭제</a></td>
	</tr>
</c:forEach>
</table>
<p style="color:darkgrey;">검색(검색어와 일치한 결과만 출력됩니다): </p><input id="kw" type="text" name="keyword"></input>
<button onclick="javascript:keyword()">검색</button>


<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deleteok/'+id;
	}
	function keyword(){
		var a = document.getElementById("kw");
		if(a.value != null) location.href='keyword/' + a.value;
	}
	
</script>





</body>
</html>