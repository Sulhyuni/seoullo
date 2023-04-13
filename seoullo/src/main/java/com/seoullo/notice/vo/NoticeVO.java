package com.seoullo.notice.vo;

import java.util.Date;

import lombok.Data;
@Data
public class NoticeVO {
	
	private long no;
	private String title,content,writer;
	private Date writeDate,startDate,endDate,updateDate;
	private long hit;
	

}
