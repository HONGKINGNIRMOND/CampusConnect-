package com.university.lms.submission.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/submissions")
    public String submissions() {
        return "submissions";
    }

    @GetMapping("/projects")
    public String projects() {
        return "projects";
    }
}