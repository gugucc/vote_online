package com.votingdemo.dao;

import com.votingdemo.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {
    Admin findadmin(@Param("username")String username,@Param("password") String password);
}
