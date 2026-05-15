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

// [Start getRoutingManager]
// [Start getDevices]
// [Start onDeviceChange]
// [StartExclude getRoutingManager]
// [StartExclude getDevices]
// [StartExclude onDeviceChange]
import { Entry, Text, Column, Component, Button, ClickEvent, HorizontalAlign, FontWeight, Scroll, Row, Color, FlexAlign, ScrollDirection, BarState } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
// [EndExclude getRoutingManager]
// [EndExclude getDevices]
// [EndExclude onDeviceChange]
import { audio } from '@kit.AudioKit';
// [StartExclude getRoutingManager]
// [StartExclude getDevices]
// [StartExclude onDeviceChange]
import { common } from '@kit.AbilityKit';
import { fileIo, WriteOptions } from '@kit.CoreFileKit';
import { Callback } from '@ohos.base';

// 全局UI更新回调
let globalLogUpdate: ((msg: string, isError: boolean) => void) = () => {};
let globalCallbackUpdate: ((msg: string) => void) = () => {};

let audioCapturer: audio.AudioCapturer | null = null;
let audioStreamInfo: audio.AudioStreamInfo = {
  samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, // 采样率。
  channels: audio.AudioChannel.CHANNEL_2, // 通道。
  sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 采样格式。
  encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW // 编码格式。
};
let audioCapturerInfo: audio.AudioCapturerInfo = {
  source: audio.SourceType.SOURCE_TYPE_MIC, // 音源类型：Mic音频源。根据业务场景配置，参考SourceType。
  capturerFlags: 0 // 音频采集器标志。
};
let audioCapturerOptions: audio.AudioCapturerOptions = {
  streamInfo: audioStreamInfo,
  capturerInfo: audioCapturerInfo
};
let file: fileIo.File;
let readDataCallback: Callback<ArrayBuffer> = () => {};
// [EndExclude getRoutingManager]
let audioManager = audio.getAudioManager();
let audioRoutingManager = audioManager.getRoutingManager();
// [End getRoutingManager]

async function initArguments(context: common.UIAbilityContext) {
  let bufferSize: long = 0;
  let path = context.cacheDir;
  let filePath = path + '/StarWars10s-2C-48000-4SW.pcm';
  file = fileIo.openSync(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
  readDataCallback = (buffer: ArrayBuffer) => {
    let options: WriteOptions = {
      offset: bufferSize,
      length: buffer.byteLength
    }
    fileIo.writeSync(file.fd, buffer, options);
    bufferSize += buffer.byteLength;
  };
}

// 初始化，创建实例，设置监听事件。
async function init(context: common.UIAbilityContext) {
  await initArguments(context);
  audio.createAudioCapturer(audioCapturerOptions).then((data) => {
    audioCapturer = data as audio.AudioCapturer;
    (audioCapturer as audio.AudioCapturer).onReadData(readDataCallback);
    console.info('Succeeded in creating audio capturer.');
    globalLogUpdate('Succeeded in creating audio capturer.', false);
  }).catch((err) => {
    console.info(`Failed to create audio capturer. Code: ${err.code}, message: ${err.message}`);
    globalLogUpdate(`Failed to create audio capturer. Code: ${err.code}, message: ${err.message}`, true);
  });
}

// 开始一次音频采集。
async function start() {
  if (audioCapturer !== null) {
    if ((audioCapturer as audio.AudioCapturer).state.valueOf() != audio.AudioState.STATE_PREPARED &&
      (audioCapturer as audio.AudioCapturer).state.valueOf() != audio.AudioState.STATE_PAUSED &&
      (audioCapturer as audio.AudioCapturer).state.valueOf() != audio.AudioState.STATE_STOPPED) {
      console.error('Audio capturer state is invalid.');
      globalLogUpdate('Audio capturer state is invalid.', true);
      return;
    }

    // 启动采集。
    (audioCapturer as audio.AudioCapturer).start().then((data) => {
      console.info('Succeeded in starting audio capturer.');
      globalLogUpdate('Succeeded in starting audio capturer.', false);
    }).catch((err) => {
      console.error(`Failed to start audio capturer. Code: ${err.code}, message: ${err.message}`);
      globalLogUpdate(`Failed to start audio capturer. Code: ${err.code}, message: ${err.message}`, true);
    });
  }
}

// 停止采集。
async function stop() {
  if (audioCapturer !== null) {
    // 只有采集器状态为STATE_RUNNING或STATE_PAUSED的时候才可以停止。
    if ((audioCapturer as audio.AudioCapturer).state.valueOf() !== audio.AudioState.STATE_RUNNING &&
      (audioCapturer as audio.AudioCapturer).state.valueOf() !== audio.AudioState.STATE_PAUSED) {
      console.info('Audio capturer state is not running or paused.');
      globalLogUpdate('Audio capturer state is not running or paused.', true);
      return;
    }

    // 停止采集。
    (audioCapturer as audio.AudioCapturer).stop().then((data) => {
      console.info('Succeeded in stopping audio capturer.');
      globalLogUpdate('Succeeded in stopping audio capturer.', false);
    }).catch((err) => {
      console.error(`Failed to stop audio capturer. Code: ${err.code}, message: ${err.message}`);
      globalLogUpdate(`Failed to stop audio capturer. Code: ${err.code}, message: ${err.message}`, true);
    });
  }
}

async function getDevices(){
  // [EndExclude getDevices]
  audioRoutingManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG).then((audioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
    console.info(`Succeeded in getting devices. AudioDeviceDescriptors: ${JSON.stringify(audioDeviceDescriptors)}`);
    // [StartExclude getDevices]
    let deviceInfo = 'Succeeded in getting devices.\n';
    deviceInfo += 'Device count: ' + audioDeviceDescriptors.length + '\n';
    for (let i = 0; i < audioDeviceDescriptors.length; i++) {
      deviceInfo += `Device ${i} - id: ${audioDeviceDescriptors[i].id} - name: ${audioDeviceDescriptors[i].name} - type: ${audioDeviceDescriptors[i].deviceType}\n`;
    }
    globalLogUpdate(deviceInfo, false);
    // [EndExclude getDevices]
  }).catch((err) => {
    console.error(`Failed to get devices. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude getDevices]
    globalLogUpdate(`Failed to get devices. Code: ${err.code}, message: ${err.message}`, true);
    // [EndExclude getDevices]
  });
  // [End getDevices]
}

async function onDeviceChange(){
  // [EndExclude onDeviceChange]
  audioRoutingManager.onDeviceChange(audio.DeviceFlag.INPUT_DEVICES_FLAG, (deviceChanged: audio.DeviceChangeAction) => {
    console.info(`Succeeded in using on function. DeviceChangeAction: ${JSON.stringify(deviceChanged)}`);
    // [StartExclude onDeviceChange]
    let callbackMsg = 'onDeviceChange' + '\n';
    callbackMsg += 'Device change type: ' + deviceChanged.type + '\n';
    callbackMsg += 'Device count: ' + deviceChanged.deviceDescriptors.length + '\n';
    for (let i = 0; i < deviceChanged.deviceDescriptors.length; i++) {
      callbackMsg += `Device ${i} - id: ${deviceChanged.deviceDescriptors[i].id} - name: ${deviceChanged.deviceDescriptors[i].name} - type: ${deviceChanged.deviceDescriptors[i].deviceType}\n`;
    }
    globalCallbackUpdate(callbackMsg);
    // [EndExclude onDeviceChange]
  });
}

@Entry
@Component
struct Index {
  @State private runningResult: string = '暂无运行结果';
  @State logMessages: string = '暂无日志信息';
  @State callbackMessages: string = '暂无回调信息';

  aboutToAppear(): void {
    // 设置全局回调。
    globalLogUpdate = (msg, isError) => this.updateLogInfo(msg, isError);
    globalCallbackUpdate = (msg) => this.updateCallbackInfo(msg);
  }

  // 更新日志信息。
  updateLogInfo(msg: string, isError: boolean): void {
    const timestamp = new Date().toLocaleTimeString();
    const prefix = isError ? '[ERROR]' : '[INFO]';
    this.logMessages = `[${timestamp}] ${prefix} ${msg}`;
  }

  // 更新回调信息。
  updateCallbackInfo(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.callbackMessages = `[${timestamp}] ${msg}`;
  }

  build(): void {
    Column() {
      // 信息显示区域（保持不变）
      Column() {
        Text('实时状态信息')
          .id('input_management_back')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 12 })
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().pushUrl({ url: "pages/Index" });
          })

        Column() {
          Text('运行结果')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 8 })
          Text(this.runningResult)
            .fontSize(12)
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
            .fontWeight(FontWeight.Bold)
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
            .fontWeight(FontWeight.Bold)
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
      .height('50%')

      Scroll() {
        Column() {
          Row() {
            Button() {
              Text('创建音频录制对象').fontSize(15).fontColor(Color.White)
            }
            .id("input_management_init")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
              init(context);
              this.runningResult = 'Succeeded in creating audio capturer.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('开始录制').fontSize(15).fontColor(Color.White)
            }
            .id("input_management_start")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              start();
              this.runningResult = 'Succeeded in starting audio capturer.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('获取输入设备信息').fontSize(15).fontColor(Color.White)
            }
            .id("input_management_getDevices")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              getDevices();
              this.runningResult = 'Succeeded in getting devices.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('监听设备连接状态变化').fontSize(15).fontColor(Color.White)
            }
            .id("input_management_onDeviceChange")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              onDeviceChange();
              this.runningResult = 'Register deviceChange success.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('停止录制').fontSize(15).fontColor(Color.White)
            }
            .id("input_management_stop")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              stop();
              this.runningResult = 'Succeeded in stopping audio capturer.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)
        }
        .width('100%')
      }
      .height('50%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}