package com.seoullo.siteqna.vo;

import java.util.Date;

import lombok.Data;
@Data
public class SiteQnaVO {

	private long siteNo,refNo, ordNo, levNo;
	private String id, title, content, status;
	private Date writeDate;
	private long hit;
	
}
