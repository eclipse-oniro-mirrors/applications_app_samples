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
import ExamViewModel from '../viewmodel/ExamViewModel';

@ComponentV2
export default struct ExamOperationView {
  @Param examViewModel: ExamViewModel = new ExamViewModel();
  @Event onSubmit: () => void = () => {};

  build() {
    Row({ space: 12 }) {
      Button($r('app.string.exam_previous'))
        .layoutWeight(1)
        .height($r('app.float.button_height'))
        .fontSize($r('app.float.font_size_caption'))
        .backgroundColor($r('app.color.card_background'))
        .fontColor($r('app.color.body_font'))
        .enabled(this.examViewModel.canPrevious)
        .onClick(() => {
          this.examViewModel.prevQuestion();
        })
      Button($r('app.string.exam_next'))
        .layoutWeight(1)
        .height($r('app.float.button_height'))
        .fontSize($r('app.float.font_size_caption'))
        .backgroundColor($r('app.color.card_background'))
        .fontColor($r('app.color.body_font'))
        .enabled(this.examViewModel.canNext)
        .onClick(() => {
          this.examViewModel.nextQuestion();
        })
      Button($r('app.string.exam_submit'))
        .layoutWeight(1)
        .height($r('app.float.button_height'))
        .fontSize($r('app.float.font_size_caption'))
        .backgroundColor($r('app.color.success'))
        .onClick(() => {
          this.onSubmit();
        })
    }
    .width('100%')
  }
}
