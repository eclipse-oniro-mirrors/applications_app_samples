/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import { hilog, hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { PageConstants, BluetoothConstants } from 'library';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * Scan result item interface.
 */
interface ScanResult {
  name: string;
  mac: string;
  rssi: number;
  type: string;
  isBonded: boolean;
}

/**
 * Device scan page.
 * Discovers nearby Bluetooth devices.
 */
@Entry
@Component
struct ScanPage {
  @State isScanning: boolean = false;
  @State scanResults: ScanResult[] = [];
  @State scanProgress: string = 'Ready to scan';
  @State deviceCount: number = 0;

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, 'ScanPage aboutToAppear');
  }

  /**
   * Start scanning for devices.
   */
  private startScan(): void {
    hiTraceMeter.startTrace('ScanPage_startScan', 0);
    this.isScanning = true;
    this.scanResults = [];
    this.deviceCount = 0;
    this.scanProgress = 'Scanning...';
    this.addLog('Starting Bluetooth scan');

    // Simulate device discovery
    const mockDevices: ScanResult[] = [
      { name: 'JBL Flip 6', mac: 'AA:BB:CC:DD:EE:01', rssi: -45, type: 'Audio', isBonded: true },
      { name: 'Sony WH-1000XM5', mac: 'AA:BB:CC:DD:EE:02', rssi: -38, type: 'Audio', isBonded: true },
      { name: 'Logitech K380', mac: 'AA:BB:CC:DD:EE:10', rssi: -50, type: 'Input', isBonded: true },
      { name: 'Microsoft Arc Mouse', mac: 'AA:BB:CC:DD:EE:11', rssi: -55, type: 'Input', isBonded: false },
      { name: 'Huawei Watch GT4', mac: 'AA:BB:CC:DD:EE:20', rssi: -40, type: 'Health', isBonded: true },
      { name: 'Samsung Galaxy S24', mac: 'AA:BB:CC:DD:EE:30', rssi: -35, type: 'Phone', isBonded: true },
      { name: 'Unknown Device', mac: 'AA:BB:CC:DD:EE:40', rssi: -72, type: 'Unknown', isBonded: false },
      { name: 'BT-Gamepad-Pro', mac: 'AA:BB:CC:DD:EE:50', rssi: -60, type: 'Input', isBonded: false },
    ];

    let index: number = 0;
    const interval: number = setInterval(() => {
      if (index < mockDevices.length) {
        this.scanResults.push(mockDevices[index]);
        this.deviceCount = this.scanResults.length;
        this.scanProgress = 'Found ' + this.deviceCount + ' devices...';
        index++;
      } else {
        clearInterval(interval);
        this.isScanning = false;
        this.scanProgress = 'Scan complete: ' + this.deviceCount + ' devices found';
        this.addLog('Scan completed, found ' + this.deviceCount + ' devices');
        hiTraceMeter.finishTrace('ScanPage_startScan', 0);
      }
    }, 300);
  }

  /**
   * Stop scanning.
   */
  private stopScan(): void {
    this.isScanning = false;
    this.scanProgress = 'Scan stopped: ' + this.deviceCount + ' devices found';
    this.addLog('Scan stopped by user');
  }

  /**
   * Add a log entry.
   */
  private addLog(message: string): void {
    hilog.info(DOMAIN, TAG, 'ScanPage: %{public}s', message);
  }

  /**
   * Get signal strength label.
   */
  private getSignalLabel(rssi: number): string {
    if (rssi >= -50) return 'Excellent';
    if (rssi >= -60) return 'Good';
    if (rssi >= -70) return 'Fair';
    return 'Weak';
  }

  build() {
    Column() {
      Row() {
        Text(PageConstants.TITLE_SCAN)
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
      }
      .width('100%')
      .height(PageConstants.NAV_BAR_HEIGHT)
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING })
      .backgroundColor(PageConstants.COLOR_SURFACE)

      // Scan control
      Column() {
        Text(this.scanProgress)
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
        Row({ space: 12 }) {
          Button(this.isScanning ? 'Stop Scan' : 'Start Scan')
            .type(ButtonType.Capsule)
            .height(PageConstants.BUTTON_HEIGHT)
            .backgroundColor(this.isScanning ? PageConstants.COLOR_ERROR : PageConstants.COLOR_PRIMARY)
            .onClick(() => {
              if (this.isScanning) {
                this.stopScan();
              } else {
                this.startScan();
              }
            })
          Text('Devices: ' + this.deviceCount)
            .fontSize(PageConstants.FONT_SIZE_BODY)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
        }
        .margin({ top: 12 })
        .justifyContent(FlexAlign.Center)
        .width('100%')
      }
      .width('100%')
      .padding(PageConstants.CARD_PADDING)
      .margin({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING, top: PageConstants.SECTION_SPACING })
      .backgroundColor(PageConstants.COLOR_SURFACE)
      .borderRadius(PageConstants.CARD_BORDER_RADIUS)

      // Results list
      List({ space: 8 }) {
        ForEach(this.scanResults, (device: ScanResult) => {
          ListItem() {
            Row() {
              Column() {
                Row() {
                  Text(device.name)
                    .fontSize(PageConstants.FONT_SIZE_BODY)
                    .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
                    .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
                  if (device.isBonded) {
                    Text(' Paired')
                      .fontSize(PageConstants.FONT_SIZE_CAPTION)
                      .fontColor(PageConstants.COLOR_SUCCESS)
                      .margin({ left: 8 })
                  }
                }
                Text(device.mac)
                  .fontSize(PageConstants.FONT_SIZE_SMALL)
                  .fontColor(PageConstants.COLOR_TEXT_HINT)
                  .margin({ top: 2 })
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Column() {
                Text(device.type)
                  .fontSize(PageConstants.FONT_SIZE_SMALL)
                  .fontColor(PageConstants.COLOR_PRIMARY)
                Text('RSSI: ' + device.rssi + ' dBm')
                  .fontSize(PageConstants.FONT_SIZE_CAPTION)
                  .fontColor(PageConstants.COLOR_TEXT_HINT)
                  .margin({ top: 2 })
                Text(this.getSignalLabel(device.rssi))
                  .fontSize(PageConstants.FONT_SIZE_CAPTION)
                  .fontColor(device.rssi >= -50 ? PageConstants.COLOR_SUCCESS : PageConstants.COLOR_WARNING)
                  .margin({ top: 2 })
              }
              .alignItems(HorizontalAlign.End)
            }
            .width('100%')
            .padding(12)
            .backgroundColor(PageConstants.COLOR_SURFACE)
            .borderRadius(8)
            .shadow({ radius: 2, color: 'rgba(0,0,0,0.08)', offsetX: 0, offsetY: 1 })
          }
        }, (device: ScanResult) => device.mac)
      }
      .width('100%')
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING, top: PageConstants.SECTION_SPACING })
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(PageConstants.COLOR_BACKGROUND)
  }
}
