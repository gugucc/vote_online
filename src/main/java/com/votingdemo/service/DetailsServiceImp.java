package com.votingdemo.service;

import com.votingdemo.dao.DetailsDao;
import com.votingdemo.entity.Details;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class DetailsServiceImp implements DetailsService {
    @Resource
    private DetailsDao detailsDao;

    @Override
    public int addDetails(Details details) {
        return detailsDao.addDetails(details);
    }
}
