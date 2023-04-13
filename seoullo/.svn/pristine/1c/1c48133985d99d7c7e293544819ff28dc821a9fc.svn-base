package com.seoullo.tour.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seoullo.tour.vo.ScheduleVO;
import com.seoullo.tour.vo.TourVO;
import com.seoullo.tour.vo.TourdateVO;
import com.seoullo.tour.vo.TourpointVO;
import com.webjjang.util.PageObject;

public interface TourMapper {

	// 리스트 관련 쿼리
	public List<TourVO> list(@Param("tag") String tag, @Param("title") String title, @Param("region") String region,
			@Param("closed") int closed);

	public List<TourVO> listByGuide(String id);

	public List<String> taglist(Long tourNo);

	// 투어 상세보기 관련 쿼리
	public TourVO view(Long no);

	public List<TourdateVO> viewTourdate(Long no);

	public List<ScheduleVO> viewSchedule(Long no);

	public List<TourpointVO> viewTourpoint(Long no);

	public List<String> viewCheckpoint(Long no);

	public Integer increaseHit(Long no);

	// 투어 등록 관련 쿼리(수정에서도 이용)
	public Integer write(TourVO vo);

	public Integer writeTourdate(TourdateVO vo);

	public Integer writeSchedule(ScheduleVO vo);

	public Integer writeTourpoint(TourpointVO vo);

	public Integer writeTag(@Param("tourNo") Long tourNo, @Param("tag") String tag);

	public Integer writeCheckpoint(@Param("tourNo") Long tourNo, @Param("checkpoint") String checkpoint);
	
	//투어 수정 관련 쿼리
	public Integer updateTour(TourVO vo);

	public Integer updateImage(TourVO vo);

	public Integer deleteSchedule(Long tourNo);

	public Integer deleteTourpoint(Long tourNo);

	public Integer deleteTag(Long tourNo);

	public Integer deleteCheckpoint(Long tourNo);

	// 기타 운영 관련 쿼리

	// 가이드의 모집종료
	public Integer close(Long no);

	// 신규 -> 3일 후 자동 예약전환(쓰레드)
	public void tourNotNew();

	// DB에 없는 파일 자동 삭제
	public List<String> tourDBFiles1();
	public List<String> tourDBFiles2();
	public List<String> tourDBFiles3();
	public List<String> tourDBFiles4();

}
