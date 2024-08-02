package com.bit.springboard.service;

import com.bit.springboard.dto.BoardFileDto;
import com.bit.springboard.dto.CommentDto;

import java.util.List;

public interface NewsService {
    List<CommentDto> getComments(int boardId);

    List<BoardFileDto> getBoardFiles(int boardId);
}
