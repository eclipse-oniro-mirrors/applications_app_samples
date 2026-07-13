'use static'

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

import { NavDestination, $r } from '@kit.ArkUI';
// [Start ReceiverScenarioAfter]
import { Color, Component, FontStyle, Entry, Row, Text, TextAttribute, State } from '@kit.ArkUI';

function fancyText(this: TextAttribute, weightValue: int, color: Color): TextAttribute {
  this.fontStyle(FontStyle.Italic);
  this.fontWeight(weightValue);
  this.backgroundColor(color);
  return this;
}

@Entry
@Component
struct FancyUse {
  @State label: string = 'Hello World';

  build() {
    Row() {
      Text(`${this.label}`)
        .margin(10)
        .fancyText(100, Color.Grey)
      Text(`${this.label}`)
        .margin(10)
        .fancyText(200, Color.Pink)
      Text(`${this.label}`)
        .margin(10)
        .fancyText(300, Color.Orange)
    }
    .margin('5%')
    .height('100%')
  }
}

// [End ReceiverScenarioAfter]

@Builder
export function receiverScenarioAfter(): void {
  NavDestination() {
    FancyUse();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.receiver_scenario_after_title'))
}
