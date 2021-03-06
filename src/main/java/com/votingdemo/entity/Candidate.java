package com.votingdemo.entity;

public class Candidate {
    private Integer c_id;
    private String username;
    private String project;
    private String sex;
    private String image;

    @Override
    public String toString() {
        return "Candidate{" +
                "c_id=" + c_id +
                ", username='" + username + '\'' +
                ", project='" + project + '\'' +
                ", sex='" + sex + '\'' +
                ", image='" + image + '\'' +
                '}';
    }

    public Integer getC_id() {
        return c_id;
    }

    public void setC_id(Integer c_id) {
        this.c_id = c_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
