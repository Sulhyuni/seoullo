package com.seoullo.cart.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.seoullo.book.mapper.BookMapper;
import com.seoullo.book.vo.BookVO;
import com.seoullo.cart.mapper.CartMapper;
import com.seoullo.cart.vo.CartVO;

import lombok.Setter;

@Service
@Qualifier("cartServiceImpl")
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;

	@Override
	public List<CartVO> list(String id) {
	    List<CartVO> list = mapper.list(id);
	    for (CartVO vo : list) {
	    	CartVO reserve = mapper.checkReserveNum(vo);
	    	vo.setReserveNum(reserve.getReserveNum());
	    	vo.setMaxNum(reserve.getMaxNum());
	    }
	    return list;
	}

	@Override
	public List<CartVO> orderList(List<Long> nos) {
	    List<CartVO> list = new ArrayList<>();
	    for (Long no : nos) {
	        List<CartVO> orderList = mapper.orderList(no);
	        list.addAll(orderList);
	    }
	    return list;
	}
	
	@Override
	public int add(CartVO vo) {
		return mapper.add(vo);
	}

	@Override
	public int update(CartVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int delete(List<Long> nos) {
	    int result = 0;
	    for (Long no : nos) {
	        result += mapper.delete(no);
	    }
	    return result;
	}


}
