package com.seoullo.scheduler.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.seoullo.member.service.MemberService;
import com.seoullo.tour.service.TourService;

@Controller
@EnableScheduling
public class SchedulerController {

	@Autowired
	@Qualifier("TourServiceImpl")
	private TourService	tourService;
	
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memService;

	// 3일 지난 투어 -> 신규에서 예약가능으로 변경
	@Scheduled(cron = "0 0 * * * *")
	public void tourNotNew() {
		tourService.tourNotNew();
	}

	// DB와 일치하지 않는 파일 삭제
	@Scheduled(cron = "30 * * * * *")
	public void deleteTourFiles() {
		tourService.deleteTourFiles();

	}
	//1년이상 지나면 휴면 계정
	@Scheduled(cron = "0 * * * * *")
	public void updateHu() {
		memService.updateHu();
	}
	//1년이상 지나면 기간만료
	@Scheduled(cron = "0 * * * * *")
	public void updatePay() {
		memService.updatePay();
	}

}
