package com.example.groupweb2;

import jakarta.annotation.PostConstruct;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;

@AllArgsConstructor
@SpringBootApplication
public class Application {
    private Environment env;
    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(Application.class);
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);
    }

    @PostConstruct
    public void run(){
        var profiles =env.getActiveProfiles();
        var result = String.join(",",profiles);
        System.out.println("Active profile: "+ result);
    }

}
