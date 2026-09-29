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

// [Start advertising_module_import]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { advertising } from '@kit.ConnectivityKit';
// [End advertising_module_import]
import { MAX_LOG_MESSAGES } from 'nearlink_library';
import { LogArea, NavBar, SectionCard, StatusDot } from '../components/CommonComponents';

@Component
export struct AdvertisingPage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State isAdvertising: boolean = false;
  @State advertisingId: number = -1;
  @State advertisingState: string = 'Stopped';
  @State logMessages: string[] = [];

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'aboutToAppear');
    this.subscribeAdvertisingStateChange();
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', 'aboutToDisappear');
    // Stop advertising
    if (this.isAdvertising && this.advertisingId >= 0) {
      this.stopAdvertising(this.advertisingId);
    }
    this.unsubscribeAdvertisingStateChange();
  }

  addLog(msg: string) {
    this.logMessages.unshift(`[${new Date().toLocaleTimeString()}] ${msg}`);
    if (this.logMessages.length > MAX_LOG_MESSAGES) {
      this.logMessages.pop();
    }
  }

  // Subscribe to advertising state change
  subscribeAdvertisingStateChange() {
    // [Start advertising_on_state_change]
    try {
      advertising.onAdvertisingStateChange((data: advertising.AdvertisingStateChangeInfo) => {
        hilog.info(0x0000, 'testTag',
          `Advertising state changed: id=${data.advertisingId}, state=${data.state}`);
        // [StartExclude advertising_on_state_change]
        this.advertisingState = data.state === advertising.AdvertisingState.STARTED ? 'Started' : 'Stopped';
        if (data.state === advertising.AdvertisingState.STOPPED) {
          this.isAdvertising = false;
          this.advertisingId = -1;
        }
        this.addLog(`State: ${this.advertisingState}, id=${data.advertisingId}`);
        // [EndExclude advertising_on_state_change]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End advertising_on_state_change]
  }

  // Unsubscribe from advertising state change
  unsubscribeAdvertisingStateChange() {
    // [Start advertising_off_state_change]
    try {
      advertising.offAdvertisingStateChange();
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End advertising_off_state_change]
  }

  // Build advertising parameters
  buildAdvertisingParams(): advertising.AdvertisingParams {
    // [Start advertising_build_params]
    let manufacturerData = new Uint8Array([0x01, 0x02, 0x03, 0x04]);

    let serviceValueBuffer = new Uint8Array(4);
    serviceValueBuffer[0] = 0x0A;
    serviceValueBuffer[1] = 0x0B;
    serviceValueBuffer[2] = 0x0C;
    serviceValueBuffer[3] = 0x0D;

    let setting: advertising.AdvertisingSettings = {
      interval: 160,
      power: advertising.TxPowerMode.ADV_TX_POWER_MEDIUM,
      isConnectable: true
    };

    let manufactureDataUnit: advertising.ManufacturerData = {
      manufacturerId: 0x1234,
      manufacturerData: manufacturerData.buffer
    };

    let serviceDataUnit: advertising.ServiceData = {
      serviceUuid: 'FFFFFFFF-1234-5678-ABCD-000000001254',
      serviceData: serviceValueBuffer.buffer
    };

    let advData: advertising.AdvertisingData = {
      serviceUuids: ['FFFFFFFF-1234-5678-ABCD-000000001254'],
      manufacturerData: [manufactureDataUnit],
      serviceData: [serviceDataUnit],
      includeDeviceName: true
    };

    let advertisingParams: advertising.AdvertisingParams = {
      advertisingSettings: setting,
      advertisingData: advData
    };
    // [End advertising_build_params]
    return advertisingParams;
  }

  // Start advertising
  async startAdvertising() {
    try {
      let advertisingParams = this.buildAdvertisingParams();
      // [Start advertising_start]
      try {
        let advId: number = await advertising.startAdvertising(advertisingParams);
        // [StartExclude advertising_start]
        hilog.info(0x0000, 'testTag', `Advertising id: ${advId}`);
        this.addLog(`Advertising started, id=${advId}`);
        // [EndExclude advertising_start]
      } catch (err) {
        hilog.error(0x0000, 'testTag',
          `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      }
      // [End advertising_start]
      this.isAdvertising = true;
      this.advertisingState = 'Starting...';
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.addLog(`Start failed: ${(err as BusinessError).code}`);
    }
  }

  // Stop advertising
  async stopAdvertising(advId: number) {
    // [Start advertising_stop]
    try {
      await advertising.stopAdvertising(advId);
      // [StartExclude advertising_stop]
      hilog.info(0x0000, 'testTag', `Stop advertising success`);
      this.addLog('Advertising stopped');
      // [EndExclude advertising_stop]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      // [StartExclude advertising_stop]
      this.addLog(`Stop failed: ${(err as BusinessError).code}`);
      // [EndExclude advertising_stop]
    }
    // [End advertising_stop]
  }

  build() {
    Column() {
      NavBar({
        title: $r('app.string.nav_advertising'), onBack: () => {
          this.pageInfos.pop();
        }
      })

      Scroll() {
        Column() {
          SectionCard({ title: $r('app.string.section_advertising_status'), testId: 'section_advertising_status' }) {
            Row() {
              StatusDot({ isConnected: this.isAdvertising, activeText: $r('app.string.status_advertising'), inactiveText: $r('app.string.status_stopped') })
              Blank()
              Text(this.advertisingState)
                .fontSize(14)
                .fontColor(this.isAdvertising ? $r('app.color.color_success') : $r('app.color.text_hint'))
            }
            .width('100%')
            Row() {
              Text($r('app.string.label_advertising_id'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              Text(this.advertisingId >= 0 ? this.advertisingId.toString() : '-')
                .fontSize(14)
            }
            .width('100%')
            .margin({ top: 8 })
          }

          SectionCard({}) {
            Button(this.isAdvertising ? 'Stop' : 'Start')
              .width('100%')
              .backgroundColor(this.isAdvertising ? $r('app.color.color_danger') : $r('app.color.color_success'))
              .onClick(() => {
                if (this.isAdvertising) {
                  this.stopAdvertising(this.advertisingId);
                } else {
                  this.startAdvertising();
                }
              })
          }

          LogArea({ logMessages: this.logMessages })
        }
        .width('100%')
        .padding({ top: 12, left: 16, right: 16, bottom: 24 })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
