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

import {
  Entry, Text, Column, Component, Button, ClickEvent, ButtonType, Row
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
// [Start EventSub_Header]
import { hiAppEvent } from '@kit.PerformanceAnalysisKit';
import { ButtonType, Row } from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
// [End EventSub_Header]
// [Start AppEvent_Declare_C_Function]
class Calc {
  native writeAppEvent(): void;
}
// [End AppEvent_Declare_C_Function]

@Entry
@Component
struct Index {
  @State message: string = "var";


  build() {
    Row() {
      Column() {
        // [Start AppEvent_Crash_Button]
        Button('WatchAppCrash ArkTS&C++')
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .backgroundColor('#0D9FFB')
          .width('80%')
          .height('5%')
          .onClick(() => {
            // 在按钮点击函数中构造一个crash事件，触发事件回调
            throw new Error('This is a jscrash triggering test.');
          })
        // [End AppEvent_Crash_Button]
        // [Start AppEvent_Click_ArkTS_Button]
        Button('writeEvent ArkTS')
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .backgroundColor('#0D9FFB')
          .width('80%')
          .height('5%')
          .onClick(() => {
            // 在按钮点击函数中进行事件打点，以记录按钮点击事件
            let eventParams: Record<string, int> = { 'clickTime': 100 };
            let eventInfo: hiAppEvent.AppEventInfo = {
              // 事件领域定义
              domain: 'button',
              // 事件名称定义
              name: 'click',
              // 事件类型定义
              eventType: hiAppEvent.EventType.BEHAVIOR,
              // 事件参数定义
              params: eventParams,
            };
            hiAppEvent.write(eventInfo).then(() => {
              hilog.info(0x0000, 'testTag', `AppEvents writeEvent ArkTS success`);
            }).catch((err: Error) => {
              const bErr = err as BusinessError;
              hilog.error(0x0000, 'testTag',
                `AppEvents HiAppEvent err.code: ${bErr.code}, err.message: ${bErr.message}`);
            });
          })
        // [End AppEvent_Click_ArkTS_Button]
      }
      .width('50%')
      Column() {
        // [Start AppEvent_CPP_Button]
        Button('writeEvent C++')
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .backgroundColor('#0D9FFB')
          .width('80%')
          .height('5%')
          .onClick((e: ClickEvent) => {
                hilog.info(0x0000, 'HiAppEvent', 'Click writeEvent C++ Button');
                try {
                  loadLibrary("entry")
                } catch (e) {
                  hilog.error(0x0000, 'HiAppEvent', 'loadFailed when click writeEvent C++', e.message);
                }

                let cls = new Calc();
                let result = cls.writeAppEvent();
          })
        // [End AppEvent_CPP_Button]
      }
      .width('50%')
    }
    .height('100%')
  }
}
