package hr.fer.ztel.domain;

public class AjaxQuestionSubmit {
	private Long idQuiz;
	private Long idQuestion;
	private String answer;
	
	public AjaxQuestionSubmit()
	{}

	public Long getIdQuiz() {
		return idQuiz;
	}

	public void setIdQuiz(Long idQuiz) {
		this.idQuiz = idQuiz;
	}

	public Long getIdQuestion() {
		return idQuestion;
	}

	public void setIdQuestion(Long idQuestion) {
		this.idQuestion = idQuestion;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
}
