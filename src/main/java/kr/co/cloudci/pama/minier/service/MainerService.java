package kr.co.cloudci.pama.minier.service;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class MainerService {

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

    public GmainerVO getStat(String urlStr){
        //List<HttpMessageConverter<?>> converters = new ArrayList<HttpMessageConverter<?>>();
        //converters.add(new FormHttpMessageConverter());
        //converters.add(new StringHttpMessageConverter());

        RestTemplate restTemplate = new RestTemplate();
        //restTemplate.setMessageConverters(converters);

        // parameter 세팅
       // MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
        //map.add("str", "thisistest");


        // REST API 호출
        ResponseEntity<GmainerVO> result = restTemplate.getForEntity(urlStr,  GmainerVO.class);

//        System.out.println(" statusCode : " + result.getStatusCode());
//        System.out.println(" header : " + result.getHeaders());

        return result.getBody();
    }
}
