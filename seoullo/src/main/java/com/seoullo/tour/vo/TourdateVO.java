package com.seoullo.tour.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TourdateVO {
	
	private Long tourNo;
	private Integer maxNum, reserveNum, priceA, priceB;
	private Date day;
	private String status;

}
