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

import { ColorMetrics, LengthMetrics, router } from '@kit.ArkUI';
import { ProgressButtonV2, ProgressButtonV2Color } from '@ohos.arkui.advanced.ProgressButtonV2';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { ProgressConstants } from '../utils/Constants';
import { DownloadController } from '../utils/DownloadController';
import { ProgressUtils } from '../utils/ProgressUtils';

/** ProgressButtonV2 sample page. */
@Entry
@ComponentV2
struct ProgressButtonV2Demo {
  @Local widthVp: number = 0;
  @Local progress: number = 0;
  @Local canClick: boolean = true;
  @Local lastEvent: string = 'ready';
  private controller: DownloadController = new DownloadController((progress: number, completed: boolean) => {
    this.progress = progress;
    this.lastEvent = completed ? 'completed' : 'tick';
    if (completed) {
      this.canClick = true;
    }
  });
  private colorOptions: ProgressButtonV2Color = new ProgressButtonV2Color({
    progressColor: ColorMetrics.rgba(10, 89, 247, 1),
    borderColor: ColorMetrics.rgba(10, 89, 247, 1),
    textColor: ColorMetrics.rgba(255, 255, 255, 1),
    backgroundColor: ColorMetrics.rgba(10, 89, 247, 1)
  });

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('ProgressButtonV2Demo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    this.controller.stop();
    Logger.leave('ProgressButtonV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('ProgressButtonV2Demo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('ProgressButtonV2Demo');
  }

  // Restore the demo state to its initial value.
  private resetDownload(): void {
    this.controller.reset();
    this.canClick = true;
    this.lastEvent = 'reset';
    Logger.event('ProgressButtonV2Demo', 'reset');
  }

  // Start the simulated operation and update the UI state.
  private startDownload(): void {
    if (!this.canClick) {
      Logger.event('ProgressButtonV2Demo', 'startIgnored', 'disabled');
      return;
    }
    this.canClick = false;
    this.lastEvent = 'start';
    this.controller.start();
    Logger.event('ProgressButtonV2Demo', 'start');
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 14 }) {
        Row({ space: 12 }) {
          Button($r('app.string.back'))
            .id('pbv2Back')
            .onClick(() => {
              Logger.event('ProgressButtonV2Demo', 'back');
              router.back();
            })
          Text($r('app.string.pbv2_title'))
            .id('pbv2Title')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(12)

        ProgressButtonV2({
          progress: this.progress,
          content: $r('app.string.download'),
          progressButtonWidth: LengthMetrics.vp(220),
          onClicked: () => {
            this.startDownload();
          },
          isEnabled: this.canClick,
          colorOptions: this.colorOptions,
          progressButtonRadius: LengthMetrics.vp(20)
        })
          .id('progressButtonV2')
          .margin({ top: 8 })

        Row({ space: 10 }) {
          Button($r('app.string.start_download')).id('pbv2Start').onClick(() => {
            this.startDownload();
          })
          Button($r('app.string.reset')).id('pbv2Reset').onClick(() => {
            this.resetDownload();
          })
          Button(this.canClick ? $r('app.string.disable') : $r('app.string.enable'))
            .id('pbv2Toggle')
            .onClick(() => {
              if (this.canClick && this.controller.isRunning()) {
                this.controller.stop();
              }
              this.canClick = !this.canClick;
              Logger.event('ProgressButtonV2Demo', 'enabled', `${this.canClick}`);
            })
        }
        .width('100%')
        .padding({ left: 12, right: 12 })

        Text(`progress=${this.progress} (${ProgressUtils.formatPercent(this.progress)})`)
          .id('pbv2Progress')
          .fontSize(15)
        Text(ProgressUtils.formatState(this.progress))
          .id('pbv2State')
          .fontSize(13)
          .fontColor('#666666')
        Text(`enabled=${this.canClick}`)
          .id('pbv2Enabled')
          .fontSize(12)
          .fontColor('#666666')
        Text(`event=${this.lastEvent}`)
          .id('pbv2Event')
          .fontSize(12)
          .fontColor('#666666')
      }
      .width('100%')
      .padding({ bottom: 16 })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
    .align(Alignment.Top)
    .constraintSize({ maxWidth: BreakpointUtils.contentMaxWidth(this.widthVp) })
    .alignSelf(ItemAlign.Center)
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
    })
  }
}
