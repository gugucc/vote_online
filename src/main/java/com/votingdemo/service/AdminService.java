package com.votingdemo.service;

import com.votingdemo.entity.Admin;

import java.util.List;

public interface AdminService  {
    Admin login(String username,String password);

    void add(Admin admin);

    List<Admin> showAdmin();

    Admin selectAdmin(int id);

    void upDate(Admin admin);

    void deleteAdmin(int id);

    List<Admin> souSou(String username);

}
