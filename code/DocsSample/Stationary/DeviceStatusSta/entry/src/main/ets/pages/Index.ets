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

import {
  Column,
  Text,
  Button,
  FontWeight,
  Entry,
  Component,
  State,
  $r,
} from '@kit.ArkUI';
import { BusinessError, Callback } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
// [Start import_the_device_status_module]
import { deviceStatus } from '@kit.MultimodalAwarenessKit';
// [End import_the_device_status_module]

const DOMAIN = 0xF811;
const TAG = '[Sample_DeviceStatus]';

@Entry
@Component
struct Index {
  @State message: string = 'deviceStatus';
  private isSubscribed: boolean = false;
  private readonly dropDetectCallback: Callback<deviceStatus.DropDetectionStatus> =
    (data: deviceStatus.DropDetectionStatus): void => {
      let status: number = -1;
      switch (data) {
        case deviceStatus.DropDetectionStatus.STATUS_NORMAL:
          status = 0;
          break;
        case deviceStatus.DropDetectionStatus.STATUS_DROPPED:
          status = 1;
          break;
        default:
          hilog.warn(DOMAIN, TAG, 'Unknown drop detection status');
          return;
      }
      hilog.info(DOMAIN, TAG, 'Drop detection event received, status: %{public}d', status);
    };

  private subscribeDropDetect(): void {
    if (this.isSubscribed) {
      this.message = 'dropDetect already subscribed';
      hilog.info(DOMAIN, TAG, 'Drop detection is already subscribed');
      return;
    }
    // [Start drop_detect_subscribe]
    try {
      deviceStatus.onDropDetect(this.dropDetectCallback);
      // [StartExclude drop_detect_subscribe]
      this.isSubscribed = true;
      this.message = 'dropDetect subscribe';
      hilog.info(DOMAIN, TAG, 'Drop detection subscribed');
      // [EndExclude drop_detect_subscribe]
    } catch (err: BusinessError<void>) {
      hilog.error(DOMAIN, TAG, 'Drop detection subscribe failed, code: %{public}d, message: %{public}s',
        err.code, err.message);
      // [StartExclude drop_detect_subscribe]
      this.message = `dropDetect subscribe failed, code: ${err.code}, message: ${err.message}`;
      // [EndExclude drop_detect_subscribe]
    }
    // [End drop_detect_subscribe]
  }

  private unsubscribeAllDropDetect(): void {
    if (!this.isSubscribed) {
      this.message = 'dropDetect unsubscribeAll';
      hilog.info(DOMAIN, TAG, 'No active drop detection subscriptions');
      return;
    }
    // [Start drop_detect_unsubscribe_all]
    try {
      deviceStatus.offDropDetect();
      // [StartExclude drop_detect_unsubscribe_all]
      this.isSubscribed = false;
      this.message = 'dropDetect unsubscribeAll';
      hilog.info(DOMAIN, TAG, 'All drop detection subscriptions cancelled');
      // [EndExclude drop_detect_unsubscribe_all]
    } catch (err: BusinessError<void>) {
      hilog.error(DOMAIN, TAG, 'Cancel all drop detection subscriptions failed, code: %{public}d, message: %{public}s',
        err.code, err.message);
      // [StartExclude drop_detect_unsubscribe_all]
      this.message = `dropDetect unsubscribeAll failed, code: ${err.code}, message: ${err.message}`;
      // [EndExclude drop_detect_unsubscribe_all]
    }
    // [End drop_detect_unsubscribe_all]
  }

  private unsubscribeDropDetect(): void {
    if (!this.isSubscribed) {
      this.message = 'dropDetect unsubscribe failed: no active subscription';
      hilog.warn(DOMAIN, TAG, 'No active drop detection subscription to cancel');
      return;
    }
    // [Start drop_detect_unsubscribe]
    // Cancel the same callback that was registered by subscribeDropDetect.
    try {
      deviceStatus.offDropDetect(this.dropDetectCallback);
      // [StartExclude drop_detect_unsubscribe]
      this.isSubscribed = false;
      this.message = 'dropDetect unsubscribe';
      hilog.info(DOMAIN, TAG, 'Drop detection callback cancelled');
      // [EndExclude drop_detect_unsubscribe]
    } catch (err: BusinessError<void>) {
      hilog.error(DOMAIN, TAG, 'Cancel drop detection callback failed, code: %{public}d, message: %{public}s',
        err.code, err.message);
      // [StartExclude drop_detect_unsubscribe]
      this.message = `dropDetect unsubscribe failed, code: ${err.code}, message: ${err.message}`;
      // [EndExclude drop_detect_unsubscribe]
    }
    // [End drop_detect_unsubscribe]
  }

  build() {
    Column(undefined) {
      Text(this.message)
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .height('20%')
        .id('show')
      Button($r('app.string.subscribeDrop'))
        .margin(10)
        .id('button4')
        .width('30%')
        .onClick(() => this.subscribeDropDetect())
      Button($r('app.string.unSubscribeDropAll'))
        .margin(10)
        .id('button5')
        .width('30%')
        .onClick(() => this.unsubscribeAllDropDetect())
      Button($r('app.string.unSubscribeDrop'))
        .margin(10)
        .id('button6')
        .width('30%')
        .onClick(() => this.unsubscribeDropDetect())
    }
    .height('100%')
    .width('100%')
  }
}
