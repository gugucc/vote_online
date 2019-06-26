package com.votingdemo.dao;

import com.votingdemo.entity.Candidate;


import java.util.List;

public interface CandidateDao {
    //添加候选人
    void addCandidate(Candidate candidate);
    //上传图片
    void uploadImages(Candidate candidate);
    //找到候选人
    List<Candidate> getCandidate();

    int delSinger(int c_id);
}
