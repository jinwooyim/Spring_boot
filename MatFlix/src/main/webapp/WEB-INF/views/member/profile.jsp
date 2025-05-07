<%@page import="com.lgy.TeamProject.dto.TeamDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  TeamDTO user = (TeamDTO) session.getAttribute("user"); %>

<div class="mypage_container">
    <!-- 프로필 섹션 -->
<section class="profile_section">
        <div class="profile_header">
            <div class="profile_image_large">
                <img src="${pageContext.request.contextPath}/resources/image/MATFLIX.png" alt="프로필 이미지">
                <button class="edit_profile_image"><i class="fas fa-camera"></i></button>
            </div>
            <div class="profile_info_container">
                <div class="profile_info">
                    <h2>${dto.mf_nickname}<button class="edit_profile_btn tab_btn" data-tab="nickname_settings"><i class="fas fa-edit user_nick_name"></i></button></h2>
                </div>
                    <div class="user_bio">안녕하세요! 맛있는 요리를 사랑하는 요리 초보입니다.</div>
                <div class="profile_stats">
                    <div class="stat_item">
                        <span class="stat_number">15</span>
                        <span class="stat_label">레시피</span>
                    </div>
                    <div class="stat_item">
                        <span class="stat_number">142</span>
                        <span class="stat_label">팔로워</span>
                    </div>
                    <div class="stat_item">
                        <span class="stat_number">56</span>
                        <span class="stat_label">팔로잉</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 탭 메뉴 -->
    <div class="mypage_tabs">
        <button class="tab_btn active" data-tab="my_recipes">내 레시피</button>
        <button class="tab_btn" data-tab="saved_recipes">저장한 레시피</button>
        <button class="tab_btn" data-tab="liked_recipes">좋아요한 레시피</button>
        <button class="tab_btn" data-tab="account_settings">계정 설정</button>
    </div>

   <!-- 내 레시피 탭 -->
   <div class="tab_content active" id="my_recipes">
       <div class="tab_header">
           <h3>내 레시피</h3>
           <button class="add_recipe_btn"><i class="fas fa-plus"></i> 새 레시피 등록</button>
       </div>
       <div class="recipe_grid">
           <% for(int i=1; i<=16; i++) { %>
               <div class="recipe_card">
                   <div class="recipe_image">
                       <img alt="food" src="${pageContext.request.contextPath}/resources/image/food.jpg">
                       <div class="recipe_overlay">
                           <a href="#" class="btn_view">레시피 보기</a>
                       </div>
                       <div class="recipe_actions">
                           <button class="recipe_action_btn edit_btn"><i class="fas fa-edit"></i></button>
                           <button class="recipe_action_btn delete_btn"><i class="fas fa-trash"></i></button>
                       </div>
                   </div>
                   <div class="recipe_info">
                       <h3><a href="#">매콤한 떡볶이 <%= i %></a></h3>
                       <p>집에서 간단하게 만드는 매콤달콤 떡볶이</p>
                       <div class="recipe_meta">
                           <div class="recipe_rating">
                               <i class="fas fa-star"></i>
                               <i class="fas fa-star"></i>
                               <i class="fas fa-star"></i>
                               <i class="fas fa-star"></i>
                               <i class="far fa-star"></i>
                               <span>(32)</span>
                           </div>
                           <div class="recipe_time">
                               <i class="far fa-clock"></i> 30분
                           </div>
                       </div>
                   </div>
               </div>
           <% } %>
       </div>
       <div class="pagination">
           <button class="pagination_btn prev_page"><i class="fas fa-chevron-left"></i></button>
           <button class="pagination_btn active" data-page="1">1</button>
           <button class="pagination_btn next_page"><i class="fas fa-chevron-right"></i></button>
       </div>
   </div>


    <!-- 저장한 레시피 탭 (기본적으로 숨겨짐) -->
    <div class="tab_content" id="saved_recipes">
        <div class="tab_header">
            <h3>저장한 레시피</h3>
        </div>
        <div class="recipe_grid">
            <!-- 저장한 레시피 카드들 -->
        </div>
    </div>

    <!-- 좋아요한 레시피 탭 (기본적으로 숨겨짐) -->
    <div class="tab_content" id="liked_recipes">
        <div class="tab_header">
            <h3>좋아요한 레시피</h3>
        </div>
        <div class="recipe_grid">
            <!-- 좋아요한 레시피 카드들 -->
        </div>
    </div>

    <!-- 계정 설정 탭 (기본적으로 숨겨짐) -->
    <script type="text/javascript">
    function user_profile_update() {
        const form = document.getElementById("user_profile_update");
        const current_pw = document.getElementById("current_password").value;
        const real_pw = "<%= user.getMf_pw() %>";

        // 유효성 검사
        if (!form.checkValidity()) {
            form.reportValidity();
            return;
        }

        // 비밀번호가 틀리면 중단
        if (current_pw !== real_pw) {
            alert("비밀번호가 다릅니다. 다시 입력해주세요.");
            return;
        }

        // 비밀번호가 맞을 경우에만 ajax 요청
        const formData = $("#user_profile_update").serialize();

        $.ajax({
            type: "post",
            data: formData,
            url: "member/mem_update",
            success: function(data) {
                alert("정상적으로 처리되었습니다.");
                window.location.href = "${pageContext.request.contextPath}/"; // index.jsp로 전체 이동
            },
            error: function(xhr, status, error) {
                console.error("AJAX 오류", status, error);
                alert("오류 발생: " + status);
            }
        });
    }
    
       function checkPasswordMatch() {
           const pw = document.getElementById("new_password").value;
           const pwChk = document.getElementById("confirm_password").value;
           const msg = document.getElementById("pw_match_msg");
           if (pwChk.length === 0) {
               msg.textContent = "";
               return;
           }
   
           if (pw === pwChk) {
               msg.textContent = "비밀번호가 일치합니다.";
               msg.style.color = "green";
           } else {
               msg.textContent = "비밀번호가 일치하지 않습니다.";
               msg.style.color = "red";
           }
       }
       //--------------------------
       function nickname() {
       const form = document.getElementById("nickname");
   
       // 유효성 검사 실행
       if (!form.checkValidity()) {
           form.reportValidity();  // 브라우저 기본 경고창 띄움
           return;  // 중단
       }
       const formData = $("#nickname").serialize();
   
       $.ajax({
           type: "post",
           data: formData,
           url: "member/nickname",
           success: function(data) {
              alert("수정성공");
               $(".content").html(data);
                $("html, body").animate({scrollTop: 0}, 0);
           },
           error: function() {
               alert("오류 발생");
           }
       });
   };
       
    </script>
    <div class="tab_content" id="account_settings">
        <div class="tab_header">
            <h3>계정 설정</h3>
        </div>
        <div class="settings_form">
        <form id="user_profile_update">
           <input type="hidden" name="mf_id" value="<%=user.getMf_id()%>">
            <div class="form_group">
                <label for="username">사용자 이름</label>
                <input type="text" id="username" name="mf_name" value="<%= user.getMf_name()%>">
            </div>
<!--             <div class="form_group"> -->
<!--                 <label for="username">닉네임</label> -->
<%--                 <input type="text" id="user_nick_name" value="<%= user.getMf_nickname() %>"> --%>
<!--             </div> -->
            <div class="form_group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="mf_email" value="<%= user.getMf_email()%>">
            </div>
            <div class="form_group">
                <label for="bio">자기소개</label>
                <textarea id="bio" rows="3">안녕하세요! 맛있는 요리를 사랑하는 요리 초보입니다.</textarea>
            </div>
            <div class="form_group type_pw">
                <label for="current_password">현재 비밀번호</label>
                <input type="password" id="current_password">
                <i class="fa fa-eye" id="togglePw"></i>
            </div>
            <div class="form_group type_pw">
                <label for="new_password">새 비밀번호</label>
                <input type="password" id="new_password" name="mf_pw"
                  required 
		           pattern="^[a-zA-Z0-9]{8,16}$"
		           title="영문, 숫자, 특수문자 조합 8-16자리로 입력해주세요." 
		           oninvalid="this.setCustomValidity('영문, 숫자 조합 8-16자리로 입력해주세요.')"
		           oninput="this.setCustomValidity('')">
                <i class="fa fa-eye" id="togglePassword"></i>
            </div>
            <div class="form_group type_pw">
                <label for="confirm_password">새 비밀번호 확인</label>
                <input type="password" id="confirm_password" name="mf_pw_chk"
                      required
                           placeholder="새 비밀번호를 다시 입력"
                           oninput="new_checkPasswordMatch()">
                <i class="fa fa-eye" id="togglePwChk"></i>
                <div id="pw_match_msg" class="validation_message"></div>
            </div>
            <div class="form_actions">
                <button type="button" class="save_settings_btn" onclick="user_profile_update()">저장하기</button>
            </div>
        </form> 
        </div>
    </div>
    
    <div class="tab_content" id="nickname_settings">
        <div class="tab_header">
            <h3>닉네임 변경</h3>
        </div>
        <div class="settings_form">
        <form id="nickname">
           <input type="hidden" name="mf_id" value="<%=user.getMf_id()%>">
            <div class="form_group">
                <label for="usernickname">현재 닉네임</label>
                <input type="text" id="usernickname" name="mf_name" value="${dto.mf_nickname}" readonly>
            </div>
            <div class="form_group">
                <label for="new_nickname">새 닉네임</label>
                <input type="text" id="new_nickname" name="mf_nickname">
            </div>
            <div class="form_actions">
                <button type="button" class="save_settings_btn" onclick="nickname()">저장하기</button>
            </div>
        </form> 
        </div>
    </div>
</div>