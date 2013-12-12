package hr.fer.ztel.controllers;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hr.fer.ztel.dao.CategoryDao;
import hr.fer.ztel.dao.QuestionDao;
import hr.fer.ztel.dao.QuizDao;
import hr.fer.ztel.domain.Category;



@Controller
public class CategoryController {
	
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private QuizDao quizDao;
	
	
	
	@RequestMapping(value = "/Categories", method = RequestMethod.GET)
	public String categoriesHome(Model model){
		model.addAttribute("categories",categoryDao.list());
		model.addAttribute("quizes",quizDao.list());
		return "CategoryView";
	}


}

