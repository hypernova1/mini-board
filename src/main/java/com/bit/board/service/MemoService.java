package com.bit.board.service;

import com.bit.board.model.MemoDto;

public interface MemoService {
  int writeMemo(MemoDto memoDto);
  String listMomo(int seq);
  int modifyMemo(MemoDto memoDto);
  int deleteMomo(int mseq);
}
