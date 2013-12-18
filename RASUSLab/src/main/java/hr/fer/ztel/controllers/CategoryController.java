package hr.fer.ztel.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import hr.fer.ztel.domain.Question;
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
	public String categoriesHome(Model model, Principal pr, HttpServletRequest request){
		model.addAttribute("categories", professorDao.getProfessorByUsername(pr.getName()).getCategories());
		System.out.println("quer " + request.getQueryString());
		
		if (request.getQueryString()!=null && request.getQueryString()!=""){
			String str = request.getQueryString().replaceAll("\\D+","");
			long cc = Long.parseLong(str);
			Category selectedCategory = categoryDao.find(cc);
			if (professorDao.getProfessorByUsername(pr.getName()).getCategories().contains(selectedCategory) ){
				model.addAttribute("selectedCategory",selectedCategory);
				model.addAttribute("quizesByUser", professorService.getQuizMadeByProfessorInCategory(pr.getName(),cc));}
		}
		
		return "CategoryChosen";
	}
	
	
	/*
	@RequestMapping(value = "/Categories", method = RequestMethod.GET)
	public String categoriesHome(Model model, Principal pr){
		model.addAttribute("categories", professorDao.getProfessorByUsername(pr.getName()).getCategories());
		model.addAttribute("selectedCategory", "none");
		return "CategoryView";
	}
	
	@RequestMapping(value = "/Category", method = RequestMethod.POST)
	public String categoryChosen(Model model, Principal pr,@ModelAttribute("selectedCategory") String cc){
		Category selectedCategory = categoryDao.find(Long.parseLong(cc));
		model.addAttribute("selectedCategoryName",selectedCategory.getCategoryName());
		model.addAttribute("quizesByUser", professorService.getQuizMadeByProfessorInCategory(pr.getName(),Long.parseLong(cc)));
		return "CategoryChosen";
	}
	*/
	@RequestMapping(value = "/AddCategory", method = RequestMethod.GET)
	public String addCategory(Model model){
		model.addAttribute("newCategory",new Category());
		return "AddCategory";
		
	}
	@RequestMapping(value = "/categoryAdded", method = RequestMethod.POST)
	public String categoryAdded(Model model, @ModelAttribute("newCategory") Category cat, Principal pr){
		categoryDao.add(cat);
		Professor prof = professorDao.getProfessorByUsername(pr.getName());
		prof.addCategory(cat);
		professorDao.update(prof);
		return "closer";
	}
	
	@RequestMapping(value = "/Categories/overview", method = RequestMethod.GET)
	public String categoriesOverview(Model model, Principal pr){
		List<Category> categories = professorDao.getProfessorByUsername(
				(pr.getName())).getCategories();
		model.addAttribute("categories", categories);
		return "CategoriesOverview";
	}
	
	@RequestMapping(value = "/Categories/overview/delete", method = RequestMethod.GET)
	public String deleteCategory(Model model, HttpServletRequest request, Principal pr ){
		String requestString = request.getQueryString();
		String categoryId = requestString.replaceAll("\\D+", "");
		Professor user = professorDao.getProfessorByUsername(pr.getName());
		List<Category> categories = user.getCategories();
		Category deletingCategory = categoryDao.find(Long.parseLong(categoryId));
		if (categories.contains(deletingCategory))
			categoryDao.remove(deletingCategory);
		categories = professorDao.getProfessorByUsername(
				(pr.getName())).getCategories();
		model.addAttribute("categories", categories);
		return "CategoriesOverview";
	}
	




}

