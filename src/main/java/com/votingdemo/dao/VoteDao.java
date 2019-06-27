package com.votingdemo.dao;

import com.votingdemo.entity.Candidate;
import com.votingdemo.entity.Duel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VoteDao {

    List<String> showDuel();

    List<String> showDuelId();

    List<Duel> getDuelId();

    List<Candidate> getVoteSinger(int d_id);

    void updateVote(@Param("d_id")int d_id, @Param("c_id") int c_id);
}
