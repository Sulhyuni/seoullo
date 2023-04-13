package com.seoullo.member.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.seoullo.member.mapper.MemberMapper;
import com.seoullo.member.vo.MemberVO;
import com.seoullo.member.vo.PaymentVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;



@Service
@Qualifier("memberServiceImpl")
@Log4j
public class MemberServiceImpl implements MemberService {

	
	@Setter(onMethod_= @Autowired)
	private MemberMapper mapper;
	
	@Override
	public MemberVO login(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.login(vo);
	}

	
	
	
	@Override
	public List<MemberVO> list(PageObject pageObject) {
		//log.info("회원리스트 MemberServiceImpl");
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		//log.info("회원리스트 데이터 가져오기 성공");

		return mapper.list(pageObject);
	}
	
	@Override
	public List<MemberVO> guideList(String id) {
		log.info("가이드의 리스트 MemberServiceImpl");
		return mapper.guideList(id);
	}
	
	@Override
	public MemberVO view(String id) {
		log.info("회원보기 MemberServiceImpl");
		// TODO Auto-generated method stub
		return mapper.view(id);
	}
	@Override
	public MemberVO guideView(String id) {
		log.info("가이드 회원보기 MemberServiceImpl");
		// TODO Auto-generated method stub
		return mapper.guideView(id);
	}
	
	@Override
	public int updateAdmin(String id,String status) {
		// TODO Auto-generated method stub
		return mapper.updateAdmin(id,status);
	}

	@Override
	public int update(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}
	@Override
	public int guideUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.guideUpdate(vo);
	}
	
	
	@Override
	public String findId(String name, String email) {
		
		return mapper.findId(name,email);
	}

	@Override
	public String findPw(String id, String name, String email) {
		
		return mapper.findPw(id,name,email);
	}


	@Override
	public int updatePw(MemberVO vo) {
		
		return mapper.updatePw(vo);
	}
	

	@Override
	public int commonWelcom(MemberVO vo) {
		log.info("MemberServiceImpl");
		
		return mapper.commonWelcom(vo);
	}

	//mapper.guidePay와 mapper.gWelcom 두개 넣기. 그래서 두개의 쿼리를 같이 쓴다.
	//welcom먼저 넣기
	@Override
	public int guideWelcom(MemberVO vo, PaymentVO pvo) {
	mapper.guideWelcom(vo);
		mapper.guidePay(pvo);
		return 1;
	}
	
	
	
	@Override
	public int delete(String id, String pw) {
		// TODO Auto-generated method stub
		return mapper.delete(id,pw);
	}
	@Override
	public int updateHu() {
		// TODO Auto-generated method stub
		return mapper.updateHu();
	}
	@Override
	public int updatePay() {
		// TODO Auto-generated method stub
		return mapper.updatePay();
	}
	@Override
	public int addPay(PaymentVO pvo,String id, String pw, int gradeNo) {
		//만약에 id정보로 인해서 오류가 나면 가이드 페이를 하나 더 만들기.mapper에
		mapper.guidePay(pvo);
		mapper.updateGradeNo(id,gradeNo);
		mapper.statusNo(id);
		mapper.payDateUpdate(id);
		return 1;
	}
	
	

	@Override
	public int statusNomal(String id, String pw) {
		mapper.statusNomal(id, pw);
		return 1;
	}


	
	
	
	//-------------------- 아작스 검사라인
	@Override
	public int checkId(String id) {
		// TODO Auto-generated method stub
		
		return mapper.checkId(id);
	}

	@Override
	public int checkNickName(String nickName) {
		// TODO Auto-generated method stub
		return mapper.checkNickName(nickName);
	}




	




	










	
	









	



}
