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

        return result.getBody();
    }
}
