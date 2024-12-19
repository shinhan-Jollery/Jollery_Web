package com.shinhan.mavenProject.section6;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeptService {

	@Autowired
	DeptDAO deptDao;

	// 1.모두조회
	public List<DeptDTO> selectAllService() {
		return deptDao.selectAll();
	}

	// 2.상세보기
	public DeptDTO selectByIdService(int deptid) {
		return deptDao.selectById(deptid);
	}

	// 3.입력
	public int insertService(DeptDTO dept) {

		return deptDao.insert(dept);
	}

	// 4.수정
	public int updateService(DeptDTO dept) {
		return deptDao.update(dept);
	}

	// 5.삭제
	public int deleteService(int deptid) {
		return deptDao.delete(deptid);
	}
}
