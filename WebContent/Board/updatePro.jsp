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
	<h1>WebContent/jsp5/updatePro.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");
		//int num =  파라미터 num 가져와서 저장
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		//1단계 드라이버 가져오기
		Class.forName("com.mysql.jdbc.Driver");
		//2단계 디비연결
		String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
		String dbUser = "jspid";
		String dbPass = "jsppass";
		Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

		//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 select
		//디비에 id정보가 있는지 조회(가져오기)
		String sql = "select * from board where num=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		//4단계 - 만든 객체 실행   select => 결과 저장 내장객체
		ResultSet rs = pstmt.executeQuery();

		//5단계 - if 첫행으로 이동 데이터 있으면 true "아이디있음"
		//      if 폼 비밀번호 디비비밀번호 비교 맞으면  수정 , main.jsp이동
		//      else  틀리면 "비밀번호틀림" 뒤로이동
		//else  데이터 없으면 false "아이디없음"  loginForm.jsp이동
		if (rs.next()) {
			out.println("글있음");//아이디있음
			if (pass.equals(rs.getString("pass"))) {
				out.println("비밀번호맞음");
				// 3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 
				//조건 id일치 하면 이름 수정
				sql = "UPDATE board SET name=?, subject=?, content=? WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setInt(4, num);
				//4단계 - 만든 객체 실행   insert,update,delete 
				pstmt.executeUpdate();
				//"회원정보수정"
				//content.jsp 이동
				// 이동 content.jsp

				response.sendRedirect("content.jsp?num=" + num);
			} else {
				out.println("비밀번호틀림");
	%>
	<script>
		alert("비밀번호틀림");
		history.back(); //뒤로이동
	</script>
	<%
		}
		} else {
			out.println("글없음");//글없음
	%>
	<script>
		alert("글없음");
		history.back(); //뒤로이동
	</script>
	<%
		}
	%>
</body>
</html>