package hr.fer.ztel.domain;

import java.util.ArrayList;
import java.util.List;

public class CategoryHolder {
	private List<Category> categories = new ArrayList<Category>();

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	
	public void addCategory(Category category){
		categories.add(category);
	}
}
