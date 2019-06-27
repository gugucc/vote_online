package com.votingdemo.controller;

import com.votingdemo.entity.Candidate;
import com.votingdemo.entity.Duel;
import com.votingdemo.service.VoteService;
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
public class VoteController {
    @Autowired
    private VoteService voteService;

   /* @RequestMapping("one")
    public ModelAndView voteView(){
        ModelAndView mv=new ModelAndView("/one");
        return mv;
    }*/

    @RequestMapping("Tp")
    public ModelAndView vote(){
        ModelAndView mv=new ModelAndView("/Tp");
        return mv;
    }

    @RequestMapping(value="show-Duel")
    @ResponseBody
    public List<String> showDuel(){
        List<String> title=voteService.showDuel();
        /*JSONObject obj=new JSONObject();
        obj.put("data",details);*/
        System.out.println("======"+title);
        return title;
    }

    @RequestMapping(value="show-DuelId")
    @ResponseBody
    public List<String> showDuelId(){
        List<String> id=voteService.showDuelId();
        /*JSONObject obj=new JSONObject();
        obj.put("data",details);*/
        System.out.println("======"+id);
        return id;
    }

    @RequestMapping(value="/one",method= RequestMethod.GET)
    @ResponseBody
    public ModelAndView duellist(){
        // 找到对决项目
        List<Duel> duel = voteService.getDuelId();
        ModelAndView view=new ModelAndView("one");
        view.addObject("Duel",duel);
        System.out.println("======"+duel);
        return view;

    }


    @RequestMapping(value="/Tp",method= RequestMethod.GET)
    @ResponseBody
    public ModelAndView getVoteSinger(int d_id,Model model){
        // 找到对决项目
        List<Candidate> candidate = voteService.getVoteSinger(d_id);
        ModelAndView view=new ModelAndView("Tp","model",model);
        view.addObject("Candidate",candidate);
        model.addAttribute("d_id",d_id);
        System.out.println("======"+candidate);
        return view;
    }

    @RequestMapping(value="/updateVote",method= RequestMethod.GET)
    @ResponseBody
    public int updateVote(int d_id,Model model){
        int i = voteService.updateVote(d_id);
        model.addAttribute("d_id",d_id);
        System.out.println("======"+i);
        System.out.println("======"+d_id);
        return i;
    }

}
