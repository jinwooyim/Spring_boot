package com.boot.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.boot.dto.AreaDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/updateMapCoordinates")
public class FindLocationController {

	@Value("${kakao.api.key}") // API Key를 application.properties에서 주입
	private String kakaoApiKey;

	@PostMapping
	public String updateMapCoordinates(@RequestBody AreaDTO address) {
		String[] coordinates = new String[2]; // [0] -> latitude, [1] -> longitude

		try {
			String addressString = buildAddress(address, true);
			JSONArray documents = getJSONResponse(addressString);

			if (documents == null || documents.length() == 0) {
				// 읍/면/동이 없는 주소로 fallback
				addressString = buildAddress(address, false);
				documents = getJSONResponse(addressString);
			}

			if (documents != null && documents.length() > 0) {
				JSONObject firstDocument = documents.getJSONObject(0);
				coordinates[0] = firstDocument.getString("y"); // 위도
				coordinates[1] = firstDocument.getString("x"); // 경도
			} else {
				return new JSONObject().put("error", "주소에 대한 좌표를 찾을 수 없습니다.").toString();
			}

		} catch (JSONException e) {
			e.printStackTrace();
			return new JSONObject().put("error", "응답에서 JSON 파싱 중 오류가 발생했습니다.").toString();
		} catch (Exception e) {
			e.printStackTrace();
			return new JSONObject().put("error", "알 수 없는 오류가 발생했습니다.").toString();
		}

		// 성공적으로 위도와 경도를 반환
		return new JSONObject().put("latitude", coordinates[0]).put("longitude", coordinates[1]).toString();
	}

	// kakao API를 이용해서 주소값을 위도와 경도를 가진 JSON 배열로 반환하는 메소드
	public JSONArray getJSONResponse(String addressString) {
		try {
			String encodedAddress = java.net.URLEncoder.encode(addressString, "UTF-8");

			String apiUrl = "https://dapi.kakao.com/v2/local/search/address.json?query=" + encodedAddress;

			// API 요청
			URL url = new URL(apiUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Authorization", "KakaoAK " + kakaoApiKey); // Kakao API Key

			// 응답 받기
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			// JSON 응답 파싱
			JSONObject jsonResponse = new JSONObject(response.toString());
			JSONArray documents = jsonResponse.getJSONArray("documents");

			return documents;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 읍면동 주소값이 있는지 없는지 판별하는 메소드
	private String buildAddress(AreaDTO address, boolean includeEmd) {
		String addr = address.getArea_ctpy_nm() + " " + address.getArea_sgg_nm();
		if (includeEmd && address.getArea_emd_nm() != null && !address.getArea_emd_nm().isEmpty()) {
			addr += " " + address.getArea_emd_nm();
		}
		return addr;
	}

	// 센터점 주변 충전소 찾기
	@PostMapping("/findStationsNear")
	@ResponseBody
	public List<Map<String, Object>> findStationsNear(@RequestBody Map<String, Object> body) {

		double centerLat = Double.parseDouble(body.get("center_lat").toString());
		double centerLng = Double.parseDouble(body.get("center_lng").toString());

		log.info("요청 받은 중심 좌표: {}, {}", centerLat, centerLng);

		List<Map<String, Object>> stations = new ArrayList<>();

		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = dbf.newDocumentBuilder();

			String url = "http://apis.data.go.kr/B552584/EvCharger/getChargerInfo?serviceKey=ha6Vs0w2TW5hmQMnGjVefZDfIMjkFiXLXhNYfw0kPcJd470rlZfa95pVgwgLfQYMXmMVe0%2BjwHptLmAGdhXaCw%3D%3D&numOfRows=1000&dataType=XML";

			for (int i = 1; i <= 426; i++) {
				String newUrl = url + "&pageNo=" + i;
				Document xmlDoc = parser.parse(new URL(newUrl).openStream());
				Element root = xmlDoc.getDocumentElement();

				for (int j = 0; j < 1000; j++) {
					Node item_node = root.getElementsByTagName("item").item(j);
					if (item_node == null) {
						continue;
					}

					double lat = Double
							.parseDouble(((Element) item_node).getElementsByTagName("lat").item(0).getTextContent());
					double lng = Double
							.parseDouble(((Element) item_node).getElementsByTagName("lng").item(0).getTextContent());

					// 중심 좌표와 가까운 충전소만 필터링 (예시로 반경 2km)
					double distance = getDistance(centerLat, centerLng, lat, lng);
					if (distance <= 2.0) {
						Map<String, Object> station = new HashMap<>();
						station.put("latitude", lat);
						station.put("longitude", lng);

						// 이름 추가하려면 여기서 stationName 같은 것도 넣을 수 있음
						stations.add(station);
					}
				}
			}
			log.info("조회 완료, 총 {}개의 충전소 발견", stations.size());

		} catch (Exception e) {
			log.error("충전소 조회 중 오류 발생", e);
		}

		return stations;
	}

	// 거리 계산하기(km를 위도와 경도로 변환)
	private double getDistance(double lat1, double lon1, double lat2, double lon2) {
		double R = 6371; // 지구 반지름 (km)
		double dLat = Math.toRadians(lat2 - lat1);
		double dLon = Math.toRadians(lon2 - lon1);
		double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(Math.toRadians(lat1))
				* Math.cos(Math.toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		double distance = R * c;
		return distance;
	}
}