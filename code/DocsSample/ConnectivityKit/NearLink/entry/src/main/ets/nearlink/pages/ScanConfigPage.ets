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

// [Start scan_module_import]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { scan } from '@kit.ConnectivityKit';
import { util } from '@kit.ArkTS';
// [End scan_module_import]
import { MAX_LOG_MESSAGES, MAX_SCAN_RESULTS_FULL } from 'nearlink_library';
import { NavBar, ScanDeviceItem, LogArea, SectionCard, ScanDeviceInfo } from '../components/CommonComponents';

// [Start scan_parse_result]
const ADV_DATA_TYPE_DISCOVERY_LEVEL = 0x01; // 发现等级
const ADV_DATA_TYPE_SERVICE_DATA_16_BIT_UUID = 0x03; // 标准服务数据（16比特UUID）
const ADV_DATA_TYPE_SERVICE_DATA_128_BIT_UUID = 0x04; // 自定义服务数据（128比特UUID）
const ADV_DATA_TYPE_COMPLETE_LIST_16_BIT_SERVICE_UUIDS = 0x05; // 完整的标准服务UUID列表
const ADV_DATA_TYPE_COMPLETE_LIST_128_BIT_SERVICE_UUIDS = 0x06; // 完整的自定义服务UUID列表
const ADV_DATA_TYPE_INCOMPLETE_LIST_16_BIT_SERVICE_UUIDS = 0x07; // 不完整的标准服务UUID列表
const ADV_DATA_TYPE_INCOMPLETE_LIST_128_BIT_SERVICE_UUIDS = 0x08; // 不完整的自定义服务UUID列表
const ADV_DATA_TYPE_SHORTENED_LOCAL_NAME = 0x0A; // 缩短的本地名称
const ADV_DATA_TYPE_COMPLETE_LOCAL_NAME = 0x0B; // 完整的本地名称
const ADV_DATA_TYPE_MANUFACTURER_SPECIFIC_DATA = 0xFF; // 厂商自定义数据

const NEARLINK_UUID_16_BIT_LENGTH = 2;
const NEARLINK_UUID_128_BIT_LENGTH = 16;
const NEARLINK_MANUFACTURER_ID_LENGTH = 2;
// 标准16比特UUID对应的128比特UUID形式的基础标识（前112比特）
const STANDARD_UUID_BASE_PREFIX = '37BEA880-FC70-11EA-B720-00000000';

// 广播报文数据的解析结果
interface ScanResultData {
  discoveryLevel: number;
  serviceData: Record<string, Uint8Array>;
  standardServiceUuids: string[];
  customServiceUuids: string[];
  localName: string;
  manufacturerData: Record<number, Uint8Array>;
}
// [End scan_parse_result]

@Component
export struct ScanConfigPage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State isScanning: boolean = false;
  @State deviceNameFilter: string = '';
  @State addressFilter: string = '';
  @State scanItems: ScanDeviceInfo[] = [];
  @State logMessages: string[] = [];

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', 'aboutToAppear');
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'testTag', 'aboutToDisappear');
    if (this.isScanning) {
      this.stopScan();
    }
  }

  addLog(msg: string) {
    this.logMessages.unshift(`[${new Date().toLocaleTimeString()}] ${msg}`);
    if (this.logMessages.length > MAX_LOG_MESSAGES) {
      this.logMessages.pop();
    }
  }

  // Subscribe to scan results
  subscribeScanResult(): void {
    // [Start scan_on_device_found]
    try {
      scan.offDeviceFound();
      scan.onDeviceFound((data: scan.ScanResults[]) => {
        data.forEach((item) => {
          hilog.info(0x0000, 'testTag',
            `Scan result: addr=${item.address}, name=${item.deviceName}, rssi=${item.rssi}`);
          this.parseScanResult(item.data);
        });
        // [StartExclude scan_on_device_found]
        // Use address as key to deduplicate, new data overwrites for real-time RSSI update
        let deviceMap: Record<string, ScanDeviceInfo> = {};
        this.scanItems.forEach((item) => {
          deviceMap[item.address] = item;
        });
        data.forEach((item) => {
          let info = deviceMap[item.address];
          if (info === undefined) {
            info = new ScanDeviceInfo();
            info.address = item.address;
            info.deviceName = item.deviceName;
            info.rssi = item.rssi;
            deviceMap[item.address] = info;
          } else {
            info.rssi = item.rssi;
          }
          // Show the parsed advertising data on the device list item
          let parsed = this.parseScanResult(item.data);
          info.parsedLocalName = parsed.localName;
          info.parsedServiceUuids = parsed.standardServiceUuids.concat(parsed.customServiceUuids).join(', ');
        });
        this.scanItems = Object.values<ScanDeviceInfo>(deviceMap).slice(0, MAX_SCAN_RESULTS_FULL);
        this.addLog(`Found ${data.length} device(s)`);
        // [EndExclude scan_on_device_found]
      });
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End scan_on_device_found]
  }

  // [Start scan_parse_result_methods]
  parseScanResult(data: ArrayBuffer): ScanResultData {
    let advData = new Uint8Array(data);
    let result: ScanResultData = {
      discoveryLevel: -1,
      serviceData: {},
      standardServiceUuids: [],
      customServiceUuids: [],
      localName: '',
      manufacturerData: {}
    };
    if (advData.byteLength === 0) {
      hilog.info(0x0000, 'testTag', 'adv data length is 0');
      return result;
    }
    let curPos = 0;
    while (curPos < advData.byteLength) {
      // 每个条目由1字节类型、1字节长度和值组成
      let dataType = advData[curPos++];
      let dataLength = advData[curPos++];
      if (dataLength === 0) {
        break; // 长度为零表示有效条目结束
      }
      switch (dataType) {
        case ADV_DATA_TYPE_DISCOVERY_LEVEL:
          result.discoveryLevel = advData[curPos];
          break;
        case ADV_DATA_TYPE_SERVICE_DATA_16_BIT_UUID:
          this.parseServiceData(NEARLINK_UUID_16_BIT_LENGTH, curPos, dataLength, advData, result.serviceData);
          break;
        case ADV_DATA_TYPE_SERVICE_DATA_128_BIT_UUID:
          this.parseServiceData(NEARLINK_UUID_128_BIT_LENGTH, curPos, dataLength, advData, result.serviceData);
          break;
        case ADV_DATA_TYPE_COMPLETE_LIST_16_BIT_SERVICE_UUIDS:
        case ADV_DATA_TYPE_INCOMPLETE_LIST_16_BIT_SERVICE_UUIDS:
          this.parseServiceUuids(NEARLINK_UUID_16_BIT_LENGTH, curPos, dataLength, advData,
            result.standardServiceUuids);
          break;
        case ADV_DATA_TYPE_COMPLETE_LIST_128_BIT_SERVICE_UUIDS:
        case ADV_DATA_TYPE_INCOMPLETE_LIST_128_BIT_SERVICE_UUIDS:
          this.parseServiceUuids(NEARLINK_UUID_128_BIT_LENGTH, curPos, dataLength, advData,
            result.customServiceUuids);
          break;
        case ADV_DATA_TYPE_SHORTENED_LOCAL_NAME:
        case ADV_DATA_TYPE_COMPLETE_LOCAL_NAME:
          let decoder = util.TextDecoder.create('utf-8');
          result.localName = decoder.decodeToString(advData.slice(curPos, curPos + dataLength));
          break;
        case ADV_DATA_TYPE_MANUFACTURER_SPECIFIC_DATA:
          this.parseManufacturerData(curPos, dataLength, advData, result.manufacturerData);
          break;
        default:
          break;
      }
      curPos += dataLength; // 移动到下一个条目
    }
    hilog.info(0x0000, 'testTag',
      `discoveryLevel: ${result.discoveryLevel}, serviceData: ${JSON.stringify(result.serviceData)}, ` +
      `standardServiceUuids: ${JSON.stringify(result.standardServiceUuids)}, ` +
      `customServiceUuids: ${JSON.stringify(result.customServiceUuids)}, ` +
      `localName: ${result.localName}, manufacturerData: ${JSON.stringify(result.manufacturerData)}`);
    return result;
  }

  parseServiceData(uuidLength: number, curPos: number, dataLength: number,
    advData: Uint8Array, serviceData: Record<string, Uint8Array>): void {
    let uuid = advData.slice(curPos, curPos + uuidLength);
    let value = advData.slice(curPos + uuidLength, curPos + dataLength);
    serviceData[this.getUuidFromUint8Array(uuidLength, uuid)] = value;
  }

  parseServiceUuids(uuidLength: number, curPos: number, dataLength: number,
    advData: Uint8Array, serviceUuids: string[]): void {
    while (dataLength > 0) {
      let uuid = advData.slice(curPos, curPos + uuidLength);
      serviceUuids.push(this.getUuidFromUint8Array(uuidLength, uuid));
      dataLength -= uuidLength;
      curPos += uuidLength;
    }
  }

  parseManufacturerData(curPos: number, dataLength: number,
    advData: Uint8Array, manufacturerData: Record<number, Uint8Array>): void {
    let manufacturerId = (advData[curPos + 1] << 8) + advData[curPos];
    let value = advData.slice(curPos + NEARLINK_MANUFACTURER_ID_LENGTH, curPos + dataLength);
    manufacturerData[manufacturerId] = value;
  }

  getUuidFromUint8Array(uuidLength: number, uuidData: Uint8Array): string {
    let hex = '';
    for (let i = uuidLength - 1; i > -1; i--) {
      hex += uuidData[i].toString(16).padStart(2, '0');
    }
    switch (uuidLength) {
      case NEARLINK_UUID_16_BIT_LENGTH:
        return STANDARD_UUID_BASE_PREFIX + hex;
      case NEARLINK_UUID_128_BIT_LENGTH:
        return `${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-` +
          `${hex.substring(16, 20)}-${hex.substring(20, 32)}`;
      default:
        return '';
    }
  }
  // [End scan_parse_result_methods]

  // Build scan filters
  buildScanFilters(): scan.ScanFilters[] | null {
    // [Start scan_config_filter]
    let deviceNameFilter: string = 'deviceName1';
    let addressFilter: string = '11:22:33:44:AA:BB';

    let filters: scan.ScanFilters[] = [];
    if (deviceNameFilter.length > 0) {
      filters.push({ deviceName: deviceNameFilter });
    }
    if (addressFilter.length > 0) {
      filters.push({ address: addressFilter });
    }
    // [End scan_config_filter]
    return filters.length > 0 ? filters : null;
  }

  // Start scan
  async startScan() {
    if (this.isScanning) {
      return;
    }
    try {
      this.subscribeScanResult();
      let filters = this.buildScanFilters();
      // [Start scan_start]
      try {
        let scanOptions: scan.ScanOptions = {
          scanMode: scan.ScanMode.SCAN_MODE_LOW_POWER
        };
        await scan.startScan(filters, scanOptions);
        // [StartExclude scan_start]
        hilog.info(0x0000, 'testTag', 'Start scan success');
        this.addLog('Start scan success');
        // [EndExclude scan_start]
      } catch (err) {
        hilog.error(0x0000, 'testTag',
          `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      }
      // [End scan_start]
      this.scanItems = [];
    } catch (err) {
      scan.offDeviceFound();
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.addLog(`Start scan failed: ${(err as BusinessError).code}`);
    }
  }

  // Start full scan (no filters)
  async startFullScan() {
    if (this.isScanning) {
      return;
    }
    try {
      this.subscribeScanResult();
      await scan.startScan(null);
      this.isScanning = true;
      this.scanItems = [];
      hilog.info(0x0000, 'testTag', 'Start full scan success');
      this.addLog('Start full scan success');
    } catch (err) {
      scan.offDeviceFound();
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      this.addLog(`Start full scan failed: ${(err as BusinessError).code}`);
    }
  }

  // Stop scan
  async stopScan() {
    // [Start scan_stop]
    try {
      await scan.stopScan();
      // [StartExclude scan_stop]
      this.isScanning = false;
      hilog.info(0x0000, 'testTag', 'Stop scan success');
      this.addLog('Stop scan success');
      // [EndExclude scan_stop]
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
      // [StartExclude scan_stop]
      this.addLog(`Stop scan failed: ${(err as BusinessError).code}`);
      // [EndExclude scan_stop]
    }
    // [End scan_stop]

    // [Start scan_off_device_found]
    try {
      scan.offDeviceFound();
    } catch (err) {
      hilog.error(0x0000, 'testTag',
        `errCode: ${(err as BusinessError).code}, errMessage: ${(err as BusinessError).message}`);
    }
    // [End scan_off_device_found]
  }

  build() {
    Column() {
      NavBar({ title: $r('app.string.nav_scan'), onBack: () => { this.pageInfos.pop(); } })

      Scroll() {
        Column() {
          SectionCard({ title: $r('app.string.section_scan_filters'), testId: 'section_scan_filters' }) {
            TextInput({ placeholder: $r('app.string.placeholder_device_name'), text: this.deviceNameFilter })
              .width('100%')
              .onChange((value: string) => { this.deviceNameFilter = value; })
              .margin({ bottom: 8 })

            TextInput({ placeholder: $r('app.string.placeholder_address'), text: this.addressFilter })
              .width('100%')
              .onChange((value: string) => { this.addressFilter = value; })
              .margin({ bottom: 12 })

            Row() {
              Button(this.isScanning ? $r('app.string.btn_stop_scan') : $r('app.string.btn_filtered_scan'))
                .id('btn_filtered_scan')
                .layoutWeight(1)
                .backgroundColor(this.isScanning ? $r('app.color.color_danger') : $r('app.color.color_accent'))
                .onClick(() => {
                  if (this.isScanning) {
                    this.stopScan();
                  } else {
                    this.startScan();
                  }
                })

              Button($r('app.string.btn_full_scan'))
                .id('btn_full_scan')
                .layoutWeight(1)
                .margin({ left: 8 })
                .enabled(!this.isScanning)
                .onClick(() => { this.startFullScan(); })
            }
            .width('100%')
          }

          SectionCard({ title: $r('app.string.section_scan_results') }) {
            if (this.isScanning && this.scanItems.length === 0) {
              Column() {
                LoadingProgress()
                  .width(36)
                  .height(36)
                  .color('#1565C0')
                Text($r('app.string.scanning_nearby_devices'))
                  .fontSize(13)
                  .fontColor($r('app.color.text_hint'))
                  .margin({ top: 8 })
              }
              .width('100%')
              .padding({ top: 24, bottom: 24 })
              .justifyContent(FlexAlign.Center)
            } else if (this.scanItems.length === 0) {
              Text($r('app.string.no_scan_results'))
                .fontSize(14)
                .fontColor($r('app.color.text_disabled'))
                .margin({ bottom: 12 })
            } else {
              ForEach(this.scanItems, (item: ScanDeviceInfo) => {
                ScanDeviceItem({ info: item })
              }, (item: ScanDeviceInfo) => item.address)
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
