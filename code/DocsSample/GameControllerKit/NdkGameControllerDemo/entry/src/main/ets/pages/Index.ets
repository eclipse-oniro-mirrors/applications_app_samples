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

import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';

const DOMAIN = 0x0000;
const TAG = '[Sample_GameControllerDemo]';
// The log page keeps at most 200 entries. The oldest one is removed first.
const MAX_LOG_COUNT = 200;

class LogItem {
  time: string;
  message: string;

  constructor(time: string, message: string) {
    this.time = time;
    this.message = message;
  }
}

@Entry
@Component
struct Index {
  @State isRegistered: boolean = false;
  @State logs: LogItem[] = [];
  private scroller: Scroller = new Scroller();

  private getTime(): string {
    let date = new Date();
    let hours = `${date.getHours()}`.padStart(2, '0');
    let minutes = `${date.getMinutes()}`.padStart(2, '0');
    let seconds = `${date.getSeconds()}`.padStart(2, '0');
    let milliseconds = `${date.getMilliseconds()}`.padStart(3, '0');
    return `${hours}:${minutes}:${seconds}.${milliseconds}`;
  }

  private addLog(message: string): void {
    if (this.logs.length >= MAX_LOG_COUNT) {
      this.logs.shift();
    }
    this.logs.push(new LogItem(this.getTime(), message));
    this.scroller.scrollEdge(Edge.Bottom);
  }

  private toggleRegister(): void {
    try {
      if (this.isRegistered) {
        testNapi.unregisterAllEventMonitors();
        this.isRegistered = false;
      } else {
        testNapi.registerAllEventMonitors();
        this.isRegistered = true;
      }
    } catch (e) {
      hilog.error(DOMAIN, TAG, `toggleRegister error: ${JSON.stringify(e)}`);
    }
  }

  private queryDevices(): void {
    try {
      testNapi.queryAllDeviceInfos();
    } catch (e) {
      hilog.error(DOMAIN, TAG, `queryDevices error: ${JSON.stringify(e)}`);
    }
  }

  private clearLog(): void {
    this.logs = [];
  }

  aboutToAppear(): void {
    if (testNapi) {
      testNapi.onChange((value: string) => {
        this.addLog(value);
      });
    } else {
      hilog.error(DOMAIN, TAG, 'testNapi is undefined');
    }
  }

  @Builder
  FunctionButton(label: Resource, buttonId: string, onClick: () => void) {
    Button(label)
      .id(buttonId)
      .width('100%')
      .height(40)
      .fontSize($r('app.float.button_font_size'))
      .backgroundColor($r('app.color.button_background'))
      .fontColor($r('app.color.button_text'))
      .margin({ top: 8, bottom: 8 })
      .onClick(onClick)
  }

  build() {
    Column() {
      Text($r('app.string.main_title'))
        .width('100%')
        .fontSize($r('app.float.title_font_size'))
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.title_text'))
        .textAlign(TextAlign.Center)
        .margin({ top: 12, bottom: 8 })

      Button(this.isRegistered ? $r('app.string.unregister_all') : $r('app.string.register_all'))
        .id('register_button')
        .width('100%')
        .height(40)
        .fontSize($r('app.float.button_font_size'))
        .backgroundColor($r('app.color.button_background'))
        .fontColor($r('app.color.button_text'))
        .margin({ top: 8, bottom: 8 })
        .onClick(() => {
          this.toggleRegister();
        })

      this.FunctionButton($r('app.string.query_devices'), 'query_button', () => {
        this.queryDevices();
      })

      this.FunctionButton($r('app.string.clear_log'), 'clear_button', () => {
        this.clearLog();
      })

      Text($r('app.string.log_title'))
        .width('100%')
        .fontSize($r('app.float.log_title_font_size'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text'))
        .textAlign(TextAlign.Start)
        .margin({ top: 8 })

      List({ scroller: this.scroller, space: 4 }) {
        ForEach(this.logs, (log: LogItem) => {
          ListItem() {
            Column() {
              Text(`${log.time} ${log.message}`)
                .width('100%')
                .fontSize($r('app.float.log_font_size'))
                .fontColor($r('app.color.log_text'))
                .wordBreak(WordBreak.NORMAL)
                .padding(4)
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .backgroundColor($r('app.color.log_background'))
            .borderRadius(4)
          }
        }, (log: LogItem) => `${log.time} ${log.message}`)
      }
      .width('100%')
      .layoutWeight(1)
      .margin({ top: 8, bottom: 12 })
      .scrollBar(BarState.Auto)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 16, right: 16 })
    .backgroundColor($r('app.color.page_background'))
  }
}
