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
import { audio } from '@kit.AudioKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [StartExclude setBluetoothAndNearlinkPreferredRecordCategory]
// [StartExclude selectMediaInputDevice]
import { common } from '@kit.AbilityKit';
import { fileIo as fs, WriteOptions } from '@kit.CoreFileKit';

// 全局UI更新回调。
let globalLogUpdate: ((msg: string, isError: boolean) => void) | undefined;
let globalCallbackUpdate: ((msg: string) => void) | undefined;

let audioCapturer: audio.AudioCapturer | undefined = undefined;
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
let file: fs.File;
let readDataCallback: Callback<ArrayBuffer>;

// [EndExclude setBluetoothAndNearlinkPreferredRecordCategory]
// [EndExclude selectMediaInputDevice]

let audioManager = audio.getAudioManager();
let audioSessionManager = audioManager.getSessionManager();
// [StartExclude setBluetoothAndNearlinkPreferredRecordCategory]
// [StartExclude selectMediaInputDevice]
async function initArguments(context: common.UIAbilityContext) {
  let bufferSize: number = 0;
  let path = context.cacheDir;
  let filePath = path + '/StarWars10s-2C-48000-4SW.pcm';
  file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  readDataCallback = (buffer: ArrayBuffer) => {
    let options: WriteOptions = {
      offset: bufferSize,
      length: buffer.byteLength
    }
    fs.writeSync(file.fd, buffer, options);
    bufferSize += buffer.byteLength;
  };
}

// 初始化，创建实例，设置监听事件。
async function init() {
  // 创建AudioCapturer实例。
  audio.createAudioCapturer(audioCapturerOptions, (err, capturer) => {
    if (err) {
      console.info(`Failed to create audio capturer. Code: ${err.code}, message: ${err.message}`);
      if (globalLogUpdate) {
        globalLogUpdate(`Failed to create audio capturer. Code: ${err.code}, message: ${err.message}`, true);
      }
      return;
    }
    console.info('Succeeded in creating audio capturer.');
    if (globalLogUpdate) {
      globalLogUpdate('Succeeded in creating audio capturer.', false);
    }
    audioCapturer = capturer;
    if (audioCapturer !== undefined) {
      audioCapturer.on('readData', readDataCallback);
    }
  });
}

// 开始一次音频采集。
async function start() {
  if (audioCapturer !== undefined) {
    // 当且仅当状态为STATE_PREPARED、STATE_PAUSED和STATE_STOPPED之一时才能启动采集。
    let stateGroup = [audio.AudioState.STATE_PREPARED, audio.AudioState.STATE_PAUSED, audio.AudioState.STATE_STOPPED];
    if (stateGroup.indexOf(audioCapturer.state.valueOf()) === -1) {
      console.error('Audio capturer state is invalid.');
      if (globalLogUpdate) {
        globalLogUpdate('Audio capturer state is invalid.', true);
      }
      return;
    }

    // 启动采集。
    audioCapturer.start((err: BusinessError) => {
      if (err) {
        console.error(`Failed to start audio capturer. Code: ${err.code}, message: ${err.message}`);
        if (globalLogUpdate) {
          globalLogUpdate(`Failed to start audio capturer. Code: ${err.code}, message: ${err.message}`, true);
        }
      } else {
        console.info('Succeeded in starting audio capturer.');
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
        };

        // 激活音频会话。
        audioSessionManager.activateAudioSession(strategy).then(() => {
          console.info('Succeeded in activating audio session.');
          if (globalLogUpdate) {
            globalLogUpdate('Succeeded in activating audio session.', false);
          }
        }).catch((err: BusinessError) => {
          console.error(`Failed to activate audio session. Code: ${err.code}, message: ${err.message}`);
          if (globalLogUpdate) {
            globalLogUpdate(`Failed to activate audio session. Code: ${err.code}, message: ${err.message}`, true);
          }
        });
        if (globalLogUpdate) {
          globalLogUpdate('Succeeded in starting audio capturer.', false);
        }
      }
    });
  }
}

// 停止采集。
async function stop() {
  if (audioCapturer !== undefined) {
    // 只有采集器状态为STATE_RUNNING或STATE_PAUSED的时候才可以停止。
    if (audioCapturer.state.valueOf() !== audio.AudioState.STATE_RUNNING && audioCapturer.state.valueOf() !==
      audio.AudioState.STATE_PAUSED) {
      console.info('Audio capturer state is not running or paused.');
      if (globalLogUpdate) {
        globalLogUpdate('Audio capturer state is not running or paused.', true);
      }
      return;
    }

    // 停止采集。
    audioCapturer.stop((err: BusinessError) => {
      if (err) {
        console.error(`Failed to stop audio capturer. Code: ${err.code}, message: ${err.message}`);
        if (globalLogUpdate) {
          globalLogUpdate(`Failed to stop audio capturer. Code: ${err.code}, message: ${err.message}`, true);
        }
      } else {
        console.info('Succeeded in stopping audio capturer.');
        if (globalLogUpdate) {
          globalLogUpdate('Succeeded in stopping audio capturer.', false);
        }
      }
    });
  }
}

async function onCurrentInputDeviceChanged(){
  // [EndExclude selectMediaInputDevice]

  try {
    // 监听当前输入设备变化事件，当选择输入设备成功后会触发该回调。
    audioSessionManager.on('currentInputDeviceChanged', (currentInputDeviceChangedEvent: audio.CurrentInputDeviceChangedEvent) => {
      console.info(`Succeeded in using on function. CurrentInputDeviceChangedEvent: ${JSON.stringify(currentInputDeviceChangedEvent)}`);
      // [StartExclude selectMediaInputDevice]
      if (globalCallbackUpdate) {
        let callbackMsg = 'onCurrentInputDeviceChanged' + '\n';
        callbackMsg += 'Device change reason: ' + currentInputDeviceChangedEvent.changeReason + '\n';
        callbackMsg += 'Device count: ' + currentInputDeviceChangedEvent.devices.length + '\n';
        for (let i = 0; i < currentInputDeviceChangedEvent.devices.length; i++) {
          callbackMsg += `Device ${i} - id: ${currentInputDeviceChangedEvent.devices[i].id} - name: ${currentInputDeviceChangedEvent.devices[i].name} - type: ${currentInputDeviceChangedEvent.devices[i].deviceType}\n`;
        }
        globalCallbackUpdate(callbackMsg);
      }
      // [EndExclude selectMediaInputDevice]
    });
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to use on function. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude selectMediaInputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to use on function. Code: ${error.code}, message: ${error.message}`, true);
    }
    // [EndExclude selectMediaInputDevice]
  }
  // [StartExclude selectMediaInputDevice]
}

async function setBluetoothAndNearlinkPreferredRecordCategory(){
  // [EndExclude setBluetoothAndNearlinkPreferredRecordCategory]

  audioSessionManager.setBluetoothAndNearlinkPreferredRecordCategory(audio.BluetoothAndNearlinkPreferredRecordCategory.
    PREFERRED_DEFAULT).then(() => {
    console.info('Succeeded in setting bluetooth and nearlink preferred record category.');
    // [StartExclude setBluetoothAndNearlinkPreferredRecordCategory]
    if (globalLogUpdate) {
      globalLogUpdate('Succeeded in setting bluetooth and nearlink preferred record category.', false);
    }
    // [EndExclude setBluetoothAndNearlinkPreferredRecordCategory]
  }).catch((err: BusinessError) => {
    console.error(`Failed to set bluetooth and nearlink preferred record category. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude setBluetoothAndNearlinkPreferredRecordCategory]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to set bluetooth and nearlink preferred record category. Code: ${err.code}, message: ${err.message}`, true);
    }
    // [EndExclude setBluetoothAndNearlinkPreferredRecordCategory]
  });
  // [End setBluetoothAndNearlinkPreferredRecordCategory]
}

async function onAvailableDeviceChange(){
  // [EndExclude selectMediaInputDevice]

  try {
    // 监听音频可选输入设备连接状态变化事件，当有输入设备上下线时会收到回调通知。
    audioSessionManager.on('availableDeviceChange', audio.DeviceUsage.MEDIA_INPUT_DEVICES, (deviceChanged: audio.DeviceChangeAction) => {
      console.info(`Succeeded in using on function. DeviceChangeAction: ${JSON.stringify(deviceChanged)}`);
      // [StartExclude selectMediaInputDevice]
      if (globalCallbackUpdate) {
        let callbackMsg = 'onAvailableDeviceChange' + '\n';
        callbackMsg += 'Device change type: ' + deviceChanged.type + '\n';
        callbackMsg += 'Device count: ' + deviceChanged.deviceDescriptors.length + '\n';
        for (let i = 0; i < deviceChanged.deviceDescriptors.length; i++) {
          callbackMsg += `Device ${i} - id: ${deviceChanged.deviceDescriptors[i].id} - name: ${deviceChanged.deviceDescriptors[i].name} - type: ${deviceChanged.deviceDescriptors[i].deviceType}\n`;
        }
        globalCallbackUpdate(callbackMsg);
      }
      // [EndExclude selectMediaInputDevice]
    });
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to use on function. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude selectMediaInputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to use on function. Code: ${error.code}, message: ${error.message}`, true);
    }
    // [EndExclude selectMediaInputDevice]
  }
  // [StartExclude selectMediaInputDevice]
}

async function selectMediaInputDevice(){
  // [EndExclude selectMediaInputDevice]

  try {
    // 获取当前可选的音频输入设备列表。
    let data = audioSessionManager.getAvailableDevices(audio.DeviceUsage.MEDIA_INPUT_DEVICES);
    console.info(`Succeeded in getting available devices. AudioDeviceDescriptors: ${JSON.stringify(data)}`);
    // 当前可选音频输入设备列表不为空时，可进行选择。
    if (data[1] || data[0]) {
      // 选择输入设备。
      audioSessionManager.selectMediaInputDevice(data[1] ? data[1] : data[0]).then(() => {
        console.info('Succeeded in selecting media input device.');
        // [StartExclude selectMediaInputDevice]
        if (globalLogUpdate) {
          globalLogUpdate('Succeeded in selecting media input device.', false);
        }
        // [EndExclude selectMediaInputDevice]
      }).catch((err: BusinessError) => {
        console.error(`Failed to select media input device. Code: ${err.code}, message: ${err.message}`);
        // [StartExclude selectMediaInputDevice]
        if (globalLogUpdate) {
          globalLogUpdate(`Failed to select media input device. Code: ${err.code}, message: ${err.message}`, true);
        }
        // [EndExclude selectMediaInputDevice]
      });
    }
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to getAvailableDevices. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude selectMediaInputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to getAvailableDevices. Code: ${error.code}, message: ${error.message}`, true);
    }
    // [EndExclude selectMediaInputDevice]
  }
  // [StartExclude selectMediaInputDevice]
}

async function getSelectedMediaInputDevice(){
  // [EndExclude selectMediaInputDevice]

  try {
    // 可通过该接口查询选择输入设备是否成功。
    let device = audioSessionManager.getSelectedMediaInputDevice();
    console.info(`Succeeded in getting selected media input device. Device: ${JSON.stringify(device)}`);
    // [StartExclude selectMediaInputDevice]
    if (globalLogUpdate) {
      let deviceInfo = 'Succeeded in getting selected media input device.\n';
      deviceInfo += `Device - id: ${device.id} - name: ${device.name} - type: ${device.deviceType}\n`;
      globalLogUpdate(deviceInfo, false);
    }
    // [EndExclude selectMediaInputDevice]
  } catch (err) {
    let error = err as BusinessError;
    console.error(`Failed to get selected media input device. Code: ${error.code}, message: ${error.message}`);
    // [StartExclude selectMediaInputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to get selected media input device. Code: ${error.code}, message: ${error.message}`, true);
    }
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
    if (globalLogUpdate) {
      globalLogUpdate('Succeeded in clearing selected media input device.', false);
    }
    // [EndExclude selectMediaInputDevice]
  }).catch((err: BusinessError) => {
    console.error(`Failed to clear selected media input device. Code: ${err.code}, message: ${err.message}`);
    // [StartExclude selectMediaInputDevice]
    if (globalLogUpdate) {
      globalLogUpdate(`Failed to clear selected media input device. Code: ${err.code}, message: ${err.message}`, true);
    }
    // [EndExclude selectMediaInputDevice]
  });
  // [End selectMediaInputDevice]
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
          .id('input_switcher_back')
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
              Text('创建音频录制对象').fontSize(15).fontColor(Color.White)
            }
            .id('input_switcher_init')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
              await initArguments(context);
              await init();
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
            .id('input_switcher_start')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await start();
              this.runningResult = 'Succeeded in starting audio capturer.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('停止录制').fontSize(15).fontColor(Color.White)
            }
            .id('input_switcher_stop')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await stop();
              this.runningResult = 'Succeeded in stopping audio capturer.';
            })
          }
          .width('80%')
          .height(50)
          .justifyContent(FlexAlign.Center)

          Row() {
            Button() {
              Text('选择蓝牙或星闪进行录音').fontSize(15).fontColor(Color.White)
            }
            .id('input_switcher_setBluetoothAndNearlinkPreferredRecordCategory')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await setBluetoothAndNearlinkPreferredRecordCategory();
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
            .id('input_switcher_onCurrentInputDeviceChanged')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await onCurrentInputDeviceChanged();
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
            .id('input_switcher_onAvailableDeviceChange')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await onAvailableDeviceChange();
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
            .id('input_switcher_selectMediaInputDevice')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await selectMediaInputDevice();
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
            .id('input_switcher_getSelectedMediaInputDevice')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await getSelectedMediaInputDevice();
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
            .id('input_switcher_clearSelectedMediaInputDevice')
            .width('80%')
            .height(40)
            .onClick(async (): Promise<void> => {
              await clearSelectedMediaInputDevice();
              this.runningResult = 'Succeeded in clearing selected media input device.';
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