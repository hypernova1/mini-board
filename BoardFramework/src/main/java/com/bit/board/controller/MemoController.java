package com.bit.board.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bit.board.model.MemberDto;
import com.bit.board.model.MemoDto;
import com.bit.board.service.MemberService;
import com.bit.board.service.MemoService;

@Controller
public class MemoController {

  @Autowired
  private MemoService memoService;
  @Autowired
  private MemberService memberService;
  
  @PostMapping("comment")
  public @ResponseBody String write(@RequestBody MemoDto memoDto, HttpSession session) {
    Integer mno = (Integer) session.getAttribute("mno");
    MemberDto member = memberService.getMemberInfo(mno);
    memoDto.setId(member.getMid());
    memoDto.setName(member.getMname());
    memoService.writeMemo(memoDto);
    
    String memoList = memoService.listMomo(memoDto.getSeq());
    return memoList;
  }
  
  @GetMapping("comment/{seq}")
  public @ResponseBody String list(@PathVariable int seq) {
    String memoList = memoService.listMomo(seq);
    return memoList;
  }
  
  @PutMapping("comment")
  public @ResponseBody String modify(@RequestBody MemoDto memoDto, HttpSession session) {
    memoService.modifyMemo(memoDto);
    String memoList = memoService.listMomo(memoDto.getSeq());
    return memoList;
  }
  
  @DeleteMapping("comment/{mseq}/{seq}")
  public @ResponseBody String delete(@PathVariable int mseq, @PathVariable int seq) {
    memoService.deleteMomo(mseq);
    String list = memoService.listMomo(seq);
    return list;
  }
  
}
