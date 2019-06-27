package com.votingdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("")
public class ViewController {

    @RequestMapping("index")
    public ModelAndView index(){
        ModelAndView mv=new ModelAndView("/index");
        return mv;
    }

    @RequestMapping("welcome")
    public ModelAndView welcome(){
        ModelAndView mv=new ModelAndView("/welcome");
        return mv;
    }

    @RequestMapping("admin-add")
    public ModelAndView adminadd(){
        ModelAndView mv=new ModelAndView("/admin-add");
        return mv;
    }

    @RequestMapping("admin-list")
    public ModelAndView adminlist(){
        ModelAndView mv=new ModelAndView("/admin-list");
        return mv;
    }


    @RequestMapping("error")
    public ModelAndView error(){
        ModelAndView mv=new ModelAndView("/error");
        return mv;
    }

    @RequestMapping("login")
    public ModelAndView login(){
        ModelAndView mv=new ModelAndView("/login");
        return mv;
    }



    @RequestMapping("candidate-list")
    public ModelAndView candidatelist(){
        ModelAndView mv=new ModelAndView("candidate-list");
        return mv;
    }

    @RequestMapping("vote-add")
    public ModelAndView voteadd(){
        ModelAndView mv=new ModelAndView("vote-add");
        return mv;
    }

    @RequestMapping("duel-list")
    public ModelAndView duellist(){
        ModelAndView mv=new ModelAndView("duel-list");
        return mv;
    }


    @RequestMapping("welcome1")
    public ModelAndView welcome1(){
        ModelAndView mv=new ModelAndView("/welcome1");
        return mv;
    }

    @RequestMapping("echarts4")
    public ModelAndView echarts4(){
        ModelAndView mv=new ModelAndView("/echarts4");
        return mv;
    }

    @RequestMapping("candidate-add")
    public ModelAndView candidateadd(){
        ModelAndView mv=new ModelAndView("candidate-add");
        return mv;
    }

    @RequestMapping("duel-add")
    public ModelAndView duel_add(){
        ModelAndView mv=new ModelAndView("/duel-add");
        return mv;
    }

    @RequestMapping("singer-add")
    public String singeradd(int d_id, Model model){
        System.out.println("======"+d_id);
        model.addAttribute("d_id",d_id);
        return "singer-add";
    }

}
