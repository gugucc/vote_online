package com.votingdemo.service;

import com.votingdemo.entity.Candidate;
import com.votingdemo.entity.Duel;

import java.util.List;

public interface VoteService {
    List<String> showDuel();

    List<String> showDuelId();

    List<Duel> getDuelId();

    List<Candidate> getVoteSinger(int d_id);

    void updateVote(int d_id,int c_id);
}
