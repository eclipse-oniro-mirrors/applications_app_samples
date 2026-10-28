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

import { LengthMetrics, router } from '@kit.ArkUI';
import { ProgressButton } from '@ohos.arkui.advanced.ProgressButton';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { ProgressConstants } from '../utils/Constants';
import { DownloadController } from '../utils/DownloadController';
import { ProgressUtils } from '../utils/ProgressUtils';

/** ProgressButton sample page. */
@Entry
@Component
struct ProgressButtonDemo {
  @State widthVp: number = 0;
  @State progress: number = 0;
  @State canClick: boolean = true;
  @State lastEvent: string = 'ready';
  private controller: DownloadController = new DownloadController((progress: number, completed: boolean) => {
    this.progress = progress;
    this.lastEvent = completed ? 'completed' : 'tick';
    if (completed) {
      this.canClick = true;
    }
  });

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('ProgressButtonDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    this.controller.stop();
    Logger.leave('ProgressButtonDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('ProgressButtonDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('ProgressButtonDemo');
  }

  // Restore the demo state to its initial value.
  private resetDownload(): void {
    this.controller.reset();
    this.canClick = true;
    this.lastEvent = 'reset';
    Logger.event('ProgressButtonDemo', 'reset');
  }

  // Start the simulated operation and update the UI state.
  private startDownload(): void {
    if (!this.canClick) {
      Logger.event('ProgressButtonDemo', 'startIgnored', 'disabled');
      return;
    }
    this.canClick = false;
    this.lastEvent = 'start';
    this.controller.start();
    Logger.event('ProgressButtonDemo', 'start');
  }

  // Compose the page layout and responsive controls.
  build() {
    Scroll() {
      Column({ space: 14 }) {
        Row({ space: 12 }) {
          Button($r('app.string.back'))
            .id('pbBack')
            .onClick(() => {
              Logger.event('ProgressButtonDemo', 'back');
              router.back();
            })
          Text($r('app.string.pb_title'))
            .id('pbTitle')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(12)

        ProgressButton({
          progress: this.progress,
          content: $r('app.string.download'),
          progressButtonWidth: 220,
          clickCallback: () => {
            this.startDownload();
          },
          enable: this.canClick,
          colorOptions: {
            progressColor: '#0A59F7',
            borderColor: '#0A59F7',
            textColor: '#FFFFFF',
            backgroundColor: '#0A59F7'
          },
          progressButtonRadius: LengthMetrics.vp(20)
        })
          .id('progressButton')
          .margin({ top: 8 })

        Row({ space: 10 }) {
          Button($r('app.string.start_download')).id('pbStart').onClick(() => {
            this.startDownload();
          })
          Button($r('app.string.reset')).id('pbReset').onClick(() => {
            this.resetDownload();
          })
          Button(this.canClick ? $r('app.string.disable') : $r('app.string.enable'))
            .id('pbToggle')
            .onClick(() => {
              if (this.canClick && this.controller.isRunning()) {
                this.controller.stop();
              }
              this.canClick = !this.canClick;
              Logger.event('ProgressButtonDemo', 'enabled', `${this.canClick}`);
            })
        }
        .width('100%')
        .padding({ left: 12, right: 12 })

        Text(`progress=${this.progress} (${ProgressUtils.formatPercent(this.progress)})`)
          .id('pbProgress')
          .fontSize(15)
        Text(ProgressUtils.formatState(this.progress))
          .id('pbState')
          .fontSize(13)
          .fontColor('#666666')
        Text(`enabled=${this.canClick}`)
          .id('pbEnabled')
          .fontSize(12)
          .fontColor('#666666')
        Text(`event=${this.lastEvent}`)
          .id('pbEvent')
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
