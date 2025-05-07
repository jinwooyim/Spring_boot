<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="content">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">

function board_list_view(b_id) {
    $.ajax({
        type: "post",
        data: { b_id: b_id },
        url: "board/content_view",
        success: function(data) {
            $("#board_body").html(data);
        },
        error: function() {
            alert("오류 발생");
        }
    });
}
</script>
    <div class="board_container">
        <!-- 게시판 헤더 -->
        <div class="board_header">
            <h2 class="board_title">자유게시판</h2>
            <p class="board_description">요리와 관련된 다양한 이야기를 자유롭게 나눠보세요!</p>
        </div>
        <div id="board_body">
        <!-- 검색 및 필터 섹션 -->
        <div class="board_search_section">
            <div class="board_category">
                <select id="board_category_select">
                    <option value="all">전체</option>
                    <option value="recipe">레시피 공유</option>
                    <option value="question">질문/답변</option>
                    <option value="review">후기</option>
                    <option value="talk">잡담</option>
                </select>
            </div>
            
            <div class="board_search">
                <select id="search_type">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="author">작성자</option>
                    <option value="title_content">제목+내용</option>
                </select>
                <div class="search_input_wrapper">
                    <input type="text" id="search_keyword" placeholder="검색어를 입력하세요">
                    <button class="search_btn"><i class="fas fa-search"></i></button>
                </div>
            </div>
        </div>
        
        <!-- 게시글 목록 -->
        <div class="board_list_section">
            <table class="board_table">
                <thead>
                    <tr>
                        <th class="board_num">번호</th>
                        <th class="board_category">분류</th>
                        <th class="board_title">제목</th>
                        <th class="board_author">작성자</th>
                        <th class="board_date">작성일</th>
                        <th class="board_views">조회</th>
                        <th class="board_likes">추천</th>
                    </tr>
                </thead>
                <tbody>
	               <c:forEach var="dto" items="${list}">
					    <tr class="notice_row">
					        <td><span class="notice_badge">${dto.b_id}</span></td>
					        <td><span class="category_badge notice">--</span></td>
					        <td class="title_cell">
					        <form id="board_list_view">
					        	<input type="hidden" name="b_id" value="${dto.b_id}">
					            <span class="comment_count">N</span>
					        	<input type="button" class="list_notice_button" value="${dto.b_title}" onclick="board_list_view('${dto.b_id}')">
					        </form>
					        </td>
					        <td><span id="other_profile">${dto.b_name}</span></td>
					        <td>${dto.b_date}</td>
					        <td>${dto.b_hit}</td>
					        <td>${dto.b_recommend}</td>
					    </tr>
					</c:forEach>

                </tbody>
            </table>
        </div>
        <!-- 페이지네이션 및 글쓰기 버튼 -->
        <div class="board_bottom_section">
            <div class="pagination">
                <a href="#" class="pagination_btn"><i class="fas fa-angle-double-left"></i></a>
                <a href="#" class="pagination_btn"><i class="fas fa-angle-left"></i></a>
                <a href="#" class="pagination_btn active">1</a>
                <a href="#" class="pagination_btn">2</a>
                <a href="#" class="pagination_btn">3</a>
                <a href="#" class="pagination_btn">4</a>
                <a href="#" class="pagination_btn">5</a>
                <a href="#" class="pagination_btn"><i class="fas fa-angle-right"></i></a>
                <a href="#" class="pagination_btn"><i class="fas fa-angle-double-right"></i></a>
            </div>
            <div class="board_buttons">
                <button class="write_btn">글쓰기</button>
            </div>
        </div>
        </div>
    </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // 글쓰기 버튼 클릭 이벤트
//     const writeBtn = document.querySelector('.write_btn');
//     if (writeBtn) {
//         writeBtn.addEventListener('click', function() {
//             // 글쓰기 페이지로 이동
// //             window.location.href = 'write_view.jsp';
            
//             alert('글쓰기 페이지로 이동합니다.');
//         });
//     }
    
    // 게시글 제목 클릭 이벤트
    const postLinks = document.querySelectorAll('.title_cell a');
    postLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            // 게시글 상세 페이지로 이동
            // const postId = this.getAttribute('data-id');
            // window.location.href = 'free_board_view.jsp?id=' + postId;
            alert('게시글 상세 페이지로 이동합니다.');
        });
    });
    
    // 검색 버튼 클릭 이벤트
    const searchBtn = document.querySelector('.search_btn');
    if (searchBtn) {
        searchBtn.addEventListener('click', function() {
            const searchType = document.getElementById('search_type').value;
            const keyword = document.getElementById('search_keyword').value;
            
            if (keyword.trim() === '') {
                alert('검색어를 입력해주세요.');
                return;
            }
            
            // 검색 결과 페이지로 이동
            // window.location.href = 'free_board.jsp?type=' + searchType + '&keyword=' + encodeURIComponent(keyword);
            alert('검색 결과 페이지로 이동합니다. 검색 유형: ' + searchType + ', 키워드: ' + keyword);
        });
    }
    
    // 카테고리 변경 이벤트
    const categorySelect = document.getElementById('board_category_select');
    if (categorySelect) {
        categorySelect.addEventListener('change', function() {
            const category = this.value;
            // 카테고리별 목록 페이지로 이동
            // window.location.href = 'free_board.jsp?category=' + category;
            alert('카테고리가 변경되었습니다: ' + category);
        });
    }
});
</script>
