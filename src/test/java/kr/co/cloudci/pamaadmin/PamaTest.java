package kr.co.cloudci.pamaadmin;



import kr.co.cloudci.pama.minier.service.DevicesItem;
import kr.co.cloudci.pama.minier.service.MainerService;
import kr.co.cloudci.pama.minier.service.Response;
import org.junit.jupiter.api.Test;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class PamaTest {

    public String formatValue(int value, int defaultPrecision, String valueUnit) {
        if (value >= 1000000000)
            return ((value / 1000000000) + " G" + valueUnit);
        else if (value >= 1000000)
            return ((value / 1000000) + " M" + valueUnit);
        else if (value >= 1000)
            return ((value / 1000) + " K" + valueUnit);
        else
            return (value + " " + valueUnit);
    }

    @Test
    public void test1() {

        MainerService mainerService = new MainerService();

        for (int i=1;i < 9;i++){
            Response result = mainerService.getStat("http://192.168.50.20"+i+":3333/stat");
            for(DevicesItem  devicesItem : result.getDevices() ) {

                System.out.println(" Hash : " + devicesItem.getName()+ " "  + formatValue(devicesItem.getSpeed(), result.getSpeedRatePrecision(), result.getSpeedUnit()) );
            };

        }



           //System.out.println(result.toString());

//            try {
//
//                Thread.sleep(1000); //1초 대기
//
//            } catch (InterruptedException e) {
//
//                e.printStackTrace();
//
//            }



    }
}
