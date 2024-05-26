extension AnswerChecker on Map<String, Object> {
  bool isCorrectAnswer() {
    return this['user_answer'] == this['correct_answer'];
  }
}
