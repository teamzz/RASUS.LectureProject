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
@Table(name = "incorrect_answers")
public class IncorrectAnswer implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6183824271940231385L;

	@Id
	@GeneratedValue
	@Column(name = "idincorrect_answer")
	private Long idIncorrectAnswer;

	@Column(name = "text_answer")
	private String textAnswer;

	@ManyToOne
	@JoinColumn(name = "idquestion")
	private Question answerToQuestion;

	public Long getIdIncorrectAnswer() {
		return idIncorrectAnswer;
	}

	public void setIdIncorrectAnswer(Long idIncorrectAnswer) {
		this.idIncorrectAnswer = idIncorrectAnswer;
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
		return "IncorrectAnswer [idIncorrectAnswer=" + idIncorrectAnswer
				+ ", textAnswer=" + textAnswer + ", answerToQuestion="
				+ answerToQuestion.getTextQuestion() + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ (int) (idIncorrectAnswer ^ (idIncorrectAnswer >>> 32));
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
		IncorrectAnswer other = (IncorrectAnswer) obj;
		if (idIncorrectAnswer != other.idIncorrectAnswer)
			return false;
		if (textAnswer == null) {
			if (other.textAnswer != null)
				return false;
		} else if (!textAnswer.equals(other.textAnswer))
			return false;
		return true;
	}

}
