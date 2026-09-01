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

// [Start ssap_server_module_import]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { ssap } from '@kit.ConnectivityKit';
// [End ssap_server_module_import]
import { advertising } from '@kit.ConnectivityKit';
import { MAX_LOG_MESSAGES, SSAP_MANUFACTURER_ID, CONNECTION_STATE_CONNECTED, NearLinkFeature } from 'nearlink_library';
import { NavBar, StatusDot, LogArea, SectionCard } from '../components/CommonComponents';

// [Start ssap_server_declare]
let server: ssap.Server;
let propertyValue1: number;
let propertyValue2: number;
// [End ssap_server_declare]

@Component
export struct SsapServerPage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State isConnected: boolean = false;
  @State connectedAddress: string = '';
  @State isAdvertising: boolean = false;
  @State advertisingId: number = -1;
  @State advertisingState: string = 'Stopped';
  @State logMessages: string[] = [];

  readonly SSAP_MFR_ID: number = SSAP_MANUFACTURER_ID;
  readonly SSAP_MANUFACTURER_DATA: number[] = [0x53, 0x53, 0x41, 0x50];

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'aboutToAppear');
    this.createServer();
    this.subscribeAdvertisingStateChange();
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', 'aboutToDisappear');
    if (this.isAdvertising) {
      this.stopAdvertising();
    }
    this.unsubscribeAdvertisingStateChange();
    this.closeServer();
  }

  addLog(msg: string) {
    this.logMessages.unshift(`[${new Date().toLocaleTimeString()}] ${msg}`);
    if (this.logMessages.length > MAX_LOG_MESSAGES) {
      this.logMessages.pop();
    }
  }

  // Create server instance
  createServer() {
    try {
      // [Start ssap_server_create]
      try {
        server = ssap.createServer();
      } catch (err) {
        hilog.error(0x0000, 'testTag',
          `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      }
      // [End ssap_server_create]
      this.addService();
      // Subscribe to events
      this.subscribeEvents();
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.addLog(`Create server failed: ${(err as BusinessError).code}`);
    }
  }

  // Add service
  addService() {
    // [Start ssap_server_add_service]
    try {
      let property1: ssap.Property = {
        serviceUuid: 'FFFFFFFF-1234-5678-ABCD-000000001234',
        propertyUuid: 'FFFFFFFF-1234-5678-ABCD-000000001235',
        value: new ArrayBuffer(1),
        operation: ssap.Operation.READABLE | ssap.Operation.WRITE_NO_RESPONSE | ssap.Operation.NOTIFY,
        descriptors: [{
          serviceUuid: 'FFFFFFFF-1234-5678-ABCD-000000001234',
          propertyUuid: 'FFFFFFFF-1234-5678-ABCD-000000001235',
          value: new ArrayBuffer(2),
          descriptorType: ssap.PropertyDescriptorType.CLIENT_PROPERTY_CONFIG,
          isWriteable: true
        }]
      };

      let property2: ssap.Property = {
        serviceUuid: 'FFFFFFFF-1234-5678-ABCD-000000001234',
        propertyUuid: 'FFFFFFFF-1234-5678-ABCD-000000001236',
        value: new ArrayBuffer(1),
        operation: ssap.Operation.READABLE | ssap.Operation.WRITE_WITH_RESPONSE
      };

      let service: ssap.Service = {
        serviceUuid: 'FFFFFFFF-1234-5678-ABCD-000000001234',
        properties: [property1, property2]
      };

      server.addService(service);
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_server_add_service]
  }

  // Subscribe to events
  subscribeEvents() {
    // [Start ssap_server_on_conn_state]
    try {
      server.onConnectionStateChange((data: ssap.ConnectionChangeState) => {
        hilog.info(0x0000, 'testTag', `Connection state: ${JSON.stringify(data)}`);
        this.connectedAddress = data.address;
        // [StartExclude ssap_server_on_conn_state]
        this.isConnected = data.state === CONNECTION_STATE_CONNECTED;
        this.addLog(`Connection: ${data.address}, state=${data.state}`);
        // [EndExclude ssap_server_on_conn_state]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_server_on_conn_state]
    // [Start ssap_server_on_property_read]
    try {
      server.onPropertyRead((data: ssap.PropertyReadRequest) => {
        hilog.info(0x0000, 'testTag', `Property read: ${JSON.stringify(data)}`);
        // [StartExclude ssap_server_on_property_read]
        this.addLog(`Read request from ${data.address}`);
        // [EndExclude ssap_server_on_property_read]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_server_on_property_read]
    // [Start ssap_server_on_property_write]
    try {
      // 写属性请求：将写入的值保存到对应属性
      server.onPropertyWrite((data: ssap.PropertyWriteRequest) => {
        hilog.info(0x0000, 'testTag', `Property write: ${JSON.stringify(data)}`);
        // [StartExclude ssap_server_on_property_write]
        let value = 0;
        if (data.value) {
          value = new Uint8Array(data.value)[0];
        }
        if (data.propertyUuid === 'FFFFFFFF-1234-5678-ABCD-000000001235') {
          propertyValue1 = value;
        } else if (data.propertyUuid === 'FFFFFFFF-1234-5678-ABCD-000000001236') {
          propertyValue2 = value;
        }
        this.addLog(`Write from ${data.address}: ${value}`);
        // [EndExclude ssap_server_on_property_write]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_server_on_property_write]
    // MTU change
    server.onMtuChange((mtu: number) => {
      hilog.info(0x0000, 'testTag', `MTU changed: ${mtu}`);
    });
  }

  // Notify property changed
  async notifyPropertyChanged(): Promise<void> {
    // [Start ssap_server_notify]
    try {
      // 使用固定示例值更新属性，实际开发中替换为业务数据
      propertyValue1 = 0x4E;
      let buffer = new ArrayBuffer(1);
      new Uint8Array(buffer)[0] = propertyValue1;
      let property: ssap.Property = {
        serviceUuid: 'FFFFFFFF-1234-5678-ABCD-000000001234',
        propertyUuid: 'FFFFFFFF-1234-5678-ABCD-000000001235',
        value: buffer
      };
      await server.notifyPropertyChanged(this.connectedAddress, property);
      // [StartExclude ssap_server_notify]
      hilog.info(0x0000, 'testTag', `notifyPropertyChanged success`);
      this.addLog('Notify property changed');
      // [EndExclude ssap_server_notify]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_server_notify]
  }

  // Close server
  closeServer() {
    if (!server) {
      return;
    }

    try {
      server.close();
      hilog.info(0x0000, 'testTag', 'Close server success');
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  // ==================== Advertising related ====================

  advStateCallback: (data: advertising.AdvertisingStateChangeInfo) => void =
    (data: advertising.AdvertisingStateChangeInfo) => {
      hilog.info(0x0000, 'testTag', 
        `Advertising state changed: id=${data.advertisingId}, state=${data.state}`);
      this.advertisingState = data.state === advertising.AdvertisingState.STARTED ? 'Started' : 'Stopped';
      if (data.state === advertising.AdvertisingState.STOPPED) {
        this.isAdvertising = false;
        this.advertisingId = -1;
      }
      this.addLog(`Advertising ${this.advertisingState}`);
    };

  subscribeAdvertisingStateChange() {
    try {
      advertising.onAdvertisingStateChange(this.advStateCallback);
      hilog.info(0x0000, 'testTag', 'Subscribed to advertising state');
    } catch (err) {
      hilog.error(0x0000, 'testTag', 
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  unsubscribeAdvertisingStateChange() {
    try {
      advertising.offAdvertisingStateChange(this.advStateCallback);
      hilog.info(0x0000, 'testTag', 'Unsubscribed from advertising state');
    } catch (err) {
      hilog.error(0x0000, 'testTag', 
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  buildAdvertisingParams(): advertising.AdvertisingParams {
    // Build custom manufacturer data for client filtering
    return NearLinkFeature.buildAdvertisingParams('FFFFFFFF-1234-5678-ABCD-000000001234', this.SSAP_MFR_ID, this.SSAP_MANUFACTURER_DATA);
  }

  async startAdvertising() {
    try {
      let params = this.buildAdvertisingParams();
      let advId: number = await advertising.startAdvertising(params);
      this.advertisingId = advId;
      this.isAdvertising = true;
      this.advertisingState = 'Starting...';
      hilog.info(0x0000, 'testTag', `Start advertising success, id: ${advId}`);
      this.addLog(`Advertising started, id=${advId}`);
    } catch (err) {
      hilog.error(0x0000, 'testTag', 
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.addLog(`Start advertising failed: ${(err as BusinessError).code}`);
    }
  }

  async stopAdvertising() {
    try {
      await advertising.stopAdvertising(this.advertisingId);
      this.isAdvertising = false;
      this.advertisingId = -1;
      this.advertisingState = 'Stopped';
      hilog.info(0x0000, 'testTag', 'Stop advertising success');
      this.addLog('Advertising stopped');
    } catch (err) {
      hilog.error(0x0000, 'testTag', 
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.addLog(`Stop advertising failed: ${(err as BusinessError).code}`);
    }
  }

  build() {
    Column() {
      NavBar({ title: $r('app.string.nav_ssap_server'), onBack: () => { this.pageInfos.pop(); } })

      Scroll() {
        Column() {
          SectionCard({ title: $r('app.string.section_server_status'), testId: 'section_server_status' }) {
            Text('FFFFFFFF-1234-5678-ABCD-000000001234')
              .fontSize(11)
              .fontColor($r('app.color.text_disabled'))
              .fontFamily('monospace')
              .margin({ bottom: 8 })
              .width('100%')
            Row() {
              StatusDot({ isConnected: this.isConnected })
              Blank()
              if (this.isConnected) {
                Text(this.connectedAddress)
                  .fontSize(12)
                  .fontColor($r('app.color.text_hint'))
              }
            }
            .width('100%')
          }

          SectionCard({ title: $r('app.string.section_advertising_control'), testId: 'section_advertising_control' }) {
            Row() {
              Text($r('app.string.label_advertising_state'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              Text(this.advertisingState)
                .fontSize(14)
                .fontColor(this.isAdvertising ? $r('app.color.color_success') : $r('app.color.text_hint'))
            }
            .width('100%')
            .margin({ bottom: 12 })
            Button(this.isAdvertising ? 'Stop' : 'Start')
              .width('100%')
              .backgroundColor(this.isAdvertising ? $r('app.color.color_danger') : $r('app.color.color_success'))
              .onClick(() => {
                if (this.isAdvertising) {
                  this.stopAdvertising();
                } else {
                  this.startAdvertising();
                }
              })
          }

          SectionCard({ title: $r('app.string.section_operations'), testId: 'section_operations' }) {
            Button($r('app.string.btn_notify_property'))
              .width('100%')
              .margin({ bottom: 8 })
              .enabled(this.isConnected)
              .onClick(() => { this.notifyPropertyChanged(); })

            Button($r('app.string.btn_close_server'))
              .width('100%')
              .backgroundColor($r('app.color.color_danger'))
              .onClick(() => { this.closeServer(); })
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
