package kr.co.cloudci.pamaadmin.controller;

import kr.co.cloudci.pama.minier.service.DevicesItem;
import kr.co.cloudci.pama.minier.service.MainerService;
import kr.co.cloudci.pama.minier.service.Response;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @RequestMapping(value = "/main", method= RequestMethod.GET)
    public String goMain(PamaAdminVO pamaAdminVO) {
        pamaAdminVO.setAge(121);

        MainerService mainerService = new MainerService();

        String printStr="";
        int no=0;
        for (int i=1;i < 10;i++){
            Response result = mainerService.getStat("http://220.126.107.155:3333"+i+"/stat");

            for(DevicesItem devicesItem : result.getDevices() ) {
                no++;


                printStr +=  " <br/> NO : [" + no + "] Name => : " + devicesItem.getName()+ " 온도 : "  +  devicesItem.getTemperature() + "C 해쉬 : " + mainerService.formatValue(devicesItem.getSpeed(), result.getSpeedRatePrecision(), result.getSpeedUnit()) ;
            };

        }

        pamaAdminVO.setPrintString(printStr);

        return "main";
    }
}

