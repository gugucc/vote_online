package com.votingdemo.dao;

import com.votingdemo.entity.Address;

import java.util.List;

public interface IPDao {
    int getIP(Address address);

    int selectIP(String sIP);
}
