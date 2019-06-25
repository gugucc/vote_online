package com.votingdemo.service;

import com.votingdemo.dao.Vote_numberDao;
import com.votingdemo.entity.Vote_number;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class Vote_numberServiceImp implements Vote_numberService {
    @Resource
    private Vote_numberDao vote_numberDao;
    @Override
    public int getNumberById(Vote_number vote_number){
        return vote_numberDao.getNumberById(vote_number);
    }
}
