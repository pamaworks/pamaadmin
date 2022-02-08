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

    @RequestMapping(value = "/main", method= RequestMethod.GET)
    public String goMain(Model model) {

        MainerService mainerService = new MainerService();

        List<DevicesItem> list = new ArrayList<DevicesItem>();
        GmainerVO minerVO = new GmainerVO();
        for (int i=1;i < 10;i++){
            minerVO = mainerService.getStat("http://220.126.107.155:3333"+i+"/stat");

           for(DevicesItem devicesItem : minerVO.getDevices() ) {

               devicesItem.updateSpeedFmt(minerVO.getSpeedRatePrecision(), minerVO.getSpeedUnit());
               list.add(devicesItem);


               //mainerService.formatValue(devicesItem.getSpeed(), minerVO.getSpeedRatePrecision(), minerVO.getSpeedUnit());

//               printStr +=  " <br/> NO : [" + no + "] Name => : " + devicesItem.getName()+ " 온도 : "  +  devicesItem.getTemperature() + "C 해쉬 : " + mainerService.formatValue(devicesItem.getSpeed(), result.getSpeedRatePrecision(), result.getSpeedUnit()) ;
            };

        }

        model.addAttribute("list", list);

        return "main";
    }
}

