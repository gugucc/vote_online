package com.votingdemo.service;

import com.votingdemo.entity.Duel;

import java.util.List;

public interface DuelService {
    int addDuel(Duel duel);
    //找到对决项目
    List<Duel> getDuel();

    int delDuel(int d_id);

    String getTitle(int d_id);

    void updateStatus(int d_id,int status);
}
