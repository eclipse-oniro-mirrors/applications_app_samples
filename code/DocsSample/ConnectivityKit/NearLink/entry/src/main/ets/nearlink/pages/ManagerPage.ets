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

// [Start manager_module_import]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { manager } from '@kit.ConnectivityKit';
// [End manager_module_import]
import { remoteDevice, nearlinkConstant } from '@kit.ConnectivityKit';
import { MAX_LOG_MESSAGES, NearLinkFeature } from 'nearlink_library';
import { LogArea, NavBar, SectionCard } from '../components/CommonComponents';

@Component
export struct ManagerPage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State nearlinkState: string = 'Unknown';
  @State isSupported: string = 'Unknown';
  @State pairedDevices: string[] = [];
  @State localName: string = '';
  @State selectedDevice: string = '';
  @State selectedPairingState: string = '';
  @State logMessages: string[] = [];

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'aboutToAppear');
    this.queryNearlinkState();
    this.queryIsNearLinkSupported();
    this.queryLocalName();
    this.queryPairedDevices();
    this.subscribeStateChange();
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', 'aboutToDisappear');
    this.unsubscribeStateChange();
    this.unsubscribePairingStateChange();
  }

  addLog(msg: string) {
    this.logMessages.unshift(`[${new Date().toLocaleTimeString()}] ${msg}`);
    if (this.logMessages.length > MAX_LOG_MESSAGES) {
      this.logMessages.pop();
    }
  }

  // Query NearLink state
  queryNearlinkState() {
    try {
      // [Start manager_getstate]
      try {
        let state: manager.NearlinkState = manager.getState();
        // [StartExclude manager_getstate]
        hilog.info(0x0000, 'testTag', `NearLink state: ${state}`);
        this.nearlinkState = this.getStateName(state);
        this.addLog(`NearLink state: ${this.nearlinkState}`);
        // [EndExclude manager_getstate]
      } catch (err) {
        hilog.error(0x0000, 'testTag',
          `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      }
      // [End manager_getstate]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.nearlinkState = `Error: ${(err as BusinessError).code}`;
    }
  }

  // Query NearLink support
  queryIsNearLinkSupported() {
    try {
      // [Start manager_issupported]
      try {
        let supported: boolean = manager.isNearLinkSupported();
        // [StartExclude manager_issupported]
        hilog.info(0x0000, 'testTag', `NearLink supported: ${supported}`);
        this.isSupported = supported ? 'Yes' : 'No';
        this.addLog(`NearLink supported: ${this.isSupported}`);
        // [EndExclude manager_issupported]
      } catch (err) {
        hilog.error(0x0000, 'testTag',
          `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      }
      // [End manager_issupported]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.isSupported = `Error: ${(err as BusinessError).code}`;
    }
  }

  // Query local device name
  queryLocalName() {
    try {
      this.localName = NearLinkFeature.getLocalName();
      hilog.info(0x0000, 'testTag', `Local name: ${this.localName}`);
      this.addLog(`Local name: ${this.localName}`);
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.localName = `Error: ${(err as BusinessError).code}`;
    }
  }

  // Query paired device list
  queryPairedDevices() {
    try {
      this.pairedDevices = NearLinkFeature.getPairedDevices();
      hilog.info(0x0000, 'testTag', `Paired devices: ${JSON.stringify(this.pairedDevices)}`);
      this.addLog(`Found ${this.pairedDevices.length} paired devices`);
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  // Select a paired device and subscribe to its pairing state changes
  selectDevice(device: string) {
    this.selectedDevice = device;
    this.selectedPairingState = '';
    hilog.info(0x0000, 'testTag', `Selected device: ${device}`);
    this.addLog(`Selected: ${device}`);
    this.subscribePairingStateChange();
    this.querySelectedPairingState();
  }

  // Subscribe to pairing state changes of the selected device
  subscribePairingStateChange() {
    try {
      remoteDevice.offPairingStateChange();
      remoteDevice.onPairingStateChange((param: remoteDevice.PairingStateParam) => {
        if (param.address !== this.selectedDevice) {
          return;
        }
        hilog.info(0x0000, 'testTag',
          `Pairing state changed, address: ${param.address}, ` +
          `preState: ${this.getPairingStateName(param.preState)}, state: ${this.getPairingStateName(param.state)}, ` +
          `reason: ${param.reason}`);
        // Query pairing state actively in the callback and print the log
        this.querySelectedPairingState();
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  // Unsubscribe from pairing state changes
  unsubscribePairingStateChange() {
    try {
      remoteDevice.offPairingStateChange();
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  // Query the pairing state of the selected device and print the log
  querySelectedPairingState() {
    try {
      let device: remoteDevice.RemoteDevice = remoteDevice.createRemoteDevice(this.selectedDevice);
      let state: remoteDevice.PairingState = device.getPairingState();
      this.selectedPairingState = this.getPairingStateName(state);
      hilog.info(0x0000, 'testTag',
        `getPairingState result: ${state} (${this.selectedPairingState})`);
      this.addLog(`Pairing state: ${this.selectedPairingState}`);
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  getPairingStateName(state: remoteDevice.PairingState): string {
    switch (state) {
      case nearlinkConstant.PairingState.PAIRING_STATE_NONE:
        return 'NONE';
      case nearlinkConstant.PairingState.PAIRING_STATE_PAIRING:
        return 'PAIRING';
      case nearlinkConstant.PairingState.PAIRING_STATE_PAIRED:
        return 'PAIRED';
      default:
        return `UNKNOWN(${state})`;
    }
  }

  // Subscribe to state changes
  subscribeStateChange() {
    // [Start manager_on_state_change]
    try {
      manager.onStateChange((state: manager.NearlinkState) => {
        hilog.info(0x0000, 'testTag', `NearLink state changed: ${state}`);
        // [StartExclude manager_on_state_change]
        this.nearlinkState = this.getStateName(state);
        // [EndExclude manager_on_state_change]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End manager_on_state_change]
  }

  // Unsubscribe from state changes
  unsubscribeStateChange() {
    // [Start manager_off_state_change]
    try {
      manager.offStateChange();
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End manager_off_state_change]
  }

  getStateName(state: manager.NearlinkState): string {
    switch (state) {
      case manager.NearlinkState.STATE_TURNING_ON:
        return 'TURNING_ON';
      case manager.NearlinkState.STATE_ON:
        return 'ON';
      case manager.NearlinkState.STATE_TURNING_OFF:
        return 'TURNING_OFF';
      case manager.NearlinkState.STATE_OFF:
        return 'OFF';
      default:
        return `UNKNOWN(${state})`;
    }
  }

  build() {
    Column() {
      NavBar({
        title: $r('app.string.nav_manager'), onBack: () => {
          this.pageInfos.pop();
        }
      })

      Scroll() {
        Column() {
          SectionCard({ title: $r('app.string.section_nearlink_status'), testId: 'section_nearlink_status' }) {
            Row() {
              Text($r('app.string.label_current_status'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              Text(this.nearlinkState)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.nearlinkState === 'ON' ? $r('app.color.color_success') : $r('app.color.color_error'))
            }
            .width('100%')

            Button($r('app.string.btn_refresh_status'))
              .id('btn_refresh_status')
              .width('100%')
              .margin({ top: 12 })
              .onClick(() => {
                this.queryNearlinkState();
              })
          }

          SectionCard({ title: $r('app.string.section_device_support'), testId: 'section_device_support' }) {
            Row() {
              Text($r('app.string.label_nearlink_supported'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              Text(this.isSupported)
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .fontColor(this.isSupported === 'Yes' ? $r('app.color.color_success') : $r('app.color.color_error'))
            }
            .width('100%')

            Button($r('app.string.btn_recheck'))
              .width('100%')
              .margin({ top: 12 })
              .onClick(() => {
                this.queryIsNearLinkSupported();
              })
          }

          SectionCard({ title: $r('app.string.section_local_info'), testId: 'section_local_info' }) {
            Row() {
              Text($r('app.string.label_device_name'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              Text(this.localName || $r('app.string.unknown_device'))
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
            }
            .width('100%')

            Button($r('app.string.btn_refresh_info'))
              .width('100%')
              .margin({ top: 12 })
              .onClick(() => {
                this.queryLocalName();
              })
          }

          SectionCard({ title: $r('app.string.section_paired_devices') }) {
            if (this.pairedDevices.length === 0) {
              Text($r('app.string.no_paired_devices'))
                .fontSize(14)
                .fontColor($r('app.color.text_disabled'))
                .margin({ bottom: 12 })
            } else {
              ForEach(this.pairedDevices, (device: string) => {
                Row() {
                  Text(device)
                    .fontSize(14)
                    .layoutWeight(1)
                  if (device === this.selectedDevice) {
                    Text($r('app.string.label_selected'))
                      .fontSize(12)
                      .fontColor($r('app.color.color_primary'))
                  }
                }
                .width('100%')
                .padding({ top: 8, bottom: 8 })
                .borderRadius(8)
                .backgroundColor(device === this.selectedDevice ?
                  $r('app.color.bg_light_blue') : $r('app.color.bg_page'))
                .margin({ bottom: 8 })
                .onClick(() => {
                  this.selectDevice(device);
                })
              })
            }
            if (this.selectedDevice !== '') {
              Row() {
                Text($r('app.string.label_selected_device'))
                  .fontSize(14)
                  .fontColor($r('app.color.text_hint'))
                  .layoutWeight(1)
                Text(this.selectedDevice)
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
              }
              .width('100%')
              .margin({ top: 4, bottom: 4 })

              Row() {
                Text($r('app.string.label_pairing_state'))
                  .fontSize(14)
                  .fontColor($r('app.color.text_hint'))
                  .layoutWeight(1)
                Text(this.selectedPairingState || $r('app.string.unknown_device'))
                  .fontSize(14)
                  .fontWeight(FontWeight.Medium)
              }
              .width('100%')
              .margin({ bottom: 8 })
            }
            Button($r('app.string.btn_refresh_list'))
              .width('100%')
              .onClick(() => {
                this.queryPairedDevices();
              })
          }

          LogArea({ logMessages: this.logMessages })
        }
        .width('100%')
        .padding({
          top: 12,
          left: 16,
          right: 16,
          bottom: 24
        })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
