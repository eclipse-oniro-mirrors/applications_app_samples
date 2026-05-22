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
// [Start LocalObservedObject]
import { Button, Column, ComponentV2, Entry, Local, ObservedV2, Row, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class Info {
  @Trace name: string;
  @Trace age: int;

  constructor(name: string, age: int) {
    this.name = name;
    this.age = age;
  }
}

@Entry
@ComponentV2
struct Index {
  info: Info = new Info('Tom', 25);
  @Local localInfo: Info = new Info('Tom', 25);

  build() {
    Row() {
      Column() {
        Text(`info: ${this.info.name}-${this.info.age}`) // Text1
          .margin(10)
        Text(`localInfo: ${this.localInfo.name}-${this.localInfo.age}`) // Text2
          .margin(10)
        Button('change info&localInfo')
          .onClick(() => {
            this.info = new Info('Lucy', 18); // Text1不会刷新
            this.localInfo = new Info('Lucy', 18); // Text2会刷新
          })
          .margin(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}
// [End LocalObservedObject]

@Builder
export function localObservedObject(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.local_observed_object_title'))
}