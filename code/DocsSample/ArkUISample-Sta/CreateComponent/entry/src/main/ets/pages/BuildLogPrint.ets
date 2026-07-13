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
// [Start BuildLogPrint]
import { Button, ClickEvent, Column, Component, Entry, State, Text } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct MyStateSample {
  @State stateVar: int = 1;

  build() {
    Column() {
      hilog.info(0X0000, 'testTag', `${this.stateVar}`); // 在build()根节点中打印日志
      Text('show text1')
        .fontSize(20)
        .margin(10)
      Button('change stateVar')
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.stateVar = (this.stateVar + 1) % 4;
        })
    }
    .width('100%')
    .height('100%')
  }
}
// [End BuildLogPrint]

@Builder
export function buildLogPrint(): void {
  NavDestination() {
    MyStateSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.build_log_print_title'))
}
