package com.bit.board.admin.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.bit.board.admin.model.BoardListDto;
import com.bit.board.admin.service.BoardAdminService;

@RestController
public class BoardAdminController {

  @Autowired
  private BoardAdminService boardadminService;
  
  @RequestMapping("category")
  public ResponseEntity<List<BoardListDto>> boardMenu() {
    List<BoardListDto> list = boardadminService.getBoardMenu();
    for(BoardListDto dto : list) {
      dto.setBname(dto.getBname().replace(dto.getCname(), "" ));
    }
    return new ResponseEntity<>(list, HttpStatus.OK);
  }
}
