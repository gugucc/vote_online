package com.votingdemo.service;

import com.votingdemo.entity.Candidate;

import java.util.List;

public interface CandidateService {
    //添加候选人
    int addCandidate(Candidate candidate);
    //上传图片
    void uploadImages(Candidate candidate);

    //找到候选人
    List<Candidate> getCandidate();
    //删除候选人
    int delSinger(int c_id);
}
