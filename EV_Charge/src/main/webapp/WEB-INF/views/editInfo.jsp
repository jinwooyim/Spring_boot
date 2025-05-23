<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정 | EV충전소</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/region.js"></script>
    <style>
        :root {
            --primary-color: #10b981;
            --primary-dark: #059669;
            --primary-light: #d1fae5;
            --text-color: #1f2937;
            --text-light: #6b7280;
            --white: #ffffff;
            --gray-50: #f9fafb;
            --gray-100: #f3f4f6;
            --gray-200: #e5e7eb;
            --gray-300: #d1d5db;
            --gray-400: #9ca3af;
            --gray-500: #6b7280;
            --gray-600: #4b5563;
            --gray-700: #374151;
            --gray-800: #1f2937;
            --gray-900: #111827;
            --red-500: #ef4444;
            --red-600: #dc2626;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            color: var(--text-color);
            background-color: var(--gray-50);
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }
        
        .container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        
        .page-header {
            margin-bottom: 2rem;
            text-align: center;
        }
        
        .page-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--gray-800);
            margin-bottom: 0.5rem;
        }
        
        .page-subtitle {
            font-size: 1rem;
            color: var(--gray-600);
        }
        
        .card {
            background-color: var(--white);
            border-radius: 1rem;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.01);
            overflow: hidden;
            border: 1px solid var(--gray-200);
        }
        
        .card-header {
            padding: 1.5rem 2rem;
            border-bottom: 1px solid var(--gray-200);
            background-color: var(--white);
        }
        
        .card-header h2 {
            margin: 0;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--gray-800);
            display: flex;
            align-items: center;
        }
        
        .card-header h2 i {
            margin-right: 0.75rem;
            color: var(--primary-color);
        }
        
        .card-body {
            padding: 2rem;
        }
        
        .form-group {
            margin-bottom: 1.75rem;
        }
        
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--gray-700);
            font-size: 0.9rem;
        }
        
        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--gray-300);
            border-radius: 0.5rem;
            font-family: inherit;
            font-size: 1rem;
            transition: all 0.2s ease;
            color: var(--gray-800);
            background-color: var(--white);
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px var(--primary-light);
        }
        
        .form-control[readonly] {
            background-color: var(--gray-100);
            cursor: not-allowed;
            color: var(--gray-600);
        }
        
        .form-text {
            margin-top: 0.5rem;
            font-size: 0.8rem;
            display: flex;
            align-items: center;
        }
        
        .form-text i {
            margin-right: 0.25rem;
        }
        
        .form-text.text-success {
            color: var(--primary-color);
        }
        
        .form-text.text-danger {
            color: var(--red-500);
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            text-decoration: none;
            border: none;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
        }
        
        .btn i {
            margin-right: 0.5rem;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }
        
        .btn-primary:hover {
            background-color: var(--primary-dark);
            transform: translateY(-1px);
        }
        
        .btn-secondary {
            background-color: var(--white);
            color: var(--gray-700);
            border: 1px solid var(--gray-300);
        }
        
        .btn-secondary:hover {
            background-color: var(--gray-100);
            color: var(--gray-800);
            transform: translateY(-1px);
        }
        
        .btn-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.75rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            padding-right: 2.5rem;
        }
        
        .form-section {
            margin-bottom: 2rem;
            padding-bottom: 2rem;
            border-bottom: 1px solid var(--gray-200);
        }
        
        .form-section:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }
        
        .form-section-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--gray-800);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }
        
        .form-section-title i {
            margin-right: 0.5rem;
            color: var(--primary-color);
        }
        
        .form-row {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1rem;
        }
        
        @media (min-width: 640px) {
            .form-row {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        .form-hint {
            font-size: 0.8rem;
            color: var(--gray-500);
            margin-top: 0.25rem;
        }
        
        .password-strength {
            height: 4px;
            background-color: var(--gray-200);
            border-radius: 2px;
            margin-top: 0.5rem;
            overflow: hidden;
        }
        
        .password-strength-bar {
            height: 100%;
            width: 0;
            transition: width 0.3s ease;
            border-radius: 2px;
        }
        
        .strength-weak {
            width: 33%;
            background-color: var(--red-500);
        }
        
        .strength-medium {
            width: 66%;
            background-color: #f59e0b;
        }
        
        .strength-strong {
            width: 100%;
            background-color: var(--primary-color);
        }
      
      .form-group {
            margin-bottom: 1.75rem;
        }
        
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--gray-700);
            font-size: 0.9rem;
        }
      
      .select-group {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 0.75rem;
            margin-bottom: 1rem;
        }
        
        .select-group select {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid var(--gray-300);
            border-radius: 0.5rem;
            font-family: inherit;
            font-size: 1rem;
            transition: all 0.2s ease;
            color: var(--gray-800);
            background-color: var(--white);
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.75rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            padding-right: 2.5rem;
        }
        
        .select-group select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px var(--primary-light);
        }
        
        /* 애니메이션 효과 */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .fade-in {
            animation: fadeIn 0.3s ease-out forwards;
        }
        
        /* 반응형 디자인 */
        @media (max-width: 640px) {
            .card-header, .card-body {
                padding: 1.5rem;
            }
            
            .btn-group {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/header.jsp" />
    
    <div class="container">
        <div class="page-header">
            <h1 class="page-title">회원정보 수정</h1>
            <p class="page-subtitle">개인정보와 지역 설정을 업데이트하세요</p>
        </div>
        
        <div class="card fade-in">
            <div class="card-header">
                <h2><i class="fas fa-user-edit"></i> 내 정보 수정</h2>
            </div>
            <div class="card-body">
                <form action="updateMember" method="post" onsubmit="return validateForm();">
                    <input type="hidden" name="user_no" value="${memberDTO.user_no}" />
                    
                    <div class="form-section">
                        <h3 class="form-section-title"><i class="fas fa-id-card"></i> 기본 정보</h3>
                        
                        <div class="form-group">
                            <label for="user_id" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="user_id" name="user_id" value="${memberDTO.user_id}" readonly>
                            <div class="form-hint">아이디는 변경할 수 없습니다.</div>
                        </div>
                        
                        <div class="form-group">
                            <label for="user_name" class="form-label">이름</label>
                            <input type="text" class="form-control" id="user_name" name="user_name" value="${memberDTO.user_name}">
                        </div>
                        
                        <div class="form-group">
                            <label for="user_email" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="user_email" name="user_email" value="${memberDTO.user_email}">
                            <div class="form-hint">알림 및 공지사항을 받을 이메일 주소를 입력하세요.</div>
                        </div>
                    </div>
                    
                    <div class="form-section">
                        <h3 class="form-section-title"><i class="fas fa-lock"></i> 비밀번호 변경</h3>
                        
                        <div class="form-group">
                            <label for="user_password" class="form-label">새 비밀번호</label>
                            <input type="password" class="form-control" id="user_password" name="user_password" placeholder="새 비밀번호를 입력하세요">
                            <div class="password-strength">
                                <div id="password-strength-bar" class="password-strength-bar"></div>
                            </div>
                            <div class="form-hint">6자 이상의 안전한 비밀번호를 사용하세요.</div>
                        </div>
                        
                        <div class="form-group">
                            <label for="user_password_check" class="form-label">비밀번호 확인</label>
                            <input type="password" class="form-control" id="user_password_check" placeholder="비밀번호를 다시 입력하세요">
                            <div id="pw_match_msg" class="form-text"></div>
                        </div>
                    </div>
                    
                    <div class="form-section">
                        <h3 class="form-section-title"><i class="fas fa-map-marker-alt"></i> 지역 설정</h3>
                        <p class="form-hint" style="margin-bottom: 1rem;">주요 활동 지역을 설정하면 해당 지역의 충전소 정보를 우선적으로 제공받을 수 있습니다.</p>
                        
                        <div class="form-group">
                            <label class="form-label">지역 선택</label>
                            <div class="select-group">
                                <div>
                                    <select id="register_area_ctpy_nm" name="area_ctpy_nm" onchange="updateRegisterAreaSggNm()">
                                        <option value="">시/도</option>
                                    </select>
                                </div>
                                <div>
                                    <select id="register_area_sgg_nm" name="area_sgg_nm" onchange="updatearea_emd_nm_register()">
                                        <option value="">군/구</option>
                                    </select>
                                </div>
                                <div>
                                    <select id="register_area_emd_nm" name="area_emd_nm">
                                        <option value="">읍/면/동</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="btn-group">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> 정보 저장하기
                        </button>
                        <a href="mypage" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i> 마이페이지로 돌아가기
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
             // 읍/면/동 옵션 업데이트 함수
              function updatearea_emd_nm_register() {
                const area_ctpy_nm = document.getElementById("register_area_ctpy_nm").value;
                const area_sgg_nm = document.getElementById("register_area_sgg_nm").value;
                const area_emd_nmSelect = document.getElementById("register_area_emd_nm");

                // 읍/면/동 초기화
                area_emd_nmSelect.innerHTML = '<option value="">읍/면/동</option>';

                if (area_ctpy_nm && area_sgg_nm && regions[area_ctpy_nm] && regions[area_ctpy_nm][area_sgg_nm]) {
                const area_emd_nms = regions[area_ctpy_nm][area_sgg_nm];
                area_emd_nms.forEach(area_emd_nm => {
                const option = document.createElement("option");
                option.value = area_emd_nm;
                option.text = area_emd_nm;
                area_emd_nmSelect.appendChild(option);
                });
                }
                }
    </script>
    
    <script>
        $(document).ready(function () {
            $.ajax({
                     type: "get",
                     url: "/provinces_list", // ProvincesController에 정의된 엔드포인트
                     success: function(data) {
                         console.log("시/도 데이터 가져왔음");
                         var area_ctpy_nmSelect = $("#register_area_ctpy_nm");
                         // 기본 옵션
                         area_ctpy_nmSelect.html('<option value="">시/도</option>');
                         
                         // 받아온 데이터로 옵션 추가 (코드를 value로, 이름을 텍스트로)
                         $.each(data, function(index, province) {
                             area_ctpy_nmSelect.append($('<option>', {
                                 value: province.provinces_code, // 시/도 코드를 value로
                                 text: province.provinces_name   // 시/도 이름을 텍스트로
                             }));
                         });
                         
                         // 시/도 선택 시 이벤트 리스너 추가
                         area_ctpy_nmSelect.on("change", function() {
                             var selectedProvinceCode = $(this).val();
                             if(selectedProvinceCode) {
                                 // 선택된 시/도 코드가 있으면 함수 실행
                                 updateRegisterAreaSggNm(selectedProvinceCode);
                             } else {
                                 // 선택이 취소되면 시/군/구 드롭다운 초기화
                                 $("#register_area_sgg_nm").html('<option value="">군/구</option>');
                                 $("#register_area_emd_nm").html('<option value="">읍/면/동</option>');
                             }
                         });
                         
                         // 모바일 버전도 동일하게 적용
                         // var area_ctpy_nm_mobileSelect = $("#area_ctpy_nm_mobile");
                         // area_ctpy_nm_mobileSelect.html('<option value="">시/도 선택</option>');
                         
                         // $.each(data, function(index, province) {
                         //     area_ctpy_nm_mobileSelect.append($('<option>', {
                         //         value: province.provinces_code,
                         //         text: province.provinces_name
                         //     }));
                         // });
                         
                         // // 모바일 버전 시/도 선택 시 이벤트 리스너 추가
                         // area_ctpy_nm_mobileSelect.on("change", function() {
                         //     var selectedProvinceCode = $(this).val();
                         //     if(selectedProvinceCode) {
                         //         // 선택된 시/도 코드가 있으면 함수 실행
                         //         updatearea_sgg_nm_mobile(selectedProvinceCode);
                         //     } else {
                         //         // 선택이 취소되면 시/군/구 드롭다운 초기화
                         //         $("#area_sgg_nm_mobile").html('<option value="">군/구 선택</option>');
                         //         $("#area_emd_nm_mobile").html('<option value="">읍/면/동 선택</option>');
                         //     }
                         // });
                     },
                     error: function(xhr, status, error) {
                         console.error("시/도 데이터를 가져오는 중 오류가 발생했습니다:", error);
                     }
                 });
                 // });

                 // 시/도 선택 시 해당 시/군/구 데이터 가져오기
                 function updateRegisterAreaSggNm(provinces_code) {
                     console.log("시/도 선택해서 시/군/구 가야한다.(1)");
                     var area_sgg_nmSelect = $("#register_area_sgg_nm");
                     var area_emd_nmSelect = $("#register_area_emd_nm");

                     // 시/군/구와 읍/면/동 초기화
                     area_sgg_nmSelect.html('<option value="">군/구</option>');
                     area_emd_nmSelect.html('<option value="">읍/면/동</option>');

                     if (!provinces_code) {
                         return;
                     }

                     // 서버에서 시/군/구 데이터 가져오기
                     $.ajax({
                         type: "get",
                         url: "/districts_list",
                         data: { provinces_code: provinces_code },
                         success: function(data) {
                             console.log("시/도 선택해서 시/군/구 가야한다.(2)");
                             // 받아온 데이터로 옵션 추가 (코드를 value로, 이름을 텍스트로)
                             $.each(data, function(index, district) {
                                 // "미분류" 항목은 제외
                                 if (district.districts_name !== "미분류") {
                                     area_sgg_nmSelect.append($('<option>', {
                                         value: district.districts_code, // 시/군/구 코드를 value로
                                         text: district.districts_name   // 시/군/구 이름을 텍스트로
                                     }));
                                 }
                             });
                         },
                         error: function(xhr, status, error) {
                             console.error("시/군/구 데이터를 가져오는 중 오류가 발생했습니다:", error);
                         }
                     });
                 }
            // 비밀번호 일치 검사
            $("#user_password, #user_password_check").on("input", function () {
                var pw = $("#user_password").val();
                var pw_check = $("#user_password_check").val();
                var msg = $("#pw_match_msg");

                if (pw_check.length === 0) {
                    msg.text("").removeClass("text-success text-danger");
                    return;
                }

                if (pw === pw_check) {
                    msg.html('<i class="fas fa-check-circle"></i> 비밀번호가 일치합니다.').removeClass("text-danger").addClass("text-success");
                } else {
                    msg.html('<i class="fas fa-times-circle"></i> 비밀번호가 일치하지 않습니다.').removeClass("text-success").addClass("text-danger");
                }
            });
            
            // 비밀번호 강도 체크
            $("#user_password").on("input", function() {
                var password = $(this).val();
                var strengthBar = $("#password-strength-bar");
                
                // 비밀번호 강도 측정
                var strength = 0;
                
                // 길이 체크
                if (password.length >= 6) strength += 1;
                if (password.length >= 10) strength += 1;
                
                // 문자 조합 체크
                if (/[A-Z]/.test(password)) strength += 1;
                if (/[a-z]/.test(password)) strength += 1;
                if (/[0-9]/.test(password)) strength += 1;
                if (/[^A-Za-z0-9]/.test(password)) strength += 1;
                
                // 강도에 따른 시각적 표시
                strengthBar.removeClass("strength-weak strength-medium strength-strong");
                
                if (password.length === 0) {
                    strengthBar.css("width", "0");
                } else if (strength < 3) {
                    strengthBar.addClass("strength-weak");
                } else if (strength < 5) {
                    strengthBar.addClass("strength-medium");
                } else {
                    strengthBar.addClass("strength-strong");
                }
            });
        });
        
        function validateForm() {
            var password = document.getElementById("user_password").value.trim();
            var passwordCheck = document.getElementById("user_password_check").value.trim();
            var name = document.getElementById("user_name").value.trim();
            var email = document.getElementById("user_email").value.trim();
            var province = document.getElementById("register_area_ctpy_nm").value.trim();
            var city = document.getElementById("register_area_sgg_nm").value.trim();
            var town = document.getElementById("register_area_emd_nm").value.trim();
            
            if (name === '') {
                alert("이름을 입력해주세요.");
                document.getElementById("user_name").focus();
                return false;
            }

            if (password !== '') {
                if (password.length < 6) {
                    alert("비밀번호는 6자 이상 입력해야 합니다.");
                    document.getElementById("user_password").focus();
                    return false;
                }

                if (password !== passwordCheck) {
                    alert("비밀번호가 일치하지 않습니다.");
                    document.getElementById("user_password_check").focus();
                    return false;
                }
            }

            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert("올바른 이메일 형식을 입력하세요.");
                document.getElementById("user_email").focus();
                return false;
            }

            if (province === '' || city === '' || town === '') {
                alert("도/시/읍면동을 모두 선택해야 합니다.");
                if (province === '') {
                    document.getElementById("area_ctpy_nm").focus();
                } else if (city === '') {
                    document.getElementById("area_sgg_nm").focus();
                } else {
                    document.getElementById("area_emd_nm").focus();
                }
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
