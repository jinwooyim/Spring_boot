<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import="com.boot.dto.TeamDTO" %>
	<%
		TeamDTO user = (TeamDTO) session.getAttribute("user");
	%>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>
				.uploadResult {
					width: 100%;
					background-color: gray;
				}

				.uploadResult ul {
					display: flex;
					flex-flow: row;
				}

				.uploadResult ul li {
					list-style: none;
					padding: 10px;
				}

				.uploadResult ul li img {
					width: 100px;
				}
			</style>
			<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
		</head>

		<body>
			<table width="500" border="1">
				<form id="actionForm" method="post" action="notice_modify">
					<input type="hidden" name="notice_boardNo" value="${pageMaker.notice_boardNo}">
					<input type="hidden" name="notice_pageNum" value="${pageMaker.notice_pageNum}">
					<input type="hidden" name="notice_amount" value="${pageMaker.notice_amount}">
					<tr>
						<td>번호</td>
						<td>
							${content_view.notice_boardNo}
						</td>
					</tr>
					<tr>
						<td>히트</td>
						<td>
							${content_view.notice_boardHit}
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<%-- ${content_view.notice_boardName} --%>
							<c:if test="${user != null && user.mf_role == 'ADMIN'}">
								<input type="text" name="notice_boardName" value="${content_view.notice_boardName}">
							</c:if>
							<c:if test="${user != null && user.mf_role == 'USER'}">
								${content_view.notice_boardName}
							</c:if>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>
							<%-- ${content_view.notice_boardTitle} --%>
							<c:if test="${user != null && user.mf_role == 'ADMIN'}">
								<input type="text" name="notice_boardTitle" value="${content_view.notice_boardTitle}">
							</c:if>
							<c:if test="${user != null && user.mf_role == 'USER'}">
								${content_view.notice_boardTitle}
							</c:if>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<%-- ${content_view.notice_boardContent} --%>
							<c:if test="${user != null && user.mf_role == 'ADMIN'}">
								<input type="text" name="notice_boardContent" value="${content_view.notice_boardContent}">
							</c:if>
							<c:if test="${user != null && user.mf_role == 'USER'}">
								${content_view.notice_boardContent}
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<c:if test="${user != null && user.mf_role == 'ADMIN'}">
								<input type="submit" value="수정">
							</c:if>
							&nbsp;&nbsp;<input type="submit" value="목록보기" formaction="notice_list">
							<c:if test="${user != null && user.mf_role == 'ADMIN'}">
								&nbsp;&nbsp;<input type="submit" value="삭제" formaction="notice_delete">
							</c:if>
						</td>
					</tr>
				</form>
			</table>

			<!-- 댓글 출력 -->
			<div>
				<input type="text" id="commentWriter" placeholder="작성자">
				<input type="text" id="commentContent" placeholder="내용">
				<button onclick="commentWrite()">댓글작성</button>
			</div>

			<div id="comment-list">
				<table>
					<tr>
						<th>댓글번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>작성시간</th>
					</tr>
					<c:forEach items="${commentList}" var="comment">
						<tr>
							<td>${comment.notice_commentNo}</td>
							<td>${comment.notice_commentWriter}</td>
							<td>${comment.notice_commentContent}</td>
							<td>${comment.notice_commentCreatedTime}</td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</body>
		<script>
			const commentWrite = () => {
				const writer = document.getElementById("commentWriter").value;
				const content = document.getElementById("commentContent").value;
				const no = "${content_view.notice_boardNo}";

				$.ajax({
					type: "post"
					, data: {
						notice_commentWriter: writer
						, notice_commentContent: content
						, notice_boardNo: no
					}
					, url: "/notice_comment/notice_save"
					, success: function (commentList) {
						console.log("작성 성공");
						console.log(commentList);

						let output = "<table>";
						output += "<tr><th>댓글번호</th>";
						output += "<th>작성자</th>";
						output += "<th>내용</th>";
						output += "<th>작성시간</th></tr>";
						for (let i in commentList) {
							output += "<tr>";
							output += "<td>" + commentList[i].notice_commentNo + "</td>";
							output += "<td>" + commentList[i].notice_commentWriter + "</td>";
							output += "<td>" + commentList[i].notice_commentContent + "</td>";
							output += "<td>" + commentList[i].notice_commentCreatedTime + "</td>";
							output += "</tr>";
						}
						output += "</table>";
						console.log("@# output=>" + output);

						document.getElementById("comment-list").innerHTML = output;
					}
					, error: function () {
						console.log("실패");
					}
				});//end of ajax
			}//end of script
		</script>

		</html>