package com.bit.springboard.service.impl;

import com.bit.springboard.common.FileUtils;
import com.bit.springboard.dao.MemberDao;
import com.bit.springboard.dao.MyPageDao;
import com.bit.springboard.dto.*;
import com.bit.springboard.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class MyPageServiceImpl implements MyPageService {

    private MyPageDao myPageDao;

    @Autowired
    public MyPageServiceImpl(MyPageDao myPageDao) { this.myPageDao = myPageDao;}

    @Override
    public MemberDto getInfo(MemberDto memberDto) {
        return myPageDao.myInfo(memberDto.getUser_id());
    }

    @Override
    public void modifyInfo(MemberDto memberDto) {
        myPageDao.modifyInfo(memberDto);
    }

    @Override
    public List<BoardDto> getMyWrite(Criteria cri) {
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
        return myPageDao.myWrite(cri);
    }

    @Override
    public List<CommentDto> getComment(Criteria cri) {
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
        return myPageDao.comments(cri);
    }

    @Override
    public int getTotalMyPage(MemberDto memberDto){
        return myPageDao.getTotalMyPage(memberDto.getUser_id());
    }

    @Override
    public int getCommentsNum(MemberDto loginMember) {
        return myPageDao.getCommentsNum(loginMember.getUser_id());
    }

    @Override
    public Map<String, Integer> newNicknameCheck(MemberDto memberDto){
        int nicknameCheck = myPageDao.newNicknameCheck(memberDto);
        Map<String, Integer> forJsonMap = new HashMap<>();
        forJsonMap.put("newNicknameCheckNum", nicknameCheck);
        return forJsonMap;
    }

    @Override
    public void uploadProfile(MemberDto memberDto, MultipartFile uploadImg) {
//        System.out.println("uploadProfile ServiceImpl 실행");
        BoardFileDto boardFileDto = new BoardFileDto();
//        System.out.println("boardFileDto = " + boardFileDto);
        if (uploadImg != null && !uploadImg.isEmpty()) {
            // 업로드 폴더 지정
            String attachPath = "C:/tmp/upload/";
            File directory = new File(attachPath);

            // 업로드 폴더가 존재하지 않으면 폴더 생성
            if (!directory.exists()) {
                directory.mkdirs();
            }

            int userId = memberDto.getId();
            boardFileDto.setId(userId);
            String fileName = uploadImg.getOriginalFilename();
            String filePath = attachPath + fileName;

            // 파일을 서버에 저장
            try {
                uploadImg.transferTo(new File(filePath));
            } catch (IOException e) {
                e.printStackTrace();
                // 예외 처리 추가
            }

            boardFileDto.setFilename(fileName);
            boardFileDto.setFilepath(filePath);
//            System.out.println(boardFileDto);
        }

        myPageDao.uploadProfile(boardFileDto);
    }

    @Override
    public BoardFileDto getProfileImg(int userId){
        return myPageDao.getProfileImg(userId);
    }

}
