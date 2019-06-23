package com.votingdemo.service;

import com.votingdemo.dao.AdminDao;
import com.votingdemo.dao.CandidateDao;
import com.votingdemo.entity.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminServiceImp implements AdminService {
    @Resource
    private AdminDao adminDao;

    @Override
    public Admin login(String username, String password) {
        return adminDao.findadmin(username,password);
    }
}
