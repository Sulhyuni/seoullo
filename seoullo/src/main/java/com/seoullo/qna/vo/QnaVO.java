package com.seoullo.qna.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	private long qnaNo, tourNo, no;
	private String title, content,id,status,region;
	private Date writeDate;
	private long refNo,ordNo,levNo,parentNo,hit;

}
