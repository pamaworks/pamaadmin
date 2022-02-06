package kr.co.cloudci.pama.minier.service;

import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.AsyncRestTemplate;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    public Response getStat(String urlStr){
        //List<HttpMessageConverter<?>> converters = new ArrayList<HttpMessageConverter<?>>();
        //converters.add(new FormHttpMessageConverter());
        //converters.add(new StringHttpMessageConverter());

        RestTemplate restTemplate = new RestTemplate();
        //restTemplate.setMessageConverters(converters);

        // parameter 세팅
       // MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
        //map.add("str", "thisistest");


        // REST API 호출
        ResponseEntity<Response> result = restTemplate.getForEntity(urlStr,  Response.class);

//        System.out.println(" statusCode : " + result.getStatusCode());
//        System.out.println(" header : " + result.getHeaders());

        return result.getBody();
    }
}
