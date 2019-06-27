package com.votingdemo.service;

import com.votingdemo.dao.DuelDao;
import com.votingdemo.entity.Duel;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;

@Service
public class DuelServiceImp implements DuelService {
    @Resource
    private DuelDao duelDao;

    @Override
    public int addDuel(Duel duel) {
        return duelDao.addDuel(duel);
    }

    @Override
    public List<Duel> getDuel() {
        return duelDao.getDuel();
    }

    @Override
    public int delDuel(int d_id) {
        return duelDao.delDuel(d_id);
    }

    @Override
    public String getTitle(int d_id) {
        return duelDao.getTitle(d_id);
    }
}
