package com.votingdemo.entity;

public class ResultMsg {
    private int flag;//消息标识
    private String msg;//消息内容

    public ResultMsg(int flag, String msg){
        this.flag=flag;
        this.msg=msg;
    }

    public int getFlag() {
        return flag;
    }
    public void setFlag(int flag) {
        this.flag = flag;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
}
