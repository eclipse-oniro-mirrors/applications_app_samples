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
import { router, PromptAction } from '@kit.ArkUI';
import { AudioStreamController } from '../common/utils/AudioStreamController';
import { InterruptMode, StreamUsageType, AudioStreamState } from '../common/constants/AudioConstants';

const TOAST_DURATION = 2000; // Toast display duration (ms)
const MUSIC_FREQ = 440; // Default frequency for MUSIC stream (Hz)
const MOVIE_FREQ = 880; // Default frequency for MOVIE stream (Hz)

@Entry
@Component
struct MusicVsVideoPage {
  @State musicPlaying: boolean = false;
  @State videoPlaying: boolean = false;
  @State musicLog: string[] = [];
  @State videoLog: string[] = [];
  @State currentMode: InterruptMode = InterruptMode.SHARE_MODE;
  @State modeLabel: string = 'SHARE_MODE';
  @State appControl: boolean = false;
  @State musicPausedByApp: boolean = false;
  @State promptAction: PromptAction = this.getUIContext().getPromptAction();
  private musicStream: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC, MUSIC_FREQ);
  private videoStream: AudioStreamController = new AudioStreamController(StreamUsageType.MOVIE, MOVIE_FREQ);
  private initialized: boolean = false;

  aboutToAppear() {
    const params = router.getParams() as Record<string, number>;
    if (params && params.interruptMode !== undefined) {
      this.currentMode = params.interruptMode as InterruptMode;
    }
    this.modeLabel = this.currentMode === InterruptMode.SHARE_MODE ? 'SHARE_MODE' : 'INDEPENDENT_MODE';
    this.registerCallbacks();
  }

  aboutToDisappear() {
    this.musicStream.release();
    this.videoStream.release();
  }

  registerCallbacks() {
    this.musicStream.onStateChange((state: AudioStreamState) => {
      this.musicPlaying = state === AudioStreamState.RUNNING;
    });
    this.musicStream.onInterrupt((logEntry: string) => {
      this.musicLog = [...this.musicLog, logEntry];
      this.promptAction.showToast({ message: `MUSIC: ${logEntry}`, duration: TOAST_DURATION });
    });
    this.videoStream.onStateChange((state: AudioStreamState) => {
      this.videoPlaying = state === AudioStreamState.RUNNING;
    });
    this.videoStream.onInterrupt((logEntry: string) => {
      this.videoLog = [...this.videoLog, logEntry];
      this.promptAction.showToast({ message: `MOVIE: ${logEntry}`, duration: TOAST_DURATION });
    });
  }

  async initStreams() {
    if (this.initialized) {
      return;
    }
    const resultA = await this.musicStream.init(this.currentMode);
    const resultB = await this.videoStream.init(this.currentMode);
    if (resultA && resultB) {
      this.initialized = true;
    }
  }

  async toggleMusic() {
    await this.initStreams();
    this.musicPausedByApp = false;
    if (this.musicPlaying) {
      await this.musicStream.stopPlay();
    } else {
      await this.musicStream.startPlay();
    }
  }

  // [Start toggle_video]
  async toggleVideo() {
    await this.initStreams();
    if (this.videoPlaying) {
      // [StartExclude toggle_video]
      await this.videoStream.stopPlay();
      // [EndExclude toggle_video]
      // [Start paused_by_app_resume_video]
      if (this.musicPausedByApp) {
        this.musicPausedByApp = false;
        await this.musicStream.startPlay();
        // [StartExclude paused_by_app_resume_video]
        this.promptAction.showToast({ message: $r('app.string.app_control_music_auto_resume'), duration: TOAST_DURATION });
        // [EndExclude paused_by_app_resume_video]
      }
      // [End paused_by_app_resume_video]
    } else {
      // [Start app_control_pause_video]
      if (this.appControl && this.currentMode === InterruptMode.SHARE_MODE && this.musicPlaying) {
        await this.musicStream.pausePlay();
        this.musicPausedByApp = true;
        // [StartExclude app_control_pause_video]
        this.promptAction.showToast({ message: $r('app.string.app_control_music_pause'), duration: TOAST_DURATION });
        // [EndExclude app_control_pause_video]
      }
      // [End app_control_pause_video]
      await this.videoStream.startPlay();
    }
  }
  // [End toggle_video]

  build() {
    Column() {
      Row() {
        Button($r('app.string.back_btn'))
          .fontSize(14)
          .height(36)
          .backgroundColor('#E0E0E0')
          .fontColor('#333')
          .onClick(() => {
            router.back();
          })
        Blank()
        Text($r('app.string.music_vs_video_title'))
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Blank()
        Text(this.modeLabel)
          .fontSize(12)
          .fontColor(this.currentMode === InterruptMode.SHARE_MODE ? '#4CAF50' : '#F44336')
      }
      .width('100%')
      .padding(16)

      if (this.currentMode === InterruptMode.SHARE_MODE) {
        Row() {
          Text($r('app.string.app_control_label'))
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
          Toggle({ type: ToggleType.Switch, isOn: this.appControl })
            .onChange((isOn: boolean) => {
              this.appControl = isOn;
            })
            .margin({ left: 8 })
          Text(this.appControl ? $r('app.string.app_control_on_video') : $r('app.string.app_control_off'))
            .fontSize(12)
            .fontColor(this.appControl ? '#4CAF50' : '#666')
            .margin({ left: 8 })
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
        .margin({ left: 16, right: 16 })
      }

      Text(this.currentMode === InterruptMode.SHARE_MODE
        ? (this.appControl
          ? $r('app.string.music_vs_video_share_control_detail')
          : $r('app.string.music_vs_video_share_no_control_detail'))
        : $r('app.string.music_vs_video_independent_detail'))
        .fontSize(13)
        .fontColor('#666')
        .padding({ left: 16, right: 16, top: 8, bottom: 16 })

      this.StreamCard(`MUSIC (${MUSIC_FREQ}Hz)`, this.musicPlaying, this.musicLog,
        () => { this.toggleMusic(); },
        () => { this.musicStream.clearInterruptLog(); this.musicLog = []; })

      this.StreamCard(`MOVIE (${MOVIE_FREQ}Hz)`, this.videoPlaying, this.videoLog,
        () => { this.toggleVideo(); },
        () => { this.videoStream.clearInterruptLog(); this.videoLog = []; })

      if (this.currentMode === InterruptMode.SHARE_MODE) {
        Column() {
          Text($r('app.string.comparison_label'))
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 4 })
          Text($r('app.string.comparison_independent_video'))
            .fontSize(12)
            .fontColor('#F44336')
          Text($r('app.string.comparison_share_control_video'))
            .fontSize(12)
            .fontColor('#4CAF50')
            .margin({ top: 4 })
          Text($r('app.string.share_mode_benefit'))
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .fontColor('#0A59F7')
            .margin({ top: 4 })
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFF8E1')
        .borderRadius(12)
        .margin({ left: 16, right: 16, bottom: 12 })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }

  @Builder
  StreamCard(title: string, isPlaying: boolean, logs: string[], onPlayStop: () => void, onClearLog: () => void) {
    Column() {
      Text(title)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 8 })

      Row() {
        Button(isPlaying ? $r('app.string.stop_btn') : $r('app.string.play_btn'))
          .fontSize(14)
          .height(40)
          .backgroundColor(isPlaying ? '#F44336' : '#4CAF50')
          .fontColor('#FFFFFF')
          .borderRadius(8)
          .onClick(onPlayStop)

        Button($r('app.string.clear_log_btn'))
          .fontSize(14)
          .height(40)
          .backgroundColor('#E0E0E0')
          .fontColor('#333')
          .borderRadius(8)
          .margin({ left: 12 })
          .onClick(onClearLog)
      }
      .margin({ bottom: 8 })

      Scroll() {
        Column() {
          ForEach(logs, (log: string, index: number) => {
            Text(log)
              .fontSize(12)
              .fontColor('#F44336')
              .width('100%')
              .padding(4)
          }, (log: string, index: number) => `${index}`)
        }
      }
      .width('100%')
      .height(80)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .padding(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .margin({ left: 16, right: 16, bottom: 12 })
  }
}
