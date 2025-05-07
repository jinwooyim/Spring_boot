<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form id="modify">
	<input type="hidden" name="b_id" value="${content_view.b_id}">
	<div class="post_view_container">
		<div class="post_view_header">
			<div class="post_category_badge">자유게시판</div>
			<h1 class="post_title">${content_view.b_title}</h1>
			<div class="post_meta">
				<div class="post_author">
					<div class="author_avatar">
						<img
							src="${pageContext.request.contextPath}/resources/image/default_avatar.png"
							alt="프로필">
					</div>
					<div class="author_info">
						<span class="author_name">${content_view.b_name}</span> <span
							class="post_date">2023.05.15</span>
					</div>
				</div>
				<div class="post_stats">
					<div class="stat_item">
						<i class="fas fa-eye"></i> <span>${content_view.b_hit}</span>
					</div>
					<div class="stat_item">
						<i class="fas fa-comment"></i> <span>0</span>
					</div>
					<div class="stat_item">
						<i class="fas fa-heart"></i> <span>0</span>
					</div>
				</div>
			</div>
		</div>

		<div class="post_view_content">
			<div class="post_info_section">
				<div class="info_item">
					<div class="info_label">
						<i class="fas fa-hashtag"></i> 번호
					</div>
					<div class="info_value">${content_view.b_id}</div>
				</div>

				<div class="info_item">
					<div class="info_label">
						<i class="fas fa-user"></i> 작성자
					</div>
					<div class="info_value">${content_view.b_name}</div>
				</div>
			</div>

			<div class="post_content_section">
				<div class="content_text">${content_view.b_content}</div>
			</div>

			<!-- 추천 버튼 섹션 -->
			<div class="post_recommend">
				<button class="recommend_btn">
					<i class="far fa-thumbs-up"></i> <span>추천</span> <span
						class="recommend_count">0</span>
				</button>
			</div>

			<div class="post_view_actions">
				<div class="action_buttons">
					<button id="return_list" type="button" id="return_list"><i class="fas fa-list"></i> 목록보기</button>
					<button id="modify_board_btn" type="button" onclick="modify_board_write()"><i class="fas fa-edit"></i> 수정하기</button>
					<button id="delete_board_btn" type="button" onclick="delete_board_write()"><i class="fas fa-trash-alt"></i> 삭제하기</button>
				</div>
			</div>
		</div>

		<!-- 댓글 섹션 -->
		<div class="comment_section">
			<div class="comment_header">
				<h3>
					<i class="far fa-comment-alt"></i> 댓글 <span class="comment_count">0</span>
				</h3>
			</div>

			<div class="comment_list">
				<div class="no_comments">
					<i class="far fa-comment-dots"></i>
					<p>첫 댓글을 작성해보세요!</p>
				</div>

				<!-- 댓글 작성 폼 -->
				<div class="comment_form">
					<textarea rows="3" placeholder="댓글을 작성해주세요."></textarea>
					<button class="comment_submit_btn">
						<i class="fas fa-paper-plane"></i> 등록
					</button>
				</div>
			</div>
		</div>

		<div class="post_view_footer">
			<div class="post_navigation">
				<a href="#" class="nav_link prev_post"> <i
					class="fas fa-chevron-left"></i>
					<div class="nav_content">
						<span class="nav_label">이전 글</span> <span class="nav_title">이전
							게시글 제목이 표시됩니다.</span>
					</div>
				</a> <a href="#" class="nav_link next_post">
					<div class="nav_content">
						<span class="nav_label">다음 글</span> <span class="nav_title">다음
							게시글 제목이 표시됩니다.</span>
					</div> <i class="fas fa-chevron-right"></i>
				</a>
			</div>
		</div>
	</div>
</form>
</body>
</html>
