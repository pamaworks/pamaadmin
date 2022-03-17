package kr.co.cloudci.pamaadmin.controller;

import kr.co.cloudci.pama.minier.service.DevicesItem;
import kr.co.cloudci.pama.minier.service.MainerService;
import kr.co.cloudci.pama.minier.service.GmainerVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String goMain(Model model) {

        MainerService mainerService = new MainerService();

        List<DevicesItem> list = new ArrayList<DevicesItem>();
        GmainerVO minerVO = new GmainerVO();

        for (int i = 1; i < 8; i++) {
            minerVO = mainerService.getStat("http://192.168.50.20" + i + ":3333/stat");


            for (DevicesItem devicesItem : minerVO.getDevices()) {

                devicesItem.updateAddField(minerVO.getSpeedRatePrecision(), minerVO.getSpeedUnit(), minerVO.getPowerUnit());
                list.add(devicesItem);
             }

        }

        model.addAttribute("list", list);

        return "main";
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String goAll(Model model) {

        MainerService mainerService = new MainerService();

        List<DevicesItem> list = new ArrayList<DevicesItem>();
        GmainerVO minerVO = new GmainerVO();

        for (int i = 1; i < 2; i++) {
            minerVO = mainerService.getStat("http://192.168.50.201:3333/stat");

            for (DevicesItem devicesItem : minerVO.getDevices()) {

                devicesItem.updateAddField(minerVO.getSpeedRatePrecision(), minerVO.getSpeedUnit(), minerVO.getPowerUnit());
                list.add(devicesItem);
            }

        }

        model.addAttribute("list", list);

        return "main";
    }
}