package com.bit.springboard.dao;

import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.RankDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    public int getRankTotalCnt() {
        return mybatis.selectOne("RankDao.getRankTotalCnt");
    }
}
