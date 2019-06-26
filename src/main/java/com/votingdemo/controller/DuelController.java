package com.votingdemo.controller;

import com.alibaba.fastjson.JSONObject;
import com.votingdemo.entity.Candidate;
import com.votingdemo.entity.Duel;
import com.votingdemo.service.DuelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping
public class DuelController {
    @Autowired
    private DuelService duelService;

    @RequestMapping(value="/addDuel")
    @ResponseBody
    public int addDuel( Duel duel){

        return duelService.addDuel(duel);
    }

    @RequestMapping(value="/find_Duel",method= RequestMethod.GET)
    @ResponseBody
    public Object list(){
        // 找到对决项目
        List<Duel> duel = duelService.getDuel();
        //String s = JSON.toJSONString(candidate);
        JSONObject obj=new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count",1000);
        obj.put("data",duel);
        return obj.toJSONString();

    }

    @RequestMapping(value="/duel-list",method= RequestMethod.GET)
    @ResponseBody
    public ModelAndView duellist(){
        // 找到对决项目
        List<Duel> duel = duelService.getDuel();
        ModelAndView view=new ModelAndView("duel-list");
        view.addObject("Duel",duel);
        return view;

    }

    @RequestMapping("/delDuel")
    @ResponseBody
    public int delDul(int d_id){
        //删除雇员
        int i=duelService.delDuel(d_id);
        System.out.println("======"+d_id);
        return i;
    }
}
