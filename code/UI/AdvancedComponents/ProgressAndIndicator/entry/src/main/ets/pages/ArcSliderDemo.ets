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

import {
  ArcSlider,
  ArcSliderLayoutOptions,
  ArcSliderOptions,
  ArcSliderPosition,
  ArcSliderStyleOptions,
  ArcSliderValueOptions
} from '@ohos.arkui.advanced.ArcSlider';
import { router } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { ProgressConstants } from '../utils/Constants';
import { ProgressUtils } from '../utils/ProgressUtils';

/** ArcSlider sample page. */
@Entry
@ComponentV2
struct ArcSliderDemo {
  @Local progress: number = ProgressConstants.ARC_INITIAL;
  @Local enlarged: boolean = false;
  @Local lastEvent: string = 'ready';
  @Local arcHeight: number = 300;
  @Local options: ArcSliderOptions = this.createOptions(ProgressConstants.ARC_INITIAL);

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('ArcSliderDemo');
    Logger.event('ArcSliderDemo', 'init', `progress=${this.progress}`);
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    Logger.leave('ArcSliderDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('ArcSliderDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('ArcSliderDemo');
  }

  private createOptions(progress: number): ArcSliderOptions {
    return new ArcSliderOptions({
      valueOptions: new ArcSliderValueOptions({
        progress: progress,
        min: ProgressConstants.MIN,
        max: ProgressConstants.MAX
      }),
      layoutOptions: new ArcSliderLayoutOptions({
        reverse: true,
        position: ArcSliderPosition.RIGHT
      }),
      styleOptions: new ArcSliderStyleOptions({
        trackThickness: 10,
        activeTrackThickness: 28,
        trackColor: '#22FFFFFF',
        selectedColor: '#FF0A59F7',
        trackBlur: 20
      }),
      onChange: (value: number) => {
        this.progress = ProgressUtils.clamp(value, ProgressConstants.MIN, ProgressConstants.MAX);
        this.lastEvent = `change=${this.progress}`;
        Logger.event('ArcSliderDemo', 'onChange', `${this.progress}`);
      },
      onTouch: (event: TouchEvent) => {
        if (event.type === TouchType.Down || event.type === TouchType.Up) {
          Logger.event('ArcSliderDemo', 'touch', `type=${event.type}`);
        }
      },
      onEnlarge: (isEnlarged: boolean) => {
        this.enlarged = isEnlarged;
        this.lastEvent = `enlarge=${isEnlarged}`;
        Logger.event('ArcSliderDemo', 'onEnlarge', `${isEnlarged}`);
      }
    });
  }

  private applyProgress(value: number): void {
    this.progress = ProgressUtils.clamp(value, ProgressConstants.MIN, ProgressConstants.MAX);
    this.options = this.createOptions(this.progress);
    this.lastEvent = `set=${this.progress}`;
    Logger.event('ArcSliderDemo', 'setProgress', `${this.progress}`);
  }

  private get percentText(): string {
    return ProgressUtils.formatPercent(this.progress);
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 12 }) {
        Row({ space: 12 }) {
          Button($r('app.string.back'))
            .id('arcBack')
            .onClick(() => {
              Logger.event('ArcSliderDemo', 'back');
              router.back();
            })
          Text($r('app.string.arc_title'))
            .id('arcTitle')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(12)

        Text($r('app.string.arc_note'))
          .fontSize(12)
          .fontColor('#666666')
          .width('100%')
          .padding({ left: 16, right: 16 })

        Column() {
          ArcSlider({ options: this.options })
            .width('100%')
            .height('100%')
        }
        .id('arcSlider')
        .width('100%')
        .height(this.arcHeight)
        .backgroundColor('#101418')
        .borderRadius(20)
        .padding(12)

        Row({ space: 8 }) {
          Button($r('app.string.decrease')).id('arcMinus').onClick(() => {
            this.applyProgress(ProgressUtils.step(this.progress, -ProgressConstants.ARC_STEP));
          })
          Button($r('app.string.increase')).id('arcPlus').onClick(() => {
            this.applyProgress(ProgressUtils.step(this.progress, ProgressConstants.ARC_STEP));
          })
          Button($r('app.string.reset')).id('arcReset').onClick(() => {
            this.applyProgress(ProgressConstants.ARC_INITIAL);
          })
          Button($r('app.string.set_high')).id('arcSetHigh').onClick(() => {
            this.applyProgress(80);
          })
        }
        .width('100%')
        .padding({ left: 12, right: 12 })

        Text(`progress=${this.progress} (${this.percentText})`)
          .id('arcProgress')
          .fontSize(15)
        Text(`event=${this.lastEvent}`)
          .id('arcEvent')
          .fontSize(12)
          .fontColor('#666666')
        Text(`enlarged=${this.enlarged}`)
          .id('arcEnlarged')
          .fontSize(12)
          .fontColor('#666666')
      }
      .width('100%')
      .padding({ bottom: 16 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .onAreaChange((oldArea: Area, newArea: Area) => {
      const heightVp = px2vp(Number(newArea.height));
      const nextHeight = heightVp < 500 ? 220 : 300;
      if (nextHeight !== this.arcHeight) {
        this.arcHeight = nextHeight;
        Logger.event('ArcSliderDemo', 'arcHeight', `${nextHeight}`);
      }
    })
  }
}
