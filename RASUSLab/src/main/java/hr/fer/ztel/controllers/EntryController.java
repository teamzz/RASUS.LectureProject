package hr.fer.ztel.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class EntryController {
	
	@RequestMapping(value = "/", method= RequestMethod.GET)
	public String goToLogin() {

		return "entry";
	}

}

