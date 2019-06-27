package com.votingdemo.controller;

import com.alibaba.fastjson.JSONObject;
import com.votingdemo.entity.Details;
import com.votingdemo.entity.Duel;
import com.votingdemo.entity.Singers;
import com.votingdemo.service.DetailsService;
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
public class DetailsController {
    @Autowired
    private DetailsService detailsService;

    @RequestMapping("/addDetails")
    @ResponseBody
    public int addDetails(Details details){
        //添加比赛歌手
        return detailsService.addDetails(details);

    }

    @RequestMapping("show-singer")
    public String showsinger(int d_id, Model model){
        /*List<String> details=detailsService.getDetails();*/
        /*JSONObject obj=new JSONObject();
        obj.put("data",details);*/
        System.out.println("======"+d_id);
        model.addAttribute("d_id",d_id);

        return "show-singer";
    }

    @RequestMapping("singer-name")
    @ResponseBody
    public List<String> singername(int d_id){
        List<String> details=detailsService.getDetails(d_id);
        /*JSONObject obj=new JSONObject();
        obj.put("data",details);*/
        System.out.println("======"+d_id);
        System.out.println("======"+details);
        return details;
    }

    @RequestMapping("singer-vote")
    @ResponseBody
    public List<String> singervote(int d_id){
        List<String> vote=detailsService.getVote(d_id);
        /*JSONObject obj=new JSONObject();
        obj.put("data",details);*/
        System.out.println("======"+d_id);
        System.out.println("======"+vote);
        return vote;
    }



}
