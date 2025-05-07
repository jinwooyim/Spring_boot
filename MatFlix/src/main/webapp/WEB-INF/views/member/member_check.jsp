<%@page import="com.lgy.TeamProject.dto.TeamDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  TeamDTO user = (TeamDTO) session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function checkPassword() {
	const formData = $("#user_pw_check").serialize();

	$.ajax({
		type: "POST",
		url: "member/member_check_ok",  // 매핑된 컨트롤러 주소
		data: formData,
		success: function(response) {
			if (response === "available") {
				alert("비밀번호 확인 완료.");
				location.href = "/member/mem_update?mf_id=" + $("input[name='mf_id']").val();
			} else {
				alert("비밀번호가 일치하지 않습니다.");
			}
		},
		error: function() {
			alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
		}
	});
}
</script>
<body>
	<form id="user_pw_check">
		비밀번호 입력 :
		<input type="password" name="mf_pw">
		<input type="hidden" name="mf_id" value="<%= user.getMf_id()%>">
		<button type="button" onclick="checkPassword()">입력</button>
	</form>
</body>
</html>