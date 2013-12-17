package hr.fer.ztel.controllers;

import javax.servlet.http.HttpServletRequest;

import hr.fer.ztel.dao.ProfessorDao;
import hr.fer.ztel.domain.Professor;
import hr.fer.ztel.domain.Question;
import hr.fer.ztel.service.ProfessorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@Autowired
	private ProfessorDao professorDao;
	
	@RequestMapping(value = "/AddUser", method = RequestMethod.GET)
	public String addUser(Model model){
		model.addAttribute("newProfessor",new Professor());
		return "AddUser";
	}
	
	@RequestMapping(value = "/userAdded", method = RequestMethod.POST)
	public String userAdded(Model model,@ModelAttribute("newProfessor") Professor prof){
		professorDao.add(prof);
		return "AddUser";
	}
	
	@RequestMapping(value = "/checkForUser", method = RequestMethod.GET)
	public String checkForUser(Model model, HttpServletRequest request){
		String[] parts = request.getQueryString().split("=");
		try{
		if(professorDao.getProfessorByUsername(parts[1])!=null) {System.out.println("username postoji u bazi");return null;}}
		catch(Exception e){
			System.out.println("username ne postoji u bazi");
			return "closer";}
		return null;
	}
}
