package com.bit.board.admin.dao;

import java.util.List;
import java.util.Locale.Category;
import org.springframework.stereotype.Component;
import com.bit.board.admin.model.BoardListDto;
import com.bit.board.admin.model.BoardTypeDto;
import com.bit.board.admin.model.CategoryDto;

@Component
public interface BoardAdminDao {
  
  List<BoardListDto> getBoardMenu();
  List<Category> getCategory();
  void makeCategory(CategoryDto catogory);
  List<BoardTypeDto> getBoardType();
  void makeBoard(BoardListDto boardList);
}
