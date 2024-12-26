package com.shinhan.order;

import com.shinhan.VO.OrdersDTO;

//Interface(규격서) : 정의는 있고 구현은 없다.
public interface OrderDAOInterface {

	public OrdersDTO selectById(int order_id);
}
