<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello World</h1>
	<button>시스템 현황</button>
	<button>계정관리</button>
	<button>작업관리</button>
	<button>데이터관리</button>
	<button>장애관리</button>
	<button>관리자</button>
	<%
		Connection conn = null;
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@10.13.9.59:1527:BRAD";
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String temp = null;

		Boolean connect = false;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "monsvr", "1q2w3e4r"); //자신의 아이디와 비밀번호
			connect = true;
			pstmt = conn.prepareStatement("select sys_Dt from TB_SKIPSCAN_TEST where rownum <= 10");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				temp = rs.getString("sys_Dt");
				System.out.println(temp);
			}
			
			conn.close();
		} catch (Exception e) {
			connect = false;
			e.printStackTrace();
		}
	%>
	<%
		if (connect == true) {
	%>
	연결되었습니다.
	<%
		} else {
	%>
	연결에 실패하였습니다.
	<%
		}
	%>


</body>
</html>