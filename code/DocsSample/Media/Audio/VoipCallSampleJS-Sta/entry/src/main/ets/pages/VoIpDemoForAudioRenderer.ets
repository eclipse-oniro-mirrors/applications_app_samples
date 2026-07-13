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

// [Start all_VoIPDemoForAudioRenderer]
import audio from '@ohos.multimedia.audio'; // 导入audio模块。
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit'; // 导入文件操作模块。
import { common } from '@kit.AbilityKit'; // 导入UIAbilityContext。
import {
  Color,
  ClickEvent,
  Column,
  Component,
  Entry,
  FlexAlign,
  HorizontalAlign,
  Row,
  Scroll,
  Text
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

// 与使用AudioRenderer开发音频播放功能过程相似，关键区别在于audioRendererInfo参数和音频数据来源。
const TAG = 'VoIPDemoForAudioRenderer';
const SAMPLE_RATE_48000: int = 48000;

let bufferSize: long = 0;
let audioRenderer: audio.AudioRenderer | undefined = undefined;
let file: fs.File | undefined = undefined;
let writeDataCallback: audio.AudioRendererWriteDataCallback = (_buffer: ArrayBuffer): audio.AudioDataCallbackResult => {
  return audio.AudioDataCallbackResult.INVALID;
};

class RendererAudioStreamInfo implements audio.AudioStreamInfo {
  samplingRate: audio.AudioSamplingRate | int = SAMPLE_RATE_48000;
  channels: audio.AudioChannel = audio.AudioChannel.CHANNEL_2;
  sampleFormat: audio.AudioSampleFormat = audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE;
  encodingType: audio.AudioEncodingType = audio.AudioEncodingType.ENCODING_TYPE_RAW;
}

class VoipAudioRendererInfo implements audio.AudioRendererInfo {
  // 需使用通话场景相应的参数。
  usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION;
  rendererFlags: int = 0;
}

class VoipAudioRendererOptions implements audio.AudioRendererOptions {
  streamInfo: audio.AudioStreamInfo = new RendererAudioStreamInfo();
  rendererInfo: audio.AudioRendererInfo = new VoipAudioRendererInfo();
}

function createAudioRendererOptions(): audio.AudioRendererOptions {
  return new VoipAudioRendererOptions();
}
// [StartExclude all_VoIPDemoForAudioRenderer]
// 全局UI更新回调
let globalLogUpdate: (msg: string, isError: boolean) => void = (_msg: string, _isError: boolean): void => {};
let globalCallbackUpdate: (msg: string) => void = (_msg: string): void => {};
// [EndExclude all_VoIPDemoForAudioRenderer]
async function initArguments(context: common.UIAbilityContext) {
  let path = context.cacheDir;
  // 此处仅作示例，实际使用时需要将文件替换为应用要播放的PCM文件。
  let filePath = path + '/StarWars10s-2C-48000-4SW.pcm';
  file = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
  bufferSize = 0;
  writeDataCallback = (buffer: ArrayBuffer) => {
    const openedFile = file;
    if (openedFile === undefined) {
      return audio.AudioDataCallbackResult.INVALID;
    }
    let options: ReadOptions = {
      offset: bufferSize,
      length: buffer.byteLength.toLong()
    };

    try {
      let bufferLength = fs.readSync(openedFile.fd, buffer, options);
      bufferSize += buffer.byteLength.toLong();
      // 如果当前回调传入的数据不足一帧，空白区域需要使用静音数据填充，否则会导致播放出现杂音。
      if (bufferLength < buffer.byteLength.toLong()) {
        let view = new DataView(buffer);
        let startIndex = bufferLength.toInt();
        let endIndex = buffer.byteLength.toInt();
        for (let i: int = startIndex; i < endIndex; i++) {
          // 空白区域填充静音数据。当使用音频采样格式为SAMPLE_FORMAT_U8时0x7F为静音数据，使用其他采样格式时0为静音数据。
          view.setUint8(i, 0);
        }
      }
      // API version 12之前不支持返回回调结果，API version 12及以后支持返回回调结果。
      // 如果开发者不希望播放某段buffer，返回audio.AudioDataCallbackResult.INVALID即可。
      return audio.AudioDataCallbackResult.VALID;
    } catch (error) {
      console.error('Error reading file:', error);

      if (globalLogUpdate) {
        globalLogUpdate(`Error reading file: ${error}`, true);
      }
      // API version 12之前不支持返回回调结果，API version 12及以后支持返回回调结果。
      return audio.AudioDataCallbackResult.INVALID;
    }
  };
}

// 初始化，创建实例，设置监听事件。
async function init() {
  try {
    let renderer = await audio.createAudioRenderer(createAudioRendererOptions()); // 创建AudioRenderer实例。
    if (renderer === null) {
      const errorMsg = `${TAG}: creating AudioRenderer failed, renderer is null`;
      console.info(errorMsg);
      if (globalLogUpdate) {
        globalLogUpdate(errorMsg, true);
      }
      return;
    }
    console.info(`${TAG}: creating AudioRenderer success`);
    // [StartExclude all_VoIPDemoForAudioRenderer]
    const successMsg = `${TAG}: creating AudioRenderer success`;
    if (globalLogUpdate) {
      globalLogUpdate(successMsg, false);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
    audioRenderer = renderer;
    renderer.onWriteData(writeDataCallback);
  } catch (error) {
    console.info(`${TAG}: creating AudioRenderer failed, error: ${error}`);
    // [StartExclude all_VoIPDemoForAudioRenderer]
    const errorMsg = `${TAG}: creating AudioRenderer failed, error: ${error}`;
    if (globalLogUpdate) {
      globalLogUpdate(errorMsg, true);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
  }
}

// 开始一次音频渲染。
async function start() {
  const renderer = audioRenderer;
  if (renderer === undefined) {
    return;
  }
  const state = renderer.state;
  if (state !== audio.AudioState.STATE_PREPARED &&
    state !== audio.AudioState.STATE_PAUSED &&
    state !== audio.AudioState.STATE_STOPPED) { // 当且仅当状态为prepared、paused和stopped之一时才能启动渲染。
    console.error(TAG + 'start failed');
    // [StartExclude all_VoIPDemoForAudioRenderer]
    const errorMsg = `${TAG} start failed`;
    if (globalLogUpdate) {
      globalLogUpdate(errorMsg, true);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
    return;
  }
  try {
    // 启动渲染。
    await renderer.start();
    console.info('Renderer start success.');
    // [StartExclude all_VoIPDemoForAudioRenderer]
    if (globalLogUpdate) {
      globalLogUpdate('Renderer start success.', false);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
  } catch (error) {
    console.error(`Renderer start failed: ${error}`);
    // [StartExclude all_VoIPDemoForAudioRenderer]
    const errorMsg = `Renderer start failed: ${error}`;
    if (globalLogUpdate) {
      globalLogUpdate(errorMsg, true);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
  }
}

// 暂停渲染。
async function pause() {
  const renderer = audioRenderer;
  if (renderer === undefined) {
    return;
  }
  // 只有渲染器状态为running的时候才能暂停。
  if (renderer.state !== audio.AudioState.STATE_RUNNING) {
    console.info('Renderer is not running');
    // [StartExclude all_VoIPDemoForAudioRenderer]
    const infoMsg = `Renderer is not running`;
    if (globalLogUpdate) {
      globalLogUpdate(infoMsg, false);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
    return;
  }
  try {
    // 暂停渲染。
    await renderer.pause();
    console.info('Renderer pause success.');
    // [StartExclude all_VoIPDemoForAudioRenderer]
    if (globalLogUpdate) {
      globalLogUpdate('Renderer pause success.', false);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
  } catch (error) {
    console.error(`Renderer pause failed: ${error}`);
    // [StartExclude all_VoIPDemoForAudioRenderer]
    const errorMsg = `Renderer pause failed: ${error}`;
    if (globalLogUpdate) {
      globalLogUpdate(errorMsg, true);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
  }
}

// 停止渲染。
async function stop() {
  const renderer = audioRenderer;
  if (renderer === undefined) {
    return;
  }
  const state = renderer.state;
  // 只有渲染器状态为running或paused时才可以停止。
  if (state !== audio.AudioState.STATE_RUNNING &&
    state !== audio.AudioState.STATE_PAUSED) {
    console.info('Renderer is not running or paused.');
    // [StartExclude all_VoIPDemoForAudioRenderer]
    const infoMsg = `Renderer is not running or paused.`;
    if (globalLogUpdate) {
      globalLogUpdate(infoMsg, false);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
    return;
  }
  try {
    // 停止渲染。
    await renderer.stop();
    const openedFile = file;
    if (openedFile !== undefined) {
      fs.closeSync(openedFile);
      file = undefined;
    }
    console.info('Renderer stop success.');
    // [StartExclude all_VoIPDemoForAudioRenderer]
    const successMsg = `Renderer stop success.`;
    if (globalLogUpdate) {
      globalLogUpdate(successMsg, false);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
  } catch (error) {
    console.error(`Renderer stop failed: ${error}`);
    // [StartExclude all_VoIPDemoForAudioRenderer]
    const errorMsg = `Renderer stop failed: ${error}`;
    if (globalLogUpdate) {
      globalLogUpdate(errorMsg, true);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
  }
}

// 销毁实例，释放资源。
async function release() {
  const renderer = audioRenderer;
  if (renderer === undefined) {
    return;
  }
  // 渲染器状态不是released状态，才能release。
  if (renderer.state === audio.AudioState.STATE_RELEASED) {
    console.info('Renderer already released');
    // [StartExclude all_VoIPDemoForAudioRenderer]
    if (globalLogUpdate) {
      globalLogUpdate('Renderer already released', false);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
    return;
  }
  try {
    // 释放资源。
    await renderer.release();
    audioRenderer = undefined;
    console.info('Renderer release success.');
    // [StartExclude all_VoIPDemoForAudioRenderer]
    if (globalLogUpdate) {
      globalLogUpdate('Renderer release success.', false);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
  } catch (error) {
    console.error(`Renderer release failed: ${error}`);
    // [StartExclude all_VoIPDemoForAudioRenderer]
    const errorMsg = `Renderer release failed: ${error}`;
    if (globalLogUpdate) {
      globalLogUpdate(errorMsg, true);
    }
    // [EndExclude all_VoIPDemoForAudioRenderer]
  }
}
// [End all_VoIPDemoForAudioRenderer]

@Entry
@Component
struct Index {
  @State currentState: string = '未初始化';
  @State logMessages: string = '暂无日志信息';
  @State callbackMessages: string = '暂无回调信息';

  aboutToAppear(): void {
    // 设置全局回调
    globalLogUpdate = (msg: string, isError: boolean) => this.updateLogInfo(msg, isError);
    globalCallbackUpdate = (msg: string) => this.updateCallbackInfo(msg);
  }

  // 更新日志信息
  updateLogInfo(msg: string, isError: boolean): void {
    const timestamp = new Date().toLocaleTimeString();
    const prefix = isError ? '[ERROR]' : '[INFO]';
    this.logMessages = `[${timestamp}] ${prefix} ${msg}`;
  }

  // 更新回调信息
  updateCallbackInfo(msg: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.callbackMessages = `[${timestamp}] ${msg}`;
  }

  async initRenderer(): Promise<void> {
    this.currentState = '正在初始化...';
    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    await initArguments(context);
    await init();
    this.currentState = '初始化完成';
  }

  async startRenderer(): Promise<void> {
    this.currentState = '正在开始播放...';
    await start();
    this.currentState = '播放中';
  }

  async pauseRenderer(): Promise<void> {
    this.currentState = '正在暂停播放...';
    await pause();
    this.currentState = '已暂停';
  }

  async stopRenderer(): Promise<void> {
    this.currentState = '正在停止播放...';
    await stop();
    this.currentState = '已停止';
  }

  async releaseRenderer(): Promise<void> {
    this.currentState = '正在释放资源...';
    await release();
    this.currentState = '已释放';
  }

  build(): void {
    Scroll() {
      Column() {
        // 信息显示区域
        Column() {
          Text('实时状态信息')
            .fontSize(18)
            .fontWeight(600)
            .margin({ bottom: 12 })

          // 当前状态
          Column() {
            Text('当前状态')
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

          // 日志信息
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

          // 回调信息
          Column() {
            Text('数据回调信息')
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

        // 功能按钮
        Row() {
          Column() {
            Text('初始化').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('48%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 8, bottom: 12 })
          .onClick((_event: ClickEvent): void => {
            this.initRenderer();
          }, undefined);

          Column() {
            Text('开始播放').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('48%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 12 })
          .onClick((_event: ClickEvent): void => {
            this.startRenderer();
          }, undefined);
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Row() {
          Column() {
            Text('暂停播放').fontColor(Color.Black).fontSize(14);
          }
          .id('audio_effect_manager_card')
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('48%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 8, bottom: 12 })
          .onClick((_event: ClickEvent): void => {
            this.pauseRenderer();
          }, undefined);

          Column() {
            Text('停止播放').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('48%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 12 })
          .onClick((_event: ClickEvent): void => {
            this.stopRenderer();
          }, undefined);
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Row() {
          Column() {
            Text('释放资源').fontColor(Color.Black).fontSize(14);
          }
          .id('audio_volume_card')
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('48%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 8, bottom: 12 })
          .onClick((_event: ClickEvent): void => {
            this.releaseRenderer();
          }, undefined);
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F1F3F5')
      .padding(16);
    }
  }
}
