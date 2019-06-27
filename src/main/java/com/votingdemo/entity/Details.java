package com.votingdemo.entity;

public class Details {
    private Integer id;
    private int c_id;
    private int d_id;
    private int vote;
    private Candidate cand;

    @Override
    public String toString() {
        return "Details{" +
                "id=" + id +
                ", c_id=" + c_id +
                ", d_id=" + d_id +
                ", vote=" + vote +
                ", cand=" + cand +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public int getD_id() {
        return d_id;
    }

    public void setD_id(int d_id) {
        this.d_id = d_id;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }

    public Candidate getCand() {
        return cand;
    }

    public void setCand(Candidate cand) {
        this.cand = cand;
    }
}
