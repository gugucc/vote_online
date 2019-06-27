package com.votingdemo.dao;

import com.votingdemo.entity.Candidate;
import com.votingdemo.entity.Details;
import com.votingdemo.entity.Duel;
import com.votingdemo.entity.Singers;

import java.util.List;

public interface DetailsDao {

    int addDetails(Details details);

    //找到参赛歌手
    List<String> getDetails(int d_id);

    List<String> getVote(int d_id);


}
