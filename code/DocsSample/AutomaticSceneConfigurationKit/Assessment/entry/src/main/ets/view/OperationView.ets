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
@ComponentV2
export default struct OperationView {
  @Param isActive: boolean = false;
  @Event onBegin: () => void = () => {};
  @Event onEnd: () => void = () => {};
  @Event onQueryState: () => void = () => {};
  @Event onQueryConfig: () => void = () => {};

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.operation_title'))
        .fontSize($r('app.float.font_size_section'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_font'))

      Row({ space: 12 }) {
        Button($r('app.string.begin_button'))
          .layoutWeight(1)
          .height($r('app.float.button_height'))
          .fontSize($r('app.float.font_size_caption'))
          .enabled(!this.isActive)
          .id('assessment_begin_button')
          .onClick(() => {
            this.onBegin();
          })
        Button($r('app.string.end_button'))
          .layoutWeight(1)
          .height($r('app.float.button_height'))
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.warning'))
          .enabled(this.isActive)
          .id('assessment_end_button')
          .onClick(() => {
            this.onEnd();
          })
      }
      .width('100%')

      Row({ space: 12 }) {
        Button($r('app.string.query_state_button'))
          .layoutWeight(1)
          .height($r('app.float.button_height'))
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.page_background'))
          .fontColor($r('app.color.body_font'))
          .id('assessment_query_state_button')
          .onClick(() => {
            this.onQueryState();
          })
        Button($r('app.string.query_config_button'))
          .layoutWeight(1)
          .height($r('app.float.button_height'))
          .fontSize($r('app.float.font_size_caption'))
          .backgroundColor($r('app.color.page_background'))
          .fontColor($r('app.color.body_font'))
          .id('assessment_query_config_button')
          .onClick(() => {
            this.onQueryConfig();
          })
      }
      .width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding($r('app.float.card_padding'))
    .backgroundColor($r('app.color.card_background'))
    .borderRadius($r('app.float.card_radius'))
  }
}
