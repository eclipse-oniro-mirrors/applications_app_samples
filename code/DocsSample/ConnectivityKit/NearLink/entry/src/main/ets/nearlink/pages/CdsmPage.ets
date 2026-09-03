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

// [Start cdsm_module_import]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { cdsm } from '@kit.ConnectivityKit';
// [End cdsm_module_import]
import { MAX_LOG_MESSAGES, NearLinkFeature } from 'nearlink_library';
import { NavBar, DeviceItem, LogArea, SectionCard } from '../components/CommonComponents';

// [Start cdsm_declare]
let cdsmClient: cdsm.CdsmClient;
let deviceAddress: string;
// [End cdsm_declare]

@Component
export struct CdsmPage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State pairedDevices: string[] = [];
  @State selectedDevice: string = '';
  @State isClientCreated: boolean = false;
  @State cdsmInfo: cdsm.CdsmInfo | null = null;
  @State logMessages: string[] = [];

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'aboutToAppear');
    this.queryPairedDevices();
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', 'aboutToDisappear');
    this.unsubscribeCdsmInfoChange();
  }

  addLog(msg: string) {
    this.logMessages.unshift(`[${new Date().toLocaleTimeString()}] ${msg}`);
    if (this.logMessages.length > MAX_LOG_MESSAGES) {
      this.logMessages.pop();
    }
  }

  // Query paired devices
  queryPairedDevices() {
    try {
      this.pairedDevices = NearLinkFeature.getPairedDevices();
      hilog.info(0x0000, 'testTag', `Paired devices: ${JSON.stringify(this.pairedDevices)}`);
      this.addLog(`Found ${this.pairedDevices.length} paired devices`);
    } catch (err) {
      hilog.error(0x0000, 'testTag', 
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.addLog(`Query failed: ${(err as BusinessError).code}`);
    }
  }

  // Select device
  selectDevice(address: string) {
    this.selectedDevice = address;
    deviceAddress = address;
    this.addLog(`Selected: ${address}`);
  }

  // Create CDSM client
  createCdsmClient() {
    if (!deviceAddress) {
      this.addLog('No device selected');
      return;
    }

    // [Start cdsm_create_client]
    try {
      cdsmClient = cdsm.createCdsmClient(deviceAddress);
      // [StartExclude cdsm_create_client]
      this.isClientCreated = true;
      hilog.info(0x0000, 'testTag', 'Create CDSM client success');
      this.addLog('CDSM client created');
      this.subscribeCdsmInfoChange();
      // [EndExclude cdsm_create_client]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      // [StartExclude cdsm_create_client]
      this.addLog(`Create client failed: ${(err as BusinessError).code}`);
      // [EndExclude cdsm_create_client]
    }
    // [End cdsm_create_client]
  }

  // Get CDSM info
  getCdsmInfo() {
    if (!cdsmClient) {
      this.addLog('No client');
      return;
    }

    // [Start cdsm_get_info]
    try {
      let cdsmInfo: cdsm.CdsmInfo = cdsmClient.getCdsmInfo();
      // [StartExclude cdsm_get_info]
      this.cdsmInfo = cdsmInfo;
      hilog.info(0x0000, 'testTag', `CDSM info: ${JSON.stringify(cdsmInfo)}`);
      this.addLog(`Got ${cdsmInfo.members.length} members`);
      // [EndExclude cdsm_get_info]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      // [StartExclude cdsm_get_info]
      this.addLog(`Get info failed: ${(err as BusinessError).code}`);
      // [EndExclude cdsm_get_info]
    }
    // [End cdsm_get_info]
  }

  // Subscribe to CDSM info changes
  subscribeCdsmInfoChange() {
    if (!cdsmClient) {
      return;
    }

    // [Start cdsm_on_info_change]
    try {
      cdsmClient.onCdsmInfoChange((data: cdsm.CdsmInfo) => {
        hilog.info(0x0000, 'testTag', `CDSM info changed: ${JSON.stringify(data)}`);
        // [StartExclude cdsm_on_info_change]
        this.cdsmInfo = data;
        this.addLog(`Info changed: ${data.members.length} members`);
        // [EndExclude cdsm_on_info_change]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      // [StartExclude cdsm_on_info_change]
      this.addLog(`Subscribe failed: ${(err as BusinessError).code}`);
      // [EndExclude cdsm_on_info_change]
    }
    // [End cdsm_on_info_change]
  }

  // Unsubscribe from CDSM info changes
  unsubscribeCdsmInfoChange() {
    if (!cdsmClient) {
      return;
    }

    // [Start cdsm_off_info_change]
    try {
      cdsmClient.offCdsmInfoChange();
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End cdsm_off_info_change]
  }

  build() {
    Column() {
      NavBar({ title: $r('app.string.nav_cdsm'), onBack: () => { this.pageInfos.pop(); } })

      Scroll() {
        Column() {
          SectionCard({}) {
            Text($r('app.string.cdsm_description'))
              .fontSize(13)
              .fontColor($r('app.color.text_hint'))
              .width('100%')
          }

          SectionCard({ title: $r('app.string.section_paired_devices'), testId: 'section_paired_devices' }) {
            Button($r('app.string.btn_refresh_list'))
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => { this.queryPairedDevices(); })

            if (this.pairedDevices.length === 0) {
              Text($r('app.string.no_paired_devices'))
                .fontSize(14)
                .fontColor($r('app.color.text_disabled'))
                .margin({ bottom: 12 })
            } else {
              ForEach(this.pairedDevices, (device: string) => {
                DeviceItem({
                  deviceName: device,
                  address: device,
                  isSelected: this.selectedDevice === device,
                  onSelect: () => { this.selectDevice(device); }
                })
              })
            }
          }

          SectionCard({ title: $r('app.string.section_cdsm_operations'), testId: 'section_cdsm_operations' }) {
            Row() {
              Text($r('app.string.label_selected_device'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              Text(this.selectedDevice || $r('app.string.not_selected'))
                .fontSize(12)
            }
            .width('100%')
            .margin({ bottom: 12 })

            Button($r('app.string.btn_create_cdsm_client'))
              .id('btn_create_cdsm_client')
              .width('100%')
              .margin({ bottom: 8 })
              .enabled(this.selectedDevice !== '')
              .onClick(() => { this.createCdsmClient(); })

            Button($r('app.string.btn_get_set_info'))
              .width('100%')
              .enabled(this.isClientCreated)
              .onClick(() => { this.getCdsmInfo(); })
          }

          if (this.cdsmInfo) {
            SectionCard({ title: $r('app.string.section_set_members') }) {
              if (this.cdsmInfo.members.length === 0) {
                Text($r('app.string.no_members'))
                  .fontSize(14)
                  .fontColor($r('app.color.text_disabled'))
              } else {
                ForEach(this.cdsmInfo.members, (member: cdsm.CdsmMemberInfo) => {
                  Row() {
                    Text(member.address)
                      .fontSize(14)
                      .layoutWeight(1)
                    Text(member.state === cdsm.CdsmConnectionState.CONNECTED ? 'Connected' : 'Disconnected')
                      .fontSize(12)
                      .fontColor(member.state === cdsm.CdsmConnectionState.CONNECTED ? $r('app.color.color_success') : $r('app.color.text_disabled'))
                  }
                  .width('100%')
                  .padding({ top: 10, bottom: 10 })
                  .borderRadius(8)
                  .backgroundColor($r('app.color.bg_page'))
                  .margin({ bottom: 8 })
                })
              }
            }
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
