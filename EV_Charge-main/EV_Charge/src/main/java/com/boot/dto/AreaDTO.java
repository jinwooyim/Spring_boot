package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AreaDTO {
	private String area_ctpy_nm; // 시/도
	private String area_sgg_nm; // 시/군/구
	private String area_emd_nm; // 읍/면/동
}
