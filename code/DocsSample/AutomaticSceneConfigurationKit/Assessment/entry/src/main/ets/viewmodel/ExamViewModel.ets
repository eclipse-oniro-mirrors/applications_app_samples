import { AssessmentConstants } from '../common/constants/AssessmentConstants';
import ExamQuestionModel, { ExamRepository } from '../model/ExamQuestionModel';

@ObservedV2
export default class ExamViewModel {
  @Trace currentIndex: number = 0;
  @Trace answers: number[] = [];
  @Trace textAnswers: string[] = [];
  @Trace remainingSeconds: number = 0;
  @Trace answeredCount: number = AssessmentConstants.INVALID_ANSWER;

  private questions: ExamQuestionModel[] = ExamRepository.getQuestions();
  private timerId: number = -1;

  initAnswers(): void {
    const answers: number[] = [];
    const textAnswers: string[] = [];
    for (let i = 0; i < this.questions.length; i++) {
      answers.push(AssessmentConstants.INVALID_ANSWER);
      textAnswers.push('');
    }
    this.answers = answers;
    this.textAnswers = textAnswers;
  }

  startCountdown(durationMillis: number): void {
    this.remainingSeconds = Math.floor(durationMillis / AssessmentConstants.MILLIS_PER_SECOND);
    if (this.remainingSeconds > 0) {
      this.timerId = setInterval(() => {
        if (this.remainingSeconds <= 0) {
          this.stopCountdown();
          return;
        }
        this.remainingSeconds -= 1;
      }, AssessmentConstants.COUNTDOWN_INTERVAL);
    }
  }

  stopCountdown(): void {
    if (this.timerId < 0) {
      return;
    }
    clearInterval(this.timerId);
    this.timerId = -1;
  }

  selectOption(index: number): void {
    this.answers[this.currentIndex] = index;
  }

  inputAnswer(text: string): void {
    this.textAnswers[this.currentIndex] = text;
  }

  isOptionSelected(index: number): boolean {
    return this.answers[this.currentIndex] === index;
  }

  nextQuestion(): void {
    if (this.currentIndex < this.questions.length - 1) {
      this.currentIndex += 1;
    }
  }

  prevQuestion(): void {
    if (this.currentIndex > 0) {
      this.currentIndex -= 1;
    }
  }

  countAnswered(): number {
    let answered: number = 0;
    for (let i = 0; i < this.questions.length; i++) {
      if (this.questions[i].type === 'fill') {
        if (this.textAnswers[i].trim().length > 0) {
          answered++;
        }
      } else {
        if (this.answers[i] !== AssessmentConstants.INVALID_ANSWER) {
          answered++;
        }
      }
    }
    return answered;
  }

  submit(): void {
    this.answeredCount = this.countAnswered();
  }

  @Computed
  get questionCount(): number {
    return this.questions.length;
  }

  @Computed
  get currentQuestion(): ExamQuestionModel {
    return this.questions[this.currentIndex];
  }

  @Computed
  get currentTextAnswer(): string {
    return this.textAnswers[this.currentIndex];
  }

  @Computed
  get isCurrentFillType(): boolean {
    return this.questions[this.currentIndex].type === 'fill';
  }

  @Computed
  get canPrevious(): boolean {
    return this.currentIndex > 0;
  }

  @Computed
  get canNext(): boolean {
    return this.currentIndex < this.questions.length - 1;
  }

  @Computed
  get formattedRemaining(): string {
    const minutes: number = Math.floor(this.remainingSeconds / AssessmentConstants.SECONDS_PER_MINUTE);
    const seconds: number = this.remainingSeconds % AssessmentConstants.SECONDS_PER_MINUTE;
    const minuteText: string = `${minutes}`.padStart(AssessmentConstants.TEXT_PAD_LENGTH, '0');
    const secondText: string = `${seconds}`.padStart(AssessmentConstants.TEXT_PAD_LENGTH, '0');
    return `${minuteText}:${secondText}`;
  }

  @Computed
  get isRemainingCritical(): boolean {
    return this.remainingSeconds <= AssessmentConstants.SECONDS_PER_MINUTE;
  }
}
