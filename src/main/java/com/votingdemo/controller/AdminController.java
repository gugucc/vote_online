package com.votingdemo.controller;

import com.votingdemo.entity.Admin;
import com.votingdemo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping(value="/login_Action",method= RequestMethod.POST)
    @ResponseBody
    public ModelAndView login(@RequestParam String username, @RequestParam String password, HttpServletResponse response, Model model) throws IOException {
        System.out.println("用户登录："+username+password);
        Admin admin= adminService.login(username,password);
        if (admin!=null){
            model.addAttribute("username",username);
            ModelAndView mv=new ModelAndView("index","model1",model);
            return mv;
        }else {
            ModelAndView mv=new ModelAndView("login","model1",model);
            return mv;
        }
    }

    @RequestMapping(value = "/admin-list",method = RequestMethod.GET)
    public ModelAndView adminShow(){
        List<Admin> admins=adminService.showAdmin();
        ModelAndView view=new ModelAndView("admin-list");
        view.addObject("admins",admins);
        return view;
    }

    @RequestMapping("deleteAdmin")
    public ModelAndView deleteAdmin(Admin admin) {
        adminService.deleteAdmin(admin.getId());
        ModelAndView mav = new ModelAndView("redirect:/admin-list");
        return mav;
    }

    @RequestMapping("add")
    public ModelAndView add(Admin admin){
        adminService.add(admin);
        ModelAndView mav = new ModelAndView("redirect:/admin-list");
        return mav;
    }

    @RequestMapping("upDate")
    public ModelAndView upDate(Admin admin) {
        adminService.upDate(admin);
        ModelAndView mav = new ModelAndView("redirect:/admin-list");
        return mav;
    }

    @RequestMapping("souSou")
    public ModelAndView souSou(String username){
        System.out.println(username);
        List<Admin> admins1=adminService.souSou(username);
        ModelAndView view=new ModelAndView("admin-list");
        view.addObject("admins",admins1);
        return view;
    }

    @RequestMapping("selectAdmin")
    public ModelAndView selectAdmin(int id){
        Admin admin=   adminService.selectAdmin(id);
        ModelAndView view=new ModelAndView("admin-update");
        view.addObject("adminss",admin);
        return view;
    }

}
