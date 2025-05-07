<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function fn_submit() {
    const form = document.getElementById("frm");

    // 유효성 검사 실행
    if (!form.checkValidity()) {
        form.reportValidity();  // 브라우저 기본 경고창 띄움
        return;  // 중단
    }
    const formData = $("#frm").serialize();

    $.ajax({
        type: "post",
        data: formData,
        url: "recruit_result_ok",
        success: function(data) {
            alert("회원가입이 정상적으로 처리되었습니다.");
            $(".content").load("${pageContext.request.contextPath}/front/content_main", function(response, status, xhr) {
                if (status === "error") {
                   alert("홈 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
                } else {
                   console.log("홈 페이지 로딩 완료");
                }
             });
        },
        error: function() {
            alert("오류 발생");
        }
    });
}
</script>

<div class="content">
    <div class="register_container">
        <div class="register_box">
            <div class="register_header">
                <h2>회원가입</h2>
                <p><span id="register_MATFLIX">MATFLIX</span> 회원이 되어 다양한 레시피를 만나보세요</p>
            </div>
            <form id="frm" class="register_form">
                <div class="form_group">
                    <label for="mf_name"><i class="fas fa-user-circle"></i> 이름 <span class="required">*</span></label>
                    <input type="text" id="mf_name" name="mf_name"
                           required maxlength="20"
                           pattern="^[a-z가-힣]+$"
                           title="소문자, 한글만 입력 가능합니다."
                           oninvalid="this.setCustomValidity('올바른 이름 형식이 아닙니다. 소문자/한글만 입력하세요.')"
                           oninput="this.setCustomValidity('')">
                </div>
                
                <div class="form_group">
                    <label for="mf_id"><i class="fas fa-user"></i> 아이디 <span class="required">*</span></label>
                    <div class="input_with_button">
                        <input type="text" id="mf_id" name="mf_id" 
                               required minlength="3" maxlength="12"
                               pattern="^[a-zA-Z0-9]{4,12}$"
                               oninvalid="this.setCustomValidity('아이디는 3~12자의 영문 소문자 및 숫자만 입력 가능합니다.')"
                               oninput="this.setCustomValidity('')">
                        <button type="button" class="btn_check">중복확인</button>
                    </div>
                    <p class="input_hint">영문, 숫자 조합 4-12자리</p>
                </div>
                
                <div class="form_group_pw">
                    <label for="mf_pw"><i class="fas fa-lock"></i> 비밀번호 <span class="required">*</span></label>
                    <input type="password" name="mf_pw" id="mf_pw" required><i class="fa fa-eye" id="togglePassword"></i>
                    <p class="input_hint">영문, 숫자, 특수문자 조합 8-16자리</p>
                </div>
                
                <div class="form_group_pw">
                    <label for="mf_pw_chk"><i class="fas fa-lock"></i> 비밀번호 확인 <span class="required">*</span></label>
                    <input type="password" name="mf_pw_chk" id="mf_pw_chk"
                           required
                           placeholder="비밀번호를 다시 입력"
                           oninput="checkPasswordMatch()"><i class="fa fa-eye" id="togglePwChk"></i>
                    <div id="pw_match_msg" class="validation_message"></div>
                </div>
                
                <div class="form_group">
                    <label for="mf_email"><i class="fas fa-envelope"></i> 이메일 <span class="required">*</span></label>
                    <input type="email" name="mf_email" id="mf_email"
                           required
                           placeholder="example@email.com"
                           pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                           oninvalid="this.setCustomValidity('올바른 이메일 주소 형식으로 입력해주세요.')"
                           oninput="this.setCustomValidity('')">
                </div>
                
                <div class="form_group">
                    <label for="mf_phone"><i class="fas fa-phone"></i> 전화번호 <span class="required">*</span></label>
                    <input type="tel" name="mf_phone" id="mf_phone"
                           required
                           placeholder="010-0000-0000"
                           pattern="^010-\d{4}-\d{4}$"
                           oninvalid="this.setCustomValidity('올바른 전화번호 형식(010-0000-0000)으로 입력해주세요.')"
                           oninput="this.setCustomValidity('')">
                </div>
                
                <div class="form_group">
                    <label for="mf_birth"><i class="fas fa-birthday-cake"></i> 생년월일 <span class="required">*</span></label>
                    <input type="text" name="mf_birth" id="mf_birth" required placeholder="주민등록번호 앞자리 6자리">
                </div>
                
                <div class="form_group">
                    <label><i class="fas fa-venus-mars"></i> 성별 <span class="required">*</span></label>
                    <div class="gender_options">
                        <label class="radio_label">
                            <input type="radio" name="mf_gender" value="m" checked> 남
                        </label>
                        <label class="radio_label">
                            <input type="radio" name="mf_gender" value="f"> 여
                        </label>
                    </div>
                </div>
                
                <div class="form_buttons">
                    <button type="submit" class="btn_register_recruit" onclick="fn_submit()">가입하기</button>
                    <button type="button" class="btn_cancel">취소</button>
                </div>
            </form>
            
            <div class="login_link">
                <p>이미 회원이신가요? <a class="recruit_cancel">로그인</a></p>
            </div>
        </div>
    </div>
</div>