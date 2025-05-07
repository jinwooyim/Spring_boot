<%@ page import="com.lgy.TeamProject.dto.TeamDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  TeamDTO user = (TeamDTO) session.getAttribute("user"); %>
<%= user %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	 <div class="board_container">
        <h1 class="board_title">자유게시판</h1>
        <p class="board_description">우리와 관련된 다양한 이야기를 자유롭게 나눠보세요!</p>
        
        <div class="post_write_container">
            <div class="post_write_header">
                <div class="post_category">게시글 작성</div>
                <h2 class="post_write_title">게시글 작성하기</h2>
                <p class="post_write_subtitle">새로운 게시글을 작성할 수 있습니다.</p>
            </div>
            
            <div class="post_write_form">
                <form id="insert_board_write">
                    <div class="form_group">
                        <label class="form_label" for="b_name">
                            <i class="fas fa-user"></i> 이름
                        </label>
                        <input type="text" id="b_name" name="b_name" class="form_control" value="<%=user.getMf_name()%>" readonly>
                    </div>
                    
                    <div class="form_group">
                        <label class="form_label" for="b_title">
                            <i class="fas fa-heading"></i> 제목
                        </label>
                        <input type="text" id="b_title" name="b_title" class="form_control" required>
                    </div>
                    
                    <div class="form_group">
                        <label class="form_label" for="b_content">
                            <i class="fas fa-align-left"></i> 내용
                        </label>
                        <textarea id="b_content" name="b_content" class="form_control form_control_textarea" required></textarea>
                    </div>
                    
                    <div class="action_buttons">
                        <button id="return_list" type="button" onclick="cancel_write()">
                            <i class="fas fa-times"></i> 취소하기
                        </button>
                        <button id="modify_board_btn" type="button" onclick="insert_board_write()">
                            <i class="fas fa-paper-plane"></i> 작성하기
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
