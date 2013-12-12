package hr.fer.ztel.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "chosen_answer")
public class UserAnswer {

	@Id
	@GeneratedValue
	@Column(name = "idchosen_answer")
	private long idChosenAnswer;

	@ManyToOne
	@JoinColumn(name = "idquiz")
	private Quiz quiz;

	@ManyToOne
	@JoinColumn(name = "idquestion")
	private Question question;

	@Column(name = "text_answer")
	private String userAnswer;

	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public String getUserAnswer() {
		return userAnswer;
	}

	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}

	public long getIdChosenAnswer() {
		return idChosenAnswer;
	}

	public void setIdChosenAnswer(long idChosenAnswer) {
		this.idChosenAnswer = idChosenAnswer;
	}

}
