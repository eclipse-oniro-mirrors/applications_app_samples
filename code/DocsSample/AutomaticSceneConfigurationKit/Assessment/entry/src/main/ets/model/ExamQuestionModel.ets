export default class ExamQuestionModel {
  public type: string = 'choice';
  public stem: Resource;
  public options: Resource[];
  public answerIndex: number;
  public correctAnswer: string = '';

  constructor(stem: Resource, options: Resource[], answerIndex: number, type?: string, correctAnswer?: string) {
    this.stem = stem;
    this.options = options;
    this.answerIndex = answerIndex;
    if (type !== undefined) {
      this.type = type;
    }
    if (correctAnswer !== undefined) {
      this.correctAnswer = correctAnswer;
    }
  }
}

export class ExamRepository {
  public static getQuestions(): ExamQuestionModel[] {
    const questions: ExamQuestionModel[] = [];
    questions.push(new ExamQuestionModel($r('app.string.question_stem_4'), [], -1, 'fill', 'SoftBus'));
    questions.push(new ExamQuestionModel($r('app.string.question_stem_5'), [], -1, 'fill', '@Trace'));
    questions.push(new ExamQuestionModel($r('app.string.question_stem_1'), [
      $r('app.string.question_option_1_1'),
      $r('app.string.question_option_1_2'),
      $r('app.string.question_option_1_3')
    ], 0));
    questions.push(new ExamQuestionModel($r('app.string.question_stem_2'), [
      $r('app.string.question_option_2_1'),
      $r('app.string.question_option_2_2'),
      $r('app.string.question_option_2_3')
    ], 1));
    questions.push(new ExamQuestionModel($r('app.string.question_stem_3'), [
      $r('app.string.question_option_3_1'),
      $r('app.string.question_option_3_2'),
      $r('app.string.question_option_3_3')
    ], 2));
    return questions;
  }
}
