<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${dto.rc_name} - 레시피 상세</title>
    <style>
        .recipe-container { max-width: 800px; margin: 0 auto; font-family: sans-serif; }
        .recipe-header img { max-width: 100%; border-radius: 10px; }
        .section-title { font-weight: bold; font-size: 1.2em; margin-top: 20px; border-bottom: 1px solid #ccc; }
        .ingredients, .steps { margin-top: 10px; }
        .step img { max-width: 100%; margin-top: 10px; }
    </style>
</head>
<body>
<div class="recipe-container">

    <!-- 대표 이미지 -->
    <div class="recipe-header">
        <h1>${dto.rc_name}</h1>
        <c:if test="${img_list != null}">
            <img src="/upload/${img_list.uploadPath}/${img_list.uuid}_${img_list.fileName}" alt="${dto.rc_name}" />
        </c:if>
        <p>등록일: ${dto.rc_created_at}</p>
        <p>카테고리: ${dto.rc_category1_id} / ${dto.rc_category2_id}</p>
        <p>소요시간: ${dto.rc_cooking_time}분</p>
        <p>난이도: ${dto.rc_difficulty}</p>
        <p>태그: ${dto.rc_tag}</p>
    </div>

    <div class="description">
        <p class="section-title">레시피 설명</p>
        <p>${dto.rc_description}</p>
    </div>

    <!-- 재료 리스트 -->
    <div class="ingredients">
        <p class="section-title">재료</p>
        <ul>
            <c:forEach var="ing" items="${ing_list}">
                <li>${ing.rc_ingredient_name} - ${ing.rc_ingredient_amount}</li>
            </c:forEach>
        </ul>
    </div>

    <!-- 요리 순서 + 이미지: course_list + course_img_list 조합 -->
    <div class="steps">
        <p class="section-title">요리 순서</p>
        <c:forEach var="step" items="${course_list}" varStatus="status">
            <div class="step">
                <p><strong>Step ${status.index + 1}:</strong> ${step.rc_course_description}</p>
                <c:forEach var="img" items="${course_img_list}">
                    <c:if test="${img.rc_recipe_id == dto.rc_recipe_id && img.image && img.fileName.contains('_step' + (status.index + 1))}">
                        <img src="/upload/${img.uploadPath}/${img.uuid}_${img.fileName}" alt="Step ${status.index + 1}" />
                    </c:if>
                </c:forEach>
            </div>
        </c:forEach>
    </div>

    <!-- 팁 -->
    <div class="tip">
        <p class="section-title">요리 팁</p>
        <p>${dto.rc_tip}</p>
    </div>

</div>
</body>
</html>