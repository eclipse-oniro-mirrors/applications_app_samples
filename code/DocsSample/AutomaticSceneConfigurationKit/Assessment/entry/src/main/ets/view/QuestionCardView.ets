/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { AssessmentConstants } from '../common/constants/AssessmentConstants';
import ExamViewModel from '../viewmodel/ExamViewModel';

@ComponentV2
export default struct QuestionCardView {
  @Param examViewModel: ExamViewModel = new ExamViewModel();

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.exam_progress', this.examViewModel.currentIndex + 1, this.examViewModel.questionCount))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))

      Text(this.examViewModel.currentQuestion.stem)
        .fontSize($r('app.float.font_size_body'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))
        .width('100%')

      if (this.examViewModel.isCurrentFillType) {
        TextInput({
          placeholder: $r('app.string.question_fill_placeholder'),
          text: this.examViewModel.currentTextAnswer
        })
          .width('100%')
          .height($r('app.float.button_height'))
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
          .backgroundColor($r('app.color.page_background'))
          .borderRadius($r('app.float.card_radius'))
          .padding({ left: 12, right: 12 })
          .onChange((value: string) => {
            this.examViewModel.inputAnswer(value);
          })
      } else {
        Repeat<Resource>(this.examViewModel.currentQuestion.options)
          .each((obj: RepeatItem<Resource>) => {
            Row({ space: 8 }) {
              Text(String.fromCharCode(AssessmentConstants.OPTION_LABEL_BASE + obj.index))
                .fontSize($r('app.float.font_size_caption'))
                .fontColor(this.examViewModel.isOptionSelected(obj.index) ?
                $r('app.color.card_background') : $r('app.color.secondary_font'))
              Text(obj.item)
                .fontSize($r('app.float.font_size_body'))
                .fontColor(this.examViewModel.isOptionSelected(obj.index) ?
                $r('app.color.card_background') : $r('app.color.body_font'))
                .layoutWeight(1)
            }
            .width('100%')
            .padding($r('app.float.card_padding'))
            .borderRadius($r('app.float.card_radius'))
            .backgroundColor(this.examViewModel.isOptionSelected(obj.index) ?
            $r('app.color.brand') : $r('app.color.page_background'))
            .alignItems(VerticalAlign.Center)
            .onClick(() => {
              this.examViewModel.selectOption(obj.index);
            })
          })
      }
    }
    .width('100%')
    .layoutWeight(1)
    .alignItems(HorizontalAlign.Start)
    .padding($r('app.float.card_padding'))
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
  }
}
