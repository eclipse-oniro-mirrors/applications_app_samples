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
// [Start isEnhancedRoutingSupported]
// [Start select_OutputDevice]
// [Start select_InputDevice]
// [Start select_OutputDeviceForAudioRenderer]
// [Start select_InputDeviceForAudioCapturer]
import audio from '@ohos.multimedia.audio';
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import {
  Entry, Component, State, Scroll, Column, Row, Text, Color, FlexAlign, HorizontalAlign, TextOverflow, ClickEvent,
  DialogAlignment, SheetInfo
} from '@kit.ArkUI';

let audioManager = audio.getAudioManager();
let audioDeviceEnhanceManager: audio.AudioDeviceEnhanceManager = audioManager.getDeviceEnhanceManager();
let audioSessionManager = audioManager.getSessionManager();

let audioRenderer: audio.AudioRenderer | undefined = undefined;
let audioCapturer: audio.AudioCapturer | undefined = undefined;
let audioStreamInfo: audio.AudioStreamInfo = {
  samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
  channels: audio.AudioChannel.CHANNEL_2,
  sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
  encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
};

let audioRendererInfo: audio.AudioRendererInfo = {
  usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
  rendererFlags: 0
};

let audioRendererOptions: audio.AudioRendererOptions = {
  streamInfo: audioStreamInfo,
  rendererInfo: audioRendererInfo
};

let audioCapturerInfo: audio.AudioCapturerInfo = {
  source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
  capturerFlags: 0
};

let audioCapturerOptions: audio.AudioCapturerOptions = {
  streamInfo: audioStreamInfo,
  capturerInfo: audioCapturerInfo
};

// [StartExclude isEnhancedRoutingSupported]
// [StartExclude select_OutputDevice]
// [StartExclude select_InputDevice]
// [StartExclude select_OutputDeviceForAudioRenderer]
// [StartExclude select_InputDeviceForAudioCapturer]
async function requestMicrophonePermission(context: common.UIAbilityContext): Promise<boolean> {
  let atManager = abilityAccessCtrl.createAtManager();
  let result: PermissionRequestResult = await atManager
    .requestPermissionsFromUser(context, ['ohos.permission.MICROPHONE']);
  let firstResult = result.authResults.find((value: int, index: int, array: Array<int>): boolean => {
    return index === 0;
  });
  return firstResult === 0;
}

function logDevice(device: audio.AudioDeviceDescriptor): string {
  let deviceInfo = `Device - id: ${device.id}\n`;
  deviceInfo += `Device - name: ${device.name}\n`;
  deviceInfo += `Device - type: ${device.deviceType}\n`;
  deviceInfo += `Device - role: ${device.deviceRole}\n`;
  deviceInfo += `Device - address: ${device.address}\n`;
  return deviceInfo;
}

function checkEnhancedRoutingSupported(updateCallback?: (msg: string, isError: boolean) => void): boolean {
  // [EndExclude isEnhancedRoutingSupported]
  let isSupported: boolean = audioDeviceEnhanceManager.isEnhancedRoutingSupported();
  console.info(`Succeeded in querying whether enhanced routing is supported. Result: ${isSupported}.`);
  // [StartExclude isEnhancedRoutingSupported]
  if (updateCallback) {
    updateCallback(`isEnhancedRoutingSupported: ${isSupported}`, false);
  }
  // [End isEnhancedRoutingSupported]
  return isSupported;
}

async function selectOutputDevice(device: audio.AudioDeviceDescriptor,
  updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  if (!checkEnhancedRoutingSupported(updateCallback)) {
    if (updateCallback) {
      updateCallback('Enhanced routing is not supported, selectOutputDevice will not take effect.', true);
    }
    return;
  }
  // [EndExclude select_OutputDevice]
  try {
    await audioDeviceEnhanceManager.selectOutputDevice(device);
    console.info('Succeeded in selecting output device.');
    // [StartExclude select_OutputDevice]
    if (updateCallback) {
      updateCallback('Succeeded in selecting output device.\n' + logDevice(device), false);
    }
    // [EndExclude select_OutputDevice]
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to select output device. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude select_OutputDevice]
    if (updateCallback) {
      updateCallback(`Failed to select output device. Code: ${error.code}, message: ${error.message}`, true);
    }
    // [End select_OutputDevice]
  }
}

async function selectInputDevice(device: audio.AudioDeviceDescriptor,
  updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  if (!checkEnhancedRoutingSupported(updateCallback)) {
    if (updateCallback) {
      updateCallback('Enhanced routing is not supported, selectInputDevice will not take effect.', true);
    }
    return;
  }
  // [EndExclude select_InputDevice]
  try {
    await audioDeviceEnhanceManager.selectInputDevice(device);
    console.info('Succeeded in selecting input device.');
    // [StartExclude select_InputDevice]
    if (updateCallback) {
      updateCallback('Succeeded in selecting input device.\n' + logDevice(device), false);
    }
    // [EndExclude select_InputDevice]
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to select input device. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude select_InputDevice]
    if (updateCallback) {
      updateCallback(`Failed to select input device. Code: ${error.code}, message: ${error.message}`, true);
    }
    // [End select_InputDevice]
  }
}

async function selectOutputDeviceForAudioRenderer(renderer: audio.AudioRenderer,
  outputDevice: audio.AudioDeviceDescriptor,
  updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  if (!checkEnhancedRoutingSupported(updateCallback)) {
    if (updateCallback) {
      updateCallback('Enhanced routing is not supported, selectOutputDeviceForAudioRenderer will not take effect.', true);
    }
    return;
  }
  // [EndExclude select_OutputDeviceForAudioRenderer]
  try {
    await audioDeviceEnhanceManager.selectOutputDeviceForAudioRenderer(renderer, outputDevice);
    console.info('Succeeded in selecting output device for audio renderer.');
    // [StartExclude select_OutputDeviceForAudioRenderer]
    if (updateCallback) {
      updateCallback('Succeeded in selecting output device for audio renderer.\n' + logDevice(outputDevice), false);
    }
    // [EndExclude select_OutputDeviceForAudioRenderer]
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to select output device for audio renderer. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude select_OutputDeviceForAudioRenderer]
    if (updateCallback) {
      updateCallback(`Failed to select output device for audio renderer. Code: ${error.code}, message: ${error.message}`, true);
    }
    // [End select_OutputDeviceForAudioRenderer]
  }
}

async function selectInputDeviceForAudioCapturer(capturer: audio.AudioCapturer,
  inputDevice: audio.AudioDeviceDescriptor,
  updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  if (!checkEnhancedRoutingSupported(updateCallback)) {
    if (updateCallback) {
      updateCallback('Enhanced routing is not supported, selectInputDeviceForAudioCapturer will not take effect.', true);
    }
    return;
  }
  // [EndExclude select_InputDeviceForAudioCapturer]
  try {
    await audioDeviceEnhanceManager.selectInputDeviceForAudioCapturer(capturer, inputDevice);
    console.info('Succeeded in selecting input device for audio capturer.');
    // [StartExclude select_InputDeviceForAudioCapturer]
    if (updateCallback) {
      updateCallback('Succeeded in selecting input device for audio capturer.\n' + logDevice(inputDevice), false);
    }
    // [EndExclude select_InputDeviceForAudioCapturer]
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to select input device for audio capturer. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude select_InputDeviceForAudioCapturer]
    if (updateCallback) {
      updateCallback(`Failed to select input device for audio capturer. Code: ${error.code}, message: ${error.message}`, true);
    }
    // [End select_InputDeviceForAudioCapturer]
  }
}

async function createAudioRenderer(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  try {
    let renderer = await audio.createAudioRenderer(audioRendererOptions);
    if (renderer === null) {
      console.info('AudioRenderer Created : ERROR : renderer is null');
      // [StartExclude select_OutputDeviceForAudioRenderer]
      if (updateCallback) {
        updateCallback('AudioRenderer Created : ERROR : renderer is null', true);
      }
      // [EndExclude select_OutputDeviceForAudioRenderer]
      return;
    }
    audioRenderer = renderer;
    console.info('AudioRenderer Created : Success');
    // [StartExclude select_OutputDeviceForAudioRenderer]
    if (updateCallback) {
      updateCallback('AudioRenderer Created : Success', false);
    }
    // [EndExclude select_OutputDeviceForAudioRenderer]
  } catch (err) {
    let error = err as BusinessError;
    console.error(`AudioRenderer Created : ERROR : ${error.message}`);
    // [StartExclude select_OutputDeviceForAudioRenderer]
    if (updateCallback) {
      updateCallback(`AudioRenderer Created : ERROR : ${error.message}`, true);
    }
    // [EndExclude select_OutputDeviceForAudioRenderer]
  }
}

async function createAudioCapturer(context: common.UIAbilityContext,
  updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let hasPermission = await requestMicrophonePermission(context);
  if (!hasPermission) {
    if (updateCallback) {
      updateCallback('麦克风权限未授权,无法创建AudioCapturer', true);
    }
    return;
  }
  try {
    let capturer = await audio.createAudioCapturer(audioCapturerOptions);
    if (capturer === null) {
      console.info('AudioCapturer Created : ERROR : capturer is null');
      // [StartExclude select_InputDeviceForAudioCapturer]
      if (updateCallback) {
        updateCallback('AudioCapturer Created : ERROR : capturer is null', true);
      }
      // [EndExclude select_InputDeviceForAudioCapturer]
      return;
    }
    audioCapturer = capturer;
    console.info('AudioCapturer Created : Success');
    // [StartExclude select_InputDeviceForAudioCapturer]
    if (updateCallback) {
      updateCallback('AudioCapturer Created : Success', false);
    }
    // [EndExclude select_InputDeviceForAudioCapturer]
  } catch (err) {
    let error = err as BusinessError;
    console.error(`AudioCapturer Created : ERROR : ${error.message}`);
    // [StartExclude select_InputDeviceForAudioCapturer]
    if (updateCallback) {
      updateCallback(`AudioCapturer Created : ERROR : ${error.message}`, true);
    }
    // [EndExclude select_InputDeviceForAudioCapturer]
  }
}

function getAvailableOutputDevices(): audio.AudioDeviceDescriptors {
  return audioSessionManager.getAvailableDevices(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES);
}

function getAvailableInputDevices(): audio.AudioDeviceDescriptors {
  return audioSessionManager.getAvailableDevices(audio.DeviceUsage.MEDIA_INPUT_DEVICES);
}

function buildDeviceSheets(devices: audio.AudioDeviceDescriptors,
  onSelect: (device: audio.AudioDeviceDescriptor) => void): Array<SheetInfo> {
  let result: Array<SheetInfo> = [];
  for (let i = 0; i < devices.length; i++) {
    let item = devices[i];
    let name: string = '\n' + (item.name || item.displayName) + '\n';
    let sheet: SheetInfo = { title: name, action: (): void => { onSelect(item); } };
    result.push(sheet);
  }
  return result;
}
// [EndExclude isEnhancedRoutingSupported]
// [EndExclude select_OutputDevice]
// [EndExclude select_InputDevice]
// [EndExclude select_OutputDeviceForAudioRenderer]
// [EndExclude select_InputDeviceForAudioCapturer]

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

  showOutputDeviceForApp(): void {
    let devices = getAvailableOutputDevices();
    if (devices.length === 0) {
      this.updateLogInfo('No available output devices found.', true);
      return;
    }
    this.getUIContext().showActionSheet({
      title: '选择输出设备',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      message: '为应用选择输出设备',
      sheets: buildDeviceSheets(devices, (device: audio.AudioDeviceDescriptor): void => {
        selectOutputDevice(device, (msg, isError) => this.updateLogInfo(msg, isError));
        this.currentState = '为应用选择输出: ' + (device.name || device.displayName);
      }),
    });
  }

  showInputDeviceForApp(): void {
    let devices = getAvailableInputDevices();
    if (devices.length === 0) {
      this.updateLogInfo('No available input devices found.', true);
      return;
    }
    this.getUIContext().showActionSheet({
      title: '选择输入设备',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      message: '为应用选择输入设备',
      sheets: buildDeviceSheets(devices, (device: audio.AudioDeviceDescriptor): void => {
        selectInputDevice(device, (msg, isError) => this.updateLogInfo(msg, isError));
        this.currentState = '为应用选择输入: ' + (device.name || device.displayName);
      }),
    });
  }

  showOutputDeviceForRenderer(): void {
    let renderer = audioRenderer;
    if (renderer === undefined) {
      this.updateLogInfo('请先创建AudioRenderer', true);
      return;
    }
    let devices = getAvailableOutputDevices();
    if (devices.length === 0) {
      this.updateLogInfo('No available output devices found.', true);
      return;
    }
    this.getUIContext().showActionSheet({
      title: '选择输出设备',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      message: '为Renderer选择输出设备',
      sheets: buildDeviceSheets(devices, (device: audio.AudioDeviceDescriptor): void => {
        selectOutputDeviceForAudioRenderer(renderer, device, (msg, isError) => this.updateLogInfo(msg, isError));
        this.currentState = '为Renderer选择输出: ' + (device.name || device.displayName);
      }),
    });
  }

  showInputDeviceForCapturer(): void {
    let capturer = audioCapturer;
    if (capturer === undefined) {
      this.updateLogInfo('请先创建AudioCapturer', true);
      return;
    }
    let devices = getAvailableInputDevices();
    if (devices.length === 0) {
      this.updateLogInfo('No available input devices found.', true);
      return;
    }
    this.getUIContext().showActionSheet({
      title: '选择输入设备',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      message: '为Capturer选择输入设备',
      sheets: buildDeviceSheets(devices, (device: audio.AudioDeviceDescriptor): void => {
        selectInputDeviceForAudioCapturer(capturer, device, (msg, isError) => this.updateLogInfo(msg, isError));
        this.currentState = '为Capturer选择输入: ' + (device.name || device.displayName);
      }),
    });
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

        Text('准备')
          .fontSize(16)
          .fontWeight(600)
          .margin({ bottom: 8 })

        Row() {
          Column() {
            Text('查询增强路由支持').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 12, bottom: 12 })
          .onClick((event: ClickEvent): void => {
            checkEnhancedRoutingSupported((msg, isError) => this.updateLogInfo(msg, isError));
          });

          Column() {
            Text('创建AudioRenderer').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 12 })
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
              await createAudioRenderer((msg, isError) => this.updateLogInfo(msg, isError));
              this.currentState = 'AudioRenderer已创建';
            })();
          });
        }

        Row() {
          Column() {
            Text('创建AudioCapturer').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 12, bottom: 12 })
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
              let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
              await createAudioCapturer(context, (msg, isError) => this.updateLogInfo(msg, isError));
              this.currentState = 'AudioCapturer已创建';
            })();
          });

          Column() {
            Text('View State').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 12 })
          .onClick((event: ClickEvent): void => {
            let renderer = audioRenderer;
            let capturer = audioCapturer;
            let rendererState = renderer !== undefined ? `Renderer: ${renderer.state}` : 'Renderer: 未创建';
            let capturerState = capturer !== undefined ? `Capturer: ${capturer.state}` : 'Capturer: 未创建';
            this.currentState = rendererState + '\n' + capturerState;
            this.updateLogInfo('View state: ' + rendererState + ', ' + capturerState, false);
          });
        }

        Text('应用级选择')
          .fontSize(16)
          .fontWeight(600)
          .margin({ bottom: 8 })

        Row() {
          Column() {
            Text('为应用选择输出').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 12, bottom: 12 })
          .onClick((event: ClickEvent): void => {
            this.showOutputDeviceForApp();
          });

          Column() {
            Text('为应用选择输入').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 12 })
          .onClick((event: ClickEvent): void => {
            this.showInputDeviceForApp();
          });
        }

        Text('流级选择')
          .fontSize(16)
          .fontWeight(600)
          .margin({ bottom: 8 })

        Row() {
          Column() {
            Text('为Renderer选择输出').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 12, bottom: 12 })
          .onClick((event: ClickEvent): void => {
            this.showOutputDeviceForRenderer();
          });

          Column() {
            Text('为Capturer选择输入').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 12 })
          .onClick((event: ClickEvent): void => {
            this.showInputDeviceForCapturer();
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
