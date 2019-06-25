package com.votingdemo.controller;

import com.votingdemo.entity.Candidate;
import com.votingdemo.service.CandidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping
public class UploadController {

    @Autowired
    private CandidateService candidateService;
    //接受表单提交请求
    @RequestMapping(value="/upload_submit")
    @ResponseBody
    public Map<String,Object> upload_submit(@RequestParam("file") MultipartFile file, HttpServletRequest request, Candidate candidate) {
        Assert.notNull(file, "上传文件不能为空");
        String filepath = request.getServletContext().getRealPath("/");
        String filename = System.currentTimeMillis()+file.getOriginalFilename();
        //确保路径存在
        File file2 = new File(filepath);
        if (!file2.exists()) {
            file2.mkdirs();
        }
        String savepath = filepath+"/upload/"+filename;
        System.out.println("轮播图保存路径:"+savepath);
        /*System.out.println(username);*/

        //保存到数据库
        candidate.setImage(savepath);
        candidateService.uploadImages(candidate);

        Map map = new HashMap<String,Object>();
        try {
            //保存文件到服务器
            file.transferTo(new File(savepath));

            //返回json
            map.put("msg","ok");
            map.put("code",200);
            /*加不加这个都行
            map.put("data",new HashMap<String,Object>(){
                {
                    put("src",savepath);
                }
            });*/

        } catch (Exception e) {
            map.put("msg","error");
            map.put("code",0);
            e.printStackTrace();
        }

        return map;
    }

}
