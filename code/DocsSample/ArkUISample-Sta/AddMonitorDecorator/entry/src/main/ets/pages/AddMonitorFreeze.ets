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
// [Start AddMonitorFreeze]
import { Button, Column, ComponentV2, DatePicker, Divider, Entry, FontWeight, ForEach, IMonitor, IMonitorDecoratedVariable, Local, LocalStorageLink, ObservedV2, Param, Require, Row, Scroll, TabContent, Tabs, Text, TextAlign, Trace, UIUtils } from '@kit.ArkUI';

@Entry
@ComponentV2
struct TabContentTest {
  @Local childMessage: Message = new Message();
  @Local data: number[] = [0, 1, 2];

  build() {
    Row() {
      Column() {
        // 当被监听的状态变量修改时，active页面的回调函数会正常触发
        // inactive页面的回调函数触发会推迟到页面变为active状态
        Button('change message').onClick(() => {
          this.childMessage.message++;
        })
        Tabs() {
          ForEach(this.data, (item: number) => {
            TabContent() {
              FreezeChild({ index: item, childMsg: this.childMessage})
            }.tabBar(`tab${item}`)
          }, (item: number) => item.toString())
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

@ObservedV2
export class Message {
  @Trace message: number = 0;
}

@ComponentV2
struct FreezeChild {
  @Param childMsg: Message = new Message();
  @Param index: number = 0;
  messageMonitor?: IMonitorDecoratedVariable;

  aboutToAppear(): void {
    // 监听属性是@ObservedV2内部属性时，设置owner能让监听继承当前组件的冻结能力。
    this.messageMonitor = UIUtils.addMonitor(() => this.childMsg.message, this.messageChange, { path: ['message'] , owner: this });
  }

  messageChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.info(`[addMonitorTest] ${path} changed from ${m.value<number>(path)?.before} to ${m.value<number>(path)?.now}, index: ${this.index}`);
    });
  }

  build() {
    Text(`设置owner ${this.childMsg.message}, index: ${this.index}`)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
  }
}
// [End AddMonitorFreeze]

@Builder
export function addMonitorFreeze(): void {
  NavDestination() {
    TabContentTest();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.add_monitor_freeze_title'))
}