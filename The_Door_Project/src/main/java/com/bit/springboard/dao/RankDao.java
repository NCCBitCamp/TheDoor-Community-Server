package com.bit.springboard.dao;

import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.RankDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class RankDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public RankDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public List<RankDto> getRankList(Criteria cri) {
        List<RankDto> rankDtoList = new ArrayList<>();

        rankDtoList = mybatis.selectList("RankDao.getRankList", cri);

        return rankDtoList;
    }

    public int getRankTotalCnt(String gametype) {
        return mybatis.selectOne("RankDao.getRankTotalCnt", gametype);
    }

    public RankDto getMyTopRanktheHostel(RankDto rankDto) {
        return mybatis.selectOne("RankDao.getMyTopRanktheHostel", rankDto);
    }

    public RankDto getMyTopRankbitCamp(RankDto rankDto) {
        return mybatis.selectOne("RankDao.getMyTopRankbitCamp", rankDto);
    }

    public RankDto getMyTopRankrozerStone(RankDto rankDto) {
        return mybatis.selectOne("RankDao.getMyTopRankrozerStone", rankDto);
    }
}
