package kr.co.cloudci.pamaadmin.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @author sycop78
 */
@RestController
public class HelloController {

    @RequestMapping(value="hello", method = RequestMethod.POST)
    public void greet(@RequestBody Map<String, Object> bodyMap) {
        List<String> nameList = (List<String>) bodyMap.get("nameList");
        nameList.forEach(name -> System.out.println(name));
    }

}
