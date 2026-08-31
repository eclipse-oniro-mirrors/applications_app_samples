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

// [Start datatransfer_module_import]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { dataTransfer } from '@kit.ConnectivityKit';
// [End datatransfer_module_import]
import { scan, advertising } from '@kit.ConnectivityKit';
import {
  SCAN_TIMEOUT_MS,
  MAX_SCAN_RESULTS,
  MAX_LOG_MESSAGES,
  MAX_RECEIVED_DATA,
  DT_MANUFACTURER_ID,
  CONNECTION_STATE_CONNECTED,
  NearLinkFeature
} from 'nearlink_library';
import { NavBar, StatusDot, DeviceItem, LogArea, SectionCard } from '../components/CommonComponents';

// [Start datatransfer_declare]
let serviceUuid: string = 'FFFFFFFF-1234-5678-ABCD-000000001244';
let chosenDeviceAddr: string;
// [End datatransfer_declare]

@Component
export struct DataTransferPage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State isPortCreated: boolean = false;
  @State isConnected: boolean = false;
  @State serverAddress: string = '';
  @State scanResults: scan.ScanResults[] = [];
  @State receivedData: string[] = [];
  @State receivedCount: number = 0;
  @State logMessages: string[] = [];
  @State isAdvertising: boolean = false;
  @State advertisingId: number = -1;
  @State advertisingState: string = 'Stopped';

  readonly DT_MFR_ID: number = DT_MANUFACTURER_ID;
  readonly DT_MANUFACTURER_DATA: number[] = [0x44, 0x54, 0x52, 0x4E]; // "DTRN" in ASCII
  // Auto-stop scan timer handle, -1 means no pending timer
  scanTimer: number = -1;

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'aboutToAppear');
    this.subscribeEvents();
    this.subscribeAdvertisingStateChange();
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', 'aboutToDisappear');
    this.clearScanTimer();
    if (this.isAdvertising) {
      this.stopAdvertising();
    }
    this.unsubscribeAdvertisingStateChange();
    this.unsubscribeEvents();
    if (this.isPortCreated) {
      this.destroyPort();
    }
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

  // Subscribe to events
  subscribeEvents() {
    // [Start datatransfer_on_conn_state]
    try {
      dataTransfer.onConnectionStateChanged((data: dataTransfer.ConnectionResult) => {
        hilog.info(0x0000, 'testTag', `Connection state: ${JSON.stringify(data)}`);
        // [StartExclude datatransfer_on_conn_state]
        this.isConnected = data.state === CONNECTION_STATE_CONNECTED;
        this.addLog(`Connection state: ${data.state}`);
        // [EndExclude datatransfer_on_conn_state]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End datatransfer_on_conn_state]

    // [Start datatransfer_on_read_data]
    try {
      dataTransfer.onReadData((data: dataTransfer.DataParams) => {
        hilog.info(0x0000, 'testTag', `Data received: ${JSON.stringify(data)}`);
        // [StartExclude datatransfer_on_read_data]
        let view = new Uint8Array(data.data);
        let dataStr = Array.from(view).map((b: number) => b.toString(16).padStart(2, '0')).join(' ');
        this.receivedData.unshift(`From ${data.address}: ${dataStr}`);
        if (this.receivedData.length > MAX_RECEIVED_DATA) {
          this.receivedData.pop();
        }
        this.receivedCount++;
        this.addLog(`Received ${data.data.byteLength} bytes`);
        // [EndExclude datatransfer_on_read_data]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End datatransfer_on_read_data]
  }

  unsubscribeEvents() {
    try {
      dataTransfer.offConnectionStateChanged();
      dataTransfer.offReadData();
      hilog.info(0x0000, 'testTag', 'Events unsubscribed');
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  // Create port
  createPort() {
    // [Start datatransfer_create_port]
    try {
      dataTransfer.createPort(serviceUuid);
      // [StartExclude datatransfer_create_port]
      this.isPortCreated = true;
      hilog.info(0x0000, 'testTag', 'Create port success');
      this.addLog('Port created');
      // [EndExclude datatransfer_create_port]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      // [StartExclude datatransfer_create_port]
      this.addLog(`Create port failed: ${(err as BusinessError).code}`);
      // [EndExclude datatransfer_create_port]
    }
    // [End datatransfer_create_port]
  }

  // Destroy port
  destroyPort() {
    // [Start datatransfer_destroy_port]
    try {
      dataTransfer.destroyPort(serviceUuid);
      // [StartExclude datatransfer_destroy_port]
      this.isPortCreated = false;
      hilog.info(0x0000, 'testTag', 'Destroy port success');
      this.addLog('Port destroyed');
      // [EndExclude datatransfer_destroy_port]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      // [StartExclude datatransfer_destroy_port]
      this.addLog(`Destroy port failed: ${(err as BusinessError).code}`);
      // [EndExclude datatransfer_destroy_port]
    }
    // [End datatransfer_destroy_port]
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

  // Scan devices
  async startScan() {
    try {
      // Clear previous timer and avoid duplicate subscription
      this.clearScanTimer();
      scan.offDeviceFound(this.scanCallback);
      scan.onDeviceFound(this.scanCallback);
      // Filter by manufacturerId, only scan DataTransfer advertising devices
      let filter: scan.ScanFilters[] = NearLinkFeature.buildManufacturerFilter(this.DT_MFR_ID);
      await scan.startScan(filter);
      this.addLog('Scanning for DataTransfer...');
      // Stop scan after timeout, save the handle so it can be cleared on page exit
      this.scanTimer = setTimeout(async () => {
        await scan.stopScan();
        scan.offDeviceFound(this.scanCallback);
        this.scanTimer = -1;
        this.addLog(`Found ${this.scanResults.length} DT device(s)`);
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
    chosenDeviceAddr = address;
    this.addLog(`Selected: ${address}`);
  }

  // Connect port
  async connectPort() {
    if (!chosenDeviceAddr) {
      this.addLog('No device selected');
      return;
    }

    // [Start datatransfer_connect]
    try {
      let params: dataTransfer.ConnectionParams = {
        address: chosenDeviceAddr,
        uuid: serviceUuid,
        transferMode: dataTransfer.TransferMode.BASIC
      };
      await dataTransfer.connect(params);
      // [StartExclude datatransfer_connect]
      hilog.info(0x0000, 'testTag', 'Connect port success');
      this.addLog('Connecting...');
      // [EndExclude datatransfer_connect]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      // [StartExclude datatransfer_connect]
      this.addLog(`Connect failed: ${(err as BusinessError).code}`);
      // [EndExclude datatransfer_connect]
    }
    // [End datatransfer_connect]
  }

  // Disconnect port
  async disconnectPort() {
    if (!chosenDeviceAddr) {
      return;
    }

    // [Start datatransfer_disconnect]
    try {
      let params: dataTransfer.ConnectionParams = {
        address: chosenDeviceAddr,
        uuid: serviceUuid
      };
      await dataTransfer.disconnect(params);
      // [StartExclude datatransfer_disconnect]
      this.isConnected = false;
      this.addLog('Disconnected');
      // [EndExclude datatransfer_disconnect]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      // [StartExclude datatransfer_disconnect]
      this.addLog(`Disconnect failed: ${(err as BusinessError).code}`);
      // [EndExclude datatransfer_disconnect]
    }
    // [End datatransfer_disconnect]
  }

  // Send data
  async sendData() {
    if (!chosenDeviceAddr || !this.isConnected) {
      this.addLog('Not connected');
      return;
    }

    // [Start datatransfer_write_data]
    try {
      // Fill the payload with fixed demo bytes; replace with business data in real development
      let dataBuffer = new ArrayBuffer(4);
      let data = new Uint8Array(dataBuffer);
      data[0] = 0x01;
      data[1] = 0x02;
      data[2] = 0x03;
      data[3] = 0x04;

      let params: dataTransfer.DataParams = {
        address: chosenDeviceAddr,
        uuid: serviceUuid,
        data: dataBuffer
      };
      await dataTransfer.writeData(params);
      // [StartExclude datatransfer_write_data]
      hilog.info(0x0000, 'testTag', 'Send data success');
      this.addLog(`Sent: ${Array.from(data).map((b: number) => b.toString(16).padStart(2, '0')).join(' ')}`);
      // [EndExclude datatransfer_write_data]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      // [StartExclude datatransfer_write_data]
      this.addLog(`Send failed: ${(err as BusinessError).code}`);
      // [EndExclude datatransfer_write_data]
    }
    // [End datatransfer_write_data]
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
    } catch (err) {
      hilog.error(0x0000, 'testTag', 
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  unsubscribeAdvertisingStateChange() {
    try {
      advertising.offAdvertisingStateChange(this.advStateCallback);
    } catch (err) {
      hilog.error(0x0000, 'testTag', 
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
  }

  buildAdvertisingParams(): advertising.AdvertisingParams {
    return NearLinkFeature.buildAdvertisingParams(serviceUuid, this.DT_MFR_ID, this.DT_MANUFACTURER_DATA);
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
      NavBar({ title: $r('app.string.nav_data_transfer'), onBack: () => { this.pageInfos.pop(); } })

      Scroll() {
        Column() {
          SectionCard({ title: $r('app.string.section_port_management'), testId: 'section_port_management' }) {
            Text(serviceUuid)
              .fontSize(11)
              .fontColor($r('app.color.text_disabled'))
              .fontFamily('monospace')
              .margin({ bottom: 12 })
              .width('100%')
            Button(this.isPortCreated ? $r('app.string.btn_destroy_port') : $r('app.string.btn_create_port'))
              .id('btn_create_port')
              .width('100%')
              .backgroundColor(this.isPortCreated ? $r('app.color.color_danger') : $r('app.color.color_success'))
              .onClick(() => {
                if (this.isPortCreated) {
                  this.destroyPort();
                } else {
                  this.createPort();
                }
              })
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

          SectionCard({ title: $r('app.string.section_scan_devices') }) {
            Button($r('app.string.btn_start_scan'))
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
                  isSelected: this.serverAddress === result.address,
                  onSelect: () => { this.selectDevice(result.address); }
                })
              })
            }
          }

          SectionCard({ title: $r('app.string.section_connection_transfer') }) {
            Row() {
              Text($r('app.string.label_target_address'))
                .fontSize(14)
                .fontColor($r('app.color.text_hint'))
                .layoutWeight(1)
              Text(this.serverAddress || 'Not selected')
                .fontSize(12)
            }
            .width('100%')
            .margin({ bottom: 8 })
            StatusDot({ isConnected: this.isConnected })
              .margin({ bottom: 12 })

            Row() {
              Button($r('app.string.btn_connect'))
                .layoutWeight(1)
                .enabled(!this.isConnected && this.serverAddress !== '' && this.isPortCreated)
                .onClick(() => { this.connectPort(); })
              Button($r('app.string.btn_disconnect'))
                .layoutWeight(1)
                .margin({ left: 8 })
                .enabled(this.isConnected)
                .backgroundColor($r('app.color.color_danger'))
                .onClick(() => { this.disconnectPort(); })
            }
            .width('100%')
            .margin({ bottom: 8 })

            Button($r('app.string.btn_send_data'))
              .width('100%')
              .enabled(this.isConnected)
              .onClick(() => { this.sendData(); })

            if (this.receivedData.length > 0) {
              Divider().margin({ top: 12, bottom: 12 })
              Text($r('app.string.received_data_count', this.receivedCount))
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ bottom: 8 })
                .alignSelf(ItemAlign.Start)
              Scroll() {
                Column() {
                  ForEach(this.receivedData, (data: string) => {
                    Text(data)
                      .fontSize(12)
                      .fontColor($r('app.color.color_success'))
                      .fontFamily('monospace')
                      .margin({ bottom: 4 })
                      .width('100%')
                  })
                }
                .width('100%')
                .alignItems(HorizontalAlign.Start)
              }
              .width('100%')
              .height(200)
              .backgroundColor('#2D2D2D')
              .borderRadius(8)
              .padding(12)
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
