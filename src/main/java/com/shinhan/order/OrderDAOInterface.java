package com.shinhan.order;

import com.shinhan.VO.OrdersDTO;

//Interface(�԰ݼ�) : ���Ǵ� �ְ� ������ ����.
public interface OrderDAOInterface {

	public OrdersDTO selectById(int order_id);
}
