package com.votingdemo.service;

import com.votingdemo.dao.VoteDao;
import com.votingdemo.entity.Candidate;
import com.votingdemo.entity.Duel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class VoteServiceImp implements VoteService{
    @Resource
    private VoteDao voteDao;

    @Override
    public List<String> showDuel() {
        return voteDao.showDuel();
    }

    @Override
    public List<String> showDuelId() {
        return voteDao.showDuelId();
    }

    @Override
    public List<Duel> getDuelId() {
        return voteDao.getDuelId();
    }

    @Override
    public List<Candidate> getVoteSinger(int d_id) {
        return voteDao.getVoteSinger(d_id);
    }

    @Override
    public void updateVote(int d_id,int c_id) {
         voteDao.updateVote(d_id,c_id);
    }


}
