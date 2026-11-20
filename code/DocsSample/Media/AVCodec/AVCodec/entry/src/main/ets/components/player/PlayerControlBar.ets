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

@Component
export struct PlayerControlBar {
  @Prop buttonEnabled: boolean = true;
  @Prop stopping: boolean = false;
  @Prop hasVideo: boolean = false;
  @Prop paused: boolean = false;
  @Prop fullscreen: boolean = false;
  @Prop hasSelectedFile: boolean = false;
  @Prop progressVisible: boolean = false;
  @Prop controlsVisible: boolean = true;
  @Prop autoHideControls: boolean = true;
  @Link moreVisible: boolean;
  @Link settingsVisible: boolean;
  @BuilderParam progressContent: () => void;
  @BuilderParam moreContent: () => void;
  @BuilderParam settingsContent: () => void;
  onControlInteraction: () => void = (): void => {};
  onSeekBackward: () => void = (): void => {};
  onStepFrame: (direction: number) => void = (_direction: number): void => {};
  onTogglePause: () => void = (): void => {};
  onSeekForward: () => void = (): void => {};
  onPlayOrStop: () => void = (): void => {};
  onToggleMore: () => void = (): void => {};
  onToggleFullscreen: () => void = (): void => {};
  onReplay: () => void = (): void => {};

  build() {
    Column({ space: 0 }) {
      if (this.progressVisible) {
        this.progressContent()
      }
      if (!this.buttonEnabled && !this.stopping) {
        Row({ space: '4vp' }) {
          Button($r('app.string.playback_rewind_short'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .backgroundColor('#26323D')
            .fontColor(Color.White)
            .onClick(() => {
              this.onControlInteraction();
              this.onSeekBackward();
            })
          if (this.hasVideo) {
            Button($r('app.string.playback_previous_frame_short'))
              .layoutWeight(1)
              .height('30vp')
              .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
              .padding({ left: '0vp', right: '0vp' })
              .fontSize('10fp')
              .backgroundColor('#26323D')
              .fontColor(Color.White)
              .onClick(() => {
                this.onControlInteraction();
                this.onStepFrame(-1);
              })
          }
          Button() {
            Row({ space: '4vp' }) {
              SymbolGlyph(this.paused ? $r('sys.symbol.play_fill') : $r('sys.symbol.pause_fill'))
                .fontSize('13fp')
                .fontColor([Color.White])
              Text(this.paused ? $r('app.string.playback_resume_short') :
                $r('app.string.playback_pause_short'))
                .fontSize('10fp')
                .fontColor(Color.White)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .alignItems(VerticalAlign.Center)
            .justifyContent(FlexAlign.Center)
            .width('100%')
          }
            .layoutWeight(1)
            .height('32vp')
            .responseRegion({ x: 0, y: '-6vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .backgroundColor('#0A59F7')
            .fontColor(Color.White)
            .onClick(() => {
              this.onControlInteraction();
              this.onTogglePause();
            })
          if (this.hasVideo) {
            Button($r('app.string.playback_next_frame_short'))
              .layoutWeight(1)
              .height('30vp')
              .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
              .padding({ left: '0vp', right: '0vp' })
              .fontSize('10fp')
              .backgroundColor('#26323D')
              .fontColor(Color.White)
              .onClick(() => {
                this.onControlInteraction();
                this.onStepFrame(1);
              })
          }
          Button($r('app.string.playback_forward_short'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .backgroundColor('#26323D')
            .fontColor(Color.White)
            .onClick(() => {
              this.onControlInteraction();
              this.onSeekForward();
            })
        }
        .width('100%')
        .height('44vp')
      }
      Row({ space: '6vp' }) {
        Button(this.buttonEnabled ? $r('app.string.play') :
          this.stopping ? $r('app.string.stopping') : $r('app.string.stop_playback'))
          .layoutWeight(1.4)
          .height('32vp')
          .responseRegion({ x: 0, y: '-6vp', width: '100%', height: '44vp' })
          .fontSize('10fp')
          .backgroundColor(this.buttonEnabled ? '#0A59F7' : '#26323D')
          .fontColor(Color.White)
          .enabled(this.buttonEnabled || !this.stopping)
          .onClick(() => {
            this.onControlInteraction();
            this.onPlayOrStop();
          })
        Button($r('app.string.playback_more'))
          .layoutWeight(1)
          .height('32vp')
          .responseRegion({ x: 0, y: '-6vp', width: '100%', height: '44vp' })
          .fontSize('10fp')
          .backgroundColor('#26323D')
          .fontColor(Color.White)
          .onClick(() => {
            this.onControlInteraction();
            this.onToggleMore();
          })
          .bindSheet($$this.moreVisible, this.moreContent(), {
            height: '78%',
            title: { title: $r('app.string.playback_more_title') }
          })
        if (this.hasVideo) {
          Button(this.fullscreen ? $r('app.string.playback_exit_fullscreen') :
            $r('app.string.playback_fullscreen'))
            .layoutWeight(1)
            .height('32vp')
            .responseRegion({ x: 0, y: '-6vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(() => {
              this.onControlInteraction();
              this.onToggleFullscreen();
            })
        }
      }
      .width('100%')
      .height('40vp')
      if (this.buttonEnabled && this.hasSelectedFile) {
        Row() {
          Button($r('app.string.playback_replay'))
            .width('100%')
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(() => {
              this.onControlInteraction();
              this.onReplay();
            })
        }
        .width('100%')
        .height('40vp')
      }
    }
    .width('100%')
    .padding({ left: '10vp', right: '10vp', top: '8vp', bottom: '10vp' })
    .backgroundColor('#E6101820')
    .borderRadius('18vp')
    .opacity(this.buttonEnabled || this.controlsVisible || !this.autoHideControls ? 1 : 0)
    .hitTestBehavior(this.buttonEnabled || this.controlsVisible || !this.autoHideControls ?
      HitTestMode.Default : HitTestMode.None)
    .bindSheet($$this.settingsVisible, this.settingsContent(), {
      height: '85%',
      title: {
        title: $r('app.string.player_settings_title'),
        subtitle: $r('app.string.player_settings_subtitle')
      }
    })
  }
}
