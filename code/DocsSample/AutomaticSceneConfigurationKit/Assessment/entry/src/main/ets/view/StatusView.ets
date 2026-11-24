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
import AssessmentViewModel from '../viewmodel/AssessmentViewModel';

@ComponentV2
export default struct StatusView {
  @Param viewModel: AssessmentViewModel = new AssessmentViewModel();

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.status_title'))
        .fontSize($r('app.float.font_size_section'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Text(this.viewModel.isActive ? $r('app.string.state_active') : $r('app.string.state_inactive'))
        .fontSize($r('app.float.font_size_body'))
        .fontColor(this.viewModel.isActive ? $r('app.color.success') : $r('app.color.secondary_font'))

      Text($r('app.string.current_config_label'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))

      if (!this.viewModel.isQueryConfigAvailable) {
        Text($r('app.string.current_config_none'))
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
      } else {
        Text($r('app.string.current_config_value', this.viewModel.queryDuration, this.viewModel.queryApps))
          .fontSize($r('app.float.font_size_body'))
          .fontColor($r('app.color.body_font'))
      }

      Divider()
        .color($r('app.color.divider'))

      Text($r('app.string.event_log_label'))
        .fontSize($r('app.float.font_size_caption'))
        .fontColor($r('app.color.secondary_font'))

      if (this.viewModel.logs.length === 0) {
        Text($r('app.string.event_log_empty'))
          .fontSize($r('app.float.font_size_caption'))
          .fontColor($r('app.color.secondary_font'))
      } else {
        Repeat<string>(this.viewModel.logs)
          .each((obj: RepeatItem<string>) => {
            Text(obj.item)
              .fontSize($r('app.float.font_size_caption'))
              .fontColor($r('app.color.body_font'))
              .width('100%')
          })
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding($r('app.float.card_padding'))
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
  }
}
