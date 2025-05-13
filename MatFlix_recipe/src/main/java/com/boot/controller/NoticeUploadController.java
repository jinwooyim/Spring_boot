package com.boot.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boot.dto.NoticeBoardAttachDTO;
import com.boot.service.NoticeUploadService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
//@RequestMapping("/comment")
public class NoticeUploadController {
	@Autowired
	private NoticeUploadService service;

	@PostMapping("/notice_uploadAjaxAction")
	public ResponseEntity<List<NoticeBoardAttachDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("@# uploadAjaxAction()");

		List<NoticeBoardAttachDTO> list = new ArrayList<NoticeBoardAttachDTO>();
		String uploadFolder = "C:\\develop\\notice";
//		날짜별 폴더 생성
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("@# uploadPath=>" + uploadPath);

		if (uploadPath.exists() == false) {
			// make yyyy/MM/dd folder
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {
			log.info("===============================");
//			getOriginalFilename : 업로드 되는 파일 이름
			log.info("@# 업로드 되는 파일 이름=>" + multipartFile.getOriginalFilename());
//			getSize : 업로드 되는 파일 크기
			log.info("@# 업로드 되는 파일 크기=>" + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			UUID uuid = UUID.randomUUID();
			log.info("@# uuid=>" + uuid);

			NoticeBoardAttachDTO boardAttachDTO = new NoticeBoardAttachDTO();
			boardAttachDTO.setNotice_fileName(uploadFileName);
			boardAttachDTO.setNotice_uuid(uuid.toString());
			boardAttachDTO.setNotice_uploadPath(uploadFolderPath);
			log.info("@# boardAttachDTO 01=>" + boardAttachDTO);

			uploadFileName = uuid.toString() + "_" + uploadFileName;
			log.info("@# uuid uploadFileName=>" + uploadFileName);

//			saveFile : 경로하고 파일이름
			File saveFile = new File(uploadPath, uploadFileName);
			FileInputStream fis = null;

			try {
//				transferTo : saveFile 내용을 저장
				multipartFile.transferTo(saveFile);

//				참이면 이미지 파일
				if (checkImageType(saveFile)) {
					boardAttachDTO.setNotice_image(true);
					log.info("@# boardAttachDTO 02=>" + boardAttachDTO);

					fis = new FileInputStream(saveFile);

//					썸네일 파일은 s_ 를 앞에 추가
					FileOutputStream thumnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

//					썸네일 파일 형식을 100/100 크기로 생성
					Thumbnailator.createThumbnail(fis, thumnail, 100, 100);

					thumnail.close();
				}

				list.add(boardAttachDTO);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (fis != null) {
						fis.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		} // end of for

//		return null;
//		파일정보들을 list 객체에 담고, http 상태값은 정상으로 리턴
		return new ResponseEntity<List<NoticeBoardAttachDTO>>(list, HttpStatus.OK);
	}

//	날짜별 폴더 생성
	public String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		log.info("@# str=>" + str);

		return str;
	}

//	이미지 여부 체크
	public boolean checkImageType(File file) {
		try {
//			이미지파일인지 체크하기 위한 타입(probeContentType)
			String contentType = Files.probeContentType(file.toPath());
			log.info("@# contentType=>" + contentType);

//			startsWith : 파일종류 판단
//			return contentType.startsWith("images");//참이면 이미지파일
			return contentType.startsWith("image");// 참이면 이미지파일
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false; // 거짓이면 이미지파일이 아님
	}

//	이미지파일을 받아서 화면에 출력(byte 배열타입)
	@GetMapping("/notice_display")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("@# display fileName=>" + fileName);

//		File file = new File("C:\\develop\\notice"+fileName);
		File file = new File("C:\\develop\\notice\\" + fileName);
		log.info("@# file=>" + file);

		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();

		try {
//			파일타입을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
//			파일정보를 byte 배열로 복사+헤더정보+http상태 정상을 결과에 저장
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@PostMapping("/notice_deleteFile")
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("@# deleteFile fileName=>" + fileName);
		File file;

		try {
//			URLDecoder.decode : 서버에 올라간 파일을 삭제하기 위해서 디코딩
			file = new File("C:\\develop\\notice\\" + URLDecoder.decode(fileName, "UTF-8"));
			log.info("@# file=>" + file);
			file.delete();

//			이미지 파일이면 썸네일도 삭제
			if (type.equals("image")) {
//				getAbsolutePath : 절대경로(full path)
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("@# largeFileName=>" + largeFileName);

				file = new File(largeFileName);
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
//			예외 오류 발생시 not found 처리
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}

//		deleted : success 의 result 로 전송
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	@GetMapping("/notice_getFileList")
	public ResponseEntity<List<NoticeBoardAttachDTO>> getFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# getFileList param=>" + param);
		log.info("@# boardNo=>" + param.get("boardNo"));

		return new ResponseEntity<>(service.getFileList(Integer.parseInt(param.get("boardNo"))), HttpStatus.OK);
	}

	@GetMapping("/notice_download")
	public ResponseEntity<Resource> download(String fileName) {
		log.info("@# download fileName=>" + fileName);

		// 파일을 리소스(자원)로 변경. 파일을 비트값으로 전환
		Resource resource = new FileSystemResource("C:\\develop\\notice\\" + fileName);
		log.info("@# resource=>" + resource);

//		리소스에서 파일명을 찾아서 변수에 저장
		String resourceName = resource.getFilename();

//		uuid 를 제외한 파일명
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		HttpHeaders headers = new HttpHeaders();

		try {
//			헤더에 파일다운로드 정보 추가
			headers.add("Content-Disposition",
					"attachment; filename=" + new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}

//		윈도우 다운로드시 필요한 정보(리소스, 헤더, 상태OK)
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

}
