package hr.fer.ztel.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "correct_answer")
public class CorrectAnswer implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1311507937501725829L;

	@Id
	@GeneratedValue
	@Column(name = "idcorrect_answers")
	private Long idCorrectAnswer;

	@Column(name = "text_answer")
	private String textAnswer;

	@ManyToOne
	@JoinColumn(name = "idquestion")
	private Question answerToQuestion;

	public long getIdCorrectAnswer() {
		return idCorrectAnswer;
	}

	public void setIdCorrectAnswer(long idCorrectAnswer) {
		this.idCorrectAnswer = idCorrectAnswer;
	}

	public String getTextAnswer() {
		return textAnswer;
	}

	public void setTextAnswer(String textAnswer) {
		this.textAnswer = textAnswer;
	}

	public Question getAnswerToQuestion() {
		return answerToQuestion;
	}

	public void setAnswerToQuestion(Question answerToQuestion) {
		this.answerToQuestion = answerToQuestion;
	}

	@Override
	public String toString() {
		return "CorrectAnswer [idCorrectAnswer=" + idCorrectAnswer
				+ ", textAnswer=" + textAnswer + ", answerToQuestion="
				+ answerToQuestion.getTextQuestion() + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idCorrectAnswer == null) ? 0 : idCorrectAnswer.hashCode());
		result = prime * result
				+ ((textAnswer == null) ? 0 : textAnswer.hashCode());
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
		CorrectAnswer other = (CorrectAnswer) obj;
		if (idCorrectAnswer == null) {
			if (other.idCorrectAnswer != null)
				return false;
		} else if (!idCorrectAnswer.equals(other.idCorrectAnswer))
			return false;
		if (textAnswer == null) {
			if (other.textAnswer != null)
				return false;
		} else if (!textAnswer.equals(other.textAnswer))
			return false;
		return true;
	}

	

}
