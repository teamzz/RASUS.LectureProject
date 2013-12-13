package hr.fer.ztel.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.collection.internal.PersistentBag;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import hr.fer.ztel.dao.CategoryDao;
import hr.fer.ztel.dao.ProfessorDao;
import hr.fer.ztel.dao.QuestionDao;
import hr.fer.ztel.dao.QuizDao;
import hr.fer.ztel.domain.Category;
import hr.fer.ztel.domain.Professor;
import hr.fer.ztel.service.ProfessorService;



@Controller
@SessionAttributes({"categories"})
public class CategoryController {
	
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private QuizDao quizDao;
	@Autowired
	private ProfessorDao professorDao;
	@Autowired
	private ProfessorService professorService;
	
	
	
	
	@RequestMapping(value = "/Categories", method = RequestMethod.GET)
	public String categoriesHome(Model model, Principal pr){
		model.addAttribute("categories", professorDao.getProfessorByUsername(pr.getName()).getCategories());
		System.out.println((professorDao.getProfessorByUsername(pr.getName()).getCategories()).getClass());
		model.addAttribute("selectedCategory", "none");
		System.out.println("/Categories model: " + model.toString());
		return "CategoryView";
	}
	
	@RequestMapping(value = "/Category", method = RequestMethod.POST)
	public String categoryChosen(Model model, Principal pr,@ModelAttribute("selectedCategory") String cc){
		model.addAttribute("quizesByUser", professorService.getQuizMadeByProfessorInCategory(pr.getName(),Long.parseLong(cc)));
		return "CategoryChosen";
	}


}

