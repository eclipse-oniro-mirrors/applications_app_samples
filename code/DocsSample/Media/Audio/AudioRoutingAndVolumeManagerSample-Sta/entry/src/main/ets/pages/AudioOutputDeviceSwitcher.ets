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
// [Start audioRenderer_setDefaultOutputDevice]
// [Start audioSessionManager_setDefaultOutputDevice]
import { audio } from '@kit.AudioKit';
// [StartExclude audioRenderer_setDefaultOutputDevice]
// [StartExclude audioSessionManager_setDefaultOutputDevice]
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

let appVolumeChangeCallback = (volumeEvent: audio.VolumeEvent) => {
  console.info(`Succeeded in using on function. VolumeEvent: ${JSON.stringify(volumeEvent)}`);
  globalCallbackUpdate(`Succeeded in using on function. VolumeEvent: ${JSON.stringify(volumeEvent)}`);
};
// [EndExclude audioSessionManager_setDefaultOutputDevice]

let audioManager = audio.getAudioManager();
let audioSessionManager = audioManager.getSessionManager();
// [StartExclude audioSessionManager_setDefaultOutputDevice]

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

async function activateAudioSession(){
  // 应用根据业务场景设置适合自己的音频会话场景，激活AudioSession时，系统会根据应用选择的音频会话场景申请对应的音频焦点。
  audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION);
  // [EndExclude audioSessionManager_setDefaultOutputDevice]

  // 设置音频会话策略。
  let strategy: audio.AudioSessionStrategy = {
    concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
  };

  // 激活AudioSession。
  audioSessionManager.activateAudioSession(strategy).then(() => {
    console.info('Succeeded in activating audio session.');
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    globalLogUpdate('Succeeded in activating audio session.', false);
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  }).catch((err) => {
    console.error(`Failed to activate audio session. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    globalLogUpdate(`Failed to activate audio session. Code: ${err.code}, message: ${err.message}`, true);
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  });
  // [StartExclude audioSessionManager_setDefaultOutputDevice]
}

async function audioSessionSetSpeakerOutput(){
  // [EndExclude audioSessionManager_setDefaultOutputDevice]

  // 设置默认输出设备为本机扬声器。
  audioSessionManager.setDefaultOutputDevice(audio.DeviceType.SPEAKER).then(() => {
    console.info('Succeeded in setting default output device.');
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    globalLogUpdate(`Succeeded in audio session setting speaker output device.`, false);
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  }).catch((err) => {
    console.error(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    globalLogUpdate(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`, true);
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  });
  // [StartExclude audioSessionManager_setDefaultOutputDevice]
}

async function audioSessionSetEarpieceOutput(){
  // [EndExclude audioSessionManager_setDefaultOutputDevice]

  // 设置默认输出设备为本机听筒。
  audioSessionManager.setDefaultOutputDevice(audio.DeviceType.EARPIECE).then(() => {
    console.info('Succeeded in setting default output device.');
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    globalLogUpdate('Succeeded in audio session setting earpiece output device.', false);
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  }).catch((err) => {
    console.error(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    globalLogUpdate(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`, true);
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  });
  // [End audioSessionManager_setDefaultOutputDevice]
}

async function audioRendererSetSpeakerOutput(){
  if (audioRenderer !== null) {
    // [EndExclude audioRenderer_setDefaultOutputDevice]

    // 设置默认输出设备为本机扬声器。
    (audioRenderer as audio.AudioRenderer).setDefaultOutputDevice(audio.DeviceType.SPEAKER).then(() => {
      console.info('Succeeded in setting default output device.');
      // [StartExclude audioRenderer_setDefaultOutputDevice]
      globalLogUpdate(`Succeeded in audio renderer setting speaker output device.`, false);
      // [EndExclude audioRenderer_setDefaultOutputDevice]
    }).catch((err) => {
      console.error(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`);
      // [StartExclude audioRenderer_setDefaultOutputDevice]
      globalLogUpdate(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`, true);
      // [EndExclude audioRenderer_setDefaultOutputDevice]
    });
    // [StartExclude audioRenderer_setDefaultOutputDevice]
  }
}

async function audioRendererSetEarpieceOutput(){
  if (audioRenderer !== null) {
    // [EndExclude audioRenderer_setDefaultOutputDevice]

    // 设置默认输出设备为本机听筒。
    (audioRenderer as audio.AudioRenderer).setDefaultOutputDevice(audio.DeviceType.EARPIECE).then(() => {
      console.info('Succeeded in setting default output device.');
      // [StartExclude audioRenderer_setDefaultOutputDevice]
      globalLogUpdate('Succeeded in audio renderer setting earpiece output device.', false);
      // [EndExclude audioRenderer_setDefaultOutputDevice]
    }).catch((err) => {
      console.error(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`);
      // [StartExclude audioRenderer_setDefaultOutputDevice]
      globalLogUpdate(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`, true);
      // [EndExclude audioRenderer_setDefaultOutputDevice]
    });
    // [End audioRenderer_setDefaultOutputDevice]
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
          .id('output_switcher_back')
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
            .id("output_switcher_init")
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
            .id("output_switcher_start")
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
              Text('激活AudioSession').fontSize(15).fontColor(Color.White)
            }
            .id("output_switcher_activateAudioSession")
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
              Text('Session设置默认发声设备为扬声器').fontSize(15).fontColor(Color.White)
            }
            .id("output_switcher_audioSessionSetSpeakerOutput")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              audioSessionSetSpeakerOutput();
              this.runningResult = 'Succeeded in setting default output device.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('Session设置默认发声设备为听筒').fontSize(15).fontColor(Color.White)
            }
            .id("output_switcher_audioSessionSetEarpieceOutput")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              audioSessionSetEarpieceOutput();
              this.runningResult = 'Succeeded in setting default output device.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('Renderer设置默认发声设备为扬声器').fontSize(15).fontColor(Color.White)
            }
            .id("output_switcher_audioRendererSetSpeakerOutput")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              audioRendererSetSpeakerOutput();
              this.runningResult = 'Succeeded in setting default output device.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('Renderer设置默认发声设备为听筒').fontSize(15).fontColor(Color.White)
            }
            .id("output_switcher_audioRendererSetEarpieceOutput")
            .width('80%')
            .height(40)
            .onClick((e: ClickEvent) => {
              audioRendererSetEarpieceOutput();
              this.runningResult = 'Succeeded in setting default output device.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('停止播放').fontSize(15).fontColor(Color.White)
            }
            .id("output_switcher_stop")
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