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
// [Start all_audioCapturer]
import audio from '@ohos.multimedia.audio';
import fs from '@ohos.file.fs';
import { ReadOptions, WriteOptions } from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { BusinessError, Callback } from '@ohos.base';
import {
  Entry, Component, State, Scroll, Column, Row, Text, Color, FlexAlign, HorizontalAlign, TextOverflow, ClickEvent
} from '@kit.ArkUI';
const TAG = 'AudioCapturerDemo';
let audioRenderer: audio.AudioRenderer | undefined = undefined;
let audioCapturer: audio.AudioCapturer | undefined = undefined;

// [Start create_AudioCapturer]
let audioStreamInfo: audio.AudioStreamInfo = {
  samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
  channels: audio.AudioChannel.CHANNEL_2,
  sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
  encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
};

let audioCapturerInfo: audio.AudioCapturerInfo = {
  source: audio.SourceType.SOURCE_TYPE_MIC,
  capturerFlags: 0
};

// 使用显式兼容类承载静态接口参数，避免生成包含可选字段的对象字面量。
class AudioCapturerOptionsCompat implements audio.AudioCapturerOptions {
  streamInfo: audio.AudioStreamInfo;
  capturerInfo: audio.AudioCapturerInfo;

  constructor(streamInfo: audio.AudioStreamInfo, capturerInfo: audio.AudioCapturerInfo) {
    this.streamInfo = streamInfo;
    this.capturerInfo = capturerInfo;
  }
}

class AudioRendererOptionsCompat implements audio.AudioRendererOptions {
  streamInfo: audio.AudioStreamInfo;
  rendererInfo: audio.AudioRendererInfo;

  constructor(streamInfo: audio.AudioStreamInfo, rendererInfo: audio.AudioRendererInfo) {
    this.streamInfo = streamInfo;
    this.rendererInfo = rendererInfo;
  }
}

let audioCapturerOptions: AudioCapturerOptionsCompat = new AudioCapturerOptionsCompat(audioStreamInfo, audioCapturerInfo);

let audioRendererInfo: audio.AudioRendererInfo = {
  usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
  rendererFlags: 0
};

let audioRendererOptions: AudioRendererOptionsCompat = new AudioRendererOptionsCompat(audioStreamInfo, audioRendererInfo);

let file: fs.File | undefined = undefined;
let readDataCallback: Callback<ArrayBuffer> = (_buffer: ArrayBuffer): void => {};
let writeDataCallback: audio.AudioRendererWriteDataCallback;

// [StartExclude all_audioCapturer]
async function requestMicrophonePermission(context: common.UIAbilityContext): Promise<boolean> {
  let atManager = abilityAccessCtrl.createAtManager();
  let result: PermissionRequestResult = await atManager
    .requestPermissionsFromUser(context, ['ohos.permission.MICROPHONE']);
  let firstResult = result.authResults.find((value: int, index: int, array: Array<int>): boolean => {
    return index === 0;
  });
  return firstResult === 0;
}
// [EndExclude all_audioCapturer]

// 采集回调将麦克风数据写入缓存 PCM 文件，供渲染侧读取。
async function initArguments(context: common.UIAbilityContext): Promise<void> {
  let bufferSize: long = 0;
  let path = context.cacheDir;
  let filePath = path + '/S16LE_2_48000.pcm';
  file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  readDataCallback = (buffer: ArrayBuffer) => {
    let options: WriteOptions = {
      offset: bufferSize,
      length: Int.toLong(buffer.byteLength)
    }
    let targetFile = file;
    if (targetFile === undefined) {
      return;
    }
    fs.writeSync(targetFile.fd, buffer, options);
    bufferSize += Int.toLong(buffer.byteLength);
  };
}

// 渲染回调从缓存 PCM 文件读取数据，末尾不足一帧时填充静音。
async function initRender(context: common.UIAbilityContext) {
  let bufferSize: long = 0;
  let path = context.cacheDir;
  let filePath = path + '/S16LE_2_48000.pcm';
  file = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
  writeDataCallback = (buffer: ArrayBuffer) => {
    let options: ReadOptions = {
      offset: bufferSize,
      length: Int.toLong(buffer.byteLength)
    };

    try {
      let sourceFile = file;
      if (sourceFile === undefined) {
        return audio.AudioDataCallbackResult.INVALID;
      }
      let bufferLength: long = fs.readSync(sourceFile.fd, buffer, options);
      let frameLength: int = buffer.byteLength;
      bufferSize += Int.toLong(frameLength);
      if (bufferLength < Int.toLong(frameLength)) {
        // PCM S16LE 静音值为 0x00，补齐未读取到的尾部数据。
        let view = new DataView(buffer);
        for (let i: int = 0; i < frameLength; i++) {
          if (Int.toLong(i) < bufferLength) {
            continue;
          }
          view.setUint8(i, 0);
        }
      }
      return audio.AudioDataCallbackResult.VALID;
    } catch (error) {
      console.error('Error reading file:', error);
      return audio.AudioDataCallbackResult.INVALID;
    }
  };
  try {
    let renderer = await audio.createAudioRenderer(audioRendererOptions);
    if (renderer === null) {
      console.info(`${TAG}: creating AudioRenderer failed, renderer is null`);
      return;
    }
    console.info(`${TAG}: creating AudioRenderer success`);
    audioRenderer = renderer;
    renderer.onWriteData(writeDataCallback);
  } catch (err) {
    let error = err as BusinessError;
    console.info(`${TAG}: creating AudioRenderer failed, error: ${error.message}`);
  }
}

// [StartExclude all_audioCapturer]
// 启动音频渲染前先校验渲染器状态。
async function startRender(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let renderer = audioRenderer;
  if (renderer !== undefined) {
    let state = renderer.state;
    if (state !== audio.AudioState.STATE_PREPARED && state !== audio.AudioState.STATE_PAUSED &&
      state !== audio.AudioState.STATE_STOPPED) {
      console.error(TAG + 'start failed');
      return;
    }
    try {
      await renderer.start();
      console.info('Renderer start success.');
    } catch (err) {
      console.error('Renderer start failed.');
    }
  }
}
// [EndExclude all_audioCapturer]

// [StartExclude all_audioCapturer]
// 停止音频渲染，文件句柄在 release 阶段统一关闭。
async function stopRender(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let renderer = audioRenderer;
  if (renderer !== undefined) {
    let state = renderer.state;
    if (state !== audio.AudioState.STATE_RUNNING && state !== audio.AudioState.STATE_PAUSED) {
      console.info('Renderer is not running or paused.');
      return;
    }
    try {
      await renderer.stop();
      console.info('Renderer stop success.');
    } catch (err) {
      console.error('Renderer stop failed.');
    }
  }
}
// [EndExclude all_audioCapturer]

// [StartExclude all_audioCapturer]
// 释放渲染器和缓存文件句柄。
async function releaseRender(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let renderer = audioRenderer;
  if (renderer !== undefined) {
    if (renderer.state === audio.AudioState.STATE_RELEASED) {
      console.info('Renderer already released');
      return;
    }
    try {
      await renderer.release();
      let currentFile = file;
      if (currentFile !== undefined) {
        fs.closeSync(currentFile);
        file = undefined;
      }
      console.info('Renderer release success.');
    } catch (err) {
      console.error('Renderer release failed.');
    }
  }
}
// [EndExclude all_audioCapturer]

// 创建采集器并注册读数据、状态变化回调。
async function init(updateCallback?: (msg: string, isError: boolean) => void, stateCallback?:
  (msg: string) => void): Promise<void> {
  try {
    let capturer = await audio.createAudioCapturer(audioCapturerOptions);
    if (capturer === null) {
      const errorMsg = `Invoke createAudioCapturer failed, capturer is null`;
      console.error(errorMsg);
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
      return;
    }
    console.info(`${TAG}: create AudioCapturer success`);
    const successMsg = `${TAG}: create AudioCapturer success`;
    if (updateCallback) {
      updateCallback(successMsg, false);
    }
    audioCapturer = capturer;
    // [Start listen_AudioCapturer]
    capturer.onReadData(readDataCallback);
    // [End listen_AudioCapturer]
    // [StartExclude create_AudioCapturer]
    await listenAudioCapturerState(stateCallback);
    // [EndExclude create_AudioCapturer]
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Invoke createAudioCapturer failed, message is ${error.message}`);
    const errorMsg = `Invoke createAudioCapturer failed, message is ${error.message}`;
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End create_AudioCapturer]

// 启动音频采集前先校验采集器状态。
// [Start start_AudioCapturer]
async function start(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let capturer = audioCapturer;
  if (capturer !== undefined) {
    let state = capturer.state;
    if (state !== audio.AudioState.STATE_PREPARED && state !== audio.AudioState.STATE_PAUSED &&
      state !== audio.AudioState.STATE_STOPPED) {
      console.error(`${TAG}: start failed`);
      const errorMsg = `${TAG}: start failed`;
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
      return;
    }
    try {
      await capturer.start();
      const successMsg = 'Capturer start success.';
      if (updateCallback) {
        updateCallback(successMsg, false);
      }
      console.info('Capturer start success.');
    } catch (err) {
      const errorMsg = 'Capturer start failed.';
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
      console.error('Capturer start failed.');
    }

  }
}
// [End start_AudioCapturer]

// 停止音频采集。
// [Start stop_AudioCapturer]
async function stop(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let capturer = audioCapturer;
  if (capturer !== undefined) {
    let state = capturer.state;
    if (state !== audio.AudioState.STATE_RUNNING && state !== audio.AudioState.STATE_PAUSED) {
      console.info('Capturer is not running or paused');
      const infoMsg = 'Capturer is not running or paused';
      if (updateCallback) {
        updateCallback(infoMsg, false);
      }
      return;
    }
    try {
      await capturer.stop();
      const successMsg = 'Capturer stop success.';
      if (updateCallback) {
        updateCallback(successMsg, false);
      }
      console.info('Capturer stop success.');
    } catch (err) {
      const errorMsg = 'Capturer stop failed.';
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
      console.error('Capturer stop failed.');
    }

  }
}
// [End stop_AudioCapturer]

// 释放采集器和缓存文件句柄。
// [Start release_AudioCapturer]
async function release(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let capturer = audioCapturer;
  if (capturer !== undefined) {
    let state = capturer.state;
    if (state === audio.AudioState.STATE_RELEASED || state === audio.AudioState.STATE_NEW) {
      console.info('Capturer already released');
      const infoMsg = 'Capturer already released';
      if (updateCallback) {
        updateCallback(infoMsg, false);
      }
      return;
    }
    try {
      await capturer.release();
      let currentFile = file;
      if (currentFile !== undefined) {
        fs.closeSync(currentFile);
        file = undefined;
      }
      console.info('Capturer release success.');
      const successMsg = 'Capturer release success.';
      if (updateCallback) {
        updateCallback(successMsg, false);
      }
    } catch (err) {
      const errorMsg = 'Capturer release failed.';
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
      console.error('Capturer release failed.');
    }

  }
}
// [End release_AudioCapturer]

// [StartExclude all_audioCapturer]
async function viewAudioCapturerState(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let capturer = audioCapturer;
  if (capturer !== undefined) {
    // [Start view_AudioCapturerState]
    let audioCapturerState: audio.AudioState = capturer.state;
    console.info(`Current state is: ${audioCapturerState}`)
    // [End view_AudioCapturerState]
    const stateMsg = `Current state is: ${audioCapturerState}`;
    if (updateCallback) {
      updateCallback(stateMsg, false);
    }
  }
}
// [EndExclude all_audioCapturer]

// [StartExclude all_audioCapturer]
// 状态变化通过页面回调更新展示区域。
async function listenAudioCapturerState(callbackUpdate?: (msg: string) => void): Promise<void> {
  let capturer = audioCapturer;
  if (capturer !== undefined) {
    // [Start listen_AudioCapturerState]
    capturer.onStateChange((capturerState: audio.AudioState) => {
      console.info(`State change to: ${capturerState}`)
      // [StartExclude listen_AudioCapturerState]
      const stateMsg = `State change to: ${capturerState}`;
      if (callbackUpdate) {
        callbackUpdate(stateMsg);
      }
      // [EndExclude listen_AudioCapturerState]
    });
    // [End listen_AudioCapturerState]
  }
}
// [EndExclude all_audioCapturer]
// [End all_audioCapturer]

@Entry
@Component
struct Index {
  @State currentState: string = '未初始化';
  @State logMessages: string = '暂无日志信息';
  @State callbackMessages: string = '暂无回调信息';

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
          .margin({ bottom: 12 })

          Column() {
            Text('回调信息')
              .fontSize(14)
              .fontWeight(600)
              .margin({ bottom: 8 })
            Text(this.callbackMessages)
              .fontSize(13)
              .fontColor('#FA8C16')
              .width('100%')
              .padding(10)
              .backgroundColor('#F0F0F0')
              .borderRadius(8)
              .maxLines(3)
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
            Text('Init Capturer').fontColor(Color.Black).fontSize(14);
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
            let hasPermission = await requestMicrophonePermission(context);
            if (!hasPermission) {
              console.error('麦克风权限未授权,无法录音');
              this.updateLogInfo('麦克风权限未授权,无法录音', true);
              this.currentState = 'Permission denied';
              return;
            }
            await initArguments(context);
            await init((msg, isError) => this.updateLogInfo(msg, isError), (msg) => this.updateCallbackInfo(msg));
            this.currentState = '已初始化';

            })();
          });

          Column() {
            Text('Start Capture').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 12 })
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await start((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = 'Recording';

            })();
          });
        }

        Row() {
          Column() {
            Text('停止录制').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 12, bottom: 12 })
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await stop((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = 'Stopped';

            })();
          });

          Column() {
            Text('释放资源').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 12 })
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await release((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = 'Released';

            })();
          });
        }

        Row() {
          Column() {
            Text('View State').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 12, bottom: 12 })
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await viewAudioCapturerState((msg, isError) => this.updateLogInfo(msg, isError));
            let capturer = audioCapturer;
            if (capturer !== undefined) {
              let state = capturer.state;
              let stateText = '';
              switch (state) {
                case audio.AudioState.STATE_NEW:
                  stateText = '新建';
                  break;
                case audio.AudioState.STATE_PREPARED:
                  stateText = '准备就绪';
                  break;
                case audio.AudioState.STATE_RUNNING:
                  stateText = 'Running';
                  break;
                case audio.AudioState.STATE_STOPPED:
                  stateText = 'Stopped';
                  break;
                case audio.AudioState.STATE_RELEASED:
                  stateText = 'Released';
                  break;
                case audio.AudioState.STATE_PAUSED:
                  stateText = 'Paused';
                  break;
                default:
                  stateText = '未知';
              }
              this.currentState = stateText;
            }

            })();
          });

          Column() {
            Text('Init Renderer').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 12 })
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
            await initRender(context);
            this.currentState = '已初始化';

            })();
          });
        }

        Row() {
          Column() {
            Text('Start Playback').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 12, bottom: 12 })
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await startRender((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = 'Playing';

            })();
          });

          Column() {
            Text('停止播放').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ bottom: 12 })
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await stopRender((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = '播放停止';

            })();
          });
        }

        Row() {
          Column() {
            Text('释放播放资源').fontColor(Color.Black).fontSize(14);
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .justifyContent(FlexAlign.Center)
          .margin({ right: 12, bottom: 12 })
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await releaseRender((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = '释放成功';

            })();
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
