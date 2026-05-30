'use static'
/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
// [Start all_audioLoopbackDebugInfo]
// [Start get_DebugManager]
import audio from '@ohos.multimedia.audio';
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import {
  Entry, Component, State, Scroll, Column, Row, Text, Color, FlexAlign, HorizontalAlign, TextOverflow, ClickEvent
} from '@kit.ArkUI';

const TAG = 'AudioLoopbackDebugInfoDemo';
let mode: audio.AudioLoopbackMode = audio.AudioLoopbackMode.HARDWARE;
let audioLoopback: audio.AudioLoopback | undefined = undefined;

// [StartExclude all_audioLoopbackDebugInfo]
async function requestMicrophonePermission(context: common.UIAbilityContext): Promise<boolean> {
  let atManager = abilityAccessCtrl.createAtManager();
  let result: PermissionRequestResult = await atManager
    .requestPermissionsFromUser(context, ['ohos.permission.MICROPHONE']);
  let firstResult = result.authResults.find((value: int, index: int, array: Array<int>): boolean => {
    return index === 0;
  });
  return firstResult === 0;
}
// [EndExclude all_audioLoopbackDebugInfo]

// 查询返听能力，能力支持时创建 AudioLoopback 实例。
async function init(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let isSupported = audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(mode);
  if (isSupported) {
    try {
      let loopback = await audio.createAudioLoopback(mode);
      console.info('Succeeded in creating audio loopback.');
      const successMsg = 'Succeeded in creating audio loopback.';
      if (updateCallback) {
        updateCallback(successMsg, false);
      }
      if (loopback === null) {
        const errorMsg = 'Failed to create audio loopback. Loopback instance is null.';
        console.error(errorMsg);
        if (updateCallback) {
          updateCallback(errorMsg, true);
        }
        return;
      }
      audioLoopback = loopback;
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to create audio loopback. Message: ${error.message}`);
      const errorMsg = `Failed to create audio loopback. Message: ${error.message}`;
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
    }

  } else {
    console.error('Audio loopback is unsupported.');
    const errorMsg = 'Audio loopback is unsupported.';
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End get_DebugManager]

// 启用返听，用于后续调试信息查询流程。
// [StartExclude all_audioLoopbackDebugInfo]
async function enable(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    try {
      let status = await loopback.getStatus();
      if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
        let isSuccess = await loopback.enable(true);
        if (isSuccess) {
          console.info('Succeeded in using enable function.');
          const successMsg = 'Succeeded in using enable function.';
          if (updateCallback) {
            updateCallback(successMsg, false);
          }
        } else {
          status = await loopback.getStatus();
        }
      }
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to use enable function. Message: ${error.message}`);
      const errorMsg = `Failed to use enable function. Message: ${error.message}`;
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
    }
  } else {
    console.error('Audio loopback not created.');
    const errorMsg = `Audio loopback not created.`;
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [EndExclude all_audioLoopbackDebugInfo]

// 静态 AudioKit 当前不暴露 DebugManager，这里只向页面回报不支持。
// [Start print_AppInfo]
function printAppInfo(context: common.UIAbilityContext, updateCallback?: (msg: string, isError: boolean) => void): void {
  // [StartExclude print_AppInfo]
  const errorMsg = 'Audio debug manager is not available in the static AudioKit API.';
  console.error(errorMsg);
  if (updateCallback) {
    updateCallback(errorMsg, true);
  }
  // [EndExclude print_AppInfo]
  return;
}
// [End print_AppInfo]

// 静态 AudioKit 当前不暴露 DebugManager，这里只向页面回报不支持。
// [Start print_LoopbackInfo]
function printLoopbackInfo(context: common.UIAbilityContext, updateCallback?: (msg: string, isError: boolean) => void): void {
  // [StartExclude print_LoopbackInfo]
  const unsupportedMsg = 'Audio debug manager is not available in the static AudioKit API.';
  console.error(unsupportedMsg);
  if (updateCallback) {
    updateCallback(unsupportedMsg, true);
  }
  // [EndExclude print_LoopbackInfo]
  return;
}
// [End print_LoopbackInfo]

// [StartExclude all_audioLoopbackDebugInfo]
@Entry
@Component
struct Index {
  @State currentState: string = '未初始化';
  @State logMessages: string = '暂无日志信息';

  updateLogInfo(msg: string, isError: boolean): void {
    const timestamp = new Date().toLocaleTimeString();
    const prefix = isError ? '[ERROR]' : '[INFO]';
    this.logMessages = `[${timestamp}] ${prefix} ${msg}`;
  }

  build(): void {
    Scroll() {
      Column() {
        Column() {
          Text('返听器调试信息查询Demo')
            .fontSize(18)
            .fontWeight(600)
            .margin({ bottom: 12 })

          Column() {
            Text('Current State')
              .fontSize(14)
              .fontWeight(600)
              .margin({ bottom: 8 })
            Text(this.currentState)
              .fontSize(14)
              .fontColor('#007DFF')
              .width('100%')
              .padding(10)
              .backgroundColor('#F0F0F0')
              .borderRadius(8)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 12 })

          Column() {
            Text('日志信息')
              .fontSize(14)
              .fontWeight(600)
              .margin({ bottom: 8 })
            Text(this.logMessages)
              .fontSize(13)
              .fontColor('#52C41A')
              .width('100%')
              .padding(10)
              .backgroundColor('#F0F0F0')
              .borderRadius(8)
              .maxLines(5)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 20 })
        }
        .width('100%')
        .padding(16)
        .backgroundColor(Color.White)
        .borderRadius(12)
        .margin({ bottom: 16 })

        Row() {
          Column() {
            Text('创建音频低时延耳返实例')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ right: 12, bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
            let hasPermission = await requestMicrophonePermission(context);
            if (!hasPermission) {
              this.updateLogInfo('麦克风权限未授权', true);
              this.currentState = 'Permission denied';
              return;
            }
            await init((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = 'Created';

            })();
          });

          Column() {
            Text('启用音频返听')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await enable((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = 'Enabled';

            })();
          });
        }

        Row() {
          Column() {
            Text('查询应用音频调试信息')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ right: 12, bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
            printAppInfo(context, (msg, isError) => this.updateLogInfo(msg, isError));
          });

          Column() {
            Text('Print Loopback Debug Info')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
            printLoopbackInfo(context, (msg, isError) => this.updateLogInfo(msg, isError));
          });
        }
      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F1F3F5')
      .padding(16);
    }

  }
}
// [EndExclude all_audioLoopbackDebugInfo]
// [End all_audioLoopbackDebugInfo]
