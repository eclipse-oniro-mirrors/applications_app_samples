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

// [Start audioRenderer_setDefaultOutputDevice]
// [Start audioSessionManager_setDefaultOutputDevice]
// [Start audioSessionManager_setMediaOutputDevice]
import { audio } from '@kit.AudioKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [StartExclude audioRenderer_setDefaultOutputDevice]
// [StartExclude audioSessionManager_setDefaultOutputDevice]
// [StartExclude audioSessionManager_setMediaOutputDevice]
import { common } from '@kit.AbilityKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';

// 全局UI更新回调。
let globalLogUpdate: ((msg: string, isError: boolean) => void) | undefined;
let globalCallbackUpdate: ((msg: string) => void) | undefined;

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
let writeDataCallback: audio.AudioRendererWriteDataCallback;
// [EndExclude audioSessionManager_setDefaultOutputDevice]
// [EndExclude audioSessionManager_setMediaOutputDevice]

let audioManager = audio.getAudioManager();
let audioSessionManager = audioManager.getSessionManager();
// [StartExclude audioSessionManager_setDefaultOutputDevice]
// [StartExclude audioSessionManager_setMediaOutputDevice]

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
  // 创建AudioRenderer实例。
  audio.createAudioRenderer(audioRendererOptions, (err, renderer) => {
    if (!err) {
      console.info('Succeeded in creating audio renderer.');
      if (globalLogUpdate) {
        globalLogUpdate('Succeeded in creating audio renderer.', false);
      }
      audioRenderer = renderer;
      if (audioRenderer !== undefined) {
        audioRenderer.on('writeData', writeDataCallback);
      }
    } else {
      console.info(`Failed to create audio renderer. Code: ${err.code}, message: ${err.message}`);
      if (globalLogUpdate) {
        globalLogUpdate(`Failed to create audio renderer. Code: ${err.code}, message: ${err.message}`, true);
      }
    }
  });
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
  // [EndExclude audioSessionManager_setDefaultOutputDevice]

  // 应用根据业务场景设置适合自己的音频会话场景，激活AudioSession时，系统会根据应用选择的音频会话场景申请对应的音频焦点。
  audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION);

  // 设置音频会话策略。
  let strategy: audio.AudioSessionStrategy = {
    concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
  };

  // 激活AudioSession。
  audioSessionManager.activateAudioSession(strategy).then(() => {
    console.info('Succeeded in activating audio session.');
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    if (globalLogUpdate) {
      globalLogUpdate('Succeeded in activating audio session.', false);
    }
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  }).catch((err: BusinessError) => {
    console.error(`Failed to activate audio session. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to activate audio session. Code: ${err.code}, message: ${err.message}`, true);
    }
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  });
  // [StartExclude audioSessionManager_setDefaultOutputDevice]
}

async function audioSessionSetSpeakerOutput(){
  // [EndExclude audioSessionManager_setDefaultOutputDevice]

  // 设置默认输出设备为扬声器。
  audioSessionManager.setDefaultOutputDevice(audio.DeviceType.SPEAKER).then(() => {
    console.info('Succeeded in setting default output device.');
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Succeeded in audio session setting speaker output device.`, false);
    }
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  }).catch((err: BusinessError) => {
    console.error(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`, true);
    }
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  });
  // [StartExclude audioSessionManager_setDefaultOutputDevice]
}

async function audioSessionSetEarpieceOutput(){
  // [EndExclude audioSessionManager_setDefaultOutputDevice]

  // 设置默认输出设备为听筒。
  audioSessionManager.setDefaultOutputDevice(audio.DeviceType.EARPIECE).then(() => {
    console.info('Succeeded in setting default output device.');
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    if (globalLogUpdate) {
      globalLogUpdate('Succeeded in audio session setting earpiece output device.', false);
    }
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  }).catch((err: BusinessError) => {
    console.error(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude audioSessionManager_setDefaultOutputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`, true);
    }
    // [EndExclude audioSessionManager_setDefaultOutputDevice]
  });
  // [End audioSessionManager_setDefaultOutputDevice]
}

async function audioRendererSetSpeakerOutput(){
  if (audioRenderer !== undefined) {
    // [EndExclude audioRenderer_setDefaultOutputDevice]

    // 设置默认输出设备为扬声器。
    audioRenderer.setDefaultOutputDevice(audio.DeviceType.SPEAKER).then(() => {
      console.info('Succeeded in setting default output device.');
      // [StartExclude audioRenderer_setDefaultOutputDevice]
      if (globalLogUpdate) {
        globalLogUpdate(`Succeeded in audio renderer setting speaker output device.`, false);
      }
      // [EndExclude audioRenderer_setDefaultOutputDevice]
    }).catch((err: BusinessError) => {
      console.error(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`);
      // [StartExclude audioRenderer_setDefaultOutputDevice]
      if (globalLogUpdate) {
        globalLogUpdate(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`, true);
      }
      // [EndExclude audioRenderer_setDefaultOutputDevice]
    });
    // [StartExclude audioRenderer_setDefaultOutputDevice]
  }
}

async function audioRendererSetEarpieceOutput(){
  if (audioRenderer !== undefined) {
    // [EndExclude audioRenderer_setDefaultOutputDevice]

    // 设置默认输出设备为听筒。
    audioRenderer.setDefaultOutputDevice(audio.DeviceType.EARPIECE).then(() => {
      console.info('Succeeded in setting default output device.');
      // [StartExclude audioRenderer_setDefaultOutputDevice]
      if (globalLogUpdate) {
        globalLogUpdate('Succeeded in audio renderer setting earpiece output device.', false);
      }
      // [EndExclude audioRenderer_setDefaultOutputDevice]
    }).catch((err: BusinessError) => {
      console.error(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`);
      // [StartExclude audioRenderer_setDefaultOutputDevice]
      if (globalLogUpdate) {
        globalLogUpdate(`Failed to set default output device. Code: ${err.code}, message: ${err.message}`, true);
      }
      // [EndExclude audioRenderer_setDefaultOutputDevice]
    });
    // [End audioRenderer_setDefaultOutputDevice]
  }
}

async function audioSessionSetSpeakerMediaOutput(){
  // [EndExclude audioSessionManager_setMediaOutputDevice]

  // 连接蓝牙耳机后，强制将媒体输出设备切换为扬声器。
  audioSessionManager.setMediaOutputDevice(audio.DeviceType.SPEAKER).then(() => {
    console.info('Succeeded in setting media output device to speaker.');
    // [StartExclude audioSessionManager_setMediaOutputDevice]
    if (globalLogUpdate) {
      globalLogUpdate('Succeeded in audio session setting speaker media output device.', false);
    }
    // [EndExclude audioSessionManager_setMediaOutputDevice]
  }).catch((err: BusinessError) => {
    console.error(`Failed to set media output device. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude audioSessionManager_setMediaOutputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to set media output device. Code: ${err.code}, message: ${err.message}`, true);
    }
    // [EndExclude audioSessionManager_setMediaOutputDevice]
  });
  // [StartExclude audioSessionManager_setMediaOutputDevice]
}

async function audioSessionSetDefaultMediaOutput(){
  // [EndExclude audioSessionManager_setMediaOutputDevice]

  // 取消强制切换，将媒体输出设备选择权交还给系统默认路由规则。
  audioSessionManager.setMediaOutputDevice(audio.DeviceType.DEFAULT).then(() => {
    console.info('Succeeded in setting media output device to default.');
    // [StartExclude audioSessionManager_setMediaOutputDevice]
    if (globalLogUpdate) {
      globalLogUpdate('Succeeded in audio session setting default media output device.', false);
    }
    // [EndExclude audioSessionManager_setMediaOutputDevice]
  }).catch((err: BusinessError) => {
    console.error(`Failed to set media output device. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude audioSessionManager_setMediaOutputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to set media output device. Code: ${err.code}, message: ${err.message}`, true);
    }
    // [EndExclude audioSessionManager_setMediaOutputDevice]
  });
  // [End audioSessionManager_setMediaOutputDevice]
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
            .id('output_switcher_init')
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
            .id('output_switcher_start')
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
            .id('output_switcher_stop')
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
            .id('output_switcher_activateAudioSession')
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
              Text('Session设置默认发声设备为扬声器').fontSize(15).fontColor(Color.White)
            }
            .id('output_switcher_audioSessionSetSpeakerOutput')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await audioSessionSetSpeakerOutput();
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
            .id('output_switcher_audioSessionSetEarpieceOutput')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await audioSessionSetEarpieceOutput();
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
            .id('output_switcher_audioRendererSetSpeakerOutput')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await audioRendererSetSpeakerOutput();
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
            .id('output_switcher_audioRendererSetEarpieceOutput')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await audioRendererSetEarpieceOutput();
              this.runningResult = 'Succeeded in setting default output device.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('Session强制媒体输出设备为扬声器').fontSize(15).fontColor(Color.White)
            }
            .id('output_switcher_audioSessionSetSpeakerMediaOutput')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await audioSessionSetSpeakerMediaOutput();
              this.runningResult = 'Succeeded in setting media output device to speaker.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('Session恢复媒体输出设备为默认路由').fontSize(15).fontColor(Color.White)
            }
            .id('output_switcher_audioSessionSetDefaultMediaOutput')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await audioSessionSetDefaultMediaOutput();
              this.runningResult = 'Succeeded in setting media output device to default.';
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