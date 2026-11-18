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
import { MusicController } from '../../common/utils/mediautils/MusicController';
import { NavigationController } from '../../common/utils/mediautils/NavigationController';
import { MixSessionController } from '../../common/utils/mediautils/MixSessionController';
import Logger from '../../common/utils/Logger';
import { AudioState } from '../../common/constants/AudioConstants';
import { TOAST_DURATION_MS } from '../../common/constants/CommonConstants';
import {
  PAGE_TOP_MARGIN, SECTION_MARGIN_BOTTOM, INNER_MARGIN_8,
  SMALL_MARGIN_TOP, STEP_TITLE_MARGIN_BOTTOM, STEP_SECTION_MARGIN_TOP,
  CARD_INFO_MARGIN_BOTTOM,
  PAGE_SUBTITLE_FONT_SIZE, DESC_FONT_SIZE, SECTION_TITLE_FONT_SIZE,
  HINT_FONT_SIZE, BODY_FONT_SIZE, SMALL_BUTTON_FONT_SIZE,
  SMALL_BUTTON_WIDTH, BUTTON_HEIGHT, SMALL_BUTTON_BORDER_RADIUS,
  NAV_BUTTON_WIDTH,
  CARD_PADDING, CARD_BORDER_RADIUS, CARD_CONTENT_WIDTH,
  COLOR_TEXT_SECONDARY, COLOR_PAUSE, COLOR_PLAY, COLOR_STOP,
  COLOR_NAV, COLOR_NAV_STOP, COLOR_CARD_BG, COLOR_DIVIDER,
  COLOR_MIX_BG, COLOR_TEXT_HINT
} from '../../common/constants/UiConstants';
import { PromptAction } from '@kit.ArkUI';

const TAG = 'MixSessionPage';

@Entry
@Component
struct MixSessionPage {
  @State isPlaying: boolean = false;
  @State isDucked: boolean = false;
  @State isNavigating: boolean = false;
  @State musicInitialized: boolean = false;
  @State navInitialized: boolean = false;
  @State mixEnabled: boolean = false;
  @State promptAction: PromptAction = this.getUIContext().getPromptAction();

  private static readonly STATE_TO_MESSAGE_MAP: Map<number, Resource> = new Map([
    [AudioState.RUNNING, $r('app.string.state_resume_playing')],
    [AudioState.PAUSED, $r('app.string.state_paused')],
    [AudioState.STOPPED, $r('app.string.state_stopped')],
    [AudioState.DUCKED, $r('app.string.state_ducked')],
    [AudioState.UNDUCKED, $r('app.string.state_volume_restored')],
  ]);

  aboutToAppear() {
    this.registerMusicUICallback();
    this.registerNavUICallback();
  }

  aboutToDisappear() {
    if (this.musicInitialized) {
      MusicController.getInstance().stop();
      MusicController.getInstance().release();
      this.musicInitialized = false;
    }
    if (this.navInitialized) {
      NavigationController.getInstance().stop();
      NavigationController.getInstance().release();
      this.navInitialized = false;
    }
  }

  registerMusicUICallback() {
    MusicController.getInstance().onStateChange((state: number, isInterrupt: boolean) => {
      switch (state) {
        case AudioState.RUNNING:
          this.isPlaying = true;
          this.isDucked = false;
          break;
        case AudioState.PAUSED:
          this.isPlaying = false;
          this.isDucked = false;
          break;
        case AudioState.STOPPED:
          this.isPlaying = false;
          this.isDucked = false;
          if (isInterrupt) {
            MusicController.getInstance().release();
            this.musicInitialized = false;
          }
          break;
        case AudioState.DUCKED:
          this.isPlaying = true;
          this.isDucked = true;
          break;
        case AudioState.UNDUCKED:
          this.isDucked = false;
          break;
      }
      if (isInterrupt) {
        this.showToast(state);
      }
    });
  }

  registerNavUICallback() {
    NavigationController.getInstance().onStateChange((state: number, isInterrupt: boolean) => {
      switch (state) {
        case AudioState.RUNNING:
          this.isNavigating = true;
          break;
        case AudioState.PAUSED:
          this.isNavigating = false;
          break;
        case AudioState.STOPPED:
          this.isNavigating = false;
          break;
      }
    });
  }

  showToast(state: number) {
    const message = MixSessionPage.STATE_TO_MESSAGE_MAP.get(state);
    if (message) {
      this.promptAction.showToast({ message: message, duration: TOAST_DURATION_MS });
    }
  }

  build() {
    Column() {
      Text($r('app.string.scheme_three_concurrency_mix'))
        .fontSize(PAGE_SUBTITLE_FONT_SIZE)
        .fontWeight(FontWeight.Bold)
        .margin({ top: PAGE_TOP_MARGIN })

      Text($r('app.string.mix_session_page_desc'))
        .fontSize(DESC_FONT_SIZE)
        .fontColor(COLOR_TEXT_SECONDARY)
        .margin({ bottom: SECTION_MARGIN_BOTTOM })

      Column() {
        Row() {
          Text($r('app.string.mix_mode_toggle_label'))
            .fontSize(BODY_FONT_SIZE)
            .fontWeight(FontWeight.Medium)
          Blank()
          Toggle({ type: ToggleType.Switch, isOn: this.mixEnabled })
            .selectedColor(COLOR_PLAY)
            .onChange(async (isOn: boolean) => {
              this.mixEnabled = isOn;
              if (isOn) {
                await MixSessionController.getInstance().enableMixMode();
              } else {
                await MixSessionController.getInstance().disableMixMode();
              }
            })
        }
        .width('100%')
        if (this.mixEnabled) {
          Text($r('app.string.mix_mode_enabled_desc'))
            .fontSize(HINT_FONT_SIZE)
            .fontColor(COLOR_PLAY)
            .margin({ top: SMALL_MARGIN_TOP })
        } else {
          Text($r('app.string.mix_mode_disabled_desc'))
            .fontSize(HINT_FONT_SIZE)
            .fontColor(COLOR_TEXT_HINT)
            .margin({ top: SMALL_MARGIN_TOP })
        }
      }
      .width(CARD_CONTENT_WIDTH)
      .padding(CARD_PADDING)
      .backgroundColor(COLOR_MIX_BG)
      .borderRadius(CARD_BORDER_RADIUS)
      .margin({ bottom: CARD_INFO_MARGIN_BOTTOM })

      Column() {
        Row() {
          Text($r('app.string.music_player_label'))
            .fontSize(SECTION_TITLE_FONT_SIZE)
            .fontWeight(FontWeight.Medium)
          Blank()
          if (this.isDucked) {
            Text($r('app.string.duck_badge'))
              .fontSize(HINT_FONT_SIZE)
              .fontColor(COLOR_PAUSE)
          }
          if (this.mixEnabled && this.isNavigating) {
            Text($r('app.string.mix_badge'))
              .fontSize(HINT_FONT_SIZE)
              .fontColor(COLOR_PLAY)
          }
        }
        .width('100%')
        Text(this.isPlaying ? (this.isDucked ? $r('app.string.playing_volume_lowered') : $r('app.string.playing_now')) : $r('app.string.stopped'))
          .fontSize(BODY_FONT_SIZE)
          .margin({ top: INNER_MARGIN_8, bottom: INNER_MARGIN_8 })
        Row() {
          Button($r('app.string.play_music'))
            .width(SMALL_BUTTON_WIDTH)
            .height(BUTTON_HEIGHT)
            .fontSize(SMALL_BUTTON_FONT_SIZE)
            .backgroundColor(COLOR_PLAY)
            .borderRadius(SMALL_BUTTON_BORDER_RADIUS)
            .enabled(!this.isPlaying)
            .onClick(async () => {
              if (!this.musicInitialized) {
                await MusicController.getInstance().init();
                this.musicInitialized = true;
              }
              await MusicController.getInstance().start();
            })
          Button($r('app.string.stop_music'))
            .width(SMALL_BUTTON_WIDTH)
            .height(BUTTON_HEIGHT)
            .fontSize(SMALL_BUTTON_FONT_SIZE)
            .backgroundColor(COLOR_STOP)
            .borderRadius(SMALL_BUTTON_BORDER_RADIUS)
            .enabled(this.isPlaying)
            .onClick(async () => {
              await MusicController.getInstance().stop();
              await MusicController.getInstance().release();
              this.musicInitialized = false;
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ top: INNER_MARGIN_8 })
      }
      .width(CARD_CONTENT_WIDTH)
      .padding(CARD_PADDING)
      .backgroundColor(COLOR_CARD_BG)
      .borderRadius(CARD_BORDER_RADIUS)
      .margin({ bottom: SECTION_MARGIN_BOTTOM })

      Divider()
        .width(CARD_CONTENT_WIDTH)
        .color(COLOR_DIVIDER)
        .margin({ bottom: SECTION_MARGIN_BOTTOM })

      Column() {
        Row() {
          Text($r('app.string.navigation_player_label'))
            .fontSize(SECTION_TITLE_FONT_SIZE)
            .fontWeight(FontWeight.Medium)
          Blank()
          if (this.isNavigating) {
            Text($r('app.string.broadcasting_badge'))
              .fontSize(HINT_FONT_SIZE)
              .fontColor(COLOR_PLAY)
          }
        }
        .width('100%')
        Text(this.isNavigating ? $r('app.string.navigating_broadcasting') : $r('app.string.navigation_not_started'))
          .fontSize(BODY_FONT_SIZE)
          .margin({ top: INNER_MARGIN_8, bottom: INNER_MARGIN_8 })
        Row() {
          Button($r('app.string.start_navigation'))
            .width(NAV_BUTTON_WIDTH)
            .height(BUTTON_HEIGHT)
            .fontSize(SMALL_BUTTON_FONT_SIZE)
            .backgroundColor(COLOR_NAV)
            .borderRadius(SMALL_BUTTON_BORDER_RADIUS)
            .enabled(!this.isNavigating)
            .onClick(async () => {
              if (!this.navInitialized) {
                await NavigationController.getInstance().init(false);
                this.navInitialized = true;
              }
              await NavigationController.getInstance().start();
            })
          Button($r('app.string.stop_navigation'))
            .width(NAV_BUTTON_WIDTH)
            .height(BUTTON_HEIGHT)
            .fontSize(SMALL_BUTTON_FONT_SIZE)
            .backgroundColor(COLOR_NAV_STOP)
            .borderRadius(SMALL_BUTTON_BORDER_RADIUS)
            .enabled(this.isNavigating)
            .onClick(async () => {
              await NavigationController.getInstance().stop();
              await NavigationController.getInstance().release();
              this.navInitialized = false;
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ top: INNER_MARGIN_8 })
      }
      .width(CARD_CONTENT_WIDTH)
      .padding(CARD_PADDING)
      .backgroundColor(COLOR_CARD_BG)
      .borderRadius(CARD_BORDER_RADIUS)

      Column() {
        Text($r('app.string.test_steps_title'))
          .fontSize(DESC_FONT_SIZE)
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: STEP_TITLE_MARGIN_BOTTOM })
        Text($r('app.string.mix_step_1'))
          .fontSize(HINT_FONT_SIZE)
          .fontColor(COLOR_TEXT_SECONDARY)
        Text($r('app.string.mix_step_2'))
          .fontSize(HINT_FONT_SIZE)
          .fontColor(COLOR_TEXT_SECONDARY)
        Text($r('app.string.mix_step_3'))
          .fontSize(HINT_FONT_SIZE)
          .fontColor(COLOR_TEXT_SECONDARY)
      }
      .width(CARD_CONTENT_WIDTH)
      .padding(CARD_PADDING)
      .backgroundColor(COLOR_MIX_BG)
      .borderRadius(CARD_BORDER_RADIUS)
      .margin({ top: STEP_SECTION_MARGIN_TOP })
    }
    .width('100%')
    .height('100%')
  }
}
