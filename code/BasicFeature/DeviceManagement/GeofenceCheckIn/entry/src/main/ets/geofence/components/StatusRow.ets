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
 * Reusable row that shows one permission or service status with an optional action.
 *
 * Pure display component driven entirely by its params, so it adds no
 * logging or tracing of its own.
 */
@ComponentV2
export struct StatusRow {
  // Leading label describing the checked item.
  @Param label: ResourceStr = '';
  // Current status text such as granted, missing, on or off.
  @Param statusText: ResourceStr = '';
  // True when the status counts as positive and drives the text color.
  @Param positive: boolean = false;
  // True when the row exposes a trailing action button.
  @Param actionable: boolean = false;
  // Test identifier assigned to the action button.
  @Param actionId: string = '';
  // Callback invoked when the user taps the action button.
  @Event onAction: () => void = () => {};

  /**
   * Build the status row layout.
   */
  build() {
    Row() {
      // Item label placed on the leading edge.
      Text(this.label)
        .fontSize(14)
        .fontColor($r('app.color.gc_text_primary'))
      // Spacer pushing the status and action to the trailing edge.
      Blank()
      // Status text colored by the positive flag.
      Text(this.statusText)
        .fontSize(12)
        .fontColor(this.positive ? $r('app.color.gc_success') : $r('app.color.gc_text_tertiary'))
      // Trailing action is rendered only while the item needs one.
      if (this.actionable) {
        Text($r('app.string.gc_app_action_grant'))
          .fontSize(12)
          .fontColor($r('app.color.gc_brand_primary'))
          .id(this.actionId)
          .padding({ left: 12, top: 12, bottom: 12 })
          .onClick(() => {
            this.onAction();
          })
      }
    }
    // Row spans the card width with a fixed height for aligned stacking.
    .width('100%')
    .height(40)
  }
}
