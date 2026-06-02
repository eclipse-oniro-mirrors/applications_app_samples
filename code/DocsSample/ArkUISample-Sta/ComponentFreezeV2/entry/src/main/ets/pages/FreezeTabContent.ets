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
// [Start FreezeTabContent]
import { Button, ClickEvent, Column, ComponentV2, Entry, FontWeight, ForEach, IMonitor, Local, Monitor, Param, Repeat, Row, TabContent, Tabs, Text } from '@kit.ArkUI';

@Entry
@ComponentV2
struct TabContentTest {
  @Local message: number = 0;
  @Local data: number[] = [0, 1, 2, 3, 4];

  build() {
    Row() {
      Column() {
        Button('change message').onClick(() => {
          this.message++;
        })

        Tabs() {
          Repeat<number>(this.data).each(ri => {
            TabContent() {
              FreezeChild({ message: this.message, index: ri.item })
            }.tabBar(`tab${ri.item}`)
          }).key((item: number) => item.toString()).virtualScroll({ disableVirtualScroll: true })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

@ComponentV2
struct FreezeChild {
  @Param message: number = 0;
  @Param index: number = 0;
  // 仅处于激活状态的TabContent下的FreezeChild可以立刻触发@Monitor
  @Monitor(['message']) onMessageUpdated(mon: IMonitor) {
    console.info(`FreezeChild message callback func ${this.message}, index: ${this.index}`);
  }

  build() {
    Text('message' + `${this.message}, index: ${this.index}`)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
  }
}

// [End FreezeTabContent]

@Builder
export function freezeTabContent(): void {
  NavDestination() {
    TabContentTest();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.freeze_tab_content_title'))
}
