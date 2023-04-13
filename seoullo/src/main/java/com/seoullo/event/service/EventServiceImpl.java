package com.seoullo.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.seoullo.event.mapper.EventMapper;
import com.seoullo.event.vo.ApplyEventVO;
import com.seoullo.event.vo.EventVO;
import com.seoullo.event.vo.ImgfileVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("eventServiceImpl")
public class EventServiceImpl implements EventService {
	
	@Setter(onMethod_ = @Autowired)
	private EventMapper mapper;
	
	// 이벤트 리스트 
	@Override
	public List<EventVO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		//log.info("왜 오ㅓ률앎알엄ㄹㅇ니ㅏㅁㅇㄹ"+pageObject);
		return mapper.list(pageObject);
	}
	// 당첨자 리스트 
	@Override
	public List<EventVO> list2(PageObject pageObject) {
		// TODO Auto-generated method stub
		return null;
	}
	//이벤트 볼때 번호와 조회수 넘어옴 
	@Override
	public EventVO view(long no, int inc) {
		// TODO Auto-generated method stub
		if(inc==1)mapper.increase(no);
	
		return mapper.view(no);
	}
	
	

	@Override
	public List<ImgfileVO> viewFile(long no) {
		// TODO Auto-generated method stub
		return mapper.viewFile(no);
	}

	@Override
	public int write(EventVO vo, List<ImgfileVO> list) {
		// TODO Auto-generated method stub
		mapper.write(vo);
		
		for(ImgfileVO ivo:list) {
			ivo.setE_no(vo.getE_no());
			mapper.writeFile(ivo);
			}
		return 1;
	}

	@Override
	public int update(EventVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int updateFile(ImgfileVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateFile(vo);
	}

	@Override
	public int main(long no, long mno) {
		// TODO Auto-generated method stub
		mapper.mainDel(no);
		log.info("여기는 서비스 임플"+no);
		return mapper.main(mno);
	}

	@Override
	public int delete(long no) {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}

	@Override
	public int deleteFile(long mno) {
		// TODO Auto-generated method stub
		return mapper.deleteFile(mno);
	}
	
	@Override
	public int apply2(ApplyEventVO vo){
		// TODO Auto-generated method stub
		
		return mapper.apply2(vo);
	}
	

}
