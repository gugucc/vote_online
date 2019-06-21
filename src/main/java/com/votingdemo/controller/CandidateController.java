package com.votingdemo.controller;

import com.alibaba.fastjson.JSONObject;
import com.votingdemo.entity.Candidate;
import com.votingdemo.entity.ResultMsg;
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
    public ResultMsg register(Model model, Candidate candidate){
        // 添加用户
        candidateService.addCandidate(candidate);
        return new ResultMsg(1,"新增成功");
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

}
