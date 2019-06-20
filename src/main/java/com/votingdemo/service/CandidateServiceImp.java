package com.votingdemo.service;

import com.votingdemo.dao.CandidateDao;
import com.votingdemo.entity.Candidate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CandidateServiceImp implements CandidateService {
    @Resource
    private CandidateDao candidateDao;

    @Override
    public void addCandidate(Candidate candidate) {
        candidateDao.addCandidate(candidate);
    }

    @Override
    public List<Candidate> getCandidate() {
        return candidateDao.getCandidate();
    }


}