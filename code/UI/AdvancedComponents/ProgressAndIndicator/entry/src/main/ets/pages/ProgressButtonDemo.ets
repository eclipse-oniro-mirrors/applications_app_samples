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
  @State operationCount: number = 0;
  @State history: string[] = [];
  private controller: DownloadController = new DownloadController((progress: number, completed: boolean) => {
    this.progress = progress;
    this.lastEvent = completed ? 'completed' : 'tick';
    if (completed) {
      this.canClick = true;
      this.record('completed');
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
    this.record('reset');
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
    this.record('start');
    Logger.event('ProgressButtonDemo', 'start');
  }

  private record(action: string): void {
    this.operationCount++;
    this.history = [`#${this.operationCount} ${action} · ${this.progress}%`, ...this.history].slice(0, 3);
    Logger.event('ProgressButtonDemo', 'history', action);
  }

  @Builder
  statCard(label: string, kind: string, id: string) {
    Column({ space: 2 }) {
      Text(label)
        .fontSize(11)
        .fontColor('#666666')
      Text(kind === 'progress' ? `${this.progress}%` :
        kind === 'state' ? ProgressUtils.state(this.progress) : `${this.operationCount}`)
        .id(id)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#0A59F7')
    }
    .layoutWeight(1)
    .height(54)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F1F3F5')
    .borderRadius(10)
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
        .padding({ left: 12, right: 12, top: 12, bottom: 6 })

        Row({ space: 8 }) {
          this.statCard('Progress', 'progress', 'pbProgressCard')
          this.statCard('State', 'state', 'pbStateCard')
          this.statCard('Actions', 'actions', 'pbActionCount')
        }
        .width('100%')
        .padding({ left: 12, right: 12, bottom: 8 })

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
              this.record(this.canClick ? 'enabled' : 'disabled');
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

        Column({ space: 2 }) {
          Row() {
            Text('Recent actions')
              .fontSize(11)
              .fontColor('#666666')
            Blank()
            Button('Clear')
              .id('pbClearHistory')
              .fontSize(10)
              .height(22)
              .onClick(() => {
                this.history = [];
                this.operationCount = 0;
              })
          }
          .width('100%')
          if (this.history.length === 0) {
            Text('No actions yet')
              .fontSize(11)
              .fontColor('#999999')
              .width('100%')
          } else {
            ForEach(this.history, (item: string) => {
              Text(item)
                .fontSize(11)
                .fontColor('#666666')
                .maxLines(1)
                .width('100%')
            }, (item: string) => item)
          }
        }
        .id('pbHistory')
        .width('100%')
        .height(88)
        .padding(8)
        .backgroundColor('#F7F8FA')
        .borderRadius(10)
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
