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
// [Start all_audioLoopback]
import audio from '@ohos.multimedia.audio';
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import {
  Entry, Component, State, Scroll, Column, Row, Text, Color, FlexAlign, HorizontalAlign, TextOverflow, ClickEvent
} from '@kit.ArkUI';

const TAG = 'AudioLoopbackDemo';
let mode: audio.AudioLoopbackMode = audio.AudioLoopbackMode.HARDWARE;
let audioLoopback: audio.AudioLoopback | undefined = undefined;
let currentReverbPreset: audio.AudioLoopbackReverbPreset = audio.AudioLoopbackReverbPreset.THEATER;
let currentEqualizerPreset: audio.AudioLoopbackEqualizerPreset = audio.AudioLoopbackEqualizerPreset.FULL;

// [StartExclude all_audioLoopback]
let statusChangeCallback = (status: audio.AudioLoopbackStatus) => {
  if (status == audio.AudioLoopbackStatus.UNAVAILABLE_DEVICE) {
    console.info('Audio loopback status is: UNAVAILABLE_DEVICE');
  } else if (status == audio.AudioLoopbackStatus.UNAVAILABLE_SCENE) {
    console.info('Audio loopback status is: UNAVAILABLE_SCENE');
  } else if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
    console.info('Audio loopback status is: AVAILABLE_IDLE');
  } else if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
    console.info('Audio loopback status is: AVAILABLE_RUNNING');
  }
};
// [EndExclude all_audioLoopback]

// [StartExclude all_audioLoopback]
async function requestMicrophonePermission(context: common.UIAbilityContext): Promise<boolean> {
  let atManager = abilityAccessCtrl.createAtManager();
  let result: PermissionRequestResult = await atManager
    .requestPermissionsFromUser(context, ['ohos.permission.MICROPHONE']);
  let firstResult = result.authResults.find((value: int, index: int, array: Array<int>): boolean => {
    return index === 0;
  });
  return firstResult === 0;
}
// [EndExclude all_audioLoopback]

// 查询当前设备能力，能力支持时创建 AudioLoopback 实例。
// [Start create_AudioLoopback]
async function init(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let isSupported = audio.getAudioManager().getStreamManager().isAudioLoopbackSupported(mode);
  if (isSupported) {
    try {
      let loopback = await audio.createAudioLoopback(mode);
      console.info('Succeeded in creating audio loopback.');
      const successMsg = 'Succeeded in creating audio loopback.';
      if (updateCallback) {
        updateCallback(successMsg, false);
      }
      if (loopback === null) {
        const errorMsg = 'Failed to create audio loopback. Loopback instance is null.';
        console.error(errorMsg);
        if (updateCallback) {
          updateCallback(errorMsg, true);
        }
        return;
      }
      audioLoopback = loopback;
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to create audio loopback. Message: ${error.message}`);
      const errorMsg = `Failed to create audio loopback. Message: ${error.message}`;
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
    }

  } else {
    console.error('Audio loopback is unsupported.');
    const errorMsg = 'Audio loopback is unsupported.';
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End create_AudioLoopback]

// 设置返听音量。
// [Start set_Volume]
async function setVolume(volume: number, updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    try {
      await loopback.setVolume(volume);
      console.info('Succeeded in setting volume.');
      const successMsg = 'Succeeded in setting volume.';
      if (updateCallback) {
        updateCallback(successMsg, false);
      }
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to set volume. Message: ${error.message}`);
      const errorMsg = `Failed to set volume. Message: ${error.message}`;
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
    }
  } else {
    console.error('Audio loopback not created.');
    const errorMsg = 'Audio loopback not created.';
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End set_Volume]

// 设置返听混响预设，并同步当前页面状态。
// [Start set_ReverbPreset]
async function setReverbPreset(preset: audio.AudioLoopbackReverbPreset, updateCallback?: (msg: string,
  isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    try {
      if (loopback.setReverbPreset(preset)) {
        console.info('Succeeded in setting reverb preset.');
        const successMsg = 'Succeeded in setting reverb preset.';
        if (updateCallback) {
          updateCallback(successMsg, false);
        }
        currentReverbPreset = preset;
      } else {
        console.error('Failed to set reverb preset.');
        const errorMsg = 'Failed to set reverb preset.';
        if (updateCallback) {
          updateCallback(errorMsg, true);
        }
      }
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to set reverb preset. Message: ${error.message}`);
      const errorMsg = `Failed to set reverb preset. Message: ${error.message}`;
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
    }
  } else {
    console.error('Audio loopback not created.');
    const errorMsg = 'Audio loopback not created.';
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End set_ReverbPreset]

// 设置返听均衡器预设，并同步当前页面状态。
// [Start set_EqualizerPreset]
async function setEqualizerPreset(preset: audio.AudioLoopbackEqualizerPreset, updateCallback?:
  (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    try {
      if (loopback.setEqualizerPreset(preset)) {
        console.info('Succeeded in setting equalizer preset.');
        const successMsg = 'Succeeded in setting equalizer preset.';
        if (updateCallback) {
          updateCallback(successMsg, false);
        }
        currentEqualizerPreset = preset;
      } else {
        console.error('Failed to set equalizer preset.');
        const errorMsg = 'Failed to set equalizer preset.';
        if (updateCallback) {
          updateCallback(errorMsg, true);
        }
      }
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to set equalizer preset. Message: ${error.message}`);
      const errorMsg = `Failed to set equalizer preset. Message: ${error.message}`;
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
    }
  } else {
    console.error('Audio loopback not created.');
    const errorMsg = 'Audio loopback not created.';
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End set_EqualizerPreset]

// 启用返听前注册状态监听，失败时回读当前状态。
// [Start enable]
async function enable(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    try {
      let status = await loopback.getStatus();
      if (status == audio.AudioLoopbackStatus.AVAILABLE_IDLE) {
        loopback.onStatusChange(statusChangeCallback);
        let isSuccess = await loopback.enable(true);
        if (isSuccess) {
          console.info('Succeeded in using enable function.');
          const successMsg = 'Succeeded in using enable function.';
          if (updateCallback) {
            updateCallback(successMsg, false);
          }
        } else {
          status = await loopback.getStatus();
          statusChangeCallback(status);
        }
      } else {
        statusChangeCallback(status);
      }
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to use enable function. Message: ${error.message}`);
      const errorMsg = `Failed to use enable function. Message: ${error.message}`;
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
    }

  } else {
    console.error('Audio loopback not created.');
    const errorMsg = `Audio loopback not created.`;
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}

// 禁用返听，成功后取消状态监听。
async function disable(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    try {
      let status = await loopback.getStatus();
      if (status == audio.AudioLoopbackStatus.AVAILABLE_RUNNING) {
        let isSuccess = await loopback.enable(false);
        if (isSuccess) {
          console.info('Succeeded in using enable function.');
          const successMsg = 'Succeeded in using enable function.';
          if (updateCallback) {
            updateCallback(successMsg, false);
          }
          loopback.offStatusChange(statusChangeCallback);
        } else {
          status = await loopback.getStatus();
          statusChangeCallback(status);
        }
      } else {
        statusChangeCallback(status);
      }
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to use enable function. Message: ${error.message}`);
      const errorMsg = `Failed to use enable function. Message: ${error.message}`;
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
    }

  } else {
    console.error('Audio loopback not created.');
    const errorMsg = `Audio loopback not created.`;
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End enable]

// 查询返听运行状态。
// [Start get_Status]
async function getStatus(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    try {
      let status = await loopback.getStatus();
      console.info(`Succeeded in getting status, status is ${status}.`);
      const successMsg = `Succeeded in getting status, status is ${status}.`;
      if (updateCallback) {
        updateCallback(successMsg, false);
      }
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to get status. Message: ${error.message}`);
      const errorMsg = `Failed to get status. Message: ${error.message}`;
      if (updateCallback) {
        updateCallback(errorMsg, true);
      }
    }

  }
}
// [End get_Status]

// 查询返听音量。
// [Start get_Volume]
async function getVolume(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    let volume = loopback.getVolume();
    const successMsg = `Succeeded in getting volume, volume is ${volume}.`;
    if (updateCallback) {
      updateCallback(successMsg, false);
    }
  } else {
    const errorMsg = 'Audio loopback not created.';
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End get_Volume]

// 查询当前支持的返听输入输出设备对。
// [Start get_SupportedDevicePairs]
async function getSupportedDevicePairs(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    let devicePairs = loopback.getSupportedDevicePairs();
    if (devicePairs.length === 0) {
      const emptyMsg = 'No supported loopback device pair found.';
      if (updateCallback) {
        updateCallback(emptyMsg, true);
      }
      return;
    }
    let firstPair = devicePairs.find((pair: audio.AudioDevicePair, index: int, array: Array<audio.AudioDevicePair>) => {
      return index === 0;
    });
    if (firstPair === undefined) {
      const emptyMsg = 'No supported loopback device pair found.';
      if (updateCallback) {
        updateCallback(emptyMsg, true);
      }
      return;
    }
    const successMsg = `Succeeded in getting supported device pairs, count: ${devicePairs.length}, ` +
      `first pair inputType: ${firstPair.inputDevice.deviceType}, ` +
      `outputType: ${firstPair.outputDevice.deviceType}.`;
    if (updateCallback) {
      updateCallback(successMsg, false);
    }
  } else {
    const errorMsg = 'Audio loopback not created.';
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End get_SupportedDevicePairs]

// 查询系统首选的返听设备对。
// [Start get_PreferredDevicePair]
async function getPreferredDevicePair(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    let devicePair = loopback.getPreferredDevicePair();
    if (devicePair === null) {
      const emptyMsg = 'No preferred loopback device pair found.';
      if (updateCallback) {
        updateCallback(emptyMsg, true);
      }
      return;
    }
    const successMsg = `Succeeded in getting preferred device pair, ` +
      `inputType: ${devicePair.inputDevice.deviceType}, ` +
      `outputType: ${devicePair.outputDevice.deviceType}.`;
    if (updateCallback) {
      updateCallback(successMsg, false);
    }
  } else {
    const errorMsg = 'Audio loopback not created.';
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End get_PreferredDevicePair]

// 查询当前返听混响预设。
// [Start get_ReverbPreset]
async function getReverbPreset(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    let reverbPreset = loopback.getReverbPreset();
    const successMsg = `Succeeded in getting reverb preset, preset is ${reverbPreset}.`;
    if (updateCallback) {
      updateCallback(successMsg, false);
    }
  } else {
    const errorMsg = 'Audio loopback not created.';
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End get_ReverbPreset]

// 查询当前返听均衡器预设。
// [Start get_EqualizerPreset]
async function getEqualizerPreset(updateCallback?: (msg: string, isError: boolean) => void): Promise<void> {
  let loopback = audioLoopback;
  if (loopback !== undefined) {
    let equalizerPreset = loopback.getEqualizerPreset();
    const successMsg = `Succeeded in getting equalizer preset, preset is ${equalizerPreset}.`;
    if (updateCallback) {
      updateCallback(successMsg, false);
    }
  } else {
    const errorMsg = 'Audio loopback not created.';
    if (updateCallback) {
      updateCallback(errorMsg, true);
    }
  }
}
// [End get_EqualizerPreset]
// [End all_audioLoopback]

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
            Text('创建音频低时延耳返实例')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ right: 12, bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
            let hasPermission = await requestMicrophonePermission(context);
            if (!hasPermission) {
              const errorMsg = 'Microphone permission denied';
              console.error(errorMsg);
              this.updateLogInfo(errorMsg, true);
              this.currentState = 'Permission denied';
              return;
            }
            await init((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = 'Created';

            })();
          });

          Column() {
            Text('设置音频返听音量')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await setVolume(0.5, (msg, isError) => this.updateLogInfo(msg, isError));

            })();
          });
        }

        Row() {
          Column() {
            Text('设置混响模式')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ right: 12, bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await setReverbPreset(currentReverbPreset, (msg, isError) => this.updateLogInfo(msg, isError));

            })();
          });

          Column() {
            Text('Set Equalizer Preset')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await setEqualizerPreset(currentEqualizerPreset, (msg, isError) => this.updateLogInfo(msg, isError));

            })();
          });
        }

        Row() {
          Column() {
            Text('Get Status')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ right: 12, bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await getStatus((msg, isError) => this.updateLogInfo(msg, isError));

            })();
          });

          Column() {
            Text('查询混响模式')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await getReverbPreset((msg, isError) => this.updateLogInfo(msg, isError));

            })();
          });
        }

        Row() {
          Column() {
            Text('查询返听音量')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ right: 12, bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await getVolume((msg, isError) => this.updateLogInfo(msg, isError));

            })();
          });

          Column() {
            Text('Get Supported Device Pairs')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await getSupportedDevicePairs((msg, isError) => this.updateLogInfo(msg, isError));

            })();
          });
        }

        Row() {
          Column() {
            Text('Get Equalizer Preset')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ right: 12, bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await getEqualizerPreset((msg, isError) => this.updateLogInfo(msg, isError));

            })();
          });

          Column() {
            Text('启用音频返听')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await enable((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = 'Enabled';

            })();
          });
        }

        Row() {
          Column() {
            Text('查询首选设备对')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ right: 12, bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await getPreferredDevicePair((msg, isError) => this.updateLogInfo(msg, isError));

            })();
          });

          Column() {
            Text('禁用音频返听')
              .fontColor(Color.Black)
              .fontSize(14)
          }
          .backgroundColor(Color.White)
          .borderRadius(20)
          .width('45%')
          .height(60)
          .margin({ bottom: 12 })
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick((event: ClickEvent): void => {
            (async (): Promise<void> => {
            await disable((msg, isError) => this.updateLogInfo(msg, isError));
            this.currentState = 'Disabled';

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
