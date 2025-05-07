<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <%-- jQuery가 꼭 필요함 --%>
<script type="text/javascript">
	function modify_board_write_ok() {
	    const form = document.getElementById("modify_board_write_ok");

	    // 유효성 검사 실행
	    if (!form.checkValidity()) {
	        form.reportValidity();  // 브라우저 기본 경고창 띄움
	        return;  // 중단
	    }

	    const formData = $("#modify_board_write_ok").serialize();

	    $.ajax({
	        type: "post",
	        url: "board/modify_board_write_ok",  // 매핑된 컨트롤러 경로 확인 필요
	        data: formData,
	        success: function(data) {
	            alert("수정이 완료되었습니다.");
	            console.log("서버 응답:", data);
	            $("#board_body").html(data);
	        },
	        error: function(xhr, status, error) {
	            alert("오류 발생: " + error);
	            console.error("에러 상태:", status);
	        }
	    });
	}
</script>
</head>
<body>
	<div class="board_container">
    <h1 class="board_title">자유게시판</h1>
    <p class="board_description">우리와 관련된 다양한 이야기를 자유롭게 나눠보세요!</p>
    
    <div class="post_edit_container">
        <div class="post_edit_header">
            <div class="post_category">게시글 수정하기</div>
            <h2 class="post_edit_title">게시글 수정하기</h2>
            <p class="post_edit_subtitle">게시글 내용을 수정할 수 있습니다.</p>
            <div class="post_author">
                <div class="author_avatar">
                    <img src="${pageContext.request.contextPath}/resources/image/default_avatar.png" alt="프로필">
                </div>
                <div class="author_info">
                    <span class="author_name">${dto.b_name}</span>
                    <span class="post_date">2023.05.15</span>
                </div>
            </div>
        </div>
        
        <div class="post_edit_form">
            <form id="modify_board_write_ok">
                <input type="hidden" name="b_id" value="${dto.b_id}">
                
                <div class="post_info">
                    <div class="info_item">
                        <span class="info_label"><i class="fas fa-hashtag"></i> 번호</span>
                        <span class="info_value">${dto.b_id}</span>
                    </div>
                    <div class="info_item">
                        <span class="info_label"><i class="fas fa-user-edit"></i> 작성자</span>
                        <span class="info_value">${dto.b_name}</span>
                    </div>
                </div>
                
                <div class="form_group">
                    <label class="form_label" for="b_title">제목</label>
                    <input type="text" id="b_title" name="b_title" class="form_control" value="${dto.b_title}" required>
                </div>
                
                <div class="form_group">
                    <label class="form_label" for="b_content">내용</label>
                    <textarea id="b_content" name="b_content" class="form_control form_control_textarea" required>${dto.b_content}</textarea>
                </div>
                
                <div class="action_buttons">
                    <button type="button" id="return_list">
                        <i class="fas fa-times"></i> 취소하기
                    </button>
                    <button id="modify_board_btn" type="button" onclick="modify_board_write_ok()">
                        <i class="fas fa-edit"></i> 수정하기
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>