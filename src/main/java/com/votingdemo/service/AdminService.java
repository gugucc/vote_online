package com.votingdemo.service;

import com.votingdemo.entity.Admin;

public interface AdminService  {
    Admin login(String username,String password);

}
