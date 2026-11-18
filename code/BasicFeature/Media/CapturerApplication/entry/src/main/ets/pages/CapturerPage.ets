/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { AudioCapturerController } from '../common/utils/mediaUtils/AudioCapturerController';
import { AudioRendererController } from '../common/utils/mediaUtils/AudioRendererController';
import { APP_ROOT_FILE_PATH } from '../common/constants/CommonConstants'
import { AudioSamplingRate, AudioChannel, AudioState, AudioSourceType, AudioSampleFormat} from '../common/constants/AudioConstants'
import { SAMPLING_RATE_KEY_MAP, SAMPLING_RATE_OPTIONS, CHANNEL_OPTIONS, CHANNEL_KEY_MAP, SOURCE_TYPE_OPTIONS,
  SOURCE_TYPE_KEY_MAP, SAMPLE_FORMAT_OPTIONS, SAMPLE_FORMAT_KEY_MAP } from '../common/constants/SelectConstants'
import Logger from '../common/utils/Logger';
import PermissionManager from '../common/utils/PermissionManager';
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';
import { RecordingMetadata } from '../common/model/RecordingMetadata';
import { PromptAction } from '@kit.ArkUI';

const TAG = 'CapturerPage';

@Entry
@Component
struct CapturerPage {
  @State capturer: boolean = false
  @State renderer: boolean = false
  @State recordingList: string[] = []
  @State showCapturerSheet: boolean = false
  @State showPlayerSheet: boolean = false
  @State isRecording: boolean = false
  @State isPlaying: boolean = false
  @State currentPlayingFile: string = ''
  @State isLowLatency: boolean = false
  @State selectedSourceType: AudioSourceType = AudioSourceType.MIC
  @State selectedSourceTypeKey: string = 'MIC'
  @State selectedSamplingRate: AudioSamplingRate = AudioSamplingRate.SAMPLE_RATE_48000
  @State selectedSamplingRateKey: string = 'SR_48000'
  @State selectedChannel: AudioChannel = AudioChannel.STEREO
  @State selectedChannelKey: string = 'STEREO'
  @State selectedSampleFormat: AudioSampleFormat = AudioSampleFormat.S16LE
  @State selectedSampleFormatKey: string = 'S16LE'
  @State currentMetadata: RecordingMetadata | undefined = undefined
  private context: common.UIAbilityContext | undefined = AppStorage.get('context');
  @State promptAction: PromptAction = this.getUIContext().getPromptAction();
  private static readonly STATE_TO_MESSAGE_MAP: Map<number, string> = new Map([
    [AudioState.RUNNING, '恢复'],
    [AudioState.PAUSED, '被暂停'],
    [AudioState.STOPPED, '被停止'],
    [AudioState.MUTED, '被静音'],
    [AudioState.UNMUTED, '解除静音'],
  ]);

  aboutToAppear() {
    this.loadRecordings();
    this.registerRendererUICallback();
    this.registerCapturerUICallback();
  }

  loadRecordings() {
    try {
      const filesDir = this.context!.filesDir;
      const files = fs.listFileSync(filesDir);
      this.recordingList = files.filter(file => file.endsWith('.pcm'));
    } catch (err) {
      Logger.error(TAG, `loadRecordings failed: ${JSON.stringify(err)}`);
    }
  }

  build() {
    Column() {
      Text('录音')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      List({ space: 10 }) {
        ForEach(this.recordingList, (item: string, index: number) => {
          ListItem() {
            Row() {
              Text(item)
                .fontSize(16)
                .width('100%')
            }
            .width('100%')
            .height(60)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
            .padding({ left: 16, right: 16 })
          }
          .swipeAction({ end: this.DeleteButtonBuilder(index) })
          .onClick(() => {
            this.currentPlayingFile = item;
            this.currentMetadata = AudioRendererController.getInstance().getRecordingMetadata(item);
            this.showPlayerSheet = true;
          })
        }, (item: string, index: number) => `${item}_${index}`)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16 })
      .bindSheet($$this.showPlayerSheet, this.PlayerBuilder(), {
        height: '50%',
        showClose: false,
        onDisappear: async () => {
          await AudioRendererController.getInstance().release();
          this.renderer = false;
        }
      })

      Column() {
        Button() {
          Circle()
            .width(60)
            .height(60)
            .fill(Color.Red)
        }
        .width(80)
        .height(80)
        .backgroundColor(Color.Transparent)
        .onClick(() => {
          this.showCapturerSheet = true;
        }
        )
      }
      .width('100%')
      .height(100)
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .bindSheet($$this.showCapturerSheet, this.RecorderBuilder(), {
      height: '60%',
      showClose: false,
      onDisappear: async () => {
        Logger.info(TAG, `capturer released`);
        await AudioCapturerController.getInstance().release();
        this.capturer = false;
      }
    })
  }

  @Builder
  DeleteButtonBuilder(index: number) {
    Button('删除')
      .width(80)
      .height(60)
      .fontSize(14)
      .backgroundColor('#F44336')
      .borderRadius(8)
      .shadow({
        radius: 4,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })
      .onClick(() => {
        this.deleteRecording(index);
      })
  }

  deleteRecording(index: number) {
    try {
      const fileName = this.recordingList[index];
      const filePath = `${APP_ROOT_FILE_PATH}/${fileName}`;
      fs.unlinkSync(filePath);
      this.recordingList.splice(index, 1);
      Logger.info(TAG, `Deleted recording: ${fileName}`);
    } catch (err) {
      Logger.error(TAG, `Failed to delete recording: ${JSON.stringify(err)}`);
    }
  }

  @Builder
  RecorderBuilder() {
    Column() {
      Row() {
        Button('开始')
          .width(90)
          .height(45)
          .fontSize(14)
          .backgroundColor('#4CAF50')
          .borderRadius(8)
          .enabled(!this.capturer)
          .shadow({
            radius: 4,
            color: '#1A000000',
            offsetX: 0,
            offsetY: 2
          })
          .onClick(async () => {
            const granted = await PermissionManager.requestPermissions(this.context!, ['ohos.permission.MICROPHONE']);
            if (granted) {
              AudioCapturerController.getInstance().setAudioParams(this.selectedSourceType, this.selectedSamplingRate,
                this.selectedChannel, this.selectedSampleFormat, this.isLowLatency);
              await AudioCapturerController.getInstance().init();
              this.capturer = true;
              await AudioCapturerController.getInstance().start();
              this.isRecording = true;
            } else {
              Logger.error(TAG, `Capturer not be permitted`);
            }
          })

        Button(this.isRecording ? '暂停' : '继续')
          .width(90)
          .height(45)
          .fontSize(14)
          .backgroundColor('#FF9800')
          .borderRadius(8)
          .margin({ left: 12 })
          .enabled(this.capturer)
          .shadow({
            radius: 4,
            color: '#1A000000',
            offsetX: 0,
            offsetY: 2
          })
          .onClick(async () => {
            if (this.isRecording) {
              await AudioCapturerController.getInstance().pause();
            } else {
              await AudioCapturerController.getInstance().start();
            }
            this.isRecording = !this.isRecording
          })

        Button('结束')
          .width(90)
          .height(45)
          .fontSize(14)
          .backgroundColor('#F44336')
          .borderRadius(8)
          .margin({ left: 12 })
          .shadow({
            radius: 4,
            color: '#1A000000',
            offsetX: 0,
            offsetY: 2
          })
          .onClick(async () => {
            this.isRecording = false;
            await AudioCapturerController.getInstance().stop();
            await AudioCapturerController.getInstance().release();
            this.showCapturerSheet = false;
            this.loadRecordings();
            this.capturer = false;
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding({ top: 30 })

      Column() {
        Row() {
          Text('⚡ 低时延')
            .fontSize(12)
            .fontColor('#666')

          Blank()

          Toggle({ type: ToggleType.Switch, isOn: this.isLowLatency })
            .selectedColor('#4CAF50')
            .enabled(!this.isRecording)
            .onChange((isOn: boolean) => {
              this.isLowLatency = isOn;
            })
        }
        .width('100%')
        .padding({ top: 10, bottom: 10 })

        Divider()
          .color('#E0E0E0')

        Row() {
          Text('🎵 流类型')
            .fontSize(12)
            .fontColor('#666')

          Blank()

          Select(SOURCE_TYPE_OPTIONS)
            .value(this.selectedSourceTypeKey)
            .font({ size: 11 })
            .selectedOptionFont({ size: 11, weight: FontWeight.Medium })
            .optionFont({ size: 11 })
            .enabled(!this.isRecording)
            .borderRadius(4)
            .backgroundColor('#FFFFFF')
            .width(120)
            .onSelect((index, value) => {
              this.selectedSourceTypeKey = value;
              this.selectedSourceType = SOURCE_TYPE_KEY_MAP[value];
            })
        }
        .width('100%')
        .padding({ top: 10, bottom: 10 })

        Divider()
          .color('#E0E0E0')

        Row() {
          Text('📊 采样率')
            .fontSize(12)
            .fontColor('#666')

          Blank()

          Select(SAMPLING_RATE_OPTIONS)
            .value(this.selectedSamplingRateKey)
            .font({ size: 11 })
            .selectedOptionFont({ size: 11, weight: FontWeight.Medium })
            .optionFont({ size: 11 })
            .enabled(!this.isRecording)
            .borderRadius(4)
            .backgroundColor('#FFFFFF')
            .width(120)
            .onSelect((index, value) => {
              this.selectedSamplingRateKey = value;
              this.selectedSamplingRate = SAMPLING_RATE_KEY_MAP[value];
            })
        }
        .width('100%')
        .padding({ top: 10, bottom: 10 })

        Divider()
          .color('#E0E0E0')

        Row() {
          Text('🔊 声道数')
            .fontSize(12)
            .fontColor('#666')

          Blank()

          Select(CHANNEL_OPTIONS)
            .value(this.selectedChannelKey)
            .font({ size: 11 })
            .selectedOptionFont({ size: 11, weight: FontWeight.Medium })
            .optionFont({ size: 11 })
            .enabled(!this.isRecording)
            .borderRadius(4)
            .backgroundColor('#FFFFFF')
            .width(120)
            .onSelect((index, value) => {
              this.selectedChannelKey = value;
              this.selectedChannel = CHANNEL_KEY_MAP[value];
            })
        }
        .width('100%')
        .padding({ top: 10, bottom: 10 })

        Divider()
          .color('#E0E0E0')

        Row() {
          Text('📏 位深')
            .fontSize(12)
            .fontColor('#666')

          Blank()

          Select(SAMPLE_FORMAT_OPTIONS)
            .value(this.selectedSampleFormatKey)
            .font({ size: 11 })
            .selectedOptionFont({ size: 11, weight: FontWeight.Medium })
            .optionFont({ size: 11 })
            .enabled(!this.isRecording)
            .borderRadius(4)
            .backgroundColor('#FFFFFF')
            .width(120)
            .onSelect((index, value) => {
              this.selectedSampleFormatKey = value;
              this.selectedSampleFormat = SAMPLE_FORMAT_KEY_MAP[value];
            })
        }
        .width('100%')
        .padding({ top: 10, bottom: 10 })
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#FAFAFA')
      .borderRadius(12)
      .margin({ top: 20, left: 16, right: 16 })
      .shadow({
        radius: 8,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius({ topLeft: 20, topRight: 20 })
  }

  @Builder
  PlayerBuilder() {
    Column() {
      Text(this.currentPlayingFile)
        .fontSize(16)
        .margin({ top: 20, bottom: 20 })

      Row() {
        Button('播放')
          .width(90)
          .height(45)
          .fontSize(14)
          .backgroundColor('#4CAF50')
          .borderRadius(8)
          .shadow({
            radius: 4,
            color: '#1A000000',
            offsetX: 0,
            offsetY: 2
          })
          .onClick(async () => {
            if(this.currentMetadata) {
              await AudioRendererController.getInstance().init();
              await AudioRendererController.getInstance().start();
              this.isPlaying = true;
              this.renderer = true;
            }
          })

        Button(this.isPlaying ? '暂停' : '继续')
          .width(90)
          .height(45)
          .fontSize(14)
          .backgroundColor('#FF9800')
          .borderRadius(8)
          .margin({ left: 12 })
          .enabled(this.renderer)
          .shadow({
            radius: 4,
            color: '#1A000000',
            offsetX: 0,
            offsetY: 2
          })
          .onClick(async () => {
            if (this.isPlaying) {
              await AudioRendererController.getInstance().pause();
            } else {
              await AudioRendererController.getInstance().start();
            }
            this.isPlaying = !this.isPlaying;
          })

        Button('停止')
          .width(90)
          .height(45)
          .fontSize(14)
          .backgroundColor('#F44336')
          .borderRadius(8)
          .margin({ left: 12 })
          .shadow({
            radius: 4,
            color: '#1A000000',
            offsetX: 0,
            offsetY: 2
          })
          .onClick(async () => {
            await AudioRendererController.getInstance().stop();
            await AudioRendererController.getInstance().release();
            this.isPlaying = false;
            this.showPlayerSheet = false;
            this.renderer = false;
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding({ top: 30 })

      if (this.currentMetadata) {
        Column() {
          Text('音频信息')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 12 })

          Row() {
            Text('⚡ 低时延')
              .fontSize(12)
              .fontColor('#666')
            Blank()
            Text(this.currentMetadata.isLowLatencyMode ? '开启' : '关闭')
              .fontSize(12)
              .fontColor(this.currentMetadata.isLowLatencyMode ? '#4CAF50' : '#999')
              .fontWeight(FontWeight.Medium)
          }
          .width('100%')
          .padding({ top: 8, bottom: 8 })

          Divider()
            .color('#E0E0E0')

          Row() {
            Text('🎵 采样率')
              .fontSize(12)
              .fontColor('#666')
            Blank()
            Text(`${this.currentMetadata.samplingRate} Hz`)
              .fontSize(12)
              .fontColor('#333')
              .fontWeight(FontWeight.Medium)
          }
          .width('100%')
          .padding({ top: 8, bottom: 8 })

          Divider()
            .color('#E0E0E0')

          Row() {
            Text('🔊 声道数')
              .fontSize(12)
              .fontColor('#666')
            Blank()
            Text(`${this.currentMetadata.channelCount}`)
              .fontSize(12)
              .fontColor('#333')
              .fontWeight(FontWeight.Medium)
          }
          .width('100%')
          .padding({ top: 8, bottom: 8 })

          Divider()
            .color('#E0E0E0')

          Row() {
            Text('📏 位深')
              .fontSize(12)
              .fontColor('#666')
            Blank()
            Text(`${this.getSampleFormatName(this.currentMetadata.sampleFormat)}`)
              .fontSize(12)
              .fontColor('#333')
              .fontWeight(FontWeight.Medium)
          }
          .width('100%')
          .padding({ top: 8, bottom: 8 })
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FAFAFA')
        .borderRadius(12)
        .margin({ top: 20, left: 16, right: 16 })
        .shadow({
          radius: 8,
          color: '#1A000000',
          offsetX: 0,
          offsetY: 2
        })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius({ topLeft: 20, topRight: 20 })
  }

  registerRendererUICallback() {
    AudioRendererController.getInstance().onStateChange((state: number, isInterrupt: boolean) => {
      Logger.info(TAG, `Renderer UI on state change: ${state}`);
      switch (state) {
        case AudioState.RUNNING:
          this.isPlaying = true;
          break;
        case AudioState.PAUSED:
          this.isPlaying = false;
          break;
        case AudioState.STOPPED:
          this.isPlaying = false;
          this.showPlayerSheet = !isInterrupt;
          AudioRendererController.getInstance().release();
          this.renderer = false;
          break;
        default:
          break;
      }
      Logger.info(TAG, `Renderer UI on state showPlayerSheet: ${this.showPlayerSheet}`);
      if (isInterrupt) {
        this.showToast(state);
      }
    });
  }

  registerCapturerUICallback() {
    AudioCapturerController.getInstance().onStateChange((state: number) => {
      Logger.info(TAG, `Capturer UI on state change: ${state}`);
      switch (state) {
        case AudioState.RUNNING:
          this.isRecording = true;
          break;
        case AudioState.PAUSED:
          this.isRecording = false;
          break;
        case AudioState.STOPPED:
          this.isRecording = false;
          this.showCapturerSheet = false;
          this.capturer = false;
          this.loadRecordings();
          break;
        case AudioState.STOPPED:
          this.isRecording = false;
          this.showCapturerSheet = false;
          this.capturer = false;
          this.loadRecordings();
          break;
        default:
          break;
      }
      Logger.info(TAG, `Capturer UI on state showPlayerSheet: ${this.showPlayerSheet}`);
      this.showToast(state);
    });
  }

  showToast(state: number) {
    const message = CapturerPage.STATE_TO_MESSAGE_MAP.get(state);
    if (message) {
      this.promptAction.showToast({
        message: message,
        duration: 1000
      });
    }
  }

  getSampleFormatName(format: number): string {
    switch (format) {
      case AudioSampleFormat.U8:
        return 'U8';
      case AudioSampleFormat.S16LE:
        return 'S16LE';
      case AudioSampleFormat.S24LE:
        return 'S24LE';
      case AudioSampleFormat.S32LE:
        return 'S32LE';
      case AudioSampleFormat.F32LE:
        return 'F32LE';
      default:
        return 'Unknown';
    }
  }
}