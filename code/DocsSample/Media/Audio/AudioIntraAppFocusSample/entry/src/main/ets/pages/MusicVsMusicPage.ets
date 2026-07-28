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
const STREAM_A_FREQ = 440; // Default frequency for MUSIC stream A (Hz)
const STREAM_B_FREQ = 660; // Default frequency for MUSIC stream B (Hz)

@Entry
@Component
struct MusicVsMusicPage {
  @State streamAPlaying: boolean = false;
  @State streamBPlaying: boolean = false;
  @State streamALog: string[] = [];
  @State streamBLog: string[] = [];
  @State currentMode: InterruptMode = InterruptMode.SHARE_MODE;
  @State modeLabel: string = 'SHARE_MODE';
  @State appControl: boolean = false;
  @State streamAPausedByApp: boolean = false;
  @State promptAction: PromptAction = this.getUIContext().getPromptAction();
  private streamA: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC, STREAM_A_FREQ);
  private streamB: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC, STREAM_B_FREQ);
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
    this.streamA.release();
    this.streamB.release();
  }

  registerCallbacks() {
    this.streamA.onStateChange((state: AudioStreamState) => {
      this.streamAPlaying = state === AudioStreamState.RUNNING;
    });
    this.streamA.onInterrupt((logEntry: string) => {
      this.streamALog = [...this.streamALog, logEntry];
      this.promptAction.showToast({ message: `Stream A: ${logEntry}`, duration: TOAST_DURATION });
    });
    this.streamB.onStateChange((state: AudioStreamState) => {
      this.streamBPlaying = state === AudioStreamState.RUNNING;
    });
    this.streamB.onInterrupt((logEntry: string) => {
      this.streamBLog = [...this.streamBLog, logEntry];
      this.promptAction.showToast({ message: `Stream B: ${logEntry}`, duration: TOAST_DURATION });
    });
  }

  async initStreams() {
    if (this.initialized) {
      return;
    }
    const resultA = await this.streamA.init(this.currentMode);
    const resultB = await this.streamB.init(this.currentMode);
    if (resultA && resultB) {
      this.initialized = true;
    }
  }

  async toggleStreamA() {
    await this.initStreams();
    if (this.streamAPlaying) {
      this.streamAPausedByApp = false;
      await this.streamA.stopPlay();
    } else {
      await this.streamA.startPlay();
    }
  }

  // [Start toggle_stream_b]
  async toggleStreamB() { // 切换Stream B的播放状态
    await this.initStreams(); // 惰性初始化两条音频流（首次播放时才创建Renderer）
    if (this.streamBPlaying) { // B正在播放 → 用户要停止B
      // [StartExclude toggle_stream_b]
      await this.streamB.stopPlay(); // 停止B的音频输出
      // [EndExclude toggle_stream_b]
      if (this.streamAPausedByApp) { // A是被应用管控暂停的（不是用户自己暂停的），停止B后应自动恢复A
        this.streamAPausedByApp = false; // 清除标记：A即将恢复，不再是"被管控暂停"状态
        await this.streamA.startPlay(); // 恢复A的音频输出，完成PAUSE→RESUME
        this.promptAction.showToast({
          message: $r('app.string.app_control_stream_a_auto_resume'),
          duration: TOAST_DURATION
        });
      }
    } else { // B未播放 → 用户要开始播放B
      if (this.appControl && this.currentMode === InterruptMode.SHARE_MODE && 
      this.streamAPlaying) { // 管控开启+SHARE+A播放中：暂停A
        await this.streamA.pausePlay(); // 主动暂停A（PAUSE策略，可恢复），而非让系统STOP（不可恢复）
        this.streamAPausedByApp = true; // 标记A是被应用管控暂停的，B停止后需要自动恢复A
        this.promptAction.showToast({ message: $r('app.string.app_control_stream_a_pause'),
         duration: TOAST_DURATION });
      }
      await this.streamB.startPlay(); // 开始B的音频输出
    }
  }
  // [End toggle_stream_b]

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
        Text($r('app.string.music_vs_music_title'))
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
          Text(this.appControl ? $r('app.string.app_control_on') : $r('app.string.app_control_off'))
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
          ? $r('app.string.music_vs_music_share_control_detail')
          : $r('app.string.music_vs_music_share_no_control_detail'))
        : $r('app.string.music_vs_music_independent_detail'))
        .fontSize(13)
        .fontColor('#666')
        .padding({ left: 16, right: 16, top: 8, bottom: 16 })

      this.StreamCard(`Stream A - MUSIC (${STREAM_A_FREQ}Hz)`, this.streamAPlaying, this.streamALog,
        () => { this.toggleStreamA(); },
        () => { this.streamA.clearInterruptLog(); this.streamALog = []; })

      this.StreamCard(`Stream B - MUSIC (${STREAM_B_FREQ}Hz)`, this.streamBPlaying, this.streamBLog,
        () => { this.toggleStreamB(); },
        () => { this.streamB.clearInterruptLog(); this.streamBLog = []; })

      if (this.currentMode === InterruptMode.SHARE_MODE) {
        Column() {
          Text($r('app.string.comparison_label'))
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 4 })
          Text($r('app.string.comparison_independent_music'))
            .fontSize(12)
            .fontColor('#F44336')
          Text($r('app.string.comparison_share_control_music'))
            .fontSize(12)
            .fontColor('#4CAF50')
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
