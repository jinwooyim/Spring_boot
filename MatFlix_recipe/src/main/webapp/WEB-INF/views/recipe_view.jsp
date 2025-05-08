<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="">
		<div class="content">
			<div class="recipe_detail_container">
				<!-- 레시피 헤더 섹션 -->
				<div class="recipe_header">
					<div class="recipe_category_badge">한식</div>
					<h1 class="recipe_title">소고기 미역국</h1>

					<div class="recipe_meta">
						<div class="recipe_author">
							<div class="author_avatar">
								<img
									src="${pageContext.request.contextPath}/resources/image/default_avatar.png"
									alt="프로필">
							</div>
							<div class="author_info">
								<span class="author_name">요리왕</span> <span class="recipe_date">2023.05.15</span>
							</div>
						</div>

						<div class="recipe_stats">
							<div class="stat_item">
								<i class="fas fa-eye"></i> <span>128</span>
							</div>
							<div class="stat_item">
								<i class="fas fa-heart"></i> <span>24</span>
							</div>
							<div class="stat_item">
								<i class="fas fa-bookmark"></i> <span>18</span>
							</div>
						</div>
					</div>
				</div>

				<!-- 레시피 메인 이미지 -->
				<div class="recipe_main_image">
					<img
						src="${pageContext.request.contextPath}/resources/image/recipe_sample.jpg"
						alt="소고기 미역국">
				</div>

				<!-- 레시피 개요 섹션 -->
				<div class="recipe_overview">
					<div class="overview_card">
						<div class="overview_icon">
							<i class="fas fa-clock"></i>
						</div>
						<div class="overview_info">
							<h3>조리 시간</h3>
							<p>30분</p>
						</div>
					</div>

					<div class="overview_card">
						<div class="overview_icon">
							<i class="fas fa-signal"></i>
						</div>
						<div class="overview_info">
							<h3>난이도</h3>
							<p>초보자</p>
						</div>
					</div>

					<div class="overview_card">
						<div class="overview_icon">
							<i class="fas fa-utensils"></i>
						</div>
						<div class="overview_info">
							<h3>카테고리</h3>
							<p>한식</p>
						</div>
					</div>
				</div>

				<!-- 레시피 소개 -->
				<div class="recipe_section">
					<h2 class="section_title">
						<i class="fas fa-info-circle"></i> 레시피 소개
					</h2>
					<div class="recipe_description">
						<p>산모에게 좋은 미역국! 소고기를 넣어 더욱 깊은 맛을 내는 미역국 레시피를 소개합니다. 특별한 날이
							아니더라도 가족들의 건강을 위해 자주 해먹으면 좋은 국입니다. 미역의 풍부한 식이섬유와 소고기의 단백질이 어우러진
							영양만점 요리입니다.</p>
					</div>
				</div>

				<!-- 재료 섹션 -->
				<div class="recipe_section">
					<h2 class="section_title">
						<i class="fas fa-carrot"></i> 재료
					</h2>

					<div class="ingredients_container">
						<div class="ingredient_group">
							<h3>주재료</h3>
							<ul class="ingredient_list">
								<li><span class="ingredient_name">소고기 (국거리용)</span> <span
									class="ingredient_amount">200g</span></li>
								<li><span class="ingredient_name">미역</span> <span
									class="ingredient_amount">50g</span></li>
								<li><span class="ingredient_name">물</span> <span
									class="ingredient_amount">8컵</span></li>
							</ul>
						</div>

						<div class="ingredient_group">
							<h3>양념</h3>
							<ul class="ingredient_list">
								<li><span class="ingredient_name">참기름</span> <span
									class="ingredient_amount">2큰술</span></li>
								<li><span class="ingredient_name">국간장</span> <span
									class="ingredient_amount">2큰술</span></li>
								<li><span class="ingredient_name">다진 마늘</span> <span
									class="ingredient_amount">1큰술</span></li>
								<li><span class="ingredient_name">소금</span> <span
									class="ingredient_amount">약간</span></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- 조리 과정 섹션 -->
				<div class="recipe_section">
					<h2 class="section_title">
						<i class="fas fa-utensils"></i> 조리 과정
					</h2>

					<div class="cooking_steps">
						<div class="step_item">
							<div class="step_number">1</div>
							<div class="step_content">
								<div class="step_text">
									<p>미역은 찬물에 20분 정도 불린 후 물기를 꼭 짜서 먹기 좋은 크기로 썰어주세요.</p>
								</div>
								<div class="step_image">
									<img
										src="${pageContext.request.contextPath}/resources/image/step1.jpg"
										alt="1단계">
								</div>
							</div>
						</div>

						<div class="step_item">
							<div class="step_number">2</div>
							<div class="step_content">
								<div class="step_text">
									<p>냄비에 참기름을 두르고 소고기를 넣어 중간 불에서 볶아주세요.</p>
								</div>
								<div class="step_image">
									<img
										src="${pageContext.request.contextPath}/resources/image/step2.jpg"
										alt="2단계">
								</div>
							</div>
						</div>

						<div class="step_item">
							<div class="step_number">3</div>
							<div class="step_content">
								<div class="step_text">
									<p>소고기가 어느 정도 익으면 불린 미역을 넣고 함께 볶아주세요.</p>
								</div>
								<div class="step_image">
									<img
										src="${pageContext.request.contextPath}/resources/image/step3.jpg"
										alt="3단계">
								</div>
							</div>
						</div>

						<div class="step_item">
							<div class="step_number">4</div>
							<div class="step_content">
								<div class="step_text">
									<p>미역이 숨이 죽으면 물을 부어 끓여주세요.</p>
								</div>
								<div class="step_image">
									<img
										src="${pageContext.request.contextPath}/resources/image/step4.jpg"
										alt="4단계">
								</div>
							</div>
						</div>

						<div class="step_item">
							<div class="step_number">5</div>
							<div class="step_content">
								<div class="step_text">
									<p>국물이 끓어오르면 국간장, 다진 마늘을 넣고 중약불로 20분 정도 더 끓여주세요.</p>
								</div>
								<div class="step_image">
									<img
										src="${pageContext.request.contextPath}/resources/image/step5.jpg"
										alt="5단계">
								</div>
							</div>
						</div>

						<div class="step_item">
							<div class="step_number">6</div>
							<div class="step_content">
								<div class="step_text">
									<p>마지막에 소금으로 간을 맞추고 완성!</p>
								</div>
								<div class="step_image">
									<img
										src="${pageContext.request.contextPath}/resources/image/step6.jpg"
										alt="6단계">
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 요리 팁 섹션 -->
				<div class="recipe_section">
					<h2 class="section_title">
						<i class="fas fa-lightbulb"></i> 요리 팁
					</h2>

					<div class="cooking_tips">
						<div class="tip_item">
							<i class="fas fa-check-circle"></i>
							<p>미역은 너무 오래 불리면 맛이 없어지니 20분 정도만 불려주세요.</p>
						</div>
						<div class="tip_item">
							<i class="fas fa-check-circle"></i>
							<p>소고기는 핏물을 제거하고 사용하면 국물이 더 맑아집니다.</p>
						</div>
						<div class="tip_item">
							<i class="fas fa-check-circle"></i>
							<p>미역국은 끓인 후 하루 정도 지난 후 먹으면 더 깊은 맛을 느낄 수 있습니다.</p>
						</div>
					</div>
				</div>

				<!-- 버튼 -->
				<div class="post_view_actions">
					<div class="action_buttons">
						<button id="return_list" type="button" id="return_list">
							<i class="fas fa-list"></i> 목록보기
						</button>
						<button id="modify_board_btn" type="button" onclick="">
							<i class="fas fa-edit"></i> 수정하기
						</button>
						<button id="delete_board_btn" type="button" onclick="">
							<i class="fas fa-trash-alt"></i> 삭제하기
						</button>
					</div>
				</div>

				<!-- 태그 섹션 -->
				<div class="recipe_section">
					<h2 class="section_title">
						<i class="fas fa-tags"></i> 태그
					</h2>

					<div class="recipe_tags">
						<a href="#" class="tag">#미역국</a> <a href="#" class="tag">#한식</a> <a
							href="#" class="tag">#국요리</a> <a href="#" class="tag">#소고기요리</a>
						<a href="#" class="tag">#영양식</a>
					</div>
				</div>

				<!-- 액션 버튼 -->
				<div class="recipe_actions">
					<button class="action_btn like_btn">
						<i class="far fa-heart"></i> 좋아요
					</button>
					<button class="action_btn save_btn">
						<i class="far fa-bookmark"></i> 저장하기
					</button>
					<button class="action_btn share_btn">
						<i class="fas fa-share-alt"></i> 공유하기
					</button>
				</div>

				<!-- 댓글 섹션 -->
				<div class="recipe_section comments_section">
					<h2 class="section_title">
						<i class="fas fa-comments"></i> 댓글 <span class="comment_count">2</span>
					</h2>

					<div class="comment_list">
						<div class="comment_item">
							<div class="comment_author">
								<div class="author_avatar">
									<img
										src="${pageContext.request.contextPath}/resources/image/user1.jpg"
										alt="사용자">
								</div>
								<div class="author_info">
									<span class="author_name">맛있는생활</span> <span
										class="comment_date">2023.05.16</span>
								</div>
							</div>
							<div class="comment_content">
								<p>정말 맛있게 만들었어요! 소고기를 조금 더 넣었더니 더 깊은 맛이 났습니다.</p>
							</div>
						</div>

						<div class="comment_item">
							<div class="comment_author">
								<div class="author_avatar">
									<img
										src="${pageContext.request.contextPath}/resources/image/user2.jpg"
										alt="사용자">
								</div>
								<div class="author_info">
									<span class="author_name">요리초보</span> <span
										class="comment_date">2023.05.17</span>
								</div>
							</div>
							<div class="comment_content">
								<p>레시피 덕분에 처음으로 미역국을 성공적으로 만들었어요! 감사합니다.</p>
							</div>
						</div>
					</div>

					<!-- 댓글 작성 폼 -->
					<div class="comment_form">
						<textarea placeholder="댓글을 작성해주세요"></textarea>
						<button class="comment_submit_btn">
							<i class="fas fa-paper-plane"></i> 등록
						</button>
					</div>
				</div>

				<!-- 추천 레시피 -->
				<div class="recipe_section">
					<h2 class="section_title">
						<i class="fas fa-thumbs-up"></i> 추천 레시피
					</h2>

					<div class="recommended_recipes">
						<div class="recipe_card">
							<div class="recipe_card_image">
								<img
									src="${pageContext.request.contextPath}/resources/image/recipe1.jpg"
									alt="된장찌개">
							</div>
							<div class="recipe_card_content">
								<div class="recipe_card_category">한식</div>
								<h3 class="recipe_card_title">된장찌개</h3>
								<div class="recipe_card_meta">
									<span><i class="fas fa-user"></i> 요리왕</span> <span><i
										class="fas fa-heart"></i> 42</span>
								</div>
							</div>
						</div>

						<div class="recipe_card">
							<div class="recipe_card_image">
								<img
									src="${pageContext.request.contextPath}/resources/image/recipe2.jpg"
									alt="김치찌개">
							</div>
							<div class="recipe_card_content">
								<div class="recipe_card_category">한식</div>
								<h3 class="recipe_card_title">김치찌개</h3>
								<div class="recipe_card_meta">
									<span><i class="fas fa-user"></i> 맛있는생활</span> <span><i
										class="fas fa-heart"></i> 38</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>