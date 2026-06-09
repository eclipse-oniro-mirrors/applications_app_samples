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
// [Start TrackCustomComponent]
import { Column, Component, Entry, FontWeight, Row, State, Text, Track, Button } from '@kit.ArkUI';

class Log {
  @Track logInfo: string;
  owner: string;
  id: number;
  time: Date;
  location: string;
  reason: string;

  constructor(logInfo: string) {
    this.logInfo = logInfo;
    this.owner = 'OH';
    this.id = 0;
    this.time = new Date();
    this.location = 'CN';
    this.reason = 'NULL';
  }
}

@Entry
@Component
struct AddLog {
  @State log: Log = new Log('origin info.');

  build() {
    Row() {
      Column() {
        Button('Change log')
          .width(300)
          .margin(10)
          .onClick((e) => {
            // 没有被@Track装饰的属性可以在点击事件中使用。
            console.info('owner: ' + this.log.owner +
              ' id: ' + this.log.id +
              ' time: ' + this.log.time +
              ' location: ' + this.log.location +
              ' reason: ' + this.log.reason);
            this.log.time = new Date();
            this.log.id++;

            this.log.logInfo += ' info.';
          })
        Text(this.log.logInfo)
          .fontSize(20)
          .margin(10)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
  }
}
// [End TrackCustomComponent]

@Builder
export function trackCustomComponent(): void {
  NavDestination() {
    AddLog();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.track_custom_component_title'))
}