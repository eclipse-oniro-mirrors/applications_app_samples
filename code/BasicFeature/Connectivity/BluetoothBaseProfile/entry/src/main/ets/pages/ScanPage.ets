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

import { hilog, hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { PageConstants, BluetoothConstants } from 'library';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/** Trace name for scan operation. */
const TRACE_NAME: string = 'ScanPage_startScan';
/** Interval between mock device discoveries in milliseconds. */
const SCAN_TICK_MS: number = 300;
/** RSSI threshold (dBm) for excellent signal. */
const RSSI_EXCELLENT: number = -50;
/** RSSI threshold (dBm) for good signal. */
const RSSI_GOOD: number = -60;
/** RSSI threshold (dBm) for fair signal. */
const RSSI_FAIR: number = -70;
/** Small margin used inside scan result cards (vp). */
const MARGIN_SMALL: number = 2;
/** Medium margin used inside scan result cards (vp). */
const MARGIN_MEDIUM: number = 8;
/** Padding around scan result cards (vp). */
const CARD_INNER_PADDING: number = 12;
/** Border radius of scan result cards (vp). */
const CARD_INNER_RADIUS: number = 8;
/** Space between scan result list items (vp). */
const LIST_ITEM_SPACE: number = 8;

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
  @State scanProgress: Resource = $r('app.string.scan_ready');
  @State deviceCount: number = 0;
  private scanTimerId: number = -1;

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, 'ScanPage aboutToAppear');
  }

  aboutToDisappear(): void {
    hilog.info(DOMAIN, TAG, 'ScanPage aboutToDisappear');
    this.clearScanTimer();
  }

  /**
   * Clear the pending scan interval and close the trace if still open.
   */
  private clearScanTimer(): void {
    if (this.scanTimerId !== -1) {
      clearInterval(this.scanTimerId);
      this.scanTimerId = -1;
      if (this.isScanning) {
        hiTraceMeter.finishTrace(TRACE_NAME, 0);
      }
    }
  }

  /**
   * Start scanning for devices.
   */
  private startScan(): void {
    hiTraceMeter.startTrace(TRACE_NAME, 0);
    this.isScanning = true;
    this.scanResults = [];
    this.deviceCount = 0;
    this.scanProgress = $r('app.string.scan_scanning');
    this.addLog('Starting Bluetooth scan');

    // Simulate device discovery
    const mockDevices: ScanResult[] = [
      { name: 'JBL Flip 6', mac: '11:22:33:44:55:01', rssi: -45, type: 'Audio', isBonded: true },
      { name: 'Sony WH-1000XM5', mac: '11:22:33:44:55:02', rssi: -38, type: 'Audio', isBonded: true },
      { name: 'Logitech K380', mac: '11:22:33:44:55:10', rssi: -50, type: 'Input', isBonded: true },
      { name: 'Microsoft Arc Mouse', mac: '11:22:33:44:55:11', rssi: -55, type: 'Input', isBonded: false },
      { name: 'Demo Health Watch', mac: '11:22:33:44:55:20', rssi: -40, type: 'Health', isBonded: true },
      { name: 'Samsung Galaxy S24', mac: '11:22:33:44:55:30', rssi: -35, type: 'Phone', isBonded: true },
      { name: 'Unknown Device', mac: '11:22:33:44:55:40', rssi: -72, type: 'Unknown', isBonded: false },
      { name: 'BT-Gamepad-Pro', mac: '11:22:33:44:55:50', rssi: -60, type: 'Input', isBonded: false },
    ];

    let index: number = 0;
    this.scanTimerId = setInterval(() => {
      if (index < mockDevices.length) {
        this.scanResults.push(mockDevices[index]);
        this.deviceCount = this.scanResults.length;
        index++;
      } else {
        clearInterval(this.scanTimerId);
        this.scanTimerId = -1;
        this.isScanning = false;
        this.scanProgress = $r('app.string.scan_complete');
        this.addLog(`Scan completed, found ${this.deviceCount} devices`);
        hiTraceMeter.finishTrace(TRACE_NAME, 0);
      }
    }, SCAN_TICK_MS);
  }

  /**
   * Stop scanning.
   */
  private stopScan(): void {
    this.clearScanTimer();
    this.isScanning = false;
    this.scanProgress = $r('app.string.scan_stopped');
    this.addLog('Scan stopped by user');
  }

  /**
   * Add a log entry.
   */
  private addLog(message: string): void {
    hilog.info(DOMAIN, TAG, 'ScanPage: %{public}s', message);
  }

  /**
   * Get signal strength label as a resource reference.
   */
  private getSignalLabel(rssi: number): Resource {
    if (rssi >= RSSI_EXCELLENT) {
      return $r('app.string.scan_signal_excellent');
    }
    if (rssi >= RSSI_GOOD) {
      return $r('app.string.scan_signal_good');
    }
    if (rssi >= RSSI_FAIR) {
      return $r('app.string.scan_signal_fair');
    }
    return $r('app.string.scan_signal_weak');
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.title_scan'))
          .fontSize(PageConstants.FONT_SIZE_TITLE)
          .fontWeight(PageConstants.FONT_WEIGHT_BOLD)
          .fontColor(PageConstants.COLOR_TEXT_PRIMARY)
      }
      .width('100%')
      .height(PageConstants.NAV_BAR_HEIGHT)
      .padding({ left: PageConstants.PAGE_PADDING, right: PageConstants.PAGE_PADDING })
      .backgroundColor(PageConstants.COLOR_CARD)

      // Scan control
      Column() {
        Text(this.scanProgress)
          .fontSize(PageConstants.FONT_SIZE_BODY)
          .fontColor(PageConstants.COLOR_TEXT_SECONDARY)
        Row({ space: PageConstants.ITEM_SPACING }) {
          Button(this.isScanning ? $r('app.string.scan_stop') : $r('app.string.scan_start'))
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
          Text($r('app.string.scan_devices_prefix'))
            .fontSize(PageConstants.FONT_SIZE_BODY)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
          Text(`${this.deviceCount}`)
            .fontSize(PageConstants.FONT_SIZE_BODY)
            .fontColor(PageConstants.COLOR_TEXT_HINT)
        }
        .margin({ top: PageConstants.ITEM_SPACING })
        .justifyContent(FlexAlign.Center)
        .width('100%')
      }
      .width('100%')
      .padding(PageConstants.CARD_PADDING)
      .margin({
        left: PageConstants.PAGE_PADDING,
        right: PageConstants.PAGE_PADDING,
        top: PageConstants.SECTION_SPACING
      })
      .backgroundColor(PageConstants.COLOR_CARD)
      .borderRadius(PageConstants.CARD_BORDER_RADIUS)

      // Results list
      List({ space: LIST_ITEM_SPACE }) {
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
                    Text($r('app.string.scan_paired_badge'))
                      .fontSize(PageConstants.FONT_SIZE_CAPTION)
                      .fontColor(PageConstants.COLOR_SUCCESS)
                      .margin({ left: MARGIN_MEDIUM })
                  }
                }
                Text(device.mac)
                  .fontSize(PageConstants.FONT_SIZE_SMALL)
                  .fontColor(PageConstants.COLOR_TEXT_HINT)
                  .margin({ top: MARGIN_SMALL })
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Column() {
                Text(device.type)
                  .fontSize(PageConstants.FONT_SIZE_SMALL)
                  .fontColor(PageConstants.COLOR_PRIMARY)
                Row() {
                  Text($r('app.string.scan_rssi_prefix'))
                    .fontSize(PageConstants.FONT_SIZE_CAPTION)
                    .fontColor(PageConstants.COLOR_TEXT_HINT)
                  Text(`${device.rssi} dBm`)
                    .fontSize(PageConstants.FONT_SIZE_CAPTION)
                    .fontColor(PageConstants.COLOR_TEXT_HINT)
                }
                .margin({ top: MARGIN_SMALL })
                Text(this.getSignalLabel(device.rssi))
                  .fontSize(PageConstants.FONT_SIZE_CAPTION)
                  .fontColor(device.rssi >= RSSI_EXCELLENT
                    ? PageConstants.COLOR_SUCCESS
                    : PageConstants.COLOR_WARNING)
                  .margin({ top: MARGIN_SMALL })
              }
              .alignItems(HorizontalAlign.End)
            }
            .width('100%')
            .padding(CARD_INNER_PADDING)
            .backgroundColor(PageConstants.COLOR_CARD)
            .borderRadius(CARD_INNER_RADIUS)
            .shadow({
              radius: 2,
              color: 'rgba(0,0,0,0.08)',
              offsetX: 0,
              offsetY: 1
            })
          }
        }, (device: ScanResult) => device.mac)
      }
      .width('100%')
      .padding({
        left: PageConstants.PAGE_PADDING,
        right: PageConstants.PAGE_PADDING,
        top: PageConstants.SECTION_SPACING
      })
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(PageConstants.COLOR_BACKGROUND)
  }
}
