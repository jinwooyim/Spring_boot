<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
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
				width: 20px;
			}
		</style>
		<!-- 	<script src="../resources/js/jquery.js"></script> -->
		<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript">
			function fn_submit() {
				alert("01");
				var formData = $("#frm").serialize();//form 요소 자체
				alert("02");

				//비동기 전송방식의 jquery 함수
				$.ajax({
					type: "post"
					, data: formData
					, url: "write"
					, success: function (data) {
						alert("저장완료");
						location.href = "list";
					}
					, error: function () {
						alert("오류발생");
					}
				});
			}
		</script>
	</head>

	<body>
		<form id="frm">
			<table width="500" border="1">
				<!-- 		<form method="post" action="write"> -->
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="boardName" size="50">
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="boardTitle" size="50">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="10" name="boardContent"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 					<input type="submit" value="입력"> -->
						<!--						<input type="button" onclick="fn_submit()" value="입력">-->
						<button type="submit">입력</button>
						&nbsp;&nbsp;
						<a href="list">목록보기</a>
					</td>
				</tr>
			</table>

			File Attach
			<div class="uploadDiv">
				<input type="file" name="uploadFile" multiple>
			</div>

			<div class="uploadResult">
				<ul>

				</ul>
			</div>

		</form>
	</body>

	</html>
	<script>
		$(document).ready(function (e) {
			console.log("@# 01");

			$("button[type='submit']").on("click", function (e) {
				e.preventDefault();
				console.log("submit clicked");

				let uploadYn = false;
				var inputFile = $("input[name='uploadFile']");
				//files : 파일정보
				var files = inputFile[0].files;
				console.log("@# files.length=>", files.length);

				if (files.length > 0) {
					uploadYn = true;
				}
				console.log("@# uploadYn=>", uploadYn);

				var formData = $("#frm").serialize();//form 요소 자체
				console.log("@# formData=>" + formData);

				$.ajax({
					type: "post"
					, data: formData
					, url: "write"
					, statusCode: {
						403: function (result) {
							alert("Forbidden");
							console.log("@# result=>", result);
						},
						200: function (result) {
							console.log("@# result2=>", result);

							// 업로드할 파일이 있으면
							if (uploadYn) {
								// 폴더 업로드
								uploadFolder();
							} else {
								alert("Saved!");
								location.href = "list";
							}
						}
					}
				});//end of ajax
			});//end of button submit

			function uploadFolder() {
				console.log("@# uploadFolder");


				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				//files : 파일정보
				var files = inputFile[0].files;

				for (var i = 0; i < files.length; i++) {
					console.log("@# files=>" + files[i].name);

					//파일 정보를 formData에 추가
					formData.append("uploadFile", files[i]);
				}

				$.ajax({
					type: "post"
					, data: formData
					, url: "uploadFolder"
					//processData : 기본은 key/value 를 Query String 으로 전송하는게 true
					//(파일 업로드는 false)
					, processData: false
					//contentType : 기본값 : "application / x-www-form-urlencoded; charset = UTF-8"
					//첨부파일은 false : multipart/form-data로 전송됨
					, contentType: false
					, success: function (result) {
						alert("Uploaded");
						console.log("@# Uploaded result=>", result);
						location.href = "list";
					}
					, error: function () {
						alert("failed");
					}
				});//end of ajax

			}// end of uploadFolder

			//확장자가 exe|sh|alz 업로드 금지하기 위한 정규식
			var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
			// 파일크기(5MB 미만) 조건
			var maxSize = 5242880;//5MB

			function checkExtension(fileName, fileSize) {
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}

			$("input[type='file']").change(function (e) {
				console.log("@# files=>", this.files);
				console.log("@# length=>", this.files.length);

				// 파일 있는 상태에서 재선택할때 남아있는 버그 해결
				var uploadUL = $(".uploadResult ul");
				uploadUL.empty();

				var formData = new FormData();
				var files = this.files;

				for (var i = 0; i < files.length; i++) {
					console.log("@# files=>" + files[i].name);
					console.log("@# files=>" + files[i].size);

					//파일크기와 종류중에서 거짓이면 리턴
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}

					//파일 정보를 formData에 추가
					formData.append("uploadFile", files[i]);
				}//end of for

				$.ajax({
					type: "post"
					, data: formData
					, url: "uploadAjaxAction"
					//processData : 기본은 key/value 를 Query String 으로 전송하는게 true
					//(파일 업로드는 false)
					, processData: false
					//contentType : 기본값 : "application / x-www-form-urlencoded; charset = UTF-8"
					//첨부파일은 false : multipart/form-data로 전송됨
					, contentType: false
					, success: function (result) {
						console.log(result);
						//파일정보들을 함수로 보냄
						showUploadResult(result);//업로드 결과 처리 함수
					}
				});//end of ajax

				function showUploadResult(uploadResultArr) {
					console.log("@# uploadResultArr=>" + uploadResultArr);
					console.log("@# uploadFile=>" + uploadResultArr.uploadFile);

					if (!uploadResultArr || uploadResultArr.length == 0) {
						return;
					}

					var uploadUL = $(".uploadResult ul");
					var str = "";

					$(uploadResultArr).each(function (i, obj) {
						console.log("@# i=>" + i);
						console.log("@# obj=>" + obj);

						// 삭제 버튼 제거=>x로 삭제후 입력으로 저장시 파일이 남아있어서 저장되는 버그
						//image type
						if (obj.image) {
							console.log("@# obj.uploadPath=>" + obj.uploadPath);
							console.log("@# obj.uuid=>" + obj.uuid);
							console.log("@# obj.fileName=>" + obj.fileName);

							//FileReader() : 파일리더객체는 파일객체로부터 바이너리를 읽어올 수 있는 객체
							reader = new FileReader();
							//파일 객체로부터 DATA-URL 형태로 바이너리를 읽어온다.
							reader.readAsDataURL(files[i]);

							//파일 리더가 파일을 다 읽으면 이후 내용을 함수의 기능으로 넣어준다.
							reader.onload = function (e) {
								console.log("@# e.target.result=>" + e.target.result);
								$(".uploadResult ul").append("<li><div>"
									+ "<span>" + obj.fileName + "</span>"
									+ "<img src='"
									+ e.target.result + "'>"
									+ "</div></li>");
							}
						}
						else {
							str += "<li><div>";
							str += "<span>" + obj.fileName + "</span>";
							str += "<img src='./resources/img/attach.png'>";
							str += "</div></li>";
						}
					});//end of each
					//div class 에 파일 목록 추가
					uploadUL.append(str);
				}//end of showUploadResult
			});//end of change
		});//end of ready
	</script>