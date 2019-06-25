package com.votingdemo.controller;

import com.votingdemo.entity.Vote_number;
import com.votingdemo.service.Vote_numberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("")
public class Vote_numberController {
    @Autowired
    private Vote_numberService vote_numberService;
    @RequestMapping("/votenumber")
    @ResponseBody
    public int getnumber(Vote_number vote_number){
        return vote_numberService.getNumberById(vote_number);
    }
}
