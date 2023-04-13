package com.seoullo.book.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class GuideVO {
	
	private long tourNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date day;
	private String status;
	private long reserveNum, maxNum;
	
	private List<GuideDetailVO> guideDetailList;
}
