<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp4/updatePro.jsp</h1>
	<%
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// id,pass,name 파라미터 가져오기
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");

		// MemberDAO 객체생성
		MemberDAO mdao = new MemberDAO();

		// int check = userCheck(id, pass)
		int check = mdao.userCheck(id, pass);

		// check == 1 이면 수정작업
		if (check == 1) {
			// MemberBean mb객체생성 멤버변수 id, pass, name 저장
			MemberBean mb = new MemberBean();
			mb.setId(id);
			mb.setPass(pass);
			mb.setName(name);

			// updateMember(mb) 호출
			mdao.updateMember(mb);

			// main.jsp 이동
			response.sendRedirect("main.jsp");
		}
		// check == 0 이면 "비밀번호틀림"
		else if (check == 0) {
	%>
	<script>
		alert("비밀번호틀림");
		history.back(); //뒤로이동
	</script>
	<%
		}
		// check == -1 이면 "아이디없음"
		else if (check == -1) {
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