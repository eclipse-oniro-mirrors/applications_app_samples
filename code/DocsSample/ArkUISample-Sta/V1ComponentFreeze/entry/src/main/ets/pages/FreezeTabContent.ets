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
import { Button, Column, Component, Entry, FontWeight, ForEach, Link, Row, State, TabContent, Tabs, TabsController, Text, Watch } from '@kit.ArkUI';

@Entry
@Component
struct TabContentTest {
  @State @Watch('onMessageUpdated') message: number = 0;
  private data: number[] = [0.0, 1.0, 2.0, 3.0, 4.0];

  onMessageUpdated(propertyName: string) {
    console.info(`TabContent message callback func ${this.message}`);
  }

  build() {
    Row() {
      Column() {
        Button('change message').onClick(() => {
          this.message++;
        })

        Tabs() {
          ForEach(this.data, (item: number) => {
            TabContent() {
              FreezeChild({ message: this.message, index: item })
            }.tabBar(`tab${item}`)
          }, (item: number) => item.toString())
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
@Component
struct FreezeChild {
  @Link @Watch('onMessageUpdated') message: number;
  index: number = 0;

  getValue(): number {
    console.info(`FreezeChild getValue, ${this.index}`)
    return this.message;
  }

  onMessageUpdated(propertyName: string) {
    console.info(`FreezeChild message callback func ${this.message}, index: ${this.index}`);
  }

  build() {
    Text('message' + `${this.getValue()}, index: ${this.index}`)
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
