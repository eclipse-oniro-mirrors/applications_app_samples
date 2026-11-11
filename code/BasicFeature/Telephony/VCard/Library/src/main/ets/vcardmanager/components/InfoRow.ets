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
export struct InfoRow {
  @Param idPrefix: string = 'id_info';
  @Param label: ResourceStr = '';
  @Param value: ResourceStr = '';
  @Param valueColor: ResourceColor = $r('app.color.text_primary');
  @Param wrap: boolean = false;

  build() {
    Row({ space: 12 }) {
      Text(this.label)
        .id(`${this.idPrefix}_label`)
        .fontSize(14)
        .fontColor($r('app.color.text_secondary'))
        .constraintSize({ minWidth: 88 })
        .textAlign(TextAlign.Start)
      Text(this.value)
        .id(`${this.idPrefix}_value`)
        .fontSize(14)
        .fontColor(this.valueColor)
        .layoutWeight(1)
        .textAlign(TextAlign.End)
        .maxLines(this.wrap ? 4 : 2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .id(`${this.idPrefix}_row`)
    .width('100%')
    .constraintSize({ minHeight: 24 })
    .alignItems(VerticalAlign.Top)
  }
}
