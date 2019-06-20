package com.votingdemo.dao;

import com.votingdemo.entity.Admin;

public interface AdminDao {
    Admin findadmin(String username);
}
