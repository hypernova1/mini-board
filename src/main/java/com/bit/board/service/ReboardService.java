package com.bit.board.service;

import java.util.List;
import java.util.Map;
import com.bit.board.model.ReboardDto;

public interface ReboardService {
  int writeArticle(ReboardDto reboardDto);
  List<ReboardDto> listArticle(Map<String, String> param);
  ReboardDto viewArticle(int rseq);
  ReboardDto getArticle(int rseq);
  int replyArticle(ReboardDto reboardDto);
  
  int modifyArticle(ReboardDto reboardDto);
  int deleteArticle(int rseq);
}
