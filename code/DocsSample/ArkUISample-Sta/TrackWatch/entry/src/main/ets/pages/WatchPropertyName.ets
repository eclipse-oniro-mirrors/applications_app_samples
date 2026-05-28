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
// [Start WatchPropertyName]
import { Entry, Component, Column, Button, ClickEvent, Text, State, Watch } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

interface Info {
  name: string;
  age: number;
}

@Entry
@Component
struct Index {
  @State @Watch('changeProperty') info: Info = {name: 'Tom', age: 20} as Info;
  // @Watch 回调
  changeProperty(propertyName: string): void {
    hilog.info(0, 'Index', `${propertyName} has changed`);
  }

  build() {
    Column() {
      Text(`Info name: ${this.info.name}`).fontSize(30)
      Text(`Info age: ${this.info.age}`).fontSize(30)
      Button('change info name')
        .onClick((e: ClickEvent) => {
          this.info.name = 'Jerry';
        })
      Button('change info age')
        .onClick((e: ClickEvent) => {
          this.info.age = 18;
        })
    }
  }
}
// [End WatchPropertyName]

@Builder
export function watchPropertyName(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.watch_property_name_title'))
}