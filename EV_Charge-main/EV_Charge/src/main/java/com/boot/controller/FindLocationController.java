package com.boot.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boot.dto.AreaDTO;

@RestController
@RequestMapping("/updateMapCoordinates")
public class FindLocationController {

	@Value("${kakao.api.key}") // API Key를 application.properties에서 주입
	private String kakaoApiKey;

	@PostMapping
	public String updateMapCoordinates(@RequestBody AreaDTO address) {
		String[] coordinates = new String[2]; // [0] -> latitude, [1] -> longitude

		try {
			String addressString = address.getArea_ctpy_nm() + " " + address.getArea_sgg_nm() + " "
					+ address.getArea_emd_nm();

			// URL 인코딩
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

			// documents 배열이 비어 있지 않은지 확인
			if (documents.length() > 0) {
				JSONObject firstDocument = documents.getJSONObject(0);

				// 위도와 경도 추출
				coordinates[0] = firstDocument.getString("y"); // 위도
				coordinates[1] = firstDocument.getString("x"); // 경도
			} else {
				throw new JSONException("No documents found in the response.");
			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
			return new JSONObject().put("error", "잘못된 URL 형식입니다.").toString();
		} catch (IOException e) {
			e.printStackTrace();
			return new JSONObject().put("error", "API 요청 중 오류가 발생했습니다.").toString();
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

//	@PostMapping("/findStationsNear")
//	public List<StationDTO> findStationsNear(@RequestBody Map<String, String> coords) {
//	    double centerLat = Double.parseDouble(coords.get("center_lat"));
//	    double centerLng = Double.parseDouble(coords.get("center_lng"));
//	    
//	    // 여기서 DB나 외부 API에서 충전소 조회
//	    List<StationDTO> stations = stationService.findStationsNear(centerLat, centerLng);
//	    
//	    return stations; // JSON으로 변환되어 클라이언트로 감
//	}
}