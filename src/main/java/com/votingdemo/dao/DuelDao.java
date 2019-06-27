package com.votingdemo.dao;

import com.votingdemo.entity.Candidate;
import com.votingdemo.entity.Duel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DuelDao {
    int addDuel(Duel duel);
    //找到对决项目
    List<Duel> getDuel();
    //删除对决
    int delDuel(int d_id);

    String getTitle(int d_id);

    void updateStatus(@Param(value="d_id")int  d_id,@Param(value="status")int  status);
}
