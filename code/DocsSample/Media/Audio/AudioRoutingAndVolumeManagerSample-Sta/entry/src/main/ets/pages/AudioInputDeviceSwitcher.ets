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

// [Start setBluetoothAndNearlinkPreferredRecordCategory]
// [Start selectMediaInputDevice]
// [StartExclude setBluetoothAndNearlinkPreferredRecordCategory]
// [StartExclude selectMediaInputDevice]
import { Entry, Text, Column, Component, Button, ClickEvent, HorizontalAlign, FontWeight, Scroll, Row, Color, FlexAlign, ScrollDirection, BarState } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
// [EndExclude setBluetoothAndNearlinkPreferredRecordCategory]
// [EndExclude selectMediaInputDevice]
import { audio } from '@kit.AudioKit';
// [StartExclude selectMediaInputDevice]

// [StartExclude setBluetoothAndNearlinkPreferredRecordCategory]
// [EndExclude selectMediaInputDevice]
import { BusinessError } from '@kit.BasicServicesKit';

// [StartExclude selectMediaInputDevice]
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

// [EndExclude setBluetoothAndNearlinkPreferredRecordCategory]
// [EndExclude selectMediaInputDevice]
let audioManager = audio.getAudioManager();
let audioSessionManager = audioManager.getSessionManager();

// [StartExclude setBluetoothAndNearlinkPreferredRecordCategory]
// [StartExclude selectMediaInputDevice]
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

async function activateAudioSession(){
  // 应用根据业务场景设置适合自己的音频会话场景，激活AudioSession时，系统会根据应用选择的音频会话场景申请对应的音频焦点。
  audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION);

  // 设置音频会话策略。
  let strategy: audio.AudioSessionStrategy = {
    concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
  };

  // 激活AudioSession。
  audioSessionManager.activateAudioSession(strategy).then(() => {
    console.info('Succeeded in activating audio session.');
    globalLogUpdate('Succeeded in activating audio session.', false);
  }).catch((err) => {
    console.error(`Failed to activate audio session. Code: ${err.code}, message: ${err.message}`);
    globalLogUpdate(`Failed to activate audio session. Code: ${err.code}, message: ${err.message}`, true);
  });
}

async function onCurrentInputDeviceChanged(){
  // [EndExclude selectMediaInputDevice]
  // 监听当前输入设备变化事件,当选择输入设备成功后会触发该回调。
  audioSessionManager.onCurrentInputDeviceChanged((currentInputDeviceChangedEvent: audio.CurrentInputDeviceChangedEvent) => {
    console.info(`Succeeded in using on function. CurrentInputDeviceChangedEvent: ${JSON.stringify(currentInputDeviceChangedEvent)}`);
    // [StartExclude selectMediaInputDevice]
    let callbackMsg = 'onCurrentInputDeviceChanged' + '\n';
    callbackMsg += 'Device change reason: ' + currentInputDeviceChangedEvent.changeReason + '\n';
    callbackMsg += 'Device count: ' + currentInputDeviceChangedEvent.devices.length + '\n';
    for (let i = 0; i < currentInputDeviceChangedEvent.devices.length; i++) {
      callbackMsg += `Device ${i} - id: ${currentInputDeviceChangedEvent.devices[i].id} - name: ${currentInputDeviceChangedEvent.devices[i].name} - type: ${currentInputDeviceChangedEvent.devices[i].deviceType}\n`;
    }
    globalCallbackUpdate(callbackMsg);
    // [EndExclude selectMediaInputDevice]
  });
  // [StartExclude selectMediaInputDevice]
}

async function setBluetoothAndNearlinkPreferredRecordCategory(){
  // [EndExclude setBluetoothAndNearlinkPreferredRecordCategory]
  audioSessionManager.setBluetoothAndNearlinkPreferredRecordCategory(audio.BluetoothAndNearlinkPreferredRecordCategory.PREFERRED_DEFAULT).then(() => {
    console.info('Succeeded in setting bluetooth and nearlink preferred record category.');
    // [StartExclude setBluetoothAndNearlinkPreferredRecordCategory]
    globalLogUpdate('Succeeded in setting bluetooth and nearlink preferred record category.', false);
    // [EndExclude setBluetoothAndNearlinkPreferredRecordCategory]
  }).catch((err) => {
    console.error(`Failed to set bluetooth and nearlink preferred record category. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude setBluetoothAndNearlinkPreferredRecordCategory]
    globalLogUpdate(`Failed to set bluetooth and nearlink preferred record category. Code: ${err.code}, message: ${err.message}`, true);
    // [EndExclude setBluetoothAndNearlinkPreferredRecordCategory]
  });
  // [End setBluetoothAndNearlinkPreferredRecordCategory]
}

async function onAvailableDeviceChange(){
  // [EndExclude selectMediaInputDevice]

  // 监听音频可选输入设备连接状态变化事件,当有输入设备上下线时会收到回调通知。
  audioSessionManager.onAvailableDeviceChange(audio.DeviceUsage.MEDIA_INPUT_DEVICES, (deviceChanged: audio.DeviceChangeAction) => {
    console.info(`Succeeded in using on function. DeviceChangeAction: ${JSON.stringify(deviceChanged)}`);
    // [StartExclude selectMediaInputDevice]
    let callbackMsg = 'onAvailableDeviceChange' + '\n';
    callbackMsg += 'Device change type: ' + deviceChanged.type + '\n';
    callbackMsg += 'Device count: ' + deviceChanged.deviceDescriptors.length + '\n';
    for (let i = 0; i < deviceChanged.deviceDescriptors.length; i++) {
      callbackMsg += `Device ${i} - id: ${deviceChanged.deviceDescriptors[i].id} - name: ${deviceChanged.deviceDescriptors[i].name} - type: ${deviceChanged.deviceDescriptors[i].deviceType}\n`;
    }
    globalCallbackUpdate(callbackMsg);
    // [EndExclude selectMediaInputDevice]
  });
  // [StartExclude selectMediaInputDevice]
}

async function selectMediaInputDevice(){
  // [EndExclude selectMediaInputDevice]

  try {
    // 获取当前可选的音频输入设备列表。
    let data = audioSessionManager.getAvailableDevices(audio.DeviceUsage.MEDIA_INPUT_DEVICES);
    console.info(`Succeeded in getting available devices. AudioDeviceDescriptors: ${JSON.stringify(data)}`);
    // 当前可选音频输入设备列表不为空时,可进行选择。
    audioSessionManager.selectMediaInputDevice(data[0]).then(() => {
      console.info('Succeeded in selecting media input device.');
      // [StartExclude selectMediaInputDevice]
      globalLogUpdate('Succeeded in selecting media input device.', false);
      // [EndExclude selectMediaInputDevice]
    }).catch((err) => {
      console.error(`Failed to select media input device. Code: ${err.code}, message: ${err.message}`);
      // [StartExclude selectMediaInputDevice]
      globalLogUpdate(`Failed to select media input device. Code: ${err.code}, message: ${err.message}`, true);
      // [EndExclude selectMediaInputDevice]
    });
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to getAvailableDevices. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude selectMediaInputDevice]
    globalLogUpdate(`Failed to getAvailableDevices. Code: ${error.code}, message: ${error.message}`, true);
    // [EndExclude selectMediaInputDevice]
  }
  // [StartExclude selectMediaInputDevice]
}

async function getSelectedMediaInputDevice(){
  // [EndExclude selectMediaInputDevice]

  try {
    // 可通过该接口查询选择输入设备是否成功。
    let device: audio.AudioDeviceDescriptor = audioSessionManager.getSelectedMediaInputDevice();
    console.info(`Succeeded in getting selected media input device. Device: ${JSON.stringify(device)}`);
    // [StartExclude selectMediaInputDevice]
    let deviceInfo = 'Succeeded in getting selected media input device.\n';
    deviceInfo += `Device - id: ${device.id} - name: ${device.name} - type: ${device.deviceType}\n`;
    globalLogUpdate(deviceInfo, false);
    // [EndExclude selectMediaInputDevice]
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to get selected media input device. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude selectMediaInputDevice]
    globalLogUpdate(`Failed to get selected media input device. Code: ${error.code}, message: ${error.message}`, true);
    // [EndExclude selectMediaInputDevice]
  }
  // [StartExclude selectMediaInputDevice]
}

async function clearSelectedMediaInputDevice(){
  // [EndExclude selectMediaInputDevice]

  // 清空通过selectMediaInputDevice选择的输入设备。
  audioSessionManager.clearSelectedMediaInputDevice().then(() => {
    console.info('Succeeded in clearing selected media input device.');
    // [StartExclude selectMediaInputDevice]
    globalLogUpdate('Succeeded in clearing selected media input device.', false);
    // [EndExclude selectMediaInputDevice]
  }).catch((err) => {
    console.error(`Failed to clear selected media input device. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude selectMediaInputDevice]
    globalLogUpdate(`Failed to clear selected media input device. Code: ${err.code}, message: ${err.message}`, true);
    // [EndExclude selectMediaInputDevice]
  });
  // [End selectMediaInputDevice]
}

@Entry
@Component
struct AudioInputDeviceSwitcher {
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
          .id('input_switcher_back')
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
            .id("input_switcher_init")
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
            .id("input_switcher_start")
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
              Text('激活AudioSession').fontSize(15).fontColor(Color.White)
            }
            .id("input_switcher_activateAudioSession")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              activateAudioSession();
              this.runningResult = 'Succeeded in activating audio session.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('选择蓝牙或星闪进行录音').fontSize(15).fontColor(Color.White)
            }
            .id("input_switcher_setBluetoothAndNearlinkPreferredRecordCategory")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              setBluetoothAndNearlinkPreferredRecordCategory();
              this.runningResult = 'Succeeded in setting bluetooth and nearlink preferred record category.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('监听当前输入设备变化').fontSize(15).fontColor(Color.White)
            }
            .id("input_switcher_onCurrentInputDeviceChanged")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              onCurrentInputDeviceChanged();
              this.runningResult = 'Register currentInputDeviceChanged success.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('监听可选设备连接状态变化').fontSize(15).fontColor(Color.White)
            }
            .id("input_switcher_onAvailableDeviceChange")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              onAvailableDeviceChange();
              this.runningResult = 'Register availableDeviceChange success.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('设置媒体输入设备').fontSize(15).fontColor(Color.White)
            }
            .id("input_switcher_selectMediaInputDevice")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              selectMediaInputDevice();
              this.runningResult = 'Succeeded in selecting media input device.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('查询设置的媒体输入设备').fontSize(15).fontColor(Color.White)
            }
            .id("input_switcher_getSelectedMediaInputDevice")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              getSelectedMediaInputDevice();
              this.runningResult = 'Succeeded in getting selected media input device.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('清空设置的媒体输入设备').fontSize(15).fontColor(Color.White)
            }
            .id("input_switcher_clearSelectedMediaInputDevice")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              clearSelectedMediaInputDevice();
              this.runningResult = 'Succeeded in clearing selected media input device.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('停止录制').fontSize(15).fontColor(Color.White)
            }
            .id("input_switcher_stop")
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