/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { RadioStatus } from '../model/RadioStatus';
import { ResultModel } from '../model/ResultModel';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = '[PanelView]';

@Component
export struct PanelView {
  @Link show: boolean;
  @Link slotId: number;
  @Link title: string;
  @State statusArray: ResultModel[] = [];
  @State radioStatus: RadioStatus = new RadioStatus();
  @State slotIdArray: number[] = [0, 1];
  @State statusFirstArray: ResultModel[] = [];
  @State statusSecondArray: ResultModel[] = [];

  pushResult(slotId: number, title: string, value: string): void {
    const result: ResultModel = new ResultModel(title, value);
    if (slotId === 0) {
      this.statusFirstArray.push(result);
    } else if (slotId === 1) {
      this.statusSecondArray.push(result);
    }
  }

  async aboutToAppear(): Promise<void> {
    this.slotIdArray.forEach((slotId: number) => {
      this.radioStatus.getRadioTech(slotId).then((radioTech: string) => {
        Logger.info(`${TAG}, aboutToAppear radioTech = ${radioTech}`);
        this.pushResult(slotId, 'RadioTech', radioTech);
      }).catch((error: BusinessError) => {
        Logger.error(`${TAG}, getRadioTech error->${JSON.stringify(error)}`);
        this.pushResult(slotId, 'RadioTech', 'not available');
      });

      this.radioStatus.getSignalInformation(slotId).then((signalInformation: string) => {
        Logger.info(`${TAG}, aboutToAppear signalInformation = ${signalInformation}`);
        this.pushResult(slotId, 'SignalInformation', signalInformation);
      }).catch((error: BusinessError) => {
        Logger.error(`${TAG}, getSignalInformation error->${JSON.stringify(error)}`);
        this.pushResult(slotId, 'SignalInformation', 'not available');
      });

      this.radioStatus.getNetworkSelectionMode(slotId).then((networkSelectionMode: string) => {
        Logger.info(`${TAG}, aboutToAppear networkSelectionMode = ${networkSelectionMode}`);
        this.pushResult(slotId, 'NetworkSelectionMode', networkSelectionMode);
      }).catch((error: BusinessError) => {
        Logger.error(`${TAG}, getNetworkSelectionMode error->${JSON.stringify(error)}`);
        this.pushResult(slotId, 'NetworkSelectionMode', 'not available');
      });

      this.radioStatus.getISOCountryCodeForNetwork(slotId).then((iSOCountryCode: string) => {
        Logger.info(`${TAG}, aboutToAppear iSOCountryCode = ${iSOCountryCode}`);
        this.pushResult(slotId, 'ISOCountryCodeForNetwork', iSOCountryCode);
      }).catch((error: BusinessError) => {
        Logger.error(`${TAG}, getISOCountryCodeForNetwork error->${JSON.stringify(error)}`);
        this.pushResult(slotId, 'ISOCountryCodeForNetwork', 'not available');
      });
    });
  }

  build() {
    Panel(this.show) {
      Column() {
        Text(this.title)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
        Divider()
        ForEach(this.slotId === 0 ? this.statusFirstArray : this.statusSecondArray, (item: ResultModel) => {
          Column() {
            Text(item.title)
              .fontSize(20)
              .fontColor(Color.Grey)
              .margin({ top: 10 })
            Text(item.value)
              .fontSize(20)
          }
        }, (item: ResultModel) => JSON.stringify(item)
        )
      }
    }
    .type(PanelType.Foldable)
    .mode(PanelMode.Half)
    .dragBar(true)
    .halfHeight(500)
    .onChange(() => {
      Logger.info(`${TAG}, onChange`);
    })
    .onClick(() => {
      this.show = false;
    })
  }
}
