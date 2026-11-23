/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import Logger from '../model/Logger';
import { InfoView } from '../common/InfoView';
import { PanelView } from '../common/PanelView';
import { RadioStatus } from '../model/RadioStatus';
import { ResultModel } from '../model/ResultModel';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = '[Index]';

@Entry
@Component
struct Index {
  @State show: boolean = false;
  @State slotId: number = 0;
  @State title: string = 'SIM1 status';
  @State networks: ResultModel[] = [];
  @State radioStatus: RadioStatus = new RadioStatus();

  aboutToAppear() {
    this.radioStatus.getNetworkState().then((networkState: string) => {
      Logger.info(`${TAG}, aboutToAppear networkState = ${JSON.stringify(networkState)}`);
      const result: ResultModel = new ResultModel('NetworkState', networkState);
      this.networks.push(result);
    });

    this.radioStatus.getRadioOn().then((radioOn: string) => {
      Logger.info(`${TAG}, aboutToAppear radioOn = ${JSON.stringify(radioOn)}`);
      const result: ResultModel = new ResultModel('IsRadioOn', radioOn.toString());
      this.networks.push(result);
    }).catch((error: BusinessError) => {
      Logger.error(`${TAG}, aboutToAppear radioOn error->${JSON.stringify(error)}`);
      const result: ResultModel = new ResultModel('IsRadioOn', `error:${JSON.stringify(error)}`);
      this.networks.push(result);
    });
  }

  build() {
    Stack() {
      Column() {
        Text($r('app.string.entry_MainAbility'))
          .width('100%')
          .height(50)
          .backgroundColor($r('app.color.radiotech_title_background'))
          .fontColor(Color.White)
          .fontSize(20)
          .padding({ left: 20 })

        Scroll() {
          Column() {
            InfoView({ show: $show, slotId: $slotId, title: $title })
            Divider().color(Color.Grey)
            ForEach(this.networks, (item: ResultModel) => {
              Column() {
                Text(item.title)
                  .width('100%')
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
                  .margin({ top: 10 })
                Text(item.value)
                  .width('100%')
                  .fontSize(20)
                  .margin({ bottom: 10 })
              }
              .margin({ left: 20, right: 20 })
            }, (item: ResultModel) => JSON.stringify(item))
          }
          .height('100%')
        }
      }

      PanelView({ show: $show, slotId: $slotId, title: $title })
    }
    .width('100%')
    .height('100%')
  }
}
