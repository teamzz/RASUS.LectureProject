package hr.fer.ztel.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "professor", uniqueConstraints = { @UniqueConstraint(columnNames = { "username" }) })
public class Professor implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4315333716597942294L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idprofessor")
	private Long idProfessor;

	@Column(name = "first_name")
	private String name;

	@Column(name = "surname")
	private String surname;

	@Column(name = "department")
	private String department;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "creator")
	@Cascade(CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	private List<Quiz> quizes;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "creator")
	@Cascade(CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	private List<Question> questions;

	@ManyToMany(fetch = FetchType.EAGER)
	@Cascade(CascadeType.SAVE_UPDATE)
	@JoinTable(name = "professor_has_category", joinColumns = { @JoinColumn(name = "idprofessor") }, inverseJoinColumns = { @JoinColumn(name = "idcategory") })
	@Fetch(FetchMode.SELECT)
	private List<Category> categories;

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public void addCategory(Category category) {
		categories.add(category);
	}

	public void removeCategory(Category category) {
		categories.remove(category);
	}

	public Professor() {

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public long getIdProfessor() {
		return idProfessor;
	}

	public void setIdProfessor(long idProfessor) {
		this.idProfessor = idProfessor;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public List<Quiz> getQuizes() {
		return quizes;
	}

	public void setQuizes(List<Quiz> quizes) {
		this.quizes = quizes;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Question> getNotusedQuestion(Long idCategory) {

		Map<Question, Integer> questionEvidency = new HashMap<Question, Integer>();
		for (Question ques : questions) {
			if (ques.getCategory().getIdCategory() == idCategory)
				questionEvidency.put(ques, new Integer(0));
		}
		Integer tempCount;
		for (Quiz quiz : quizes) {
			for (Question tempQuest : quiz.getQuestions()) {
				if (tempQuest.getCategory().getIdCategory() == idCategory) {

					tempCount = questionEvidency.get(tempQuest) + 1;
					questionEvidency.put(tempQuest, tempCount);
				}
			}
		}

		List<Question> retval = new ArrayList<Question>();
		for (Entry<Question, Integer> quest : questionEvidency.entrySet()) {

			if (quest.getValue() == 0)
				retval.add(quest.getKey());
		}
		return retval;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((department == null) ? 0 : department.hashCode());
		result = prime * result
				+ ((idProfessor == null) ? 0 : idProfessor.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((surname == null) ? 0 : surname.hashCode());
		result = prime * result
				+ ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Professor other = (Professor) obj;
		if (department == null) {
			if (other.department != null)
				return false;
		} else if (!department.equals(other.department))
			return false;
		if (idProfessor == null) {
			if (other.idProfessor != null)
				return false;
		} else if (!idProfessor.equals(other.idProfessor))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (surname == null) {
			if (other.surname != null)
				return false;
		} else if (!surname.equals(other.surname))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

}
