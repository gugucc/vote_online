package com.votingdemo.service;

import com.votingdemo.entity.Details;
import com.votingdemo.entity.Singers;

import java.util.List;

public interface DetailsService {
    int addDetails(Details details);

    //找到参赛歌手
    List<String> getDetails(int d_id);

    List<String> getVote(int d_id);


}
