<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit post form</title>
</head>
<body>

<form:form commandName="boardVO" method="POST" action="../editok">
	<form:hidden path="seq" />
	<table id="edit">
		<tr>
		<td>카테고리</td>
		<td>
			<input list="category" name="category" required/>
		  		<datalist id="category">
			    	<option value="맛집후기">
				    <option value="강의후기">
				    <option value="기숙사후기">
			  </datalist>
		  <td>
		</tr>
		<tr><td>제목</td><td><form:input path="title" /></td></tr>
		<tr><td>글쓴이</td><td><form:input path="writer" /></td></tr>
		<tr><td>내용</td><td><form:textarea cols="50" rows="5" path="content"/></td></tr>
	</table>
	<input type="submit" value="수정" />
	<input type="button" value="취소" onclick="history.back()" />
</form:form>

</body>
</html>