import ExamViewModel from '../viewmodel/ExamViewModel';

@ComponentV2
export default struct ExamOperationView {
  @Param examViewModel: ExamViewModel = new ExamViewModel();
  @Event onSubmit: () => void = () => {};

  build() {
    Row({ space: 12 }) {
      Button($r('app.string.exam_previous'))
        .layoutWeight(1)
        .height(44)
        .fontSize($r('app.float.font_size_caption'))
        .backgroundColor($r('app.color.card_background'))
        .fontColor($r('app.color.body_font'))
        .enabled(this.examViewModel.canPrevious)
        .onClick(() => {
          this.examViewModel.prevQuestion();
        })
      Button($r('app.string.exam_next'))
        .layoutWeight(1)
        .height(44)
        .fontSize($r('app.float.font_size_caption'))
        .backgroundColor($r('app.color.card_background'))
        .fontColor($r('app.color.body_font'))
        .enabled(this.examViewModel.canNext)
        .onClick(() => {
          this.examViewModel.nextQuestion();
        })
      Button($r('app.string.exam_submit'))
        .layoutWeight(1)
        .height(44)
        .fontSize($r('app.float.font_size_caption'))
        .backgroundColor($r('app.color.success'))
        .onClick(() => {
          this.onSubmit();
        })
    }
    .width('100%')
  }
}
