<%@page import="member.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/loginPro.jsp</h1>
	<%
		//request  id,pass 파라미터 가져와서 => 변수 저장
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		// 로그인 인증(폼아이디,비밀번호 / 디비아이디,비밀번호 일치 확인
		//		=>일치하면 권한부여/페이지 상관없이 값을 저장사용)

		// MemberDAO 객체생성
		MemberDAO MDAO = new MemberDAO();
		// 정수형 check = userCheck(아이디값, 비밀번호값) 메서드 호출
		int check = MDAO.userCheck(id, pass);

		if (check == 1) {
			// 세션값 생성  "id",id
			session.setAttribute("id", id);
			// 이동 main.jsp 
			response.sendRedirect("main.jsp");
		} else if (check == 0) {
	%>
	<script>
		alert("비밀번호틀림");
		history.back(); //뒤로이동
	</script>

	<%
		} else if (check == -1) {
	%>
	<script>
		alert("아이디없음");
		history.back(); //뒤로이동
	</script>

	<%
		}
	%>
</body>
</html>


