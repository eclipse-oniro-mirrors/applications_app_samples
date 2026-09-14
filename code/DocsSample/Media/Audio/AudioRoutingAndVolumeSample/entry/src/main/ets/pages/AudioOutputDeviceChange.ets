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

// [Start onOutputDeviceChangeWithInfo]
// [Start onCurrentOutputDeviceChanged]
import { audio } from '@kit.AudioKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [StartExclude onOutputDeviceChangeWithInfo]
// [StartExclude onCurrentOutputDeviceChanged]
import { common } from '@kit.AbilityKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';

// 全局UI更新回调。
let globalLogUpdate: ((msg: string, isError: boolean) => void) | undefined;
let globalCallbackUpdate: ((msg: string) => void) | undefined;
// [EndExclude onOutputDeviceChangeWithInfo]
// [EndExclude onCurrentOutputDeviceChanged]

let audioRenderer: audio.AudioRenderer | undefined = undefined;
let audioStreamInfo: audio.AudioStreamInfo = {
  samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, // 采样率。
  channels: audio.AudioChannel.CHANNEL_2, // 通道。
  sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 采样格式。
  encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW // 编码格式。
};
let audioRendererInfo: audio.AudioRendererInfo = {
  usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, // 音频流使用类型：语音通话。根据业务场景配置，参考StreamUsage。
  rendererFlags: 0 // 音频渲染器标志。
};
let audioRendererOptions: audio.AudioRendererOptions = {
  streamInfo: audioStreamInfo,
  rendererInfo: audioRendererInfo
};
// [StartExclude onOutputDeviceChangeWithInfo]

let audioSessionManager = audio.getAudioManager().getSessionManager();
// [StartExclude onCurrentOutputDeviceChanged]
let writeDataCallback: audio.AudioRendererWriteDataCallback;

async function initArguments(context: common.UIAbilityContext) {
  let bufferSize: number = 0;
  let file = await context.resourceManager.getRawFd('S16LE_2_48000.pcm');
  writeDataCallback = (buffer: ArrayBuffer) => {
    let options: ReadOptions = {
      offset: bufferSize + file.offset,
      length: buffer.byteLength
    };
    if (bufferSize > file.length) {
      bufferSize = 0;
    }
    try {
      let bufferLength = fs.readSync(file.fd, buffer, options);
      bufferSize += buffer.byteLength;
      if (bufferSize > file.length) {
        let view = new DataView(buffer);
        for (let i = bufferSize - file.length; i < buffer.byteLength; i++) {
          view.setUint8(i, 0);
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
async function init() {
  // [EndExclude onOutputDeviceChangeWithInfo]
  // [EndExclude onCurrentOutputDeviceChanged]

  // 创建AudioRenderer实例。
  audio.createAudioRenderer(audioRendererOptions, (err, renderer) => {
    if (!err) {
      console.info('Succeeded in creating audio renderer.');
      // [StartExclude onOutputDeviceChangeWithInfo]
      // [StartExclude onCurrentOutputDeviceChanged]
      if (globalLogUpdate) {
        globalLogUpdate('Succeeded in creating audio renderer.', false);
      }
      // [EndExclude onOutputDeviceChangeWithInfo]
      // [EndExclude onCurrentOutputDeviceChanged]
      audioRenderer = renderer;
      // [StartExclude onOutputDeviceChangeWithInfo]
      // [StartExclude onCurrentOutputDeviceChanged]
      if (audioRenderer !== undefined) {
        audioRenderer.on('writeData', writeDataCallback);
      }
      // [EndExclude onOutputDeviceChangeWithInfo]
      // [EndExclude onCurrentOutputDeviceChanged]
    } else {
      console.info(`Failed to create audio renderer. Code: ${err.code}, message: ${err.message}`);
      // [StartExclude onOutputDeviceChangeWithInfo]
      // [StartExclude onCurrentOutputDeviceChanged]
      if (globalLogUpdate) {
        globalLogUpdate(`Failed to create audio renderer. Code: ${err.code}, message: ${err.message}`, true);
      }
      // [EndExclude onOutputDeviceChangeWithInfo]
      // [EndExclude onCurrentOutputDeviceChanged]
    }
  });
  // [StartExclude onOutputDeviceChangeWithInfo]
  // [StartExclude onCurrentOutputDeviceChanged]
}

async function start() {
  if (audioRenderer !== undefined) {
    // 当且仅当状态为prepared、paused和stopped之一时才能启动渲染。
    let stateGroup = [audio.AudioState.STATE_PREPARED, audio.AudioState.STATE_PAUSED, audio.AudioState.STATE_STOPPED];
    if (stateGroup.indexOf(audioRenderer.state.valueOf()) === -1) {
      console.error('Audio renderer state is invalid.');
      if (globalLogUpdate) {
        globalLogUpdate('Audio renderer state is invalid.', true);
      }
      return;
    }
    audioRenderer.start((err: BusinessError) => {
      if (err) {
        console.error(`Failed to start audio renderer. Code: ${err.code}, message: ${err.message}`);
        if (globalLogUpdate) {
          globalLogUpdate(`Failed to start audio renderer. Code: ${err.code}, message: ${err.message}`, true);
        }
      } else {
        console.info('Succeeded in starting audio renderer.');
        if (globalLogUpdate) {
          globalLogUpdate('Succeeded in starting audio renderer.', false);
        }
      }
    });
  }
}

async function stop() {
  if (audioRenderer !== undefined) {
    if (audioRenderer.state.valueOf() !== audio.AudioState.STATE_RUNNING &&
      audioRenderer.state.valueOf() !== audio.AudioState.STATE_PAUSED) {
      console.info('Audio renderer state is not running or paused.');
      if (globalLogUpdate) {
        globalLogUpdate('Audio renderer state is not running or paused.', true);
      }
      return;
    }
    audioRenderer.stop((err: BusinessError) => {
      if (err) {
        console.error(`Failed to stop audio renderer. Code: ${err.code}, message: ${err.message}`);
        if (globalLogUpdate) {
          globalLogUpdate(`Failed to stop audio renderer. Code: ${err.code}, message: ${err.message}`, true);
        }
      } else {
        console.info('Succeeded in stopping audio renderer.');
        if (globalLogUpdate) {
          globalLogUpdate('Succeeded in stopping audio renderer.', false);
        }
      }
    });
  }
}

async function activateAudioSession(){

  // 应用根据业务场景设置适合自己的音频会话场景，激活AudioSession时，系统会根据应用选择的音频会话场景申请对应的音频焦点。
  audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION);
  // [EndExclude onCurrentOutputDeviceChanged]

  // 设置音频会话策略。
  let strategy: audio.AudioSessionStrategy = {
    concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
  };

  // 激活AudioSession。
  audioSessionManager.activateAudioSession(strategy).then(() => {
    console.info('Succeeded in activating audio session.');
    // [StartExclude onCurrentOutputDeviceChanged]
    if (globalLogUpdate) {
      globalLogUpdate('Succeeded in activating audio session.', false);
    }
    // [EndExclude onCurrentOutputDeviceChanged]
  }).catch((err: BusinessError) => {
    console.error(`Failed to activate audio session. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude onCurrentOutputDeviceChanged]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to activate audio session. Code: ${err.code}, message: ${err.message}`, true);
    }
    // [EndExclude onCurrentOutputDeviceChanged]
  });
  // [StartExclude onCurrentOutputDeviceChanged]
}

async function onOutputDeviceChangeWithInfo(){
  // [EndExclude onOutputDeviceChangeWithInfo]

  try {
    audioRenderer?.on('outputDeviceChangeWithInfo', (deviceChangeInfo: audio.AudioStreamDeviceChangeInfo) => {
      console.info(`Succeeded in using on function. AudioStreamDeviceChangeInfo: ${JSON.stringify(deviceChangeInfo)}`);
      // [StartExclude onOutputDeviceChangeWithInfo]
      if (globalCallbackUpdate) {
        let callbackMsg = 'onOutputDeviceChangeWithInfo' + '\n';
        callbackMsg += 'Device change reason: ' + deviceChangeInfo.changeReason + '\n';
        callbackMsg += 'Device count: ' + deviceChangeInfo.devices.length + '\n';
        for (let i = 0; i < deviceChangeInfo.devices.length; i++) {
          callbackMsg += `Device ${i} - id: ${deviceChangeInfo.devices[i].id} - name: ${deviceChangeInfo.devices[i].name} - type: ${deviceChangeInfo.devices[i].deviceType}\n`;
        }
        globalCallbackUpdate(callbackMsg);
      }
      // [EndExclude onOutputDeviceChangeWithInfo]
      switch (deviceChangeInfo.changeReason) {
        case audio.AudioStreamDeviceChangeReason.REASON_OLD_DEVICE_UNAVAILABLE:
          // 响应设备不可用事件，如果应用处于播放状态，应暂停播放，更新UX界面。
          audioRenderer?.pause();
          break;
        case audio.AudioStreamDeviceChangeReason.REASON_NEW_DEVICE_AVAILABLE:
          // 应用根据业务情况响应设备可用事件。
          break;
        case audio.AudioStreamDeviceChangeReason.REASON_OVERRODE:
          // 应用根据业务情况响应设备强选事件。
          break;
        case audio.AudioStreamDeviceChangeReason.REASON_UNKNOWN:
          // 应用根据业务情况响应未知原因事件。
          break;
      }
    });
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to use on function. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude onOutputDeviceChangeWithInfo]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to use on function. Code: ${error.code}, message: ${error.message}`, true);
    }
    // [EndExclude onOutputDeviceChangeWithInfo]
  }
  // [End onOutputDeviceChangeWithInfo]
}

async function onCurrentOutputDeviceChanged(){
  // [EndExclude onCurrentOutputDeviceChanged]

  try {
    // 订阅监听音频流输出设备变化及原因。
    audioSessionManager.on('currentOutputDeviceChanged', async (deviceChangeInfo: audio.CurrentOutputDeviceChangedEvent) => {
      console.info(`Succeeded in using on function. AudioStreamDeviceChangeInfo: ${JSON.stringify(deviceChangeInfo)}`);
      // [StartExclude onCurrentOutputDeviceChanged]
      if (globalCallbackUpdate) {
        let callbackMsg = 'onOutputDeviceChangeWithInfo' + '\n';
        callbackMsg += 'Device change reason: ' + deviceChangeInfo.changeReason + '\n';
        callbackMsg += 'Device change recommended action: ' + deviceChangeInfo.recommendedAction + '\n';
        callbackMsg += 'Device count: ' + deviceChangeInfo.devices.length + '\n';
        for (let i = 0; i < deviceChangeInfo.devices.length; i++) {
          callbackMsg += `Device ${i} - id: ${deviceChangeInfo.devices[i].id} - name: ${deviceChangeInfo.devices[i].name} - type: ${deviceChangeInfo.devices[i].deviceType}\n`;
        }
        globalCallbackUpdate(callbackMsg);
      }
      // [EndExclude onCurrentOutputDeviceChanged]
      switch (deviceChangeInfo.changeReason) {
        case audio.AudioStreamDeviceChangeReason.REASON_OLD_DEVICE_UNAVAILABLE:
          // 响应设备不可用事件，如果应用处于播放状态，应暂停播放，更新UX界面。
          audioRenderer?.pause();
          console.info('REASON_OLD_DEVICE_UNAVAILABLE, pause audio is recommended');
          break;
        case audio.AudioStreamDeviceChangeReason.REASON_NEW_DEVICE_AVAILABLE:
          // 应用根据业务情况响应设备可用事件。
          break;
        case audio.AudioStreamDeviceChangeReason.REASON_OVERRODE:
          // 应用根据业务情况响应设备强选事件。
          break;
        case audio.AudioStreamDeviceChangeReason.REASON_UNKNOWN:
          // 应用根据业务情况响应未知原因事件。
          break;
      }
    });
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to use on function. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude onCurrentOutputDeviceChanged]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to use on function. Code: ${error.code}, message: ${error.message}`, true);
    }
    // [EndExclude onCurrentOutputDeviceChanged]
  }
  // [End onCurrentOutputDeviceChanged]
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
          .id('output_change_back')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 12 })
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().pushUrl({ url: 'pages/Index' });
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

      Scroll() {
        Column() {
          Row() {
            Button() {
              Text('创建音频播放对象').fontSize(15).fontColor(Color.White)
            }
            .id('output_change_init')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
              await initArguments(context);
              await init();
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
            .id('output_change_start')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await start();
              this.runningResult = 'Succeeded in starting audio renderer.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('停止播放').fontSize(15).fontColor(Color.White)
            }
            .id('output_change_stop')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await stop();
              this.runningResult = 'Succeeded in stopping audio renderer.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('激活AudioSession').fontSize(15).fontColor(Color.White)
            }
            .id('output_change_activateAudioSession')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await activateAudioSession();
              this.runningResult = 'Succeeded in activating audio session.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('监听音频流输出设备变化及原因').fontSize(15).fontColor(Color.White)
            }
            .id('output_change_onOutputDeviceChangeWithInfo')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await onOutputDeviceChangeWithInfo();
              this.runningResult = 'Register outputDeviceChangeWithInfo success.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('监听输出设备变化').fontSize(15).fontColor(Color.White)
            }
            .id('output_change_onCurrentOutputDeviceChanged')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await onCurrentOutputDeviceChanged();
              this.runningResult = 'Register currentOutputDeviceChanged success.';
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