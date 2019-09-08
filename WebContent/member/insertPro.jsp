<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp4/insertPro.jsp</h1>
	<%
		//한글처리
		request.setCharacterEncoding("utf-8");
		//request  id,pass,name 파라미터 가져와서 => 변수 저장
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());
		// 자바빈 저장
		// 자바빈 파일 생성 패키지 member 파일이름 MemberBean id, pass, name, reg_date
		// MemberBean 객체생성 => 기억장소 할당
		MemberBean mb = new MemberBean();
		
		// 멤버변수 <= 파라미터 저장
		mb.setId(id);
		mb.setPass(pass);
		mb.setName(name);
		mb.setReg_date(reg_date);

		// 디비작업 전달
		// 디비작업 파일 만들기 패키지 member 파일이름 MemberDAO
		// insertMember(자바빈의 주소를 저장할 변수) 함수만들기
		// MemberDAO 객체생성
		// insertMember(자바빈주소값) 메서드호출
		MemberDAO mdao = new MemberDAO();
		
		mdao.insertMember(mb);
		// 디비작업 전달
	%>
	<script type="text/javascript">
	alert("회원가입 성공");
	location.href="loginForm.jsp";
</script>
</body>
</html>

