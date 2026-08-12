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

import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Logger from '../common/Logger';

const TAG = 'UsbKeyAuth';

@Entry
@Component
struct MainPage {
  @State resultText: string = '';
  private subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
    events: ['EVENT_RESULT'],
  };

  aboutToAppear() {
    commonEventManager.createSubscriber(this.subscribeInfo, (error, data) => {
      if (error) {
        Logger.error(`createSubscriber failed: ${JSON.stringify(error)}`);
        return;
      }
      this.resultText = data.data ?? '';
    });
  }

  private publishEvent(event: string) {
    commonEventManager.publish(event, {
      code: 0,
      data: ''
    }, (err: BusinessError) => {
      if (err) {
        Logger.error(`Publish event ${event} failed: ${JSON.stringify(err)}`);
      }
    });
  }

  build() {
    Column() {
      Text('USB Key 可信持有物认证')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('绑定 USB Key')
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.publishEvent('EVENT_BIND');
        })

      Button('解绑 USB Key')
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.publishEvent('EVENT_UNBIND');
        })

      Button('查询已绑定凭据')
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.publishEvent('EVENT_QUERY');
        })

      Button('设置解锁策略')
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.publishEvent('EVENT_SET_POLICY');
        })

      Button('查询解锁策略')
        .width('80%')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.publishEvent('EVENT_GET_POLICY');
        })

      Text(`结果：${this.resultText}`)
        .fontSize(14)
        .margin({ top: 20 })
        .padding(10)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
