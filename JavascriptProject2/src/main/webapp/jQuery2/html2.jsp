<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    // <h1> jQuery2/html2.jsp</h1>
    
    String id = request.getParameter("id");
    String result = "";
//     if(id.equals("kim")){
//     	result="아이디 중복";
//     }else{
//     	result="아이디 사용 가능";
//    }

		//DB 연결 정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBID = "root";
		final String DBPW = "1234";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		
		
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println( " 드라이브 로드 성공 ! ");
		
		
		// 2. 디비 연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println(" 디비 연결 성공 ! ");
		
		// 3. SQL 작성 & pstmt

		String sql = "select * from itwill_member where id=? ";
		
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// ???
		pstmt.setString(1, id);

		// 4. SQL 실행
		ResultSet rs = pstmt.executeQuery();
		System.out.println(" SQL 구문 실행 완료 ! ");
		
		if(rs.next()){
			result="아이디 중복";	
		
					
		}else{
			result="아이디 사용 가능";
		}
		
		
		




    %>
    <%=id+":"+result%>