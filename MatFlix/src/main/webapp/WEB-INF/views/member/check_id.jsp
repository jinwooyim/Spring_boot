<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  String mf_id = request.getParameter("mf_id");
  boolean isDuplicated = false;

  // DB 연결
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  
  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

    String sql = "SELECT * FROM matflix WHERE mf_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, mf_id);
    rs = pstmt.executeQuery();

    if (rs.next()) {
      isDuplicated = true;
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
    try { if (conn != null) conn.close(); } catch (Exception e) {}
  }
%>

<html>
<head>
  <title>아이디 중복 확인</title>
</head>
<body>
<%
  if (isDuplicated) {
%>
  <script>
    alert("이미 사용 중인 아이디입니다.");
    window.close();
  </script>
<%
  } else {
%>
  <script>
    alert("사용 가능한 아이디입니다.");
    opener.document.getElementById("mf_id").readOnly = true;
    window.close();
  </script>
<%
  }
%>
</body>
</html>