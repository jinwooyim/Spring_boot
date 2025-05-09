<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <style>
        .recipe_grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .recipe_card {
            width: 270px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            font-family: sans-serif;
        }
        .recipe_card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .recipe_card p {
            padding: 10px;
            margin: 0;
            font-size: 14px;
        }
    </style>
</head>
<body>
<button class="add_recipe_btn" onclick="location.href='insert_recipe'"><i class="fas fa-plus"></i> 새 레시피 등록</button>
<button class="add_recipe_btn" onclick="location.href='main'"><i class="fas fa-plus"></i>메인화면으로</button>
<div class="recipe_grid">
    <c:forEach var="recipe" items="${recipe_list_all}">
    <c:set var="recipe_id" value="${recipe.rc_recipe_id}" />
    <a href="recipe_content_view?rc_recipe_id=${recipe.rc_recipe_id}">
            <div class="recipe_card">
            <c:set var="found_image" value="false" />
            <c:forEach var="attach" items="${file_list_all}">
                <c:if test="${!found_image && attach.rc_recipe_id == recipe_id && attach.image}">
                    <img src="/upload/${attach.uploadPath}/${attach.uuid}_${attach.fileName}" alt="${recipe.rc_name}" />
                    <c:set var="found_image" value="true" />
                </c:if>
            </c:forEach>

            <p>
                ${recipe.rc_recipe_id}. ${recipe.rc_name} <br/>
                (${recipe.rc_created_at})
            </p>
        </div>
    </a>
</c:forEach>
</div>

</body>
</html>