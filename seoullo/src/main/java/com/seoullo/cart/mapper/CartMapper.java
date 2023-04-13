package com.seoullo.cart.mapper;

import java.util.List;

import com.seoullo.cart.vo.CartVO;

public interface CartMapper {
	
	// 장바구니 전체 리스트
	public List<CartVO> list(String id);
	
	// 장바구니 번호로 가져오는 리스트
	public List<CartVO> orderList(long no);
	
	public int add(CartVO vo);
	
	public int update(CartVO vo);
	
	public int delete(long no);
	
	public CartVO checkReserveNum(CartVO vo);
}
