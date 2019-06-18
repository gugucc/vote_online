package com.votingdemo.dao;

import com.votingdemo.entity.admin;

public interface AdminDao {
    admin findadmin(String username);
}
