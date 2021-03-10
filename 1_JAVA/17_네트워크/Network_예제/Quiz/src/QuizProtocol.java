class QuizProtocol {
	private static final int WAITING = 0;
	private static final int PROBLEM = 1;
	private static final int ANSWER = 2;

	private static final int NUMPROBLEMS = 3;

	private int state = WAITING;
	private int currentProblem = 0;

	private String[] problems = { "네트워크 처리 패키지는?", "자바의 최신버전은?",
			"인터넷에서 컴퓨터를 식별하는 주소는?" };
	private String[] answers = { "java.io", "1.6", "IP 주소" };

	public String process(String theInput) {
		String theOutput = null;

		if (state == WAITING) {
			theOutput = "퀴즈를 시작합니다(y/n)";
			state = PROBLEM;
		} else if (state == PROBLEM) {
			if (theInput.equalsIgnoreCase("y")) {
				theOutput = problems[currentProblem];
				state = ANSWER;
			} else {
				state = WAITING;
				theOutput = "quit";
			}
		} else if (state == ANSWER) {
			if (theInput.equalsIgnoreCase(answers[currentProblem])) {
				theOutput = "정답입니다. 계속하시겠습니까? (y/n)";
				state = PROBLEM;
			} else {
				state = PROBLEM;
				theOutput = "오답입니다. 계속하시겠습니까? (y/n)";
			}
			currentProblem = (currentProblem + 1) % NUMPROBLEMS;
		}
		return theOutput;
	}
}
