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
import { StreamCardView } from '../common/components/StreamCardView';

const TOAST_DURATION = 2000; // Toast display duration (ms)
const MUSIC_FREQ = 440; // Default frequency for MUSIC stream (Hz)
const GAME_FREQ = 550; // Default frequency for GAME stream (Hz)

@Entry
@Component
struct MusicVsGamePage {
  @State musicPlaying: boolean = false;
  @State gamePlaying: boolean = false;
  @State musicLog: string[] = [];
  @State gameLog: string[] = [];
  @State currentMode: InterruptMode = InterruptMode.SHARE_MODE;
  @State modeLabel: string = 'SHARE_MODE';
  @State promptAction: PromptAction = this.getUIContext().getPromptAction();
  private musicStream: AudioStreamController = new AudioStreamController(StreamUsageType.MUSIC, MUSIC_FREQ);
  private gameStream: AudioStreamController = new AudioStreamController(StreamUsageType.GAME, GAME_FREQ);
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
    this.gameStream.release();
  }

  registerCallbacks() {
    this.musicStream.onStateChange((state: AudioStreamState) => {
      this.musicPlaying = state === AudioStreamState.RUNNING;
    });
    this.musicStream.onInterrupt((logEntry: string) => {
      this.musicLog = [...this.musicLog, logEntry];
      this.promptAction.showToast({ message: `MUSIC: ${logEntry}`, duration: TOAST_DURATION });
    });
    this.gameStream.onStateChange((state: AudioStreamState) => {
      this.gamePlaying = state === AudioStreamState.RUNNING;
    });
    this.gameStream.onInterrupt((logEntry: string) => {
      this.gameLog = [...this.gameLog, logEntry];
      this.promptAction.showToast({ message: `GAME: ${logEntry}`, duration: TOAST_DURATION });
    });
  }

  async initStreams() {
    if (this.initialized) {
      return;
    }
    const resultA = await this.musicStream.init(this.currentMode);
    const resultB = await this.gameStream.init(this.currentMode);
    if (resultA && resultB) {
      this.initialized = true;
    }
  }

  async toggleMusic() {
    await this.initStreams();
    if (this.musicPlaying) {
      await this.musicStream.stopPlay();
    } else {
      await this.musicStream.startPlay();
    }
  }

  async toggleGame() {
    await this.initStreams();
    if (this.gamePlaying) {
      await this.gameStream.stopPlay();
    } else {
      await this.gameStream.startPlay();
    }
  }

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
        Text($r('app.string.music_vs_game_title'))
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Blank()
        Text(this.modeLabel)
          .id('pageModeLabelMG')
          .fontSize(12)
          .fontColor(this.currentMode === InterruptMode.SHARE_MODE ? '#4CAF50' : '#F44336')
      }
      .width('100%')
      .padding(16)

      Text($r('app.string.game_coexist_desc'))
        .fontSize(13)
        .fontColor('#666')
        .padding({ left: 16, right: 16, bottom: 16 })

      Column() {
        Text($r('app.string.game_no_control_reason'))
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: 4 })
        Text($r('app.string.game_coexist_explanation'))
          .fontSize(12)
          .fontColor('#666')
        Text($r('app.string.game_type_warning'))
          .fontSize(12)
          .fontColor('#F44336')
          .margin({ top: 4 })
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#FFF8E1')
      .borderRadius(12)
      .margin({ left: 16, right: 16, bottom: 12 })

      StreamCardView({
        title: `MUSIC (${MUSIC_FREQ}Hz)`,
        isPlaying: this.musicPlaying,
        logs: this.musicLog,
        idPrefix: 'musicG',
        onPlayStop: () => { this.toggleMusic(); },
        onClearLog: () => { this.musicStream.clearInterruptLog(); this.musicLog = []; }
      })

      StreamCardView({
        title: `GAME (${GAME_FREQ}Hz)`,
        isPlaying: this.gamePlaying,
        logs: this.gameLog,
        idPrefix: 'gameG',
        onPlayStop: () => { this.toggleGame(); },
        onClearLog: () => { this.gameStream.clearInterruptLog(); this.gameLog = []; }
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
  }

}
