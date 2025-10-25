package com.university.lms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/students")
    public String students() {
        return "students";
    }

    @GetMapping("/faculties")
    public String faculties() {
        return "faculties";
    }
}