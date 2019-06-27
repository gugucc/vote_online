package com.votingdemo.service;

import com.votingdemo.dao.DetailsDao;
import com.votingdemo.entity.Details;
import com.votingdemo.entity.Singers;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DetailsServiceImp implements DetailsService {
    @Resource
    private DetailsDao detailsDao;

    @Override
    public int addDetails(Details details) {
        return detailsDao.addDetails(details);
    }

    @Override
    public List<String> getDetails(int d_id) {
        return detailsDao.getDetails(d_id);
    }

    @Override
    public List<String> getVote(int d_id) {
        return detailsDao.getVote(d_id);
    }


}
