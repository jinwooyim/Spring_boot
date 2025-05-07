<%@page import="com.lgy.TeamProject.dto.TeamDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
TeamDTO user = (TeamDTO) session.getAttribute("user");
%>
<%-- <%=user%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/index.css"   rel="stylesheet"><!-- 실행 -->
<link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet"><!-- 사이드바 -->
<link href="${pageContext.request.contextPath}/resources/css/content_main.css" rel="stylesheet"><!-- 메인 -->
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet"><!-- 헤더 -->
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet"><!-- 푸터 -->
<link href="${pageContext.request.contextPath}/resources/css/login.css"   rel="stylesheet"><!-- 로그인 -->
<link href="${pageContext.request.contextPath}/resources/css/recruit.css" rel="stylesheet"><!-- 회원가입 -->
<link href="${pageContext.request.contextPath}/resources/css/profile.css" rel="stylesheet"><!-- 마이페이지 -->
<link href="${pageContext.request.contextPath}/resources/css/recipe.css" rel="stylesheet"><!-- 레시피 -->
<link href="${pageContext.request.contextPath}/resources/css/recipe_write.css" rel="stylesheet"><!-- 레시피 작성 -->
<link href="${pageContext.request.contextPath}/resources/css/list.css" rel="stylesheet"><!-- 레시피 리스트 -->
<link href="${pageContext.request.contextPath}/resources/css/content_view.css" rel="stylesheet"><!-- 레시피 리스트 -->
<link href="${pageContext.request.contextPath}/resources/css/modify_board_write.css" rel="stylesheet"><!-- 자유게시판 작성 -->
<link   href="${pageContext.request.contextPath}/resources/css/write_view.css" rel="stylesheet"><!-- 자유게시판 작성 -->
<link href="${pageContext.request.contextPath}/resources/css/recipe_view.css" rel="stylesheet"><!-- 자유게시판 작성 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.17/jquery.bxslider.min.css"   rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.17/jquery.bxslider.min.js"></script>
<script type="text/javascript">
    var isLoggedIn = <%=(user != null) ? "true" : "false"%>;
<!-- 여기 글쓰기 버튼 입니다. 아래 script에 넣으면 작동 x -->
   function insert_board_write() {
       const form = document.getElementById("insert_board_write");

       if (!form.checkValidity()) {
           form.reportValidity();  // 유효성 검사
           return;
       }

       const formData = $("#insert_board_write").serialize();

       $.ajax({
           type: "post",
           data: formData,
           url: "board/insert_board_write",
           success: function(data) {
               $(".content").html(data);
           },
           error: function() {
               alert("오류 발생");
           }
       });
      $("html, body").animate({ scrollTop: 0 }, 0);
   }
<!-- 여기 글쓰기 버튼 입니다. 아래 script에 넣으면 작동 x (여기까지 글쓰기 버튼 script -->
   <!-- content_view에서 가져왔습니다.  -->
   $(document).on("click", "#return_list", function () {
        if (isLoggedIn) {
          $(".content").load("${pageContext.request.contextPath}/board/list", function(response, status, xhr) {
                  if (status === "error") {
                     alert("자유게시판 로딩 중 오류가 발생했습니다: " + xhr.status);
                  } else {
                     console.log("마이페이지 페이지 로딩 완료");
                  }
          });
      } else {
             alert("로그인 후 이용가능합니다.");
      }
      $("html, body").animate({ scrollTop: 0 }, 0);
   });
   
   function modify_board_write() {
       const form = document.getElementById("modify");
   
       // 유효성 검사 실행
       if (!form.checkValidity()) {
           form.reportValidity();  // 브라우저 기본 경고창 띄움
           return;  // 중단
       }
       const formData = $("#modify").serialize();
   
       $.ajax({
           type: "post",
           data: formData,
           url: "board/modify_board_write",
           success: function(data) {
               $("#board_body").html(data, function(response, status, xhr) {
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
   };
   
   function delete_board_write() {
       const form = document.getElementById("modify");
   
       // 유효성 검사 실행
       if (!form.checkValidity()) {
           form.reportValidity();  // 브라우저 기본 경고창 띄움
           return;  // 중단
       }
       const formData = $("#modify").serialize();
   
       $.ajax({
           type: "post",
           data: formData,
           url: "board/delete_board_write",
           success: function(data) {
               $(".content").html(data);
           },
           error: function() {
               alert("오류 발생");
           }
       });
   };
   
   
   <!-- content_view에서 가져왔습니다.(여기까지)  -->
   

   // 클릭
   $(document).ready(function () {
      $("html, body").animate({ scrollTop: 0 }, 0);
      // 로그인 버튼 클릭 시 login.jsp를 content 영역에 로드
      $(document).on("click", ".btn_login, .recruit_cancel", function () {
         $(".content").load("${pageContext.request.contextPath}/member/login", function(response, status, xhr) {
            if (status === "error") {
               alert("로그인 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
            } else {
               console.log("로그인 페이지 로딩 완료");
            }
         });
      });
      
      
      
      //회원가입
      $(document).on("click", ".btn_register, #login_recruit", function () {
         $("html, body").animate({ scrollTop: 0 }, 0);
         $(".content").load("${pageContext.request.contextPath}/member/recruit", function(response, status, xhr) {
            if (status === "error") {
               alert("회원가입 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
            } else {
               console.log("회원가입 페이지 로딩 완료");
               initValidation();
            }
         });
      });
      
      // 홈
      $(document).on("click", ".header_logo, .logo, #home, .btn_cancel", function () {
         $("html, body").animate({ scrollTop: 0 }, 0);
         $(".content").load("${pageContext.request.contextPath}/front/content_main", function(response, status, xhr) {
            if (status === "error") {
               alert("홈 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
            } else {
               console.log("홈 페이지 로딩 완료");
            }
         });
      });
      

//       $(document).on("click", ".profile", function () {
//          $("html, body").animate({ scrollTop: 0 }, 0);
//          if (isLoggedIn) {
//             $(".content").load("${pageContext.request.contextPath}/member/profile?mf_id=${mf_id}", function(response, status, xhr) {
//                if (status === "error") {
//                   alert("로그인 후 이용하실 수 있습니다.");
//                   $(".content").load("${pageContext.request.contextPath}/member/login", function(response, status, xhr) {
//                       if (status === "error") {
//                          alert("로그인 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
//                       } else {
//                          console.log("로그인 페이지 로딩 완료");
//                       }
//                    });
//                } else {
//                   console.log("마이페이지 페이지 로딩 완료");
//                }
//             });
//            } else {
//                alert("로그인 후 이용가능합니다.");
//          }
//       });
      
      // 마이페이지의 카테고리
      $(document).on("click", ".tab_btn", function () {
           const tabId = $(this).data("tab");

           // 1. 모든 탭 버튼의 active 제거
           $(".tab_btn").removeClass("active");
           $(this).addClass("active");

           // 2. 모든 탭 콘텐츠 숨기기
           $(".tab_content").removeClass("active");

           // 계정설정
           if (tabId === "account_settings") {
               $("#" + tabId).addClass("active");
           }
           
           // 내 레시피
           if (tabId === "my_recipes") {
               $("#" + tabId).addClass("active");
           }
           
           // 저장한 레시피
           if (tabId === "saved_recipes") {
               $("#" + tabId).addClass("active");
           }
               
           // 좋아요한 레시피
           if (tabId === "liked_recipes") {
               $("#" + tabId).addClass("active");
           }
               
           // 닉네임
           if (tabId === "nickname_settings") {
               $("#" + tabId).addClass("active");
           }
       });
      
      // 자유게시판
      $(document).on("click", ".board", function () {
         $("html, body").animate({ scrollTop: 0 }, 0);
         if (isLoggedIn) {
            $(".content").load("${pageContext.request.contextPath}/board/list", function(response, status, xhr) {
                  if (status === "error") {
                     alert("자유게시판 로딩 중 오류가 발생했습니다: " + xhr.status);
                  } else {
                     console.log("마이페이지 페이지 로딩 완료");
                  }
            });
      } else {
               alert("로그인 후 이용가능합니다.");
      }
      });
      
      // 레시피 추가
      $(document).on("click", ".add_recipe_btn", function () {
         $("html, body").animate({ scrollTop: 0 }, 0);
         $(".content").load("${pageContext.request.contextPath}/front/recipe_write", function(response, status, xhr) {
            if (status === "error") {
               alert("레시피 추가 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
            } else {
               console.log("레시피 추가 페이지 로딩 완료");
            }
         });
      });
      
      // 자유게시판 - 글쓰기버튼
      $(document).on("click", ".write_btn", function () {
         $("html, body").animate({ scrollTop: 0 }, 0);
         $(".content").load("${pageContext.request.contextPath}/board/write_view", function(response, status, xhr) {
            if (status === "error") {
               alert("레시피 추가 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
            } else {
               console.log("레시피 추가 페이지 로딩 완료");
            }
         });
      });
      
        function insert_board_write() {
          const form = document.getElementById("insert_board_write");
   
          if (!form.checkValidity()) {
              form.reportValidity();
              return;
          }
   
          const formData = $("#insert_board_write").serialize();
   
          $.ajax({
              type: "post",
              data: formData,
              url: "board/insert_board_write",
              success: function (data) {
                  $(".content").html(data);
                  $("html, body").animate({ scrollTop: 0 }, 0);
              },
              error: function () {
                  alert("오류 발생");
              }
          });
      }

      // 사이드바 토글
      $(document).on("click","#sidebar_toggle", function () {
         $("#sidebar").toggleClass("hidden");
         $(".main_wrapper").toggleClass("sidebar_hidden");
         $("#sidebar_toggle").toggleClass("sidebar_hidden");
      });

      // page up
      $(document).on("click","#page_up", function () {
         $("html, body").animate({scrollTop: 0}, 500);
      });

      // 분류 드롭다운
      $(document).on("click", ".dropdown_toggle", function () {
         const d = $(".dropdown_menu").css("display");
         if (d === "none"){
            $(".dropdown_menu").css({"display":"block"});
            $("#i_toggle").removeClass("fa-chevron-down").addClass("fa-chevron-up");
         } else {
           $(".dropdown_menu").css({ "display": "none" });
           $("#i_toggle").removeClass("fa-chevron-up").addClass("fa-chevron-down");
      }
      });

      //드롭다운 분류 바로가기
      //한식
      $(document).on("click",".korean", function () {
         let top = $(".category_section_korean").offset().top;
         $("html, body").animate({ scrollTop: top }, 500);
      });
//       $(document).on("click", ".korean", function () {
//            let target = $(".category_section_korean");
//            if (target.length) {
//                let top = target.offset().top;
//                $("html, body").animate({ scrollTop: top }, 500);
//            } else {
//                console.warn("카테고리 섹션을 찾을 수 없습니다.");
//            }

//            if ($(".content").attr("id") != "home") {
//                $(".content").load("${pageContext.request.contextPath}/front/content_main", function(response, status, xhr) {
//                    if (status === "error") {
//                        alert("홈 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
//                    } else {
//                        console.log("홈 페이지 로딩 완료");
//                      let top = $(".category_section_korean").offset().top
//                       $("html, body").animate({ scrollTop: top }, 0);
//                    }
//                });
//            }
//        });

      //양식
      $(document).on("click",".western", function () {
         let top = $(".category_section_western").offset().top;
         $("html, body").animate({ scrollTop: top }, 500);
      });
//       $(document).on("click", ".western", function () {
//          let target = $(".category_section_western");
//          if (target.length) {
//              let top = target.offset().top;
//              $("html, body").animate({ scrollTop: top }, 500);
//          } else {
//              console.warn("카테고리 섹션을 찾을 수 없습니다.");
//          }

//          if ($(".content").attr("id") != "home") {
//              $(".content").load("${pageContext.request.contextPath}/front/content_main", function(response, status, xhr) {
//                  if (status === "error") {
//                      alert("홈 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
//                  } else {
//                      console.log("홈 페이지 로딩 완료");
//                      let top = $(".category_section_western").offset().top
//                       $("html, body").animate({ scrollTop: top }, 0);
//                  }
//              });
//          }
//      });
      //일식
      $(document).on("click",".japanese", function () {
         let top = $(".category_section_japanese").offset().top;
         $("html, body").animate({ scrollTop: top }, 500);
      });
//       $(document).on("click", ".japanese", function () {
//            let target = $(".category_section_japanese");
//            if (target.length) {
//                let top = target.offset().top;
//                $("html, body").animate({ scrollTop: top }, 500);
//            } else {
//                console.warn("카테고리 섹션을 찾을 수 없습니다.");
//            }

//            if ($(".content").attr("id") != "home") {
//                $(".content").load("${pageContext.request.contextPath}/front/content_main", function(response, status, xhr) {
//                    if (status === "error") {
//                        alert("홈 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
//                    } else {
//                        console.log("홈 페이지 로딩 완료");
//                        let top = $(".category_section_japanese").offset().top
//                         $("html, body").animate({ scrollTop: top }, 0);
//                    }
//                });
//            }
//        });
      //중식
      $(document).on("click",".chinese", function () {
         let top = $(".category_section_chinese").offset().top;
         $("html, body").animate({ scrollTop: top }, 500);
      });
//       $(document).on("click", ".chinese", function () {
//            let target = $(".category_section_chinese");
//            if (target.length) {
//                let top = target.offset().top;
//                $("html, body").animate({ scrollTop: top }, 500);
//            } else {
//                console.warn("카테고리 섹션을 찾을 수 없습니다.");
//            }

//            if ($(".content").attr("id") != "home") {
//                $(".content").load("${pageContext.request.contextPath}/front/content_main", function(response, status, xhr) {
//                    if (status === "error") {
//                        alert("홈 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
//                    } else {
//                        console.log("홈 페이지 로딩 완료");
//                        let top = $(".category_section_chinese").offset().top
//                         $("html, body").animate({ scrollTop: top }, 0);
//                    }
//                });
//            }
//        });
      //디저트
      $(document).on("click",".dessert", function () {
         let top = $(".category_section_dessert").offset().top;
         $("html, body").animate({ scrollTop: top }, 500);
      });
//       $(document).on("click", ".dessert", function () {
//            let target = $(".category_section_dessert");
//            if (target.length) {
//                let top = target.offset().top;
//                $("html, body").animate({ scrollTop: top }, 500);
//            } else {
//                console.warn("카테고리 섹션을 찾을 수 없습니다.");
//            }

//            if ($(".content").attr("id") != "home") {
//                $(".content").load("${pageContext.request.contextPath}/front/content_main", function(response, status, xhr) {
//                    if (status === "error") {
//                        alert("홈 페이지 로딩 중 오류가 발생했습니다: " + xhr.status);
//                    } else {
//                        console.log("홈 페이지 로딩 완료");
//                        let top = $(".category_section_dessert").offset().top
//                         $("html, body").animate({ scrollTop: top }, 0);
//                    }
//                });
//            }
//        });
      
      // 아이디 중복체크
      $(document).on("click",".btn_check",function () {
          const mf_id = $("#mf_id").val();

          // 빈값 검사
          if (!mf_id) {
              alert("아이디를 입력하세요.");
              return;
          }

          // 클라이언트 유효성 검사
          const idPattern = /^[a-zA-Z0-9]{4,12}$/;
          if (!idPattern.test(mf_id)) {
              alert("아이디는 4~12자의 영문 대/소문자 또는 숫자만 가능합니다.");
              return;
          }

          $.ajax({
              type: "post",
              url: "member/mf_id_check",  // 아이디 중복 체크를 처리할 서버 경로
              data: { mf_id: mf_id },
              success: function(response) {
                  if (response === "available") {
                      alert("사용 가능한 아이디입니다.");
                      $("#mf_id").prop("readonly", true);
                      $("button[onclick='check_id()']").prop("disabled", true).text("중복체크 완료");
                  } else if (response === "unavailable") {
                      alert("이미 사용 중인 아이디입니다.");
                  } else {
                      alert("확인 중 오류가 발생했습니다.");
                  }
              },
              error: function() {
                  alert("서버 요청 중 오류가 발생했습니다.");
              }
          });
      });
      
      //비번 보이게하기
      $(document).on("click","#togglePassword", function () {
              $("#mf_pw").attr("type", $("#mf_pw").attr("type") === "password" ? "text" : "password");
              $("#new_password").attr("type", $("#new_password").attr("type") === "password" ? "text" : "password");
           });
      $(document).on("click","#togglePwChk", function () {
              $("#mf_pw_chk").attr("type", $("#mf_pw_chk").attr("type") === "password" ? "text" : "password");
              $("#confirm_password").attr("type", $("#confirm_password").attr("type") === "password" ? "text" : "password");
           });
      $(document).on("click","#togglePw", function () {
              $("#current_password").attr("type", $("#current_password").attr("type") === "password" ? "text" : "password");
           });
   });
      
   //----------------------------------------
     
      
        
      function checkPasswordMatch() {
          document.getElementById("mf_pw").addEventListener("input", checkPasswordMatch);
          document.getElementById("mf_pw_chk").addEventListener("input", checkPasswordMatch);
          
          const pw = document.getElementById("mf_pw").value;
          const pwChk = document.getElementById("mf_pw_chk").value;
          const msg = document.getElementById("pw_match_msg");

          if (pwChk.length === 0) {
              msg.textContent = "";
              return;
          }
      
          if ((pw === pwChk)) {
              msg.textContent = "비밀번호가 일치합니다.";
              msg.style.color = "green";
          } else {
              msg.textContent = "비밀번호가 일치하지 않습니다.";
              msg.style.color = "red";
          }
      }
      
      function new_checkPasswordMatch() {
          document.getElementById("new_password").addEventListener("input", checkPasswordMatch);
          document.getElementById("confirm_password").addEventListener("input", checkPasswordMatch);
          
          const pw = document.getElementById("new_password").value;
          const pwChk = document.getElementById("confirm_password").value;
          const msg = document.getElementById("pw_match_msg");

          if (pwChk.length === 0) {
              msg.textContent = "";
              return;
          }
      
          if ((pw === pwChk)) {
              msg.textContent = "비밀번호가 일치합니다.";
              msg.style.color = "green";
          } else {
              msg.textContent = "비밀번호가 일치하지 않습니다.";
              msg.style.color = "red";
          }
      }
   
      
      //-------------------------------------------
      
</script>
</head>
<body>
   <div class="container">
      <!-- sidebar -->
      <jsp:include page="sidebar.jsp" />

      <div class="main_wrapper" id="main_wrapper">
         <!-- header -->
         <jsp:include page="header.jsp" />

         <!-- content -->
         <div class="content" id="content">
            <jsp:include page="../front/content_main.jsp" />
<%--             <jsp:include page="../recipe/recipe_view.jsp" /> --%>
         </div>

         <!-- footer -->
         <jsp:include page="footer.jsp" />
      </div>
   </div>
</body>
</html>