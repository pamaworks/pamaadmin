package kr.co.cloudci.pamaadmin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class})
public class PamaAdminApplication {



    public static void main(String[] args) {
        SpringApplication.run(PamaAdminApplication.class, args);
    }

}
