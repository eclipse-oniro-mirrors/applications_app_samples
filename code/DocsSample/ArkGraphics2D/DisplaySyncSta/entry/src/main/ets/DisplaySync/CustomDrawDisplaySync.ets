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
// [Start display_sync_by_complete_example]
// [Start display_sync_by_ui_import_module]
import { displaySync } from '@kit.ArkGraphics2D';
import { Entry, Text, Column, Row, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { Color } from '@kit.ArkUI';
import { FlexAlign, ShadowStyle, VerticalAlign } from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
// [End display_sync_by_ui_import_module]
// [Start display_sync_by_expected_FrameRate_Range]
import { ExpectedFrameRateRange } from '@kit.ArkUI';
// [End display_sync_by_expected_FrameRate_Range]
// [Start display_sync_by_ui_context_example]
import { UIContext } from '@kit.ArkUI';
// [End display_sync_by_ui_context_example]
// [Start display_sync_by_ui_complete_example]
// [Start display_sync_create_object]
// [Start display_sync_create_object_one]
@Entry
@Component
struct Index {
  // [End display_sync_create_object_one]
  // [Start display_sync_create_text_component]
  // [StartExclude display_sync_create_object]
  @State drawFirstSize: number = 25;
  @State drawSecondSize: number = 25;
  // [EndExclude display_sync_create_object]

  // [StartExclude display_sync_create_text_component]
  // [Start display_sync_create_text_component_slow]
  private backDisplaySyncSlow: displaySync.DisplaySync | undefined = undefined;
  // [End display_sync_create_text_component_slow]

  private backDisplaySyncFast: displaySync.DisplaySync | undefined = undefined;
  // [StartExclude display_sync_create_object]
  private isBigger_30: boolean = true;
  private isBigger_60: boolean = true;
  // [EndExclude display_sync_create_text_component]

  @Builder
  doSomeRenderFirst() {
    Text('30')
      .fontSize(this.drawFirstSize)
  }

  @Builder
  doSomeRenderSecond() {
    Text('60')
      .fontSize(this.drawSecondSize)
  }
  // [End display_sync_create_text_component]

  // [Start display_sync_frame_rate_setting_and_subscription_function_registration]
  CreateDisplaySyncSlow() {
    // [Start display_sync_create_slow]
    let range : ExpectedFrameRateRange = {
      expected: 30,
      min: 0,
      max: 120
    };

    // 创建DisplaySync实例
    this.backDisplaySyncSlow = displaySync.create();
    // 设置DisplaySync期望的帧率
    this.backDisplaySyncSlow?.setExpectedFrameRateRange(range);
    // [End display_sync_create_slow]
    // [Start display_sync_frame_rate_subscription_function_registration_slow]
    let draw30 = (intervalInfo: displaySync.IntervalInfo) => {
      if (this.isBigger_30) {
        this.drawFirstSize += 1;
        if (this.drawFirstSize > 150) {
          this.isBigger_30 = false;
        }
      } else {
        this.drawFirstSize -= 1;
        if (this.drawFirstSize < 25) {
          this.isBigger_30 = true;
        }
      }
    };

    // 注册订阅函数
    this.backDisplaySyncSlow?.onFrame(draw30);
    // [End display_sync_frame_rate_subscription_function_registration_slow]
  }
  // [End display_sync_frame_rate_setting_and_subscription_function_registration]

  CreateDisplaySyncFast() {
    let range : ExpectedFrameRateRange = {
      expected: 60,
      min: 0,
      max: 120
    };
    this.backDisplaySyncFast = displaySync.create();
    this.backDisplaySyncFast?.setExpectedFrameRateRange(range);

    let draw60 = (intervalInfo: displaySync.IntervalInfo) => {
      if (this.isBigger_60) {
        this.drawSecondSize += 1;
        if (this.drawSecondSize > 150) {
          this.isBigger_60 = false;
        }
      } else {
        this.drawSecondSize -= 1;
        if (this.drawSecondSize < 25) {
          this.isBigger_60 = true;
        }
      }
    };

    // 注册订阅函数
    this.backDisplaySyncFast?.onFrame(draw60);
  }

  // [Start display_sync_call_start_context]
  aboutToAppear() {
    // 获取UIContext实例
    let uiContext: UIContext = this.getUIContext();
    // 在当前UI上下文中执行DisplaySync的Start接口
    uiContext.runScopedTask(() => {
      this.backDisplaySyncSlow?.start();
    })
  }
  // [End display_sync_call_start_context]

  // [Start display_sync_call_stop]
  aboutToDisappear() {
    let draw30 = (intervalInfo: displaySync.IntervalInfo) => {
      if (this.isBigger_30) {
        this.drawFirstSize += 1;
        if (this.drawFirstSize > 150) {
          this.isBigger_30 = false;
        }
      } else {
        this.drawFirstSize -= 1;
        if (this.drawFirstSize < 25) {
          this.isBigger_30 = true;
        }
      }
    };

    if (this.backDisplaySyncSlow) {
      // [Start display_sync_call_stop_slow]
      // 取消订阅函数
      this.backDisplaySyncSlow?.offFrame(draw30);
      // [End display_sync_call_stop_slow]
      this.backDisplaySyncSlow?.stop();
      this.backDisplaySyncSlow = undefined;
    }

    let draw60 = (intervalInfo: displaySync.IntervalInfo) => {
      if (this.isBigger_60) {
        this.drawSecondSize += 1;
        if (this.drawSecondSize > 150) {
          this.isBigger_60 = false;
        }
      } else {
        this.drawSecondSize -= 1;
        if (this.drawSecondSize < 25) {
          this.isBigger_60 = true;
        }
      }
    };

    if (this.backDisplaySyncFast) {
      // 取消订阅函数
      this.backDisplaySyncFast?.offFrame(draw60);
      this.backDisplaySyncFast?.stop();
      this.backDisplaySyncFast = undefined;
    }
  }
  // [End display_sync_call_stop]

  // [Start display_sync_call_start]
  build() {
    // [StartExclude display_sync_call_start]
    Column() {
      Row() {
        this.doSomeRenderFirst();
      }
      .height('40%')

      Row() {
        this.doSomeRenderSecond();
      }
      .height('40%')

      Row() {
        // [Start display_sync_start_per_frame_callback]
        Button('Start')
          .id('CustomDrawStart')
          .fontSize(14)
          .fontWeight(500)
          .margin({ bottom: 10, left: 5 })
          .fontColor(Color.White)
          .onClick((e: ClickEvent): void => {
            if (this.backDisplaySyncSlow == undefined) {
              this.CreateDisplaySyncSlow();
            }
            if (this.backDisplaySyncFast == undefined) {
              this.CreateDisplaySyncFast();
            }
            if (this.backDisplaySyncSlow) {
              // [Start display_sync_start_per_frame_callback_slow]
              // 开始每帧回调
              this.backDisplaySyncSlow?.start();
              // [End display_sync_start_per_frame_callback_slow]
            }
            if (this.backDisplaySyncFast) {
              // 开始每帧回调
              this.backDisplaySyncFast?.start();
            }
          })
          .width('20%')
          .height(40)
          .shadow(ShadowStyle.OUTER_DEFAULT_LG)
        // [End display_sync_start_per_frame_callback]

        // [Start display_sync_stop_per_frame_callback]
        Button('Stop')
          .id('CustomDrawStop')
          .fontSize(14)
          .fontWeight(500)
          .margin({ bottom: 10, left: 5 })
          .fontColor(Color.White)
          .onClick((e: ClickEvent): void => {
            if (this.backDisplaySyncSlow) {
              // [Start display_sync_stop_per_frame_callback_slow]
              // 停止每帧回调
              this.backDisplaySyncSlow?.stop();
              // [End display_sync_stop_per_frame_callback_slow]
            }
            if (this.backDisplaySyncFast) {
              // 停止每帧回调
              this.backDisplaySyncFast?.stop();
            }
          })
          .width('20%')
          .height(40)
          .shadow(ShadowStyle.OUTER_DEFAULT_LG)
        // [End display_sync_stop_per_frame_callback]

        // [StartExclude display_sync_by_complete_example]
        Button('Back')
          .id('CustomDrawBack')
          .fontSize(14)
          .fontWeight(500)
          .margin({ bottom: 10, left: 5 })
          .fontColor(Color.White)
          .onClick((event: ClickEvent): void => {
            if (this.backDisplaySyncSlow) {
              this.backDisplaySyncSlow?.stop();
            }
            if (this.backDisplaySyncFast) {
              this.backDisplaySyncFast?.stop();
            }
            this.getUIContext().getRouter().back();
          })
          .width('20%')
          .height(40)
          .shadow(ShadowStyle.OUTER_DEFAULT_LG)
        // [EndExclude display_sync_by_complete_example]
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .shadow(ShadowStyle.OUTER_DEFAULT_SM)
      .alignItems(VerticalAlign.Bottom)
      .layoutWeight(1)
    }
    // [EndExclude display_sync_call_start]
  }
  // [StartExclude display_sync_call_start]
  // [EndExclude display_sync_create_object]
  // [EndExclude display_sync_call_start]
}
// [End display_sync_call_start]
// [End display_sync_create_object]
// [End display_sync_by_ui_complete_example]
// [End display_sync_by_complete_example]