package com.votingdemo.controller;

import com.votingdemo.entity.Details;
import com.votingdemo.service.DetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping
public class DetailsController {
    @Autowired
    private DetailsService detailsService;

    @RequestMapping("/addDetails")
    @ResponseBody
    public int addDetails(Details details){
        //添加比赛歌手
        return detailsService.addDetails(details);

    }

}
