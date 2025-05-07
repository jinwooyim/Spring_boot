<%@ page import="com.lgy.TeamProject.dto.TeamDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  TeamDTO user = (TeamDTO) session.getAttribute("user"); %>
<aside class="sidebar" id="sidebar">
	<div class="sidebar_header">
		<div class="logo">
			<img alt="MATFLIX"
				src="${pageContext.request.contextPath}/resources/image/MATFLIX.png">
		</div>
	</div>
	<% if (user != null) {  %>
		<div class="user_profile">
			<div class="profile_image profile">
				<img alt="MATFLIX" onclick="my_page()"
					src="${pageContext.request.contextPath}/resources/image/MATFLIX.png">
			</div>
			<div class="profile_info">
				<h3><%=user.getMf_name()%> 님<br>환영합니다.</h3>
				<div id="div_a">
					<input type="button" value="로그아웃" id="log_out" onclick="location.href='${pageContext.request.contextPath}/member/log_out'">
				</div>
			</div>
		</div>
	<%} else { %>
		<div class="user_profile">
			<div class="profile_info">
				<img src="${pageContext.request.contextPath}/resources/image/side_cook.jpg">
			</div>
		</div>
	<%} %>

	<div class="sidebar_search">
		<form action="search.jsp" method="get">
			<input type="text" name="query" placeholder="레시피 검색...">
			<button type="submit">검색</button>
		</form>
	</div>

	<nav class="sidebar_menu">
		<ul>
			<li><span id="home"><i class="fas fa-home"></i>홈</span></li>
			<li><span><i class="fas fa-thumbs-up"></i>추천 레시피</span></li>
			<li id="dropdown_menu">
				<span class="dropdown_toggle"> 
					<span id="span_none">
						<i class="fas fa-th-large" id="i"></i>분류
					</span> <i id="i_toggle" class="fas fa-chevron-down"></i>
				</span>
				<ul class="dropdown_menu">
					<li><span id="dropdown_menu" class="korean">한식</span></li>
					<li><span id="dropdown_menu" class="western">양식</span></li>
					<li><span id="dropdown_menu" class="japanese">일식</span></li>
					<li><span id="dropdown_menu" class="chinese">중식</span></li>
					<li><span id="dropdown_menu" class="dessert">디저트</span></li>
				</ul>
				</li>
			<li><span><i class="fas fa-star"></i>인기 레시피</span></li>
			<li><span class="profile" onclick="my_page()"><i class="fas fa-user"></i>마이페이지</span></li>
<!-- 			<li><button class="profile" onclick="my_page()"><i class="fas fa-user"></i>마이페이지</button></li> -->
			<li><span class="board"><i class="fas fa-comments"></i>자유게시판</span></li>
			<li><span><i class="fas fa-bullhorn"></i>공지사항</span></li>
		</ul>
	</nav>
<% if (user != null) {  %>
	<h2 id="h2">
		<i class="fas fa-bell"></i>알림
	</h2>
	<div class="sidebar_notifications">
		<div class="notification">
			<div class="notification_content">
				<p>홍길동님이 회원님의 레시피를 좋아합니다.</p>
				<span class="notification_time">1시간 전</span>
			</div>
		</div>
		<div class="notification">
			<div class="notification_content">
				<p>김철수님이 회원님의 레시피에 댓글을 남겼습니다.</p>
				<span class="notification_time">3시간 전</span>
			</div>
		</div>
		<div class="notification">
			<div class="notification_content">
				<p>김철수님이 회원님의 레시피에 댓글을 남겼습니다.</p>
				<span class="notification_time">3시간 전</span>
			</div>
		</div>
		<div class="notification">
			<div class="notification_content">
				<p>김철수님이 회원님의 레시피에 댓글을 남겼습니다.</p>
				<span class="notification_time">3시간 전</span>
			</div>
		</div>
		<div class="notification">
			<div class="notification_content">
				<p>김철수님이 회원님의 레시피에 댓글을 남겼습니다.</p>
				<span class="notification_time">3시간 전</span>
			</div>
		</div>
	</div>
		
	<%} %>
</aside>
<script>

<% if (user != null) { %>
user_mf_id = "<%= user.getMf_id() %>";
isLoggedIn = true;
<% } %>

// 마이페이지 이동 함수
function my_page() {
    if (isLoggedIn) {
        $.ajax({
            type: "POST",
            url: "member/profile",
            data: { mf_id: user_mf_id },
            success: function(data) {
                $(".content").html(data);
            },
            error: function(xhr, status, error) {
                console.error("AJAX 오류 발생:", status, error);
                alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
            }
        });
        $("html, body").animate({ scrollTop: 0 }, 0);
    } else {
        alert("로그인 후 이용 가능합니다.");
    }
}
</script>