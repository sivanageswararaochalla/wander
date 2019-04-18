package com.wander.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	@RequestMapping(method = RequestMethod.GET, value = "/")
    public ModelAndView getIndexPage() {
	  return new ModelAndView("home");
    }
	
}
