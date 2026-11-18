import { AssessmentConstants } from '../common/constants/AssessmentConstants';
import ExamViewModel from '../viewmodel/ExamViewModel';

@ComponentV2
export default struct ExamHeaderView {
  @Param examViewModel: ExamViewModel = new ExamViewModel();
  @Param examDuration: number = 0;

  build() {
    Row() {
      Text($r('app.string.exam_title'))
        .fontSize($r('app.float.font_size_title'))
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.title_font'))
        .id('assessment_exam_title')
      Blank()
      Text($r('app.string.exam_remaining_label'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))
        .margin({ right: 8 })
      if (this.examDuration === AssessmentConstants.DURATION_DEFAULT) {
        Text($r('app.string.duration_default'))
          .fontSize($r('app.float.font_size_body'))
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.body_font'))
      } else {
        Text(this.examViewModel.formattedRemaining)
          .fontSize($r('app.float.font_size_body'))
          .fontWeight(FontWeight.Medium)
          .fontColor(this.examViewModel.isRemainingCritical ?
          $r('app.color.warning') : $r('app.color.brand'))
      }
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }
}
