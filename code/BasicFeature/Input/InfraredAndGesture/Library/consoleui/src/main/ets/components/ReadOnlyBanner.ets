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

/**
 * Banner shown when the console is opened in read-only mode.
 * It is purely presentational and performs no side effects.
 */
@ComponentV2
export struct ReadOnlyBanner {
  /** Localized hint text displayed inside the banner. */
  @Param text: ResourceStr = $r('app.string.read_only_hint');

  /** Renders a single-line banner with the hint text. */
  build() {
    Row({ space: '8vp' }) {
      Text(this.text)
        .id('id_read_only_text')
        .fontSize($r('app.float.caption_font'))
        .fontColor($r('app.color.text_secondary'))
        .layoutWeight(1)
    }
    .id('id_read_only_banner')
    .width('100%')
    .padding($r('app.float.page_padding'))
    .backgroundColor($r('app.color.bg_card'))
    .borderRadius($r('app.float.card_radius'))
  }
}
