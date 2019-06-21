package com.votingdemo.service;


import com.votingdemo.dao.AdminDao;
import com.votingdemo.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminServiceImp implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin login(String username) {

        return adminDao.findadmin(username);
    }

}