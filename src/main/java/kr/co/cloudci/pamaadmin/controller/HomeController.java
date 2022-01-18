package kr.co.cloudci.pamaadmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @RequestMapping(value = "/index", method= RequestMethod.GET)
    public String goHome(PamaAdminVO pamaAdminVO) {
        pamaAdminVO.setAge(121);


        return "index";
    }
}

