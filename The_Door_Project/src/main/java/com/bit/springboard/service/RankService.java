package com.bit.springboard.service;

import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.RankDto;

import java.util.List;

public interface RankService {
    List<RankDto> getRankList(Criteria cri);

    int getRankTotalCnt(String gametype);

    RankDto getMyTopRanktheHostel(String userId);
    RankDto getMyTopRankbitCamp(String userId);
    RankDto getMyTopRankrozerStone(String userId);

    List<RankDto> getMyTopRank(String userId);
}
