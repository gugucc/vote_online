package com.votingdemo.service;

import com.votingdemo.entity.Address;

import java.util.List;

public interface IPService {
    int getIP(Address address);

    int selectIP(String sIP);
}
