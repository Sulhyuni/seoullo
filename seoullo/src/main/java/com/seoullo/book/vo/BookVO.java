package com.seoullo.book.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BookVO {
	
	// booking 테이블
	private long no; // 예약번호
	private String id, name, gender, email, tel; // 회원아이디, 예약자명, 예약자성별, 예약자이메일, 예약자연락처
	private Date bookDate; // 예약일자
	private String payStatus, payMethod; // 결제상태, 결제수단
	private long payPrice; // 결제가격 (모든 투어 합친 금액)
	
	// tour 테이블
	private long tourNo; // 투어번호
	private String type, title, region, thumbnail, guideId; // 종류, 제목, 지역, 썸네일, 가이드아이디
	
	// tourDate 테이블
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date day; // 투어일자
	private String status; // 예약가능 상태 (예약가능, 마감)
	private long reserveNum, maxNum, priceA, priceB; // 현재예약인원, 최대인원, 대인가격, 소인가격
	
	// bookDetail 테이블	
	private List<BookDetailVO> bookDetailList;

}
