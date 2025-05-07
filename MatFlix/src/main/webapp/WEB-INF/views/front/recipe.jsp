<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="content">
    <div class="recipe_detail_container">
        <!-- 레시피 헤더 섹션 -->
        <div class="recipe_header">
            <div class="recipe_title_section">
                <h1>매콤 달콤 떡볶이</h1>
                <div class="recipe_meta_info">
                    <div class="recipe_author">
                        <img src="${pageContext.request.contextPath}/resources/image/MATFLIX.png" alt="작성자 프로필">
                        <span>요리왕 김작성</span>
                    </div>
                    <div class="recipe_stats">
                        <div class="stat_item">
                            <i class="fas fa-eye"></i>
                            <span>1,234</span>
                        </div>
                        <div class="stat_item">
                            <i class="fas fa-heart"></i>
                            <span>256</span>
                        </div>
                        <div class="stat_item">
                            <i class="fas fa-bookmark"></i>
                            <span>78</span>
                        </div>
                        <div class="stat_item">
                            <i class="fas fa-comment"></i>
                            <span>42</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="recipe_image_container">
                <img src="${pageContext.request.contextPath}/resources/image/food.jpg" alt="매콤 달콤 떡볶이" class="recipe_main_image">
            </div>
            
            <div class="recipe_action_buttons">
                <button class="action_btn like_btn">
                    <i class="far fa-heart"></i>
                    <span>좋아요</span>
                </button>
                <button class="action_btn save_btn">
                    <i class="far fa-bookmark"></i>
                    <span>저장</span>
                </button>
                <button class="action_btn share_btn">
                    <i class="fas fa-share-alt"></i>
                    <span>공유</span>
                </button>
                <button class="action_btn print_btn">
                    <i class="fas fa-print"></i>
                    <span>인쇄</span>
                </button>
            </div>
        </div>
        
        <!-- 레시피 소개 섹션 -->
        <div class="recipe_intro_section">
            <div class="recipe_intro_text">
                <h2>간단한 한줄 소개</h2>
                <p>집에서도 쉽게 만들 수 있는 매콤달콤한 국민 간식, 떡볶이 레시피를 소개합니다. 분식집 맛 그대로 재현한 비법 레시피!</p>
            </div>
            
            <div class="recipe_info_cards">
                <div class="info_card">
                    <i class="fas fa-clock"></i>
                    <div class="info_text">
                        <span class="info_label">조리시간</span>
                        <span class="info_value">30분</span>
                    </div>
                </div>
                <div class="info_card">
                    <i class="fas fa-signal"></i>
                    <div class="info_text">
                        <span class="info_label">난이도</span>
                        <span class="info_value">초보자</span>
                    </div>
                </div>
                <div class="info_card">
                    <i class="fas fa-users"></i>
                    <div class="info_text">
                        <span class="info_label">인원</span>
                        <span class="info_value">2인분</span>
                    </div>
                </div>
                <div class="info_card">
                    <i class="fas fa-fire"></i>
                    <div class="info_text">
                        <span class="info_label">칼로리</span>
                        <span class="info_value">320kcal</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 재료 및 조리과정 섹션 -->
        <div class="recipe_content_section">
            <div class="recipe_ingredients">
                <h2><i class="fas fa-carrot"></i> 재료</h2>
                
                <div class="ingredient_group">
                    <h3>주재료</h3>
                    <ul class="ingredient_list">
                        <li>
                            <span class="ingredient_name">떡볶이 떡</span>
                            <span class="ingredient_amount">400g</span>
                        </li>
                        <li>
                            <span class="ingredient_name">어묵</span>
                            <span class="ingredient_amount">200g</span>
                        </li>
                        <li>
                            <span class="ingredient_name">양배추</span>
                            <span class="ingredient_amount">1/4개</span>
                        </li>
                        <li>
                            <span class="ingredient_name">대파</span>
                            <span class="ingredient_amount">1대</span>
                        </li>
                        <li>
                            <span class="ingredient_name">삶은 계란</span>
                            <span class="ingredient_amount">2개</span>
                        </li>
                    </ul>
                </div>
                
                <div class="ingredient_group">
                    <h3>양념장</h3>
                    <ul class="ingredient_list">
                        <li>
                            <span class="ingredient_name">고추장</span>
                            <span class="ingredient_amount">3큰술</span>
                        </li>
                        <li>
                            <span class="ingredient_name">고춧가루</span>
                            <span class="ingredient_amount">2큰술</span>
                        </li>
                        <li>
                            <span class="ingredient_name">설탕</span>
                            <span class="ingredient_amount">2큰술</span>
                        </li>
                        <li>
                            <span class="ingredient_name">간장</span>
                            <span class="ingredient_amount">1큰술</span>
                        </li>
                        <li>
                            <span class="ingredient_name">다진 마늘</span>
                            <span class="ingredient_amount">1큰술</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 조리 과정 섹션 -->
        <div class="recipe_steps_section">
            <h2><i class="fas fa-utensils"></i> 조리 과정</h2>
            
            <div class="step_list">
                <div class="step_item">
                    <div class="step_number">1</div>
                    <div class="step_content">
                        <p>떡볶이 떡은 찬물에 30분 정도 담가 불린 후 체에 밭쳐 물기를 제거해주세요.</p>
                        <div class="step_image">
                            <img src="${pageContext.request.contextPath}/resources/image/food.jpg" alt="1단계">
                        </div>
                    </div>
                </div>
                
                <div class="step_item">
                    <div class="step_number">2</div>
                    <div class="step_content">
                        <p>양배추는 먹기 좋은 크기로 썰고, 대파는 어슷 썰어 준비해주세요.</p>
                        <div class="step_image">
                            <img src="${pageContext.request.contextPath}/resources/image/food.jpg" alt="2단계">
                        </div>
                    </div>
                </div>
                
                <div class="step_item">
                    <div class="step_number">3</div>
                    <div class="step_content">
                        <p>냄비에 물 2컵을 붓고 양념장 재료를 모두 넣어 끓여주세요.</p>
                        <div class="step_image">
                            <img src="${pageContext.request.contextPath}/resources/image/food.jpg" alt="3단계">
                        </div>
                    </div>
                </div>
                
                <div class="step_item">
                    <div class="step_number">4</div>
                    <div class="step_content">
                        <p>양념장이 끓어오르면 불린 떡과 어묵, 양배추를 넣고 중간 불에서 떡이 말랑해질 때까지 끓여주세요.</p>
                        <div class="step_image">
                            <img src="${pageContext.request.contextPath}/resources/image/food.jpg" alt="4단계">
                        </div>
                    </div>
                </div>
                
                <div class="step_item">
                    <div class="step_number">5</div>
                    <div class="step_content">
                        <p>떡이 말랑해지면 대파를 넣고 1분 정도 더 끓인 후 삶은 계란을 넣고 완성해주세요.</p>
                        <div class="step_image">
                            <img src="${pageContext.request.contextPath}/resources/image/food.jpg" alt="5단계">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 요리 팁 섹션 -->
        <div class="recipe_tips_section">
            <h2><i class="fas fa-lightbulb"></i> 요리 팁</h2>
            <div class="tips_content">
                <ul class="tips_list">
                    <li>떡이 너무 불지 않게 주의하세요. 30분 이상 물에 담가두면 너무 물러질 수 있습니다.</li>
                    <li>매운 맛을 조절하고 싶다면 고춧가루의 양을 조절해보세요.</li>
                    <li>달달한 맛을 더 원한다면 올리고당이나 물엿을 추가해도 좋습니다.</li>
                    <li>치즈를 올려 먹으면 매운맛이 중화되고 더 풍부한 맛을 즐길 수 있습니다.</li>
                </ul>
            </div>
        </div>
        
        <!-- 조리도구 광고 섹션 -->
        <section class="todays_menu">
            <div class="todays_menu_container">
                <div class="menu_image">
                    <img alt="cooking_tool" src="${pageContext.request.contextPath}/resources/image/cooking_tool.png">
                </div>
                <div class="menu_info">
                    <span class="menu_label">요리에 맞는 기구를 고르세요!</span>
                    <h3>떡볶이에 딱 맞는 조리도구</h3>
                    <p>프리미엄 주물 냄비로 열이 골고루 전달되어 떡볶이의 맛이 더욱 깊어집니다. 지금 구매하시면 20% 할인!</p>
                    <div>
                        <a href="#">자세히 보기</a>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 댓글 섹션 -->
        <div class="recipe_comments_section">
            <h2><i class="fas fa-comments"></i> 댓글 <span class="comment_count">42</span></h2>
            
            <div class="comment_form">
                <textarea placeholder="댓글을 남겨보세요"></textarea>
                <button class="comment_submit_btn">등록</button>
            </div>
            
            <div class="comments_list">
                <div class="comment_item">
                    <div class="comment_author">
                        <img src="${pageContext.request.contextPath}/resources/image/MATFLIX.png" alt="댓글 작성자">
                        <div class="author_info">
                            <span class="author_name">맛있게먹자</span>
                            <span class="comment_date">2023.04.10</span>
                        </div>
                    </div>
                    <div class="comment_content">
                        <p>정말 맛있게 만들어 먹었어요! 치즈 추가해서 먹었더니 더 맛있더라구요. 감사합니다~</p>
                    </div>
                    <div class="comment_actions">
                        <button class="comment_like_btn"><i class="far fa-heart"></i> <span>5</span></button>
                        <button class="comment_reply_btn"><i class="fas fa-reply"></i> 답글</button>
                    </div>
                </div>
                
                <div class="comment_item">
                    <div class="comment_author">
                        <img src="${pageContext.request.contextPath}/resources/image/MATFLIX.png" alt="댓글 작성자">
                        <div class="author_info">
                            <span class="author_name">요리초보</span>
                            <span class="comment_date">2023.04.09</span>
                        </div>
                    </div>
                    <div class="comment_content">
                        <p>요리 초보인데도 쉽게 따라할 수 있었어요! 남편이 분식집보다 맛있다고 칭찬해줬어요 ㅎㅎ</p>
                    </div>
                    <div class="comment_actions">
                        <button class="comment_like_btn"><i class="far fa-heart"></i> <span>12</span></button>
                        <button class="comment_reply_btn"><i class="fas fa-reply"></i> 답글</button>
                    </div>
                    
                    <!-- 답글 -->
                    <div class="reply_item">
                        <div class="comment_author">
                            <img src="${pageContext.request.contextPath}/resources/image/MATFLIX.png" alt="답글 작성자">
                            <div class="author_info">
                                <span class="author_name">요리왕 김작성</span>
                                <span class="comment_date">2023.04.09</span>
                            </div>
                        </div>
                        <div class="comment_content">
                            <p>칭찬 감사합니다! 맛있게 드셨다니 기쁘네요 :)</p>
                        </div>
                        <div class="comment_actions">
                            <button class="comment_like_btn"><i class="far fa-heart"></i> <span>3</span></button>
                        </div>
                    </div>
                </div>
                
                <div class="comment_item">
                    <div class="comment_author">
                        <img src="${pageContext.request.contextPath}/resources/image/MATFLIX.png" alt="댓글 작성자">
                        <div class="author_info">
                            <span class="author_name">떡볶이마스터</span>
                            <span class="comment_date">2023.04.08</span>
                        </div>
                    </div>
                    <div class="comment_content">
                        <p>저는 여기에 오뎅 국물을 조금 넣어봤는데 깊은 맛이 더해져서 좋았어요! 다들 한번 시도해보세요~</p>
                    </div>
                    <div class="comment_actions">
                        <button class="comment_like_btn"><i class="far fa-heart"></i> <span>8</span></button>
                        <button class="comment_reply_btn"><i class="fas fa-reply"></i> 답글</button>
                    </div>
                </div>
            </div>
            
            <div class="comments_pagination">
                <button class="pagination_btn"><i class="fas fa-chevron-left"></i></button>
                <button class="pagination_btn active">1</button>
                <button class="pagination_btn">2</button>
                <button class="pagination_btn">3</button>
                <button class="pagination_btn"><i class="fas fa-chevron-right"></i></button>
            </div>
        </div>
        
        <!-- 비슷한 레시피 추천 섹션 -->
        <div class="similar_recipes_section">
            <h2><i class="fas fa-utensils"></i> 비슷한 요리 및 어울릴만한 요리들 추천</h2>
            
            <div class="similar_recipes_list">
                <div class="similar_recipe_item">
                    <div class="similar_recipe_image">
                        <img src="${pageContext.request.contextPath}/resources/image/food.jpg" alt="라볶이">
                    </div>
                    <div class="similar_recipe_info">
                        <h3>매콤 라볶이</h3>
                        <div class="recipe_rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                            <span>(28)</span>
                        </div>
                    </div>
                </div>
                
                <div class="similar_recipe_item">
                    <div class="similar_recipe_image">
                        <img src="${pageContext.request.contextPath}/resources/image/food.jpg" alt="김치볶음밥">
                    </div>
                    <div class="similar_recipe_info">
                        <h3>김치볶음밥</h3>
                        <div class="recipe_rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                            <span>(42)</span>
                        </div>
                    </div>
                </div>
                
                <div class="similar_recipe_item">
                    <div class="similar_recipe_image">
                        <img src="${pageContext.request.contextPath}/resources/image/food.jpg" alt="어묵탕">
                    </div>
                    <div class="similar_recipe_info">
                        <h3>얼큰 어묵탕</h3>
                        <div class="recipe_rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <span>(36)</span>
                        </div>
                    </div>
                </div>
                
                <div class="similar_recipe_item">
                    <div class="similar_recipe_image">
                        <img src="${pageContext.request.contextPath}/resources/image/food.jpg" alt="순대볶음">
                    </div>
                    <div class="similar_recipe_info">
                        <h3>매콤 순대볶음</h3>
                        <div class="recipe_rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                            <span>(19)</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 작성자의 다른 레시피 섹션 -->
        <div class="author_recipes_section">
            <h2><i class="fas fa-user-chef"></i> 요리왕 김작성님의 다른 요리들도 소개</h2>
            
            <div class="recipe_grid">
                <div class="recipe_card">
                    <div class="recipe_image">
                        <img alt="food" src="${pageContext.request.contextPath}/resources/image/food.jpg">
                        <div class="recipe_overlay">
                            <a href="#" class="btn_view">레시피 보기</a>
                        </div>
                    </div>
                    <div class="recipe_info">
                        <h3><a href="#">김치찌개</a></h3>
                        <p>얼큰하고 시원한 국물이 일품인 김치찌개</p>
                        <div class="recipe_meta">
                            <div class="recipe_rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>(56)</span>
                            </div>
                            <div class="recipe_time">
                                <i class="far fa-clock"></i> 30분
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="recipe_card">
                    <div class="recipe_image">
                        <img alt="food" src="${pageContext.request.contextPath}/resources/image/food.jpg">
                        <div class="recipe_overlay">
                            <a href="#" class="btn_view">레시피 보기</a>
                        </div>
                    </div>
                    <div class="recipe_info">
                        <h3><a href="#">간장계란밥</a></h3>
                        <p>5분만에 뚝딱 만드는 초간단 한끼</p>
                        <div class="recipe_meta">
                            <div class="recipe_rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(42)</span>
                            </div>
                            <div class="recipe_time">
                                <i class="far fa-clock"></i> 5분
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="recipe_card">
                    <div class="recipe_image">
                        <img alt="food" src="${pageContext.request.contextPath}/resources/image/food.jpg">
                        <div class="recipe_overlay">
                            <a href="#" class="btn_view">레시피 보기</a>
                        </div>
                    </div>
                    <div class="recipe_info">
                        <h3><a href="#">부대찌개</a></h3>
                        <p>햄과 소시지가 듬뿍 들어간 얼큰한 부대찌개</p>
                        <div class="recipe_meta">
                            <div class="recipe_rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <span>(78)</span>
                            </div>
                            <div class="recipe_time">
                                <i class="far fa-clock"></i> 40분
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="recipe_card">
                    <div class="recipe_image">
                        <img alt="food" src="${pageContext.request.contextPath}/resources/image/food.jpg">
                        <div class="recipe_overlay">
                            <a href="#" class="btn_view">레시피 보기</a>
                        </div>
                    </div>
                    <div class="recipe_info">
                        <h3><a href="#">된장찌개</a></h3>
                        <p>구수한 된장 향이 일품인 건강식</p>
                        <div class="recipe_meta">
                            <div class="recipe_rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <span>(35)</span>
                            </div>
                            <div class="recipe_time">
                                <i class="far fa-clock"></i> 25분
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 좋아요 버튼 토글
    const likeBtn = document.querySelector('.like_btn');
    likeBtn.addEventListener('click', function() {
        const icon = this.querySelector('i');
        if (icon.classList.contains('far')) {
            icon.classList.remove('far');
            icon.classList.add('fas');
            icon.style.color = '#e74c3c';
        } else {
            icon.classList.remove('fas');
            icon.classList.add('far');
            icon.style.color = '';
        }
    });
    
    // 저장 버튼 토글
    const saveBtn = document.querySelector('.save_btn');
    saveBtn.addEventListener('click', function() {
        const icon = this.querySelector('i');
        if (icon.classList.contains('far')) {
            icon.classList.remove('far');
            icon.classList.add('fas');
            icon.style.color = '#FFC045';
        } else {
            icon.classList.remove('fas');
            icon.classList.add('far');
            icon.style.color = '';
        }
    });
    
    // 댓글 좋아요 버튼 토글
    const commentLikeBtns = document.querySelectorAll('.comment_like_btn');
    commentLikeBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const icon = this.querySelector('i');
            const count = this.querySelector('span');
            
            if (icon.classList.contains('far')) {
                icon.classList.remove('far');
                icon.classList.add('fas');
                icon.style.color = '#e74c3c';
                count.textContent = parseInt(count.textContent) + 1;
            } else {
                icon.classList.remove('fas');
                icon.classList.add('far');
                icon.style.color = '';
                count.textContent = parseInt(count.textContent) - 1;
            }
        });
    });
});
</script>
