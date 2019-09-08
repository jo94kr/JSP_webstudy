<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
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
	<h1>WebContent/jsp5/list.jsp</h1>
	<%
		// BoardDAO bdao 객체생성
		BoardDAO bdao = new BoardDAO();
		// List boardList = getBoardList() 호출
		List boardList = bdao.getBoardList();
	%>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>조회수</td>
		</tr>
		<%
			for (int i = 0; i < boardList.size(); i++) {
				// BoardBean bb = 배열 첫번째 칸 배열이름.get()
				BoardBean bb = (BoardBean) boardList.get(i);
		%><tr>
			<td><%=bb.getNum()%></td>
			<td><a href="content.jsp?num=<%=bb.getNum()%>"><%=bb.getSubject()%></a></td>
			<td><%=bb.getName()%></td>
			<td><%=bb.getDate()%></td>
			<td><%=bb.getReadcount()%></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="5"><input type="button" value="글작성" onclick="location.href='writeForm.jsp'"></td>
		</tr>
	</table>
</body>
</html>
