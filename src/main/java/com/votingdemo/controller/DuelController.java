package com.votingdemo.controller;

import com.votingdemo.entity.Duel;
import com.votingdemo.service.DuelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
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

}
