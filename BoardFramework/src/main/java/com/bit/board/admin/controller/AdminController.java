package com.bit.board.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bit.board.admin.model.BoardListDto;
import com.bit.board.admin.service.BoardAdminService;
import com.bit.board.model.MemberDto;
import com.bit.board.service.MemberService;
import com.bit.util.Criteria;
import com.bit.util.PageMaker;

@Controller
public class AdminController {

  @Autowired
  private BoardAdminService boardadminService;
  @Autowired
  private MemberService memberService;

  @GetMapping("manage")
  public String manage() {
    return "/admin/list";
  }
  
  @GetMapping("category")
  public @ResponseBody ResponseEntity<List<BoardListDto>> boardMenu() {
    List<BoardListDto> list = boardadminService.getBoardMenu();
    for (BoardListDto dto : list) {
      dto.setBname(dto.getBname().replace(dto.getCname(), ""));
    }
    return new ResponseEntity<>(list, HttpStatus.OK);
  }

  @GetMapping("/manage/{searchKeyword}/{page}")
  public @ResponseBody ResponseEntity<Map<String, Object>> memberList(
      @PathVariable("searchKeyword") String searchKeyword,
      @PathVariable("page") int page) {
    
    Criteria cri = new Criteria();
    cri.setPage(page);
    cri.setKeyword(searchKeyword);
    PageMaker pm = new PageMaker();
    pm.setCri(cri);
    
    List<MemberDto> list = memberService.getMemberList(cri);
    
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("list", list);

    int totalCount = memberService.getTotalCount(searchKeyword);

    pm.setTotal(totalCount);

    map.put("pm", pm);

    return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
  }
}
