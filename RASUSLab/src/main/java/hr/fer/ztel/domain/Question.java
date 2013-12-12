package hr.fer.ztel.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "question", uniqueConstraints = { @UniqueConstraint(columnNames = { "idquestion" }) })
public class Question implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5493493790377676208L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idquestion", unique = true, nullable = false)
	private Long idQuestion;

	@Column(name = "text_question")
	private String textQuestion;

	@ManyToOne
	//@Cascade(CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "idcategory")
	private Category category;

	@ManyToOne()
	@Cascade(CascadeType.SAVE_UPDATE)
	@JoinColumn(name = "idprofessor")
	private Professor creator;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "answerToQuestion")
	@Cascade(CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	private List<CorrectAnswer> correctAnswers = new ArrayList<CorrectAnswer>();

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "answerToQuestion")
	@Cascade(CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	private List<IncorrectAnswer> incorrectAnswers = new ArrayList<IncorrectAnswer>();

	@Transient
	private String questionType;
	@Transient
	private int numberOfCorrectAnswers;
	@Transient
	private int numberOfIncorrectAnswers;
	
	@Transient
	private List<String> answers;
	
	public Question() {

	}

	public String getTextQuestion() {
		return textQuestion;
	}

	public void setTextQuestion(String textQuestion) {
		this.textQuestion = textQuestion;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public long getIdQuestion() {
		return idQuestion;
	}

	public void setIdQuestion(long idQuestion) {
		this.idQuestion = idQuestion;
	}

	public Professor getCreator() {
		return creator;
	}

	public void setCreator(Professor creator) {
		this.creator = creator;
	}

	public List<CorrectAnswer> getCorrectAnswers() {
		return correctAnswers;
	}

	public void setCorrectAnswers(List<CorrectAnswer> correctAnswers) {
		this.correctAnswers = correctAnswers;
	}

	public List<IncorrectAnswer> getIncorrectAnswers() {
		return incorrectAnswers;
	}

	public void setIncorrectAnswers(List<IncorrectAnswer> incorrectAnswers) {
		this.incorrectAnswers = incorrectAnswers;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public int getNumberOfCorrectAnswers() {
		return numberOfCorrectAnswers;
	}

	public void setNumberOfCorrectAnswers(int numberOfCorrectAnswers) {
		this.numberOfCorrectAnswers = numberOfCorrectAnswers;
	}

	public int getNumberOfIncorrectAnswers() {
		return numberOfIncorrectAnswers;
	}

	public void setNumberOfIncorrectAnswers(int numberOfIncorrectAnswers) {
		this.numberOfIncorrectAnswers = numberOfIncorrectAnswers;
	}

	@Override
	public String toString() {
		return "Question [idQuestion=" + idQuestion + ", textQuestion="
				+ textQuestion + ", category=" + category + ", creator="
				+ creator + "]";
	}

	private List<String> createAnswers(int numberOfQuestion) {

		List<String> answers = new ArrayList<String>();

		answers.add(getCorrectAnswers().get(0).getTextAnswer());

		int i = 1;
		for (IncorrectAnswer incorrectAnswer : getIncorrectAnswers()) {
			if (i >= numberOfQuestion)
				break;
			answers.add(incorrectAnswer.getTextAnswer());
			i++;
		}

		return answers;
	}

	public List<String> getAnswers() {
		if(answers==null)
			answers=createAnswers(4);
		System.out.println("creating ans");
		return answers;
	}

	public void setAnswers(List<String> answers) {
		this.answers = answers;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((creator == null) ? 0 : creator.hashCode());
		result = prime * result
				+ ((idQuestion == null) ? 0 : idQuestion.hashCode());
		result = prime * result
				+ ((textQuestion == null) ? 0 : textQuestion.hashCode());
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
		Question other = (Question) obj;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (creator == null) {
			if (other.creator != null)
				return false;
		} else if (!creator.equals(other.creator))
			return false;
		if (idQuestion == null) {
			if (other.idQuestion != null)
				return false;
		} else if (!idQuestion.equals(other.idQuestion))
			return false;
		if (textQuestion == null) {
			if (other.textQuestion != null)
				return false;
		} else if (!textQuestion.equals(other.textQuestion))
			return false;
		return true;
	}

}
