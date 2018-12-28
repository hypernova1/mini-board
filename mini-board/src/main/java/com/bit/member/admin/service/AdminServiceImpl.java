package com.bit.member.admin.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.member.admin.dao.AdminDao;
import com.bit.member.model.MemberDto;

@Service
public class AdminServiceImpl implements AdminService {

  @Autowired
  private SqlSession sqlSession;
  
  @Override
  public List<MemberDto> getMemberList(Map<String, String> param) {
    return sqlSession.getMapper(AdminDao.class).getMemberList(param);
  }

  @Override
  public int deleteMember(int seq) {
    return sqlSession.getMapper(AdminDao.class).deleteMember(seq);
  }

  @Override
  public int modifyMember(MemberDto memberDto) {
    // TODO Auto-generated method stub
    return 0;
  }

}
