package hr.fer.ztel.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MapKey;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "quiz")
public class Quiz implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 350246950397698204L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idquiz")
	private Long idQuiz;

	@Column(name = "quiz_name")
	private String quizName;

	@Column(name = "activated")
	private boolean activated;

	@ManyToOne
	@JoinColumn(name = "idprofessor")
	private Professor creator;

	@ManyToOne
	@JoinColumn(name = "idcategory")
	private Category category;

	@Column(name = "code")
	private String code;

	// @OneToMany(fetch = FetchType.EAGER, mappedBy = "pk.quiz")
	// @Fetch(FetchMode.SELECT)
	// private List<QuestionInQuizInformation> questions;
	//
	// public List<QuestionInQuizInformation> getQuestions() {
	// return questions;
	// }
	//
	// public void setQuestions(List<QuestionInQuizInformation> questions) {
	// this.questions = questions;
	// }

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "pk.quiz", orphanRemoval = true)
	@Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
	@MapKey(name = "orderNumber")
	@Fetch(FetchMode.SELECT)
	private Map<Integer, QuestionInQuizInformation> questionsInformation = new HashMap<Integer, QuestionInQuizInformation>();

	@Transient
	private List<Question> questions;

	public List<Question> getQuestions() {
		List<Question> retval = new ArrayList<Question>(
				questionsInformation.size());
		for (Entry<Integer, QuestionInQuizInformation> question : questionsInformation
				.entrySet()) {
			retval.add(question.getKey(), question.getValue().getQuestion());
		}
		return retval;
	}

	public QuestionInQuizInformation getNextNotactivatedQuestion() {
		QuestionInQuizInformation quinftemp;
		for (int i = 0; i < questionsInformation.size(); i++) {
			quinftemp = questionsInformation.get(new Integer(i));
			if (!quinftemp.getFinished()) {
				return quinftemp;
			}
		}
		return null;
	}
	
	public QuestionInQuizInformation getActivatedQuestion() {
		QuestionInQuizInformation quinftemp;
		for (int i = 0; i < questionsInformation.size(); i++) {
			quinftemp = questionsInformation.get(new Integer(i));
			if (quinftemp.getActivated()) {
				return quinftemp;
			}
		}
		return null;
	}
	

	public Map<Integer, QuestionInQuizInformation> getQuestionsInformation() {
		return questionsInformation;
	}

	public void setQuestionsInformation(
			Map<Integer, QuestionInQuizInformation> questionsInformation) {
		this.questionsInformation = questionsInformation;
	}

	public void setQuestion(List<Question> questionList) {
		this.questions = questionList;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Quiz() {
	}

	public long getIdQuiz() {
		return idQuiz;
	}

	public void setIdQuiz(long idQuiz) {
		this.idQuiz = idQuiz;
	}

	public String getQuizName() {
		return quizName;
	}

	public void setQuizName(String quizName) {
		this.quizName = quizName;
	}

	public boolean isActivated() {
		return activated;
	}

	public void setActivated(boolean activated) {
		this.activated = activated;
	}

	public Professor getCreator() {
		return creator;
	}

	public void setCreator(Professor creator) {
		this.creator = creator;
	}

	public void addQuestionInQuizInformation(QuestionInQuizInformation qinf) {
		qinf.setOrderNumber(questionsInformation.size());
		questionsInformation.put(questionsInformation.size(), qinf);
	}

	public void deleteQuestion(Long questionId) {
		Integer index = null;
		for (Entry<Integer, QuestionInQuizInformation> quinfor : questionsInformation
				.entrySet()) {
			if (quinfor.getValue().getQuestion().getIdQuestion() == questionId) {
				index = quinfor.getKey();
				break;
			}

		}
		questionsInformation.remove(index);

	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (activated ? 1231 : 1237);
		result = prime * result
				+ ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result + ((creator == null) ? 0 : creator.hashCode());
		result = prime * result + ((idQuiz == null) ? 0 : idQuiz.hashCode());
		result = prime * result
				+ ((quizName == null) ? 0 : quizName.hashCode());
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
		Quiz other = (Quiz) obj;
		if (activated != other.activated)
			return false;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (creator == null) {
			if (other.creator != null)
				return false;
		} else if (!creator.equals(other.creator))
			return false;
		if (idQuiz == null) {
			if (other.idQuiz != null)
				return false;
		} else if (!idQuiz.equals(other.idQuiz))
			return false;
		if (quizName == null) {
			if (other.quizName != null)
				return false;
		} else if (!quizName.equals(other.quizName))
			return false;
		return true;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
