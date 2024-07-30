package com.bit.springboard.service.impl;

import com.bit.springboard.dao.RankDao;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.RankDto;
import com.bit.springboard.service.RankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RankServiceImpl implements RankService {
    private RankDao rankDao;

    @Autowired
    public RankServiceImpl(RankDao rankDao) {
        this.rankDao = rankDao;
    }

    @Override
    public List<RankDto> getRankList(Criteria cri) {
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());

        return rankDao.getRankList(cri);
    }

    @Override
    public int getRankTotalCnt(String gametype) {
        return rankDao.getRankTotalCnt(gametype);
    }


    @Override
    public List<RankDto> getMyTopRank(String userId) {
        return rankDao.getMyTopRank(userId);
    }
}
