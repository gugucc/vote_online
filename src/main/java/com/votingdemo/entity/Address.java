package com.votingdemo.entity;

import java.sql.Timestamp;

public class Address {
    private int id;
    private String ip;
    private Timestamp vote_time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Timestamp getVote_time() {
        return vote_time;
    }

    public void setVote_time(Timestamp vote_time) {
        this.vote_time = vote_time;
    }
}
