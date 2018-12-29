package com.bit.common.dao;

import java.util.Map;

public interface CommonDao {
  
  int getNextSeq();
  void increaseHit(int seq);
  int getNewArticleCount(int bcode);
  int getTotalArticleCount(Map<String, String> map);
}
