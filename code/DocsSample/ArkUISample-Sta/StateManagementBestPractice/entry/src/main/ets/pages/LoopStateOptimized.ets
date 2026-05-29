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

// [Start loop_state_optimized]
import { Button, ClickEvent, Color, Column, ComponentV2, Entry, FlexAlign, ForEach, HorizontalAlign, Local, Row, Stack, Text } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct Index {
  @Local message: string = 'TAG logMessage';

  build() {
    Column() {
      Button('print logmessage')
        .onClick(() => {
          let logMessage: string = this.message;
          for (let i = 0; i < 10; i++) {
            hilog.info(0x0000, 'TAG', '%{public}s', logMessage);
          }
        })
        .width('90%')
        .backgroundColor(Color.Blue)
        .fontColor(Color.White)
    }
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
// [End loop_state_optimized]

@Builder
export function loopStateOptimizedBuilder(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.loop_state_optimized_title'))
}
