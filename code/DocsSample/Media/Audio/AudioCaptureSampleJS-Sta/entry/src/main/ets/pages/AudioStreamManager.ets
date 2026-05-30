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
// [Start get_StreamManager]
import audio from '@ohos.multimedia.audio';
import { Callback } from '@ohos.base';
import {
  Entry, Component, State, Scroll, Column, Text, Color, FlexAlign, HorizontalAlign, ClickEvent
} from '@kit.ArkUI';

let audioManager = audio.getAudioManager();
let audioStreamManager = audioManager.getStreamManager();
// [End get_StreamManager]

let globalCallbackUpdate: ((msg: string) => void) | undefined;

// 录制流变化监听会把流和设备信息同步到页面回调区域。
let audioCapturerChangeCallback: Callback<audio.AudioCapturerChangeInfoArray> =
  (audioCapturerChangeInfoArray: audio.AudioCapturerChangeInfoArray): void => {
    // [Start audioStreamManager_on]
    // [StartExclude audioStreamManager_on]
    let infoMsg = '';
    // [EndExclude audioStreamManager_on]
    audioCapturerChangeInfoArray.forEach((capturerChangeInfo: Readonly<audio.AudioCapturerChangeInfo>, i: int): void => {
      console.info(`## CapChange on is called for element ${i} ##`);
      console.info(`StreamId for ${i} is: ${capturerChangeInfo.streamId}`);
      console.info(`Source for ${i} is: ${capturerChangeInfo.capturerInfo.source}`);
      console.info(`Flag  ${i} is: ${capturerChangeInfo.capturerInfo.capturerFlags}`);

      // [StartExclude audioStreamManager_on]
      infoMsg += `CapChange on is called for element ${i}\n`;
      infoMsg += `StreamId for ${i} is: ${capturerChangeInfo.streamId}\n`;
      infoMsg += `Source for ${i} is: ${capturerChangeInfo.capturerInfo.source}\n`;
      infoMsg += `Flag ${i} is: ${capturerChangeInfo.capturerInfo.capturerFlags}\n`;
      // [EndExclude audioStreamManager_on]

      capturerChangeInfo.deviceDescriptors.forEach((descriptor: Readonly<audio.AudioDeviceDescriptor>, j: int): void => {
        let sampleRate = descriptor.sampleRates.find((value: int, index: int, array: Array<int>): boolean => {
          return index === 0;
        });
        let channelCount = descriptor.channelCounts.find((value: int, index: int, array: Array<int>): boolean => {
          return index === 0;
        });
        console.info(`Id: ${i} : ${descriptor.id}`);
        console.info(`Type: ${i} : ${descriptor.deviceType}`);
        console.info(`Role: ${i} : ${descriptor.deviceRole}`);
        console.info(`Name: ${i} : ${descriptor.name}`);
        console.info(`Address: ${i} : ${descriptor.address}`);
        console.info(`SampleRates: ${i} : ${sampleRate}`);
        console.info(`ChannelCounts ${i} : ${channelCount}`);
        console.info(`ChannelMask: ${i} : ${descriptor.channelMasks}`);
      });
    });

    let callback = globalCallbackUpdate;
    if (callback !== undefined) {
      // [StartExclude audioStreamManager_on]
      callback(infoMsg);
      // [EndExclude audioStreamManager_on]
    }
    // [End audioStreamManager_on]
  };

// 查询前注册监听，保证后续录制流变化能回显到页面。
function listenAudioStreamManager(): void {
  audioStreamManager.onAudioCapturerChange(audioCapturerChangeCallback);
}

// 查询完成后取消监听，避免重复回调。
function cancelListenAudioStreamManager(): void {
  // [Start cancel_ListenAudioStreamManager]
  audioStreamManager.offAudioCapturerChange(audioCapturerChangeCallback);
  console.info('CapturerChange Off is called');
  // [End cancel_ListenAudioStreamManager]
}

// 查询当前录制流信息，并把明细写入日志展示区。
// [Start get_CurrentAudioCapturerInfoArray]
async function getCurrentAudioCapturerInfoArray(updateCallback?:
  (msg: string, isError: boolean) => void): Promise<void>{
  // [StartExclude get_CurrentAudioCapturerInfoArray]
  listenAudioStreamManager();
  // [EndExclude get_CurrentAudioCapturerInfoArray]

  try {
    let audioCapturerChangeInfoArray = await audioStreamManager.getCurrentAudioCapturerInfoArray();
    console.info('getCurrentAudioCapturerInfoArray Get Promise Called');
    // [StartExclude get_CurrentAudioCapturerInfoArray]
    let detailInfo = 'getCurrentAudioCapturerInfoArray Get Promise Called\n';
    // [EndExclude get_CurrentAudioCapturerInfoArray]
    audioCapturerChangeInfoArray.forEach((capturerChangeInfo: Readonly<audio.AudioCapturerChangeInfo>, i: int): void => {
      console.info(`StreamId for ${i} is: ${capturerChangeInfo.streamId}`);
      console.info(`Source for ${i} is: ${capturerChangeInfo.capturerInfo.source}`);
      console.info(`Flag  ${i} is: ${capturerChangeInfo.capturerInfo.capturerFlags}`);

      // [StartExclude get_CurrentAudioCapturerInfoArray]
      detailInfo += `StreamId for ${i} is: ${capturerChangeInfo.streamId}\n`;
      detailInfo += `Source for ${i} is: ${capturerChangeInfo.capturerInfo.source}\n`;
      detailInfo += `Flag ${i} is: ${capturerChangeInfo.capturerInfo.capturerFlags}\n`;
      // [EndExclude get_CurrentAudioCapturerInfoArray]

      capturerChangeInfo.deviceDescriptors.forEach((descriptor: Readonly<audio.AudioDeviceDescriptor>, j: int): void => {
        let sampleRate = descriptor.sampleRates.find((value: int, index: int, array: Array<int>): boolean => {
          return index === 0;
        });
        let channelCount = descriptor.channelCounts.find((value: int, index: int, array: Array<int>): boolean => {
          return index === 0;
        });
        console.info(`Id: ${i} : ${descriptor.id}`);
        console.info(`Type: ${i} : ${descriptor.deviceType}`);
        console.info(`Role: ${i} : ${descriptor.deviceRole}`);
        console.info(`Name: ${i} : ${descriptor.name}`);
        console.info(`Address: ${i} : ${descriptor.address}`);
        console.info(`SampleRates: ${i} : ${sampleRate}`);
        console.info(`ChannelCounts ${i} : ${channelCount}`);
        console.info(`ChannelMask: ${i} : ${descriptor.channelMasks}`);
      });
    });
    if (updateCallback) {
      // [StartExclude get_CurrentAudioCapturerInfoArray]
      updateCallback(detailInfo, false);
      // [EndExclude get_CurrentAudioCapturerInfoArray]
    }
  } catch (err) {
    let error = err as Error;
    console.error(`Invoke getCurrentAudioCapturerInfoArray failed, message is ${error.message}`);
    // [StartExclude get_CurrentAudioCapturerInfoArray]
    const errorMsg = `Invoke getCurrentAudioCapturerInfoArray failed, message is ${error.message}`;
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
    // [EndExclude get_CurrentAudioCapturerInfoArray]
  }

  // [StartExclude get_CurrentAudioCapturerInfoArray]
  cancelListenAudioStreamManager();
  // [EndExclude get_CurrentAudioCapturerInfoArray]
}
// [End get_CurrentAudioCapturerInfoArray]

@Entry
@Component
struct Index {
  @State currentState: string = '未初始化';
  @State logMessages: string = '暂无日志信息';
  @State callbackMessages: string = '暂无回调信息';

  aboutToAppear(): void {
    // 页面出现时挂接全局回调，供静态监听函数更新 UI。
    globalCallbackUpdate = (msg: string) => this.updateCallbackInfo(msg);
  }

  updateLogInfo(msg: string, isError: boolean): void {
    const timestamp = new Date().toLocaleTimeString();
    const prefix = isError ? '[ERROR]' : '[INFO]';
    this.logMessages = `[${timestamp}] ${prefix} ${msg}`;
  }

  updateCallbackInfo(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.callbackMessages = `[${timestamp}] ${msg}`;
  }

  build(): void {
    Scroll() {
      Column() {
        Column() {
          Text('Status Info')
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
            Scroll() {
              Text(this.logMessages)
                .fontSize(12)
                .fontColor('#52C41A')
                .width('100%')
                .padding(10)
                .backgroundColor('#F0F0F0')
                .borderRadius(8)
            }
            .width('100%')
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 12 })

          Column() {
            Text('回调信息')
              .fontSize(14)
              .fontWeight(600)
              .margin({ bottom: 8 })
            Scroll() {
              Text(this.callbackMessages)
                .fontSize(12)
                .fontColor('#FA8C16')
                .width('100%')
                .padding(10)
                .backgroundColor('#F0F0F0')
                .borderRadius(8)
            }
            .width('100%')
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

        Column() {
          Text('Get Current Capturer Info').fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(60)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
          this.currentState = '正在获取录制流信息...';
          await getCurrentAudioCapturerInfoArray((msg, isError) => {
            this.updateLogInfo(msg, isError);
            if (!isError) {
              this.currentState = '获取成功';
            } else {
              this.currentState = '获取失败';
            }
          });

            })();
          });
      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F1F3F5')
      .padding(16);
    }
  }
}
