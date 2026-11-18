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
 * Overlay toast used to show the result of a manual IR send.
 * It is purely presentational and performs no side effects.
 */
@ComponentV2
export struct SendResultToast {
  /** Whether the toast is currently visible. */
  @Param visible: boolean = false;
  /** Result message displayed inside the toast. */
  @Param text: string = '';

  /** Renders the centered toast only when visibility is enabled. */
  build() {
    // The overlay is skipped entirely when hidden so it never intercepts layout.
    if (this.visible) {
      Stack() {
        Text(this.text)
          .id('id_send_toast_text')
          .fontSize($r('app.float.body_font'))
          .fontColor(Color.White)
          .backgroundColor($r('app.color.text_primary'))
          .borderRadius($r('app.float.card_radius'))
          .padding($r('app.float.page_padding'))
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .constraintSize({ maxWidth: '80%' })
      }
      .id('id_send_toast')
      .width('100%')
      .height('100%')
      .alignContent(Alignment.Center)
      // Let touches pass through so the toast never blocks interactions.
      .hitTestBehavior(HitTestMode.None)
    }
  }
}
