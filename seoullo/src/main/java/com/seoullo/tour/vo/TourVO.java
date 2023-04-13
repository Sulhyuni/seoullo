package com.seoullo.tour.vo;

import java.util.Comparator;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class TourVO {

	private Long no, hit;
	private Date regdate;
	private String status, type, title, description, region, guideId, thumbnail, mainImg, subImg, subtitle, content,
			meetPlace;
	private Double meetLat, meetLng;
	private Integer gradeNo;
	private List<TourdateVO> tourdateList;
	private List<ScheduleVO> scheduleList;
	private List<TourpointVO> tourpointList;
	private List<String> tagList;
	private List<String> checkpointList;

	public static Comparator<TourVO> byHit = new Comparator<TourVO>() {

		@Override
		public int compare(TourVO o1, TourVO o2) {
			return (int) (o2.getHit() - o1.getHit());
		}
	};

	public static Comparator<TourVO> byRegdate = new Comparator<TourVO>() {

		@Override
		public int compare(TourVO o1, TourVO o2) {
			return o2.getRegdate().compareTo(o1.getRegdate());
		}
	};

}
