package com.votingdemo.service;

import com.votingdemo.dao.IPDao;
import com.votingdemo.entity.Address;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class IPServiceImp implements IPService{
    @Resource
    private IPDao ipDao;

    @Override
    public int getIP(Address address) {
        return ipDao.getIP(address);
    }

    @Override
    public int selectIP(String sIP) {
        return ipDao.selectIP(sIP);
    }
}
