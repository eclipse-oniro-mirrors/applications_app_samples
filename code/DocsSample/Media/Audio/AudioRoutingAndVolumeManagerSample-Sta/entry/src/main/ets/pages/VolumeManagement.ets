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

import { Entry, Text, Column, Component, Button, ClickEvent, HorizontalAlign, FontWeight, Scroll, Row, Color, FlexAlign, ScrollDirection, BarState } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
// [Start getVolumeManager]
// [Start getVolumeByStream]
// [Start onStreamVolumeChange]
// [Start setAppVolumePercentage]
import { audio } from '@kit.AudioKit';
// [StartExclude getVolumeManager]
// [StartExclude getVolumeByStream]
// [StartExclude onStreamVolumeChange]
// [StartExclude setAppVolumePercentage]
// [Start setVolume]
import { BusinessError } from '@kit.BasicServicesKit';
// [StartExclude setVolume]
import { common } from '@kit.AbilityKit';
import { fileIo, ReadOptions } from '@kit.CoreFileKit';
import { Callback } from '@ohos.base';

// 全局UI更新回调
let globalLogUpdate: ((msg: string, isError: boolean) => void) = () => {};
let globalCallbackUpdate: ((msg: string) => void) = () => {};

let audioRenderer: audio.AudioRenderer | null = null;
let audioStreamInfo: audio.AudioStreamInfo = {
  samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, // 采样率。
  channels: audio.AudioChannel.CHANNEL_2, // 通道。
  sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 采样格式。
  encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW // 编码格式。
};
let audioRendererInfo: audio.AudioRendererInfo = {
  usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, // 音频流使用类型：VoIP通话。根据业务场景配置，参考StreamUsage。
  rendererFlags: 0 // 音频渲染器标志。
};
let audioRendererOptions: audio.AudioRendererOptions = {
  streamInfo: audioStreamInfo,
  rendererInfo: audioRendererInfo
};
let writeDataCallback: audio.AudioRendererWriteDataCallback = () => {};
// [EndExclude getVolumeManager]
// [EndExclude setAppVolumePercentage]

let audioManager = audio.getAudioManager();
let audioVolumeManager = audioManager.getVolumeManager();
// [End getVolumeManager]
// [StartExclude setAppVolumePercentage]

async function initArguments(context: common.UIAbilityContext) {
  let bufferSize: long = 0;
  let file = context.resourceManager.getRawFdSync('S16LE_2_48000.pcm');
  writeDataCallback = (buffer: ArrayBuffer) => {
    let options: ReadOptions = {
      offset: bufferSize + file.offset,
      length: buffer.byteLength
    };
    if (bufferSize > file.length) {
      bufferSize = 0;
    }
    try {
      let bufferLength = fileIo.readSync(file.fd, buffer, options);
      bufferSize += buffer.byteLength;
      if (bufferSize > file.length) {
        let view = new DataView(buffer);
        for (let i = bufferSize - file.length; i < buffer.byteLength; i++) {
          view.setUint8(Long.toInt(i), 0);
        }
        bufferSize = 0;
      }
      return audio.AudioDataCallbackResult.VALID;
    } catch (error) {
      console.error(`Failed to read file. Code: ${error.code}, message: ${error.message}`);
      return audio.AudioDataCallbackResult.INVALID;
    }
  };
}

// 初始化，创建实例，设置监听事件。
async function init(context: common.UIAbilityContext) {
  await initArguments(context);
  audio.createAudioRenderer(audioRendererOptions).then((data) => {
    audioRenderer = data as audio.AudioRenderer;
    (audioRenderer as audio.AudioRenderer).onWriteData(writeDataCallback);
    console.info('Succeeded in creating audio renderer.');
    globalLogUpdate('Succeeded in creating audio renderer.', false);
  }).catch((err) => {
    console.info(`Failed to create audio renderer. Code: ${err.code}, message: ${err.message}`);
    globalLogUpdate(`Failed to create audio renderer. Code: ${err.code}, message: ${err.message}`, true);
  });
}

async function start() {
  if (audioRenderer !== null) {
    if ((audioRenderer as audio.AudioRenderer).state.valueOf() != audio.AudioState.STATE_PREPARED &&
      (audioRenderer as audio.AudioRenderer).state.valueOf() != audio.AudioState.STATE_PAUSED &&
      (audioRenderer as audio.AudioRenderer).state.valueOf() != audio.AudioState.STATE_STOPPED) {
      console.error('Audio renderer state is invalid.');
      globalLogUpdate('Audio renderer state is invalid.', true);
      return;
    }
    (audioRenderer as audio.AudioRenderer).start().then((data) => {
      console.info('Succeeded in starting audio renderer.');
      globalLogUpdate('Succeeded in starting audio renderer.', false);
    }).catch((err) => {
      console.error(`Failed to start audio renderer. Code: ${err.code}, message: ${err.message}`);
      globalLogUpdate(`Failed to start audio renderer. Code: ${err.code}, message: ${err.message}`, true);
    });
  }
}

async function stop() {
  if (audioRenderer !== null) {
    if ((audioRenderer as audio.AudioRenderer).state.valueOf() !== audio.AudioState.STATE_RUNNING &&
      (audioRenderer as audio.AudioRenderer).state.valueOf() !== audio.AudioState.STATE_PAUSED) {
      console.info('Audio renderer state is not running or paused.');
      globalLogUpdate('Audio renderer state is not running or paused.', true);
      return;
    }
    (audioRenderer as audio.AudioRenderer).stop().then((data) => {
      console.info('Succeeded in stopping audio renderer.');
      globalLogUpdate('Succeeded in stopping audio renderer.', false);
    }).catch((err) => {
      console.error(`Failed to stop audio renderer. Code: ${err.code}, message: ${err.message}`);
      globalLogUpdate(`Failed to stop audio renderer. Code: ${err.code}, message: ${err.message}`, true);
    });
  }
}

async function getVolumeByStream(){
  try {
    // [EndExclude getVolumeByStream]

    // 获取指定音频流的音量。
    let volume = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
    console.info(`Succeeded in getting volume by stream. Volume: ${volume}`);
    // [StartExclude getVolumeByStream]
    globalLogUpdate(`Succeeded in getting volume by stream. Volume: ${volume}`, false);
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to get volume by stream. Code: ${error.code}, message: ${error.message}`);
    globalLogUpdate(`Failed to get volume by stream. Code: ${error.code}, message: ${error.message}`, true);
  }

}

async function getMinVolumeByStream(){
  try {
    // [EndExclude getVolumeByStream]

    // 获取指定音频流的最小音量。
    let volume = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
    console.info(`Succeeded in getting min volume by stream. Volume: ${volume}`);
    // [StartExclude getVolumeByStream]
    globalLogUpdate(`Succeeded in getting min volume by stream. Volume: ${volume}`, false);
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to get min volume by stream. Code: ${error.code}, message: ${error.message}`);
    globalLogUpdate(`Failed to get min volume by stream. Code: ${error.code}, message: ${error.message}`, true);
  }
}

async function getMaxVolumeByStream(){
  try {
    // [EndExclude getVolumeByStream]

    // 获取指定音频流的最大音量。
    let volume = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
    console.info(`Succeeded in getting max volume by stream. Volume: ${volume}`);
    // [End getVolumeByStream]
    globalLogUpdate(`Succeeded in getting max volume by stream. Volume: ${volume}`, false);
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to get max volume by stream. Code: ${error.code}, message: ${error.message}`);
    globalLogUpdate(`Failed to get max volume by stream. Code: ${error.code}, message: ${error.message}`, true);
  }
}

async function onStreamVolumeChange(){
  // [EndExclude onStreamVolumeChange]

  audioVolumeManager.onStreamVolumeChange(audio.StreamUsage.STREAM_USAGE_MUSIC, (streamVolumeEvent: audio.StreamVolumeEvent) => {
    console.info(`Succeeded in using on function. StreamVolumeEvent: ${JSON.stringify(streamVolumeEvent)}`);
    // [StartExclude onStreamVolumeChange]
    globalCallbackUpdate(`Succeeded in using on function. StreamVolumeEvent: ${JSON.stringify(streamVolumeEvent)}`);
    // [EndExclude onStreamVolumeChange]
  });
  // [End onStreamVolumeChange]
}
// [EndExclude setAppVolumePercentage]

let appVolumeChangeCallback = (volumeEvent: audio.VolumeEvent) => {
  console.info(`Succeeded in using on function. VolumeEvent: ${JSON.stringify(volumeEvent)}`);
  // [StartExclude setAppVolumePercentage]
  globalCallbackUpdate(`Succeeded in using on function. VolumeEvent: ${JSON.stringify(volumeEvent)}`);
  // [EndExclude setAppVolumePercentage]
};
// [StartExclude setAppVolumePercentage]

async function onAppVolumeChange(){
  // [EndExclude setAppVolumePercentage]

  audioVolumeManager.onAppVolumeChange(appVolumeChangeCallback);
  // [StartExclude setAppVolumePercentage]
}

async function offAppVolumeChange(){
  // [EndExclude setAppVolumePercentage]

  audioVolumeManager.offAppVolumeChange(appVolumeChangeCallback);
  // [StartExclude setAppVolumePercentage]
}

async function setAppVolumePercentage(){
  // [EndExclude setAppVolumePercentage]

  // 设置应用的音量（范围为0到100）。
  audioVolumeManager.setAppVolumePercentage(20).then(() => {
    console.info('Succeeded in setting app volume percentage.');
    // [StartExclude setAppVolumePercentage]
    globalLogUpdate('Succeeded in setting app volume percentage.', false);
    // [EndExclude setAppVolumePercentage]
  }).catch((err) => {
    console.error(`Failed to set app volume percentage. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude setAppVolumePercentage]
    globalLogUpdate(`Failed to set app volume percentage. Code: ${err.code}, message: ${err.message}`, true);
    // [EndExclude setAppVolumePercentage]
  });
  // [StartExclude setAppVolumePercentage]
}

async function getAppVolumePercentage(){
  // [EndExclude setAppVolumePercentage]

  // 查询应用音量。
  audioVolumeManager.getAppVolumePercentage().then((volume) => {
    console.info(`Succeeded in getting app volume percentage. Volume: ${volume}`);
    // [StartExclude setAppVolumePercentage]
    globalLogUpdate(`Succeeded in getting app volume percentage. Volume: ${volume}`, false);
    // [EndExclude setAppVolumePercentage]
  }).catch((err) => {
    console.error(`Failed to get app volume percentage. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude setAppVolumePercentage]
    globalLogUpdate(`Failed to get app volume percentage. Code: ${err.code}, message: ${err.message}`, true);
    // [EndExclude setAppVolumePercentage]
  });
  // [End setAppVolumePercentage]
}

async function setVolume(){
  if (audioRenderer !== null) {
    // [EndExclude setVolume]

    (audioRenderer as audio.AudioRenderer).setVolume(0.1).then(() => {
      console.info('Succeeded in setting volume.');
      // [StartExclude setVolume]
      globalLogUpdate('Succeeded in setting volume.', false);
      // [EndExclude setVolume]
    }).catch((err) => {
      console.error(`Failed to set volume. Code: ${err.code}, message: ${err.message}`);
      // [StartExclude setVolume]
      globalLogUpdate(`Failed to set volume. Code: ${err.code}, message: ${err.message}`, true);
      // [EndExclude setVolume]
    });
    // [StartExclude setVolume]
  }

}

async function getVolume(){
  if (audioRenderer !== null) {
    // [EndExclude setVolume]

    try {
      let volume = (audioRenderer as audio.AudioRenderer).getVolume();
      console.info(`Succeeded in getting volume. Volume: ${volume}`);
      // [StartExclude setVolume]
      globalLogUpdate(`Succeeded in getting volume. Volume: ${volume}`, false);
      // [EndExclude setVolume]
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to get volume. Code: ${error.code}, message: ${error.message}`);
      // [StartExclude setVolume]
      globalLogUpdate(`Failed to get volume. Code: ${error.code}, message: ${error.message}`, true);
      // [EndExclude setVolume]
    }
    // [End setVolume]
  }
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
          .id('volume_back')
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
              Text('创建音频播放对象').fontSize(15).fontColor(Color.White)
            }
            .id("volume_init")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
              init(context);
              this.runningResult = 'Succeeded in creating audio renderer.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('开始播放').fontSize(15).fontColor(Color.White)
            }
            .id("volume_start")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              start();
              this.runningResult = 'Succeeded in starting audio renderer.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('获取指定音频流的音量').fontSize(15).fontColor(Color.White)
            }
            .id("volume_getVolumeByStream")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              getVolumeByStream();
              this.runningResult = 'Succeeded in getting volume by stream.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('获取指定音频流的最小音量').fontSize(15).fontColor(Color.White)
            }
            .id("volume_getMinVolumeByStream")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              getMinVolumeByStream();
              this.runningResult = 'Succeeded in getting min volume by stream.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('获取指定音频流的最大音量').fontSize(15).fontColor(Color.White)
            }
            .id("volume_getMaxVolumeByStream")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              getMaxVolumeByStream();
              this.runningResult = 'Succeeded in getting max volume by stream.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('监听系统音量变化').fontSize(15).fontColor(Color.White)
            }
            .id("volume_onStreamVolumeChange")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              onStreamVolumeChange();
              this.runningResult = 'Register streamVolumeChange success.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('监听应用音量变化').fontSize(15).fontColor(Color.White)
            }
            .id("volume_onAppVolumeChange")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              onAppVolumeChange();
              this.runningResult = 'Register appVolumeChange success.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('查询应用音量').fontSize(15).fontColor(Color.White)
            }
            .id("volume_getAppVolumePercentage")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              getAppVolumePercentage();
              this.runningResult = 'Succeeded in getting app volume percentage.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('设置应用的音量').fontSize(15).fontColor(Color.White)
            }
            .id("volume_setAppVolumePercentage")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              setAppVolumePercentage();
              this.runningResult = 'Succeeded in setting app volume percentage.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('查询音频流音量').fontSize(15).fontColor(Color.White)
            }
            .id("volume_getVolume")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              getVolume();
              this.runningResult = 'Succeeded in getting volume.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('设置音频流音量').fontSize(15).fontColor(Color.White)
            }
            .id("volume_setVolume")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              setVolume();
              this.runningResult = 'Succeeded in setting volume.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('停止播放').fontSize(15).fontColor(Color.White)
            }
            .id("volume_stop")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              stop();
              this.runningResult = 'Succeeded in stopping audio renderer.';
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