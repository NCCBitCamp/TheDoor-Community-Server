package com.bit.springboard.service;

import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.RankDto;

import java.util.List;
import java.util.Map;

public interface RankService {
    List<RankDto> getRankList(Criteria cri);

    int getRankTotalCnt(String gametype);

    RankDto getMyTopRanktheHostel(RankDto rankDto);
    RankDto getMyTopRankbitCamp(RankDto rankDto);
    RankDto getMyTopRankrozerStone(RankDto rankDto);

}
