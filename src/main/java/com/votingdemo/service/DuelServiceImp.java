package com.votingdemo.service;

import com.votingdemo.dao.DuelDao;
import com.votingdemo.entity.Duel;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
@Service
public class DuelServiceImp implements DuelService {
    @Resource
    private DuelDao duelDao;

    @Override
    public int addDuel(Duel duel) {
        return duelDao.addDuel(duel);
    }
}
