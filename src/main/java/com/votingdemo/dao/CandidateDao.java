package com.votingdemo.dao;

import com.votingdemo.entity.Candidate;

import java.util.List;

public interface CandidateDao {
    //添加候选人
    void addCandidate(Candidate candidate);
    //找到候选人
    List<Candidate> getCandidate();
}
