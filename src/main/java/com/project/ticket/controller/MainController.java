package com.project.ticket.controller;

import com.project.ticket.dto.MemberDTO;
import com.project.ticket.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {

    @Autowired
    private FlightService flightService;

    @GetMapping("/save")
    public String saveForm() {
        return "memberSave";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        int saveResult = flightService.save(memberDTO);
        if (saveResult > 0) {
            return "memberLogin";
        } else {
            return "index";
        }
    }


}
