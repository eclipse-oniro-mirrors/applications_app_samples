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

export enum ChipTone {
  SUCCESS = 0,
  WARNING = 1,
  DANGER = 2,
  NEUTRAL = 3
}

@ComponentV2
export struct StatusChip {
  @Param idValue: string = 'id_chip';
  @Param text: ResourceStr = '';
  @Param tone: ChipTone = ChipTone.NEUTRAL;

  private toneColor(): ResourceColor {
    if (this.tone === ChipTone.SUCCESS) {
      return $r('app.color.success');
    }
    if (this.tone === ChipTone.WARNING) {
      return $r('app.color.warning');
    }
    if (this.tone === ChipTone.DANGER) {
      return $r('app.color.danger');
    }
    return $r('app.color.text_secondary');
  }

  build() {
    Text(this.text)
      .id(this.idValue)
      .fontSize(12)
      .fontColor(this.toneColor())
      .backgroundColor($r('app.color.fill_subtle'))
      .borderRadius(10)
      .padding({ left: 8, right: 8, top: 3, bottom: 3 })
  }
}
