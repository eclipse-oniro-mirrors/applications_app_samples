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
 * Reusable key-value row with a left label and a right value text.
 */
@ComponentV2
export struct InfoRow {
  // Prefix used to build the accessibility ids of the inner components.
  @Param idPrefix: string = 'id_info';
  // Left label text.
  @Param label: ResourceStr = '';
  // Right value text.
  @Param value: ResourceStr = '';
  // Font color of the value text.
  @Param valueColor: ResourceColor = $r('app.color.text_primary');

  /**
   * Build the two-text row with the value aligned to the end.
   */
  build() {
    Row({ space: 12 }) {
      Text(this.label)
        .id(this.idPrefix + '_label')
        .fontSize(14)
        .fontColor($r('app.color.text_secondary'))
        .constraintSize({ minWidth: 88 })
        .textAlign(TextAlign.Start)
      Text(this.value)
        .id(this.idPrefix + '_value')
        .fontSize(14)
        .fontColor(this.valueColor)
        .layoutWeight(1)
        .textAlign(TextAlign.End)
        .maxLines(3)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .id(this.idPrefix + '_row')
    .width('100%')
    .constraintSize({ minHeight: 24 })
    .alignItems(VerticalAlign.Top)
  }
}
