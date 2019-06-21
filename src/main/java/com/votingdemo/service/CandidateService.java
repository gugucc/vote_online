package com.votingdemo.service;

import com.votingdemo.entity.Candidate;
import com.votingdemo.entity.Product;

import java.util.List;

public interface CandidateService {
    //添加候选人
    void addCandidate(Candidate candidate);
    //上传图片
    void uploadImages(Candidate candidate);

    //找到候选人
    List<Candidate> getCandidate();
}
