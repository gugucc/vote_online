package com.votingdemo.controller;

import com.alibaba.fastjson.JSONObject;
import com.votingdemo.entity.Candidate;
import com.votingdemo.service.CandidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping
public class CandidateController {
    @Autowired
    private CandidateService candidateService;

    @RequestMapping(value="/add_submit",method= RequestMethod.POST)
    @ResponseBody
    public int register(Model model, Candidate candidate){
        // 添加用户
        return candidateService.addCandidate(candidate);

    }

    @RequestMapping(value="/find_Candidate",method= RequestMethod.GET)
    @ResponseBody
    public Object list(){
        // 找到预备选手
        List<Candidate> candidate = candidateService.getCandidate();
        //String s = JSON.toJSONString(candidate);
        JSONObject obj=new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count",1000);
        obj.put("data",candidate);
        return obj.toJSONString();

    }



    @RequestMapping("/del")
    @ResponseBody
    public int del(int c_id){
        //删除候选歌手
        int i=candidateService.delSinger(c_id);
        System.out.println("======"+c_id);
        return i;
    }

}
