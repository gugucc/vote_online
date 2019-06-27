package com.votingdemo.dao;

import com.votingdemo.entity.Candidate;
import com.votingdemo.entity.Duel;

import java.util.List;

public interface VoteDao {

    List<String> showDuel();

    List<String> showDuelId();

    List<Duel> getDuelId();

    List<Candidate> getVoteSinger(int d_id);

    int updateVote(int d_id);
}
