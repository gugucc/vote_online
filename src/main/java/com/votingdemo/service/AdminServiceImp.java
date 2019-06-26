package com.votingdemo.service;

import com.votingdemo.dao.AdminDao;
import com.votingdemo.dao.CandidateDao;
import com.votingdemo.entity.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AdminServiceImp implements AdminService {
    @Resource
    private AdminDao adminDao;


    @Override
    public Admin login(String username, String password) {
        return adminDao.findadmin(username,password);
    }

    @Override
    public void add(Admin admin) {
        adminDao.add(admin);
    }

    @Override
    public List<Admin> showAdmin() {
        return adminDao.showAdmin();
    }

    @Override
    public Admin selectAdmin(int id) {
        return adminDao.selectAdmin(id);
    }


    @Override
    public void upDate(Admin admin) {
        adminDao.upDate(admin);
    }

    @Override
    public void deleteAdmin(int id) {
        adminDao.deleteAdmin(id);
    }

    @Override
    public List<Admin> souSou(String username) {
        return adminDao.souSou(username);
    }
}
