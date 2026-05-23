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
// [Start EventAsyncSync]
import { ClickEvent, Column, ComponentV2, Entry, Event, Local, Param, Text } from '@kit.ArkUI';

@ComponentV2
struct Child {
  @Param index: number = 0;
  @Event changeIndex: (val: number) => void;

  build() {
    Column() {
      Text(`Child index: ${this.index}`)
        .onClick((e: ClickEvent) => {
          this.changeIndex(20);
          // 从父组件将变化同步回子组件的不是立刻生效
          console.info(`after changeIndex ${this.index}`);
        })
    }
  }
}
@Entry
@ComponentV2
struct Index {
  @Local index: number = 0;

  build() {
    Column() {
      Child({
        index: this.index,
        changeIndex: (val: number) => {
          this.index = val;
          // 使用changeIndex修改父组件的值立刻生效，index的值已经修改
          console.info(`in changeIndex ${this.index}`);
        }
      })
    }
  }
}

// [End EventAsyncSync]

@Builder
export function eventAsyncSync(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.event_async_sync_title'))
}