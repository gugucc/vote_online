package com.votingdemo.entity;

public class Singers {
    private String username;

    @Override
    public String toString() {
        return "Singers{" +
                "username='" + username + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
