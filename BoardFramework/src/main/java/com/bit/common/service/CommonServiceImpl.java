package com.bit.common.service;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import com.bit.common.dao.CommonDao;
import com.bit.util.BoardConstance;
import com.bit.util.PageNavigation;

@Service
public class CommonServiceImpl implements CommonService {

  private SqlSession sqlSession;
  
  public CommonServiceImpl(SqlSession sqlSession) {
    this.sqlSession = sqlSession;
  }
  
  @Override
  public PageNavigation makePageNavigation(Map<String, String> param) {
    PageNavigation navigation = new PageNavigation();
    int page = Integer.parseInt(param.get("page"));
    int pageSize = BoardConstance.PAGE_CNT.getValue();
    int listSize = BoardConstance.LIST_CNT.getValue();
    int newArticleCount  = sqlSession.getMapper(CommonDao.class)
                                     .getNewArticleCount(Integer.parseInt(param.get("bcode")));
    int totalArticleCount = sqlSession.getMapper(CommonDao.class).getTotalArticleCount(param);
    int totalPageCount = (totalArticleCount - 1) / listSize + 1; // 페이지수
    
    navigation.setNewArticleCount(newArticleCount);
    navigation.setTotalArticleCount(totalArticleCount);
    navigation.setTotalPageCount(totalPageCount);
    navigation.setPageNo(page);
    navigation.setNowFirst(page <= pageSize);
    
    navigation.setNowEnd((totalPageCount - 1) / pageSize * pageSize < page);
    return navigation;
  }

}
