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
// [Start ReceiverParam]
import { Color, Component, Entry, Row, Text, TextAttribute } from '@kit.ArkUI';

function fancy(this: TextAttribute, fontSize: number): TextAttribute {
  this.fontColor(Color.Red);
  this.fontSize(fontSize);
  return this;
}

@Entry
@Component
struct FancyUse {
  build() {
    Row() {
      Text('Fancy')
        .fancy(16)
      Text('Fancy')
        .fancy(24)
    }
  }
}

// [End ReceiverParam]

@Builder
export function receiverParam(): void {
  NavDestination() {
    FancyUse();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.receiver_param_title'))
}
