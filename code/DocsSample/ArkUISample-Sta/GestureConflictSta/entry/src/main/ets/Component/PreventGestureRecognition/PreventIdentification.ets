'use static'
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

import { Entry, Component, State, Stack, Column, Text, Flex, Slider, Color, Margin, StackOptions, FlexOptions, SliderOptions, Alignment, GestureGroup, GestureMode, PanGesture, PanDirection, LongPressGesture, TapGesture, GestureRecognizer, GestureControl, BaseGestureEvent, GestureEvent, TouchEvent, $r, SliderStyle, SliderChangeMode, ItemAlign, FlexAlign } from '@kit.ArkUI'
@Entry
@Component
struct PreventIdentification {
  @State progress: long = 496000 as long;
  @State total: long = 27490000 as long;
  @State currentWidth: string = '100%';
  @State currentHeight: string = '100%';
  private currentPosX: double = 0.0;
  private currentPosY: double = 0.0;
  private currentFullScreenState: boolean = true;
  private normalPlayTimer: int = -1;
  private isPlaying: boolean = true;
  private fastForwardTimer: int = -1;

  aboutToAppear(): void {
    this.startNormalPlayTimer();
  }

  startNormalPlayTimer(): void {
    if (this.normalPlayTimer != -1) {
      this.stopNormalPlayTimer();
    }
    this.normalPlayTimer = setInterval(() => {
      this.progress = this.progress + 1000 as long;
    }, 1000);
  }

  stopNormalPlayTimer(): void {
    if (this.normalPlayTimer == -1) {
      return;
    }
    clearInterval(this.normalPlayTimer);
    this.normalPlayTimer = -1;
  }

  startFastForwardTimer(): void {
    if (this.fastForwardTimer != -1) {
      this.stopFastForwardTimer();
    }
    this.fastForwardTimer = setInterval(() => {
      this.progress = this.progress + 100000 as long;
    }, 100);
  }

  stopFastForwardTimer(): void {
    if (this.fastForwardTimer == -1) {
      return;
    }
    clearInterval(this.fastForwardTimer);
    this.fastForwardTimer = -1;
  }

  showMessage(message: string): void {
    this.getUIContext().getPromptAction().showToast({ message: message, alignment: Alignment.Center });
  }

  toggleFullScreenState(): void {
    this.currentFullScreenState = !this.currentFullScreenState;
    if (this.currentFullScreenState) {
      this.currentWidth = '100%';
      this.currentHeight = '100%';
    } else {
      this.currentWidth = '100%';
      this.currentHeight = '50%';
    }
    this.showMessage(this.currentFullScreenState
      ? this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.Play_full_screen').id)
      : this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.Exit_play_full_screen').id));
  }

  togglePlayAndPause(): void {
    this.isPlaying = !this.isPlaying;
    if (!this.isPlaying) {
      this.stopNormalPlayTimer();
    } else {
      this.startNormalPlayTimer();
    }
    this.showMessage(this.isPlaying
      ? this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.stop_playing').id)
      : this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.Continue_playing').id));
  }

  doFastForward(start: boolean): void {
    if (!start) {
      this.stopFastForwardTimer();
      this.startNormalPlayTimer();
      this.showMessage(
        this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.Cancel_FastForwarding').id));
      return;
    }

    this.stopNormalPlayTimer();
    this.startFastForwardTimer();
    this.showMessage(
      this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.Start_FastForwarding').id));
  }

  updateBrightness(start: boolean, event: GestureEvent): void {
    let newY: double = event.fingerList[0].localY;
    if (start) {
      this.currentPosY = newY;
      this.showMessage(this.getUIContext().getHostContext()!.resourceManager
        .getStringSync($r('app.string.Start_adjusting_brightness').id));
      return;
    }
    let offsetY: double = newY - this.currentPosY;
    if (Math.abs(offsetY) > 10 as double) {
      this.showMessage((offsetY > 0.0 as double)
        ? this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.Reduce_brightness').id)
        : this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.Increase_brightness').id))
      this.currentPosY = newY;
    }
  }

  updateProgress(start: boolean, event: GestureEvent): void {
    let newX: double = event.fingerList[0].localX;
    if (start) {
      this.currentPosX = newX;
      this.showMessage(this.getUIContext().getHostContext()!.resourceManager
        .getStringSync($r('app.string.Adjust_schedule').id));
      return;
    }
    let offsetX: double = newX - this.currentPosX;
    this.progress = (this.progress + Math.floor(offsetX * 10000.0 as double) as long) as long;
    this.currentPosX = newX;
  }

  build() {
    Stack({ alignContent: Alignment.Center } as StackOptions) {
      Column() {
        Column() {
          Text(this.getUIContext().getHostContext()!.resourceManager.getStringSync($r('app.string.Playback_progress').id) + this.progress.toString())
        }
        .width('100%').height('90%')

        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween } as FlexOptions) {
          Slider({
            value: this.progress as double,
            min: 0.0 as double,
            max: this.total as double,
            style: SliderStyle.OutSet
          } as SliderOptions)
            .onChange((value: double, mode: SliderChangeMode) => {
              this.progress = value as long;
            })
            .id('progress_layer')
            // [Start disable_gesturetype]
            .onTouchTestDone((event: BaseGestureEvent | undefined, recognizers: Array<GestureRecognizer>) => {
              for (let i: int = 0; i < recognizers.length; i++) {
                let recognizer = recognizers[i];
                // 根据类型禁用所有滑动手势
                if (recognizer.getType() == GestureControl.GestureType.PAN_GESTURE) {
                  recognizer.preventBegin();
                }
              }
            })
            //  [End disable_gesturetype]
            // [Start component_disabled]
            .onTouchTestDone((event: BaseGestureEvent | undefined, recognizers: Array<GestureRecognizer>) => {
              for (let i: int = 0; i < recognizers.length; i++) {
                let recognizer = recognizers[i];
                // 禁用掉标识为myID的组件上的所有手势
                if (recognizer.getEventTargetInfo().getId() == 'myID') {
                  recognizer.preventBegin();
                }
              }
            })
            //  [End component_disabled]
            // [Start builtIn_gestureDisable]
            .onTouchTestDone((event: BaseGestureEvent | undefined, recognizers: Array<GestureRecognizer>) => {
              for (let i: int = 0; i < recognizers.length; i++) {
                let recognizer = recognizers[i];
                // 禁用掉所有系统内置的手势
                if (recognizer.isBuiltIn()) {
                  recognizer.preventBegin();
                }
              }
            })
            //  [End builtIn_gestureDisable]
            .margin({ left: 5 } as Margin)
            .trackColor(Color.Red)
            .blockColor(Color.Yellow)
            .selectedColor(Color.Orange)
            .trackThickness(2)
            .flexShrink(1)
            .flexGrow(1)
        }
        .flexGrow(1)
        .flexShrink(1)
        .id('id_progress_view')
      }
    }
    .id('video_layer')
    .backgroundColor('#E0E0E0')
    .gesture(
      GestureGroup(GestureMode.Exclusive,
        PanGesture({ direction: PanDirection.Vertical, distance: 10 })
          .tag('pan_for_brightness_control')
          .onActionStart((event: GestureEvent) => {
            this.updateBrightness(true, event);
          })
          .onActionUpdate((event: GestureEvent) => {
            this.updateBrightness(false, event);
          }),
        PanGesture({ direction: PanDirection.Horizontal, distance: 10 })
          .tag('pan_for_play_progress_control')
          .onActionStart((event: GestureEvent) => {
            this.updateProgress(true, event);
          })
          .onActionUpdate((event: GestureEvent) => {
            this.updateProgress(false, event);
          }),

        LongPressGesture()
          .tag('long_press_for_fast_forward_control')
          .onAction(() => {
            this.doFastForward(true);
          })
          .onActionEnd(() => {
            this.doFastForward(false);
          })
          .onActionCancel(() => {
            this.doFastForward(false);
          }),

        TapGesture({ count: 2 })
          .tag('double_tap_on_video')
          .onAction(() => {
            this.toggleFullScreenState();
          }),

        TapGesture()
          .tag('single_tap_on_video')
          .onAction(() => {
            this.togglePlayAndPause();
          })
      )
    )
    .width(this.currentWidth)
    .height(this.currentHeight)
  }
}
