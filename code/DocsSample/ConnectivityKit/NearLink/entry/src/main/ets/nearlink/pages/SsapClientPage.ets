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

import { SCAN_TIMEOUT_MS, MAX_SCAN_RESULTS, MAX_LOG_MESSAGES, NEARLINK_SERVICE_UUID, SSAP_MANUFACTURER_ID,
  CONNECTION_STATE_CONNECTED, NearLinkFeature } from 'nearlink_library';
import { BusinessError } from '@kit.BasicServicesKit';
// [Start ssap_client_module_import]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ssap } from '@kit.ConnectivityKit';
// [End ssap_client_module_import]
import { scan } from '@kit.ConnectivityKit';
import { DeviceItem, LogArea, NavBar, StatusDot, SectionCard } from '../components/CommonComponents';

// [Start ssap_client_declare]
let client: ssap.Client;
// [End ssap_client_declare]

@Component
export struct SsapClientPage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State isConnected: boolean = false;
  @State serverAddress: string = '';
  @State scanResults: scan.ScanResults[] = [];
  @State services: ssap.Service[] = [];
  @State logMessages: string[] = [];
  @State lastNotificationValue: string = '';
  @State notificationCount: number = 0;
  readonly SSAP_MFR_ID: number = SSAP_MANUFACTURER_ID;
  readonly SSAP_SVC_UUID: string = NEARLINK_SERVICE_UUID;
  // Auto-stop scan timer handle, -1 means no pending timer
  scanTimer: number = -1;

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'aboutToAppear');
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', 'aboutToDisappear');
    this.clearScanTimer();
    this.closeClient();
  }

  // Clear the pending auto-stop scan timer
  clearScanTimer() {
    if (this.scanTimer >= 0) {
      clearTimeout(this.scanTimer);
      this.scanTimer = -1;
    }
  }

  addLog(msg: string) {
    this.logMessages.unshift(`[${new Date().toLocaleTimeString()}] ${msg}`);
    if (this.logMessages.length > MAX_LOG_MESSAGES) {
      this.logMessages.pop();
    }
  }

  // Scan callback (class-level property to prevent GC)
  scanCallback: (data: scan.ScanResults[]) => void = (data: scan.ScanResults[]) => {
    // Deduplicate by address, update RSSI in real-time
    let deviceMap: Record<string, scan.ScanResults> = {};
    this.scanResults.forEach((item) => {
      deviceMap[item.address] = item;
    });
    data.forEach((item) => {
      deviceMap[item.address] = item;
    });
    this.scanResults = Object.values<scan.ScanResults>(deviceMap).slice(0, MAX_SCAN_RESULTS);
  };

  // Scan for server (filter by manufacturerId, only scan SSAP Server)
  async startScan() {
    try {
      // Clear previous timer and avoid duplicate subscription
      this.clearScanTimer();
      scan.offDeviceFound(this.scanCallback);
      scan.onDeviceFound(this.scanCallback);
      // Filter by manufacturerId, only scan devices broadcasting as SSAP Server
      let filter: scan.ScanFilters[] = NearLinkFeature.buildManufacturerFilter(this.SSAP_MFR_ID);
      await scan.startScan(filter);
      this.addLog('Scanning for SSAP Server...');
      // Stop scan after timeout, save the handle so it can be cleared on page exit
      this.scanTimer = setTimeout(async () => {
        await scan.stopScan();
        scan.offDeviceFound(this.scanCallback);
        this.scanTimer = -1;
        this.addLog(`Found ${this.scanResults.length} SSAP device(s)`);
      }, SCAN_TIMEOUT_MS);
    } catch (err) {
      // Clean up subscription if start fails
      scan.offDeviceFound(this.scanCallback);
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.addLog(`Scan failed: ${(err as BusinessError).code}`);
    }
  }

  // Select device
  selectDevice(address: string) {
    this.serverAddress = address;
    this.addLog(`Selected: ${address}`);
  }

  // Create SSAP client instance
  createSsapClient(address: string): void {
    // [Start ssap_client_create]
    try {
      client = ssap.createClient(address);
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_client_create]
  }

  // Subscribe to connection state change
  subscribeConnState(): void {
    // [Start ssap_client_on_conn_state]
    try {
      client.onConnectionStateChange((data: ssap.ConnectionChangeState) => {
        hilog.info(0x0000, 'testTag', `Connection state: ${JSON.stringify(data)}`);
        // [StartExclude ssap_client_on_conn_state]
        this.isConnected = data.state === CONNECTION_STATE_CONNECTED;
        this.addLog(`Connection: ${data.address}, state=${data.state}`);
        // [EndExclude ssap_client_on_conn_state]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_client_on_conn_state]
  }

  // Subscribe to property change events
  subscribePropertyChange(): void {
    // [Start ssap_client_on_property_change]
    try {
      client.onPropertyChange((data: ssap.Property) => {
        hilog.info(0x0000, 'testTag', `Property changed: ${JSON.stringify(data)}`);
        // [StartExclude ssap_client_on_property_change]
        let view = new Uint8Array(data.value);
        let hexStr = Array.from(view).map((b: number) => b.toString(16).padStart(2, '0')).join(' ');
        this.lastNotificationValue = hexStr;
        this.notificationCount++;
        // [EndExclude ssap_client_on_property_change]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_client_on_property_change]
  }

  // Initiate connection to the SSAP server
  async connectServer(): Promise<void> {
    // [Start ssap_client_connect]
    try {
      await client.connect();
      // [StartExclude ssap_client_connect]
      this.addLog('Connect success');
      // [EndExclude ssap_client_connect]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_client_connect]
  }

  // Connect to the selected SSAP server
  async connectDevice() {
    if (!this.serverAddress) {
      this.addLog('No device selected');
      return;
    }

    try {
      this.createSsapClient(this.serverAddress);
      this.subscribeConnState();
      this.subscribePropertyChange();
      await this.connectServer();
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.addLog(`Connect failed: ${(err as BusinessError).code}`);
    }
  }

  // Get services
  async getServices(): Promise<void> {
    // [Start ssap_client_get_services]
    let services: ssap.Service[] = [];
    try {
      services = await client.getServices();
      // [StartExclude ssap_client_get_services]
      this.addLog(`Get services success, count=${services.length}`);
      // [EndExclude ssap_client_get_services]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_client_get_services]
    this.services = services.filter((s: ssap.Service) => s.serviceUuid === this.SSAP_SVC_UUID);
  }

  // Find custom service property
  findCustomProperty(propertyIndex: number): ssap.Property | null {
    let svc = this.services.find((s: ssap.Service) =>
    s.serviceUuid === this.SSAP_SVC_UUID && s.properties.length > propertyIndex
    );
    return svc ? svc.properties[propertyIndex] : null;
  }

  // Read property
  async readProperty(): Promise<void> {
    let property = this.findCustomProperty(0);
    if (!property) {
      this.addLog('Custom service not found, please get services first');
      return;
    }

    // [Start ssap_client_read_property]
    let result: ssap.Property | null = null;
    try {
      result = await client.readProperty(property);
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_client_read_property]
    if (result) {
      let view = new Uint8Array(result.value);
      let hexStr = Array.from(view).map((b: number) => b.toString(16).padStart(2, '0')).join(' ');
      this.addLog(`Property value: ${hexStr}`);
    }
  }

  // Write property
  async writeProperty(): Promise<void> {
    let property = this.findCustomProperty(0);
    if (!property) {
      this.addLog('Custom service not found, please get services first');
      return;
    }

    // [Start ssap_client_write_property]
    try {
      let valueBuffer = new ArrayBuffer(1);
      let value = new Uint8Array(valueBuffer);
      value[0] = 1;
      property.value = valueBuffer;

      await client.writeProperty(property, ssap.PropertyWriteType.WRITE_NO_RESPONSE);
      // [StartExclude ssap_client_write_property]
      this.addLog('Write property success');
      // [EndExclude ssap_client_write_property]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_client_write_property]
  }

  // Enable property notification
  async setPropertyNotification(): Promise<void> {
    let property = this.findCustomProperty(0);
    if (!property) {
      this.addLog('Custom service not found, please get services first');
      return;
    }

    // [Start ssap_client_set_notification]
    try {
      await client.setPropertyNotification(property, true);
      // [StartExclude ssap_client_set_notification]
      this.addLog('Enable notification success');
      // [EndExclude ssap_client_set_notification]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End ssap_client_set_notification]
  }

  // Disconnect
  async disconnectDevice() {
    if (!client) {
      return;
    }

    try {
      await client.disconnect();
      this.isConnected = false;
      this.addLog('Disconnected');
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  // Close client
  closeClient() {
    if (!client) {
      return;
    }

    try {
      client.close();
      this.isConnected = false;
      this.addLog('Client closed');
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  build() {
    Column() {
      NavBar({
        title: $r('app.string.nav_ssap_client'), onBack: () => {
          this.pageInfos.pop();
        }
      })

      Scroll() {
        Column() {
          SectionCard({ title: $r('app.string.section_scan_devices'), testId: 'section_scan_devices' }) {
            Button($r('app.string.btn_start_scan'))
              .id('btn_start_scan')
              .width('100%')
              .margin({ bottom: 8 })
              .onClick(() => {
                this.scanResults = [];
                this.startScan();
              })

            if (this.scanResults.length > 0) {
              ForEach(this.scanResults, (result: scan.ScanResults) => {
                DeviceItem({
                  deviceName: result.deviceName || 'Unknown',
                  address: result.address,
                  rssi: result.rssi,
                  isSelected: this.serverAddress === result.address,
                  onSelect: () => { this.selectDevice(result.address); }
                })
              })
            }
          }

          SectionCard({ title: $r('app.string.section_connection_management'), testId: 'section_connection_management' }) {
            Row() {
              Text($r('app.string.label_server'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              Text(this.serverAddress || 'Not selected')
                .fontSize(12)
                .fontColor($r('app.color.text_secondary'))
            }
            .width('100%')
            .margin({ bottom: 8 })
            StatusDot({ isConnected: this.isConnected })
              .margin({ bottom: 12 })

            Row() {
              Button($r('app.string.btn_connect'))
                .layoutWeight(1)
                .enabled(!this.isConnected && this.serverAddress !== '')
                .onClick(() => { this.connectDevice(); })
              Button($r('app.string.btn_disconnect'))
                .layoutWeight(1)
                .margin({ left: 8 })
                .enabled(this.isConnected)
                .backgroundColor($r('app.color.color_danger'))
                .onClick(() => { this.disconnectDevice(); })
            }
            .width('100%')
          }

          if (this.notificationCount > 0) {
            SectionCard({ title: $r('app.string.section_notification_status') }) {
              Row() {
                Text(`Received ${this.notificationCount} notification(s)`)
                  .fontSize(14)
                  .fontColor($r('app.color.color_success'))
                  .layoutWeight(1)
                Text(this.lastNotificationValue)
                  .fontSize(12)
                  .fontColor($r('app.color.text_hint'))
                  .fontFamily('monospace')
              }
              .width('100%')
            }
          }

          SectionCard({ title: $r('app.string.section_service_operations') }) {
            Button($r('app.string.btn_get_services'))
              .width('100%')
              .margin({ bottom: 8 })
              .enabled(this.isConnected)
              .onClick(() => { this.getServices(); })

            Row() {
              Button($r('app.string.btn_read_property'))
                .layoutWeight(1)
                .enabled(this.isConnected && this.services.length > 0)
                .onClick(() => { this.readProperty(); })
              Button($r('app.string.btn_write_property'))
                .layoutWeight(1)
                .margin({ left: 8 })
                .enabled(this.isConnected && this.services.length > 0)
                .onClick(() => { this.writeProperty(); })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Button($r('app.string.btn_enable_notification'))
              .width('100%')
              .enabled(this.isConnected && this.services.length > 0)
              .onClick(() => { this.setPropertyNotification(); })
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
