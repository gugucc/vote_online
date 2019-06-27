package com.votingdemo.entity;

import java.sql.Timestamp;

public class Duel {
    private Integer d_id;
    private String title;
    private Timestamp startime;
    private Integer status;

    @Override
    public String toString() {
        return "Duel{" +
                "d_id=" + d_id +
                ", title='" + title + '\'' +
                ", startime=" + startime +
                ", status=" + status +
                '}';
    }

    public int getD_id() {
        return d_id;
    }

    public void setD_id(int d_id) {
        this.d_id = d_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getStartime() {
        return startime;
    }

    public void setStartime(Timestamp startime) {
        this.startime = startime;
    }

    public void setD_id(Integer d_id) {
        this.d_id = d_id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
