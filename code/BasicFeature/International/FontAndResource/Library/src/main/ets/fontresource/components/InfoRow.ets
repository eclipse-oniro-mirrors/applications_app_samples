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

// A reusable label-value row component shared by both demo pages.
@ComponentV2
export struct InfoRow {
  // The unique id prefix used to build test ids for this row instance.
  @Param idPrefix: string = 'id_info';
  // The localized label shown on the left side of the row.
  @Param label: ResourceStr = '';
  // The localized or plain value shown on the right side of the row.
  @Param value: ResourceStr = '';
  // The color applied to the value text, allowing status based coloring.
  @Param valueColor: ResourceColor = $r('app.color.text_primary');

  // Builds the two-column row layout for one label-value pair.
  build() {
    // Place the label and value side by side with a fixed gap.
    Row({ space: 12 }) {
      // Render the label text pinned to the left with a minimum width.
      Text(this.label)
        .id(`${this.idPrefix}_label`)
        .fontSize(14)
        .fontColor($r('app.color.text_secondary'))
        .constraintSize({ minWidth: 88 })
        .textAlign(TextAlign.Start)
      // Render the value text that stretches and truncates gracefully.
      Text(this.value)
        .id(`${this.idPrefix}_value`)
        .fontSize(14)
        .fontColor(this.valueColor)
        .layoutWeight(1)
        .textAlign(TextAlign.End)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    // Attach the row level test id.
    .id(`${this.idPrefix}_row`)
    // Stretch the row across the full parent width.
    .width('100%')
    // Keep the row at a comfortable minimum height.
    .constraintSize({ minHeight: 24 })
    // Align the children to the top edge for multi-line values.
    .alignItems(VerticalAlign.Top)
  }
}
