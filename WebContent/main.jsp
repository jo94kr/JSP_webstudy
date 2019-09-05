<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 세션값 가져오기  "id"
		String id = (String) session.getAttribute("id");

		// 세션값 없으면 loginForm.jsp 이동
		if (id == null) {
			response.sendRedirect("loginForm.jsp");
		}
	%>
	<h1>WebContent/member/main.jsp</h1>
	<%=id%>님 로그인 하셨습니다.
	<br>
	<a href="info.jsp">회원정보 조회</a>
	<a href="updateForm.jsp">회원정보 수정</a>
	<a href="deleteForm.jsp">회원정보 삭제</a>
	<a href="list.jsp">회원목록</a>
</body>
</html>

