package com.votingdemo.controller;

import com.votingdemo.entity.Address;
import com.votingdemo.service.IPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

@Controller
@RequestMapping
public class IPController {

    @Autowired
    private IPService ipService;

    @RequestMapping("selectIP")
    @ResponseBody
    public int selectIP(String sIP, HttpServletRequest request){
         int i = ipService.selectIP(sIP);
        /*JSONObject obj=new JSONObject();
        obj.put("data",details);*/
        System.out.println("request.getRemoteAddr(): " + request.getRemoteAddr());
        System.out.println("request.getRemoteHost(): " + request.getRemoteHost());
        System.out.println("======="+i);
        System.out.println("==========="+sIP);
        return i;
    }

    @RequestMapping(value = "/getIP",method = RequestMethod.POST)
    @ResponseBody
    public String getIP(Address address, HttpSession session, HttpServletRequest request){
        // 获取请求主机IP地址,如果通过代理进来，则透过防火墙获取真实IP地址
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_CLIENT_IP");
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
            }
        } else if (ip.length() > 15) {
            String[] ips = ip.split(",");
            for (int index = 0; index < ips.length; index++) {
                String strIp = (String) ips[index];
                if (!("unknown".equalsIgnoreCase(strIp))) {
                    ip = strIp;
                    break;
                }
            }
        }
        /*if (ip.equals("127.0.0.1")) {
            InetAddress inetAddress = null;
            try {
                inetAddress = InetAddress.getLocalHost();
            } catch (UnknownHostException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            ip = inetAddress.getHostAddress();
        }*/
        address.setIp(ip);
        int result = ipService.getIP(address);;
        if (result > 0) {
            return "index";
        } else {
            return "404";
        }

    }

}
