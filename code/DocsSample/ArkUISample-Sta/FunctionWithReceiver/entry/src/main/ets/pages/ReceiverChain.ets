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
// [Start ReceiverChain]
import { Color, Component, Entry, Row, Text, TextAttribute } from '@kit.ArkUI';

function fancySize(this: TextAttribute, fontSize: number): TextAttribute {
  this.fontSize(fontSize);
  return this;
}

function fancyColor(this: TextAttribute): TextAttribute {
  this.fontColor(Color.Red);
  return this;
}

@Entry
@Component
struct FancyUse {
  build() {
    Row() {
      Text('Fancy')
        .fancySize(16)
        .fancyColor() // 链式调用Function-with-Receiver
        .onClick((e) => { }) // 链式调用Text组件其他方法
    }
  }
}

// [End ReceiverChain]

@Builder
export function receiverChain(): void {
  NavDestination() {
    FancyUse();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.receiver_chain_title'))
}
