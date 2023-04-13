package com.seoullo.siteqna.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SiteAnswerVO {

	private long aNo,siteNo;
	private String id, title, reply, status, replyer;
	private Date replyDate;
}
