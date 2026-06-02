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

import { NavDestination, $r, Button, ClickEvent, Color, Column, ComponentV2, Entry, FlexAlign, ForEach, HorizontalAlign, Local, Row, Stack, Text } from '@kit.ArkUI';

// [Start calculation_direct_state]
import { Button, ClickEvent, Color, Column, ComponentV2, Entry, FlexAlign, ForEach, HorizontalAlign, Local, Row, Stack, Text } from '@kit.ArkUI';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Index {
  @Local message: string = 'Message';

  appendMsg(newMsg: string) {
    // 性能打点
    hiTraceMeter.startTrace('StateVariable', 1);
    this.message += newMsg;
    this.message += '~';
    hiTraceMeter.finishTrace('StateVariable', 1);
  }

  build() {
    Column() {
      Text(this.message)
      Button('change')
        .onClick(() => {
          this.appendMsg('add');
        })
        .width('90%')
        .backgroundColor(Color.Blue)
        .fontColor(Color.White)
    }
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
// [End calculation_direct_state]

@Builder
export function calculationDirectStateBuilder(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.calculation_direct_state_title'))
}
