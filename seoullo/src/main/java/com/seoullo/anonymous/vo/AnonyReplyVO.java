package com.seoullo.anonymous.vo;

import java.util.Date;

import lombok.Data;
@Data
public class AnonyReplyVO {

	private long anonyNo, rno,replyCnt;
	private String id,reply, replyer;
	private Date writeDate,updateDate;
}
