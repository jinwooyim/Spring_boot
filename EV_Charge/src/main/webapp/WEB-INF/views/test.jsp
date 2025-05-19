<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>경로 지도 표시</title>
    <meta charset="UTF-8">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=109dd4a6fbdf108d896544146388b47e&libraries=services"></script>
    <style>
        #findpathBtn {
            position: absolute;
            bottom: 20px;
            right: 20px;
            z-index: 10;
            background-color: #3B82F6;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            cursor: pointer;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>

<h2>경로 지도</h2>

<form id="routeForm" method="get" action="${pageContext.request.contextPath}/findpath">
    <input type="hidden" id="startLat" name="startLat">
    <input type="hidden" id="startLng" name="startLng">
    목적지 주소: <input type="text" name="endAddr" id="endAddr" required>
</form>
<!-- 위치 버튼은 form 바깥에 있어도 정상 작동 -->
<div id="findpathBtn">📍 내 위치에서 경로탐색</div>

<div id="map" style="width:100%;height:600px;margin-top:20px;"></div>

<script>
    // 1. 지도 객체 전역으로 선언
    var map;

    // 2. vertexJson이 있으면 경로 표시, 없으면 기본 지도
    var vertexJson = '${vertexJson}';
    var mapContainer = document.getElementById('map');

    if (vertexJson && vertexJson !== 'null' && vertexJson.length > 2) {
        var vertexes = JSON.parse(vertexJson);
        var centerLat = vertexes[1];
        var centerLng = vertexes[0];

        var pathCoordinates = [];
        for (var i = 0; i < vertexes.length; i += 2) {
            var lng = vertexes[i];
            var lat = vertexes[i + 1];
            pathCoordinates.push(new kakao.maps.LatLng(lat, lng));
        }

        map = new kakao.maps.Map(mapContainer, {
            center: new kakao.maps.LatLng(centerLat, centerLng),
            level: 4
        });

        var polyline = new kakao.maps.Polyline({
            path: pathCoordinates,
            strokeWeight: 8,
            strokeColor: '#3B82F6',
            strokeOpacity: 1,
            strokeStyle: 'solid'
        });
        polyline.setMap(map);

        new kakao.maps.Marker({
            position: pathCoordinates[0],
            map: map,
            title: '출발지'
        });

        new kakao.maps.Marker({
            position: pathCoordinates[pathCoordinates.length - 1],
            map: map,
            title: '도착지'
        });

    } else {
        // 경로 없을 때는 기본 지도만 표시
        map = new kakao.maps.Map(mapContainer, {
            center: new kakao.maps.LatLng(37.5665, 126.9780), // 서울 중심
            level: 4
        });
    }

    // 3. 내 위치 버튼 클릭 → 좌표 설정 + 폼 제출
    document.getElementById('findpathBtn').addEventListener('click', function () {
        const endAddr = document.getElementById('endAddr').value.trim();

        if (!endAddr) {
            alert("목적지 주소를 입력하세요.");
            return;
        }

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                document.getElementById('startLat').value = position.coords.latitude;
                document.getElementById('startLng').value = position.coords.longitude;
                document.getElementById('routeForm').submit();
            }, function () {
                alert("현재 위치를 가져올 수 없습니다.");
            });
        } else {
            alert("이 브라우저는 위치 기능을 지원하지 않습니다.");
        }
    });
</script>

</body>
</html>
