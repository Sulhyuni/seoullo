package com.seoullo.tour.vo;

import lombok.Data;

@Data
public class ScheduleVO {
	
	private Long no, tourNo;
	private Integer dayNum, scheduleNum, starthour, startminute;
	private String schedule, description;

}
