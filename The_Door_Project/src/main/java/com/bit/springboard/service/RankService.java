package com.bit.springboard.service;

import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.RankDto;

import java.util.List;

public interface RankService {
    List<RankDto> getRankList(Criteria cri);

    int getRankTotalCnt(String gametype);

    List<RankDto> getMyTopRank(String userId);
}
