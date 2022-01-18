package kr.co.cloudci.pamaadmin;



import kr.co.cloudci.pama.minier.service.MainerService;
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

    @Test
    public void test1() {

        MainerService mainerService = new MainerService();


        Map<String, Object> result = mainerService.getStat("http://192.168.50.201:3333/stat");
        for(String key : result.keySet()) {
            System.out.println(key + " : " + result.get(key));
        };
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
