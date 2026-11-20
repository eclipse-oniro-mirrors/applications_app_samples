/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export enum PlaybackMoreAction {
  OPEN_QUEUE,
  CHANGE_SPEED,
  DISPLAY_SCALE,
  TOGGLE_MUTE,
  CHOOSE_TRANSFORM,
  SELECT_AUDIO_TRACK,
  SELECT_SUBTITLE_FILE,
  SELECT_SUBTITLE_DELAY,
  SELECT_SUBTITLE_STYLE,
  OPEN_PLAYER_SETTINGS,
  SET_AB_LOOP_START,
  SET_AB_LOOP_END,
  CLEAR_AB_LOOP,
  TOGGLE_BACKGROUND_PLAYBACK,
  EXIT_PIP,
  ENTER_PIP
}

@Component
export struct PlaybackMoreActionsPanel {
  @Prop buttonEnabled: boolean = true;
  @Prop isStopping: boolean = false;
  @Prop hasVideo: boolean = false;
  @Prop hasAudio: boolean = false;
  @Prop audioMuted: boolean = false;
  @Prop isPlayerSettingsVisible: boolean = false;
  @Prop abLoopStartUs: number = -1;
  @Prop abLoopEndUs: number = -1;
  @Prop isAbLoopEnabled: boolean = false;
  @Prop isBackgroundPlaybackEnabled: boolean = false;
  @Prop isPipActive: boolean = false;
  @Prop subtitleFileName: string = '';
  onClearSubtitle: () => void = (): void => {};
  onAction: (action: PlaybackMoreAction) => Promise<void> = async (_action: PlaybackMoreAction): Promise<void> => {};

  private formatHistoryPosition(positionUs: number): string {
    const totalSeconds: number = Math.floor(Math.max(0, positionUs) / 1000000);
    const minutes: number = Math.floor(totalSeconds / 60);
    const seconds: number = totalSeconds % 60;
    return (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
  }

  build() {
    Scroll() {
      Column({ space: '8vp' }) {
      Text($r('app.string.playback_section_controls'))
        .fontSize('13fp')
        .fontWeight(FontWeight.Medium)
        .fontColor('#667085')
      Row({ space: '8vp' }) {
        Button($r('app.string.playback_queue'))
          .layoutWeight(1)
          .height('30vp')
          .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
          .fontSize('10fp')
          .onClick(async () => {
            await this.onAction(PlaybackMoreAction.OPEN_QUEUE);
          })
      }
      .height('44vp')
      if (!this.buttonEnabled && !this.isStopping && this.hasVideo) {
        Row({ space: '8vp' }) {
          Button($r('app.string.adjust_playback_speed'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(async () => {
              await this.onAction(PlaybackMoreAction.CHANGE_SPEED);
            })
        }
        .height('44vp')
      }
      if (this.hasVideo) {
        if (this.subtitleFileName.length > 0) {
          Row({ space: '8vp' }) {
            Text(this.subtitleFileName)
              .layoutWeight(1)
              .fontSize('12fp')
              .fontColor('#667085')
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
            Button($r('app.string.playback_subtitle_clear'))
              .height('30vp')
              .fontSize('10fp')
              .onClick((): void => this.onClearSubtitle())
          }
          .width('100%')
        }
        Row({ space: '8vp' }) {
          Button($r('app.string.playback_display_scale'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(async () => {
              await this.onAction(PlaybackMoreAction.DISPLAY_SCALE);
            })
          if (this.hasAudio) {
            Button(this.audioMuted ? $r('app.string.playback_unmute') : $r('app.string.playback_mute'))
              .layoutWeight(1)
              .height('30vp')
              .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
              .fontSize('10fp')
              .onClick(async () => {
                await this.onAction(PlaybackMoreAction.TOGGLE_MUTE);
              })
          } else {
            Blank().layoutWeight(1)
          }
        }
        .height('44vp')
      } else if (this.hasAudio) {
        Row({ space: '8vp' }) {
          Button(this.audioMuted ? $r('app.string.playback_unmute') : $r('app.string.playback_mute'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(async () => {
              await this.onAction(PlaybackMoreAction.TOGGLE_MUTE);
            })
          Blank().layoutWeight(1)
        }
        .height('44vp')
      }
      if (this.hasVideo) {
        Row() {
          Button($r('app.string.playback_transform'))
            .width('100%')
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(async () => {
              await this.onAction(PlaybackMoreAction.CHOOSE_TRANSFORM);
            })
        }
        .height('44vp')
      }
      Divider().color('#E5E7EB')
      Text($r('app.string.playback_section_media'))
        .fontSize('13fp')
        .fontWeight(FontWeight.Medium)
        .fontColor('#667085')
      if (this.hasAudio) {
        Row({ space: '8vp' }) {
          Button($r('app.string.playback_audio_track'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(async () => {
              await this.onAction(PlaybackMoreAction.SELECT_AUDIO_TRACK);
            })
          if (this.hasVideo) {
            Button($r('app.string.playback_subtitle'))
              .layoutWeight(1)
              .height('30vp')
              .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
              .fontSize('10fp')
              .onClick(async () => {
                await this.onAction(PlaybackMoreAction.SELECT_SUBTITLE_FILE);
              })
          } else {
            Blank().layoutWeight(1)
          }
        }
        .height('44vp')
      }
      if (this.hasVideo && !this.hasAudio) {
        Row({ space: '8vp' }) {
          Button($r('app.string.playback_subtitle'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(async () => {
              await this.onAction(PlaybackMoreAction.SELECT_SUBTITLE_FILE);
            })
          Blank().layoutWeight(1)
        }
        .height('44vp')
      }
      if (this.hasVideo) {
        Row({ space: '8vp' }) {
          Button($r('app.string.playback_subtitle_sync'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(async () => {
              await this.onAction(PlaybackMoreAction.SELECT_SUBTITLE_DELAY);
            })
          Button($r('app.string.playback_subtitle_style'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(async () => {
              await this.onAction(PlaybackMoreAction.SELECT_SUBTITLE_STYLE);
            })
        }
        .height('44vp')
      }
      Divider().color('#E5E7EB')
      Text($r('app.string.playback_section_pipeline'))
        .fontSize('13fp')
        .fontWeight(FontWeight.Medium)
        .fontColor('#667085')
      Row({ space: '8vp' }) {
        Button($r('app.string.setting'))
          .layoutWeight(1)
          .height('30vp')
          .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
          .fontSize('10fp')
          .onClick(async () => {
            await this.onAction(PlaybackMoreAction.OPEN_PLAYER_SETTINGS);
          })
          .enabled(!this.isPlayerSettingsVisible)
      }
      .height('44vp')
      Row({ space: '8vp' }) {
        Button(this.abLoopStartUs >= 0 ? $r('app.string.playback_ab_set_start_done') :
          $r('app.string.playback_ab_set_start'))
          .layoutWeight(1)
          .height('30vp')
          .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
          .fontSize('10fp')
          .enabled(!this.buttonEnabled && !this.isStopping)
          .onClick(async () => {
            await this.onAction(PlaybackMoreAction.SET_AB_LOOP_START);
          })
        Button(this.isAbLoopEnabled ? $r('app.string.playback_ab_set_end_done') :
          $r('app.string.playback_ab_set_end'))
          .layoutWeight(1)
          .height('30vp')
          .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
          .fontSize('10fp')
          .enabled(!this.buttonEnabled && !this.isStopping && this.abLoopStartUs >= 0)
          .onClick(async () => {
            await this.onAction(PlaybackMoreAction.SET_AB_LOOP_END);
          })
        Button($r('app.string.playback_ab_clear'))
          .layoutWeight(1)
          .height('30vp')
          .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
          .fontSize('10fp')
          .enabled(this.abLoopStartUs >= 0 || this.abLoopEndUs >= 0)
          .onClick(async () => {
            await this.onAction(PlaybackMoreAction.CLEAR_AB_LOOP);
          })
      }
      .height('44vp')
      Row({ space: '8vp' }) {
        Button(this.isBackgroundPlaybackEnabled ? $r('app.string.playback_background_on') :
          $r('app.string.playback_background_off'))
          .layoutWeight(1)
          .height('30vp')
          .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
          .fontSize('10fp')
          .enabled(!this.buttonEnabled && !this.isStopping)
          .onClick(async () => {
            await this.onAction(PlaybackMoreAction.TOGGLE_BACKGROUND_PLAYBACK);
          })
        Blank().layoutWeight(1)
        Blank().layoutWeight(1)
      }
      .height('44vp')
      if (this.hasVideo) {
        Row({ space: '8vp' }) {
        Button(this.isPipActive ? $r('app.string.playback_pip_exit') : $r('app.string.playback_pip_enter'))
          .layoutWeight(1)
          .height('30vp')
          .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
          .fontSize('10fp')
          .enabled(!this.buttonEnabled && !this.isStopping)
          .onClick(async () => {
            if (this.isPipActive) {
              await this.onAction(PlaybackMoreAction.EXIT_PIP);
            } else {
              await this.onAction(PlaybackMoreAction.ENTER_PIP);
            }
          })
        if (this.isAbLoopEnabled) {
          Text(this.formatHistoryPosition(this.abLoopStartUs) + ' - ' +
            this.formatHistoryPosition(this.abLoopEndUs))
            .layoutWeight(1)
            .fontSize('12fp')
            .fontColor('#5F6368')
            .textAlign(TextAlign.Center)
        } else {
          Blank().layoutWeight(1)
        }
        Blank().layoutWeight(1)
        }
        .height('44vp')
      }
    }
    .width('100%')
    .padding({ left: '12vp', right: '12vp', top: '6vp', bottom: '6vp' })
      }
      .scrollBar(BarState.Auto)
    }
  }

