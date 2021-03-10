class QuizProtocol {
	private static final int WAITING = 0;
	private static final int PROBLEM = 1;
	private static final int ANSWER = 2;

	private static final int NUMPROBLEMS = 3;

	private int state = WAITING;
	private int currentProblem = 0;

	private String[] problems = { "��Ʈ��ũ ó�� ��Ű����?", "�ڹ��� �ֽŹ�����?",
			"���ͳݿ��� ��ǻ�͸� �ĺ��ϴ� �ּҴ�?" };
	private String[] answers = { "java.io", "1.6", "IP �ּ�" };

	public String process(String theInput) {
		String theOutput = null;

		if (state == WAITING) {
			theOutput = "��� �����մϴ�(y/n)";
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
				theOutput = "�����Դϴ�. ����Ͻðڽ��ϱ�? (y/n)";
				state = PROBLEM;
			} else {
				state = PROBLEM;
				theOutput = "�����Դϴ�. ����Ͻðڽ��ϱ�? (y/n)";
			}
			currentProblem = (currentProblem + 1) % NUMPROBLEMS;
		}
		return theOutput;
	}
}
