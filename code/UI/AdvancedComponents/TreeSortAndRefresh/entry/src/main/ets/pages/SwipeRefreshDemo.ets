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

import { router } from '@kit.ArkUI';
import { SwipeRefresherV2 } from '@ohos.arkui.advanced.SwipeRefresherV2';
import Logger from '../util/Logger';
import { BreakpointUtils } from '../utils/BreakpointUtils';
import { RefreshController } from '../utils/RefreshController';
import { TreeSortUtils } from '../utils/TreeSortUtils';

/** SwipeRefresh sample page. */
@Entry
@ComponentV2
struct SwipeRefreshDemo {
  @Local widthVp: number = 0;
  @Local loading: boolean = false;
  @Local refreshCount: number = 0;
  @Local status: string = 'count=0, loading=false';
  private controller: RefreshController = new RefreshController((count: number, loading: boolean) => {
    this.refreshCount = count;
    this.loading = loading;
    this.status = TreeSortUtils.refreshStatus(count, loading);
  });

  // Initialize page state and write the entry log.
  aboutToAppear(): void {
    Logger.enter('SwipeRefreshDemo');
  }

  // Release page resources and write the exit log.
  aboutToDisappear(): void {
    this.controller.dispose();
    Logger.leave('SwipeRefreshDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageShow(): void {
    Logger.show('SwipeRefreshDemo');
  }

  // Track page visibility for lifecycle logging.
  onPageHide(): void {
    Logger.hide('SwipeRefreshDemo');
  }

  // Start the simulated operation and update the UI state.
  private startRefresh(): void {
    if (this.loading) {
      Logger.event('SwipeRefreshDemo', 'startIgnored', 'already loading');
      return;
    }
    this.controller.start();
  }

  // Stop the running operation and clear pending timers.
  private stopRefresh(): void {
    this.controller.stop();
  }

  // Compose the page layout and responsive controls.
  build() {
    Column({ space: 10 }) {
      Row({ space: 12 }) {
        Button($r('app.string.back'))
          .id('refreshBack')
          .onClick(() => {
            Logger.event('SwipeRefreshDemo', 'back');
            router.back();
          })
        Text($r('app.string.refresh_title'))
          .id('refreshPageTitle')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .padding(12)

      Row({ space: 10 }) {
        Button($r('app.string.refresh_start'))
          .id('refreshStart')
          .onClick(() => {
            this.startRefresh();
          })
        Button($r('app.string.refresh_stop'))
          .id('refreshStop')
          .onClick(() => {
            this.stopRefresh();
          })
      }

      SwipeRefresherV2({
        content: $r('app.string.refresh_loading'),
        isLoading: this.loading
      })
        .id('swipeRefresher')

      Text(this.status)
        .id('refreshStatus')
        .fontSize(14)
        .fontColor('#666666')

      List({ space: 8 }) {
        ForEach([1, 2, 3, 4, 5], (item: number) => {
          ListItem() {
            Text('Refreshed item ' + item)
              .fontSize(15)
              .width('100%')
              .padding(12)
              .backgroundColor('#F1F3F5')
              .borderRadius(10)
          }
        }, (item: number) => `${item}`)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 12, right: 12 })
    }
    .width('100%')
    .height('100%')
    .padding({
      left: BreakpointUtils.pagePadding(this.widthVp),
      right: BreakpointUtils.pagePadding(this.widthVp),
      bottom: 12
    })
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.widthVp = px2vp(Number(newArea.width));
    })
  }
}
