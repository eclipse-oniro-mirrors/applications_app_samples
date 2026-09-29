/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start import_softbus_base]
import softbusBase from '@ohos.distributed.softbusBase';
// [End import_softbus_base]
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../util/Logger';

// Maximum number of log entries kept on screen.
const MAX_LOG_COUNT = 200;
// Length of the custom payload carried in perception advertising.
const CUSTOM_DATA_LENGTH = 4;
// Custom payload bytes carried in perception advertising.
const CUSTOM_DATA_BYTES: number[] = [0x01, 0x02, 0x03, 0x04];

/**
 * Log entry structure.
 */
interface LogEntry {
  id: number;
  time: string;
  api: string;
  success: boolean;
  detail: string;
}

/**
 * SoftBus perception (softbusBase) debugging page.
 * Six buttons call the six softbusBase APIs. Every call is wrapped in
 * try/catch so the app never crashes. A scrolling log window below shows the
 * return value or error code of each call in real time.
 */
@Entry
@Component
struct Index {
  @State logs: LogEntry[] = [];
  private logCounter: number = 0;

  /**
   * Build an HH:mm:ss.SSS timestamp.
   */
  private getTimeStamp(): string {
    const d = new Date();
    const h = d.getHours().toString().padStart(2, '0');
    const m = d.getMinutes().toString().padStart(2, '0');
    const s = d.getSeconds().toString().padStart(2, '0');
    const ms = d.getMilliseconds().toString().padStart(3, '0');
    return `${h}:${m}:${s}.${ms}`;
  }

  /**
   * Convert an ArrayBuffer to a readable hex string.
   */
  private arrayBufferToHex(buf: ArrayBuffer): string {
    if (!buf || buf.byteLength === 0) {
      return '(empty)';
    }
    const bytes = new Uint8Array(buf);
    let hex = '';
    for (let i = 0; i < bytes.length; i++) {
      hex += bytes[i].toString(16).padStart(2, '0') + ' ';
    }
    return hex.trim();
  }

  /**
   * Build the custom payload (<=5 bytes) carried in advertising.
   */
  private buildCustomData(): ArrayBuffer {
    const buf = new ArrayBuffer(CUSTOM_DATA_LENGTH);
    const view = new Uint8Array(buf);
    for (let i = 0; i < CUSTOM_DATA_BYTES.length; i++) {
      view[i] = CUSTOM_DATA_BYTES[i];
    }
    return buf;
  }

  /**
   * Fetch a resource string, substituting positional args.
   */
  private getString(res: Resource, ...args: Array<number | string>): string {
    const context = this.getUIContext().getHostContext();
    if (!context) {
      return '';
    }
    try {
      return context.resourceManager.getStringSync(res.id, ...args);
    } catch (e) {
      return '';
    }
  }

  /**
   * Append a log entry (newest on top) and mirror it to hilog.
   */
  private addLog(api: string, success: boolean, detail: string): void {
    const entry: LogEntry = {
      id: ++this.logCounter,
      time: this.getTimeStamp(),
      api: api,
      success: success,
      detail: detail,
    };
    this.logs = [entry].concat(this.logs);
    if (this.logs.length > MAX_LOG_COUNT) {
      this.logs = this.logs.slice(0, MAX_LOG_COUNT);
    }
    if (success) {
      Logger.info('%{public}s %{public}s OK: %{public}s', entry.time, api, detail);
    } else {
      Logger.error('%{public}s %{public}s FAIL: %{public}s', entry.time, api, detail);
    }
  }

  /**
   * Format the device list returned by getPerceptionDeviceList.
   */
  private formatDeviceList(devices: softbusBase.PerceptionDeviceInfo[]): string {
    if (!devices || devices.length === 0) {
      return this.getString($r('app.string.log_get_list_empty'));
    }
    let result = this.getString($r('app.string.log_get_list_count'), devices.length);
    for (let i = 0; i < devices.length; i++) {
      const dev = devices[i];
      result += `\n  [${i}] deviceType=${dev.deviceType}, deviceId=${this.arrayBufferToHex(dev.deviceId)}, customData=${this.arrayBufferToHex(dev.customData)}`;
    }
    return result;
  }

  // ============ Six API wrappers (all wrapped in try/catch) ============

  async callStartPerceptionAdv(): Promise<void> {
    const apiName = 'startPerceptionAdv';
    try {
      // [Start start_adv]
      const type = softbusBase.PerceptionType.PERCEPTION_TYPE_COLLABORATIVE_WAKE;
      const customData = this.buildCustomData();
      await softbusBase.startPerceptionAdv(type, customData);
      // [End start_adv]
      this.addLog(apiName, true, this.getString($r('app.string.log_start_adv_success')));
    } catch (e) {
      const err = e as BusinessError;
      this.addLog(apiName, false, `code=${err.code}, message=${err.message}`);
    }
  }

  async callSetPerceptionAdvHighFreq(): Promise<void> {
    const apiName = 'setPerceptionAdvHighFreq';
    try {
      // [Start set_high_freq]
      const type = softbusBase.PerceptionType.PERCEPTION_TYPE_COLLABORATIVE_WAKE;
      const customData = this.buildCustomData();
      await softbusBase.setPerceptionAdvHighFreq(type, customData);
      // [End set_high_freq]
      this.addLog(apiName, true, this.getString($r('app.string.log_high_freq_success')));
    } catch (e) {
      const err = e as BusinessError;
      this.addLog(apiName, false, `code=${err.code}, message=${err.message}`);
    }
  }

  async callStopPerceptionAdv(): Promise<void> {
    const apiName = 'stopPerceptionAdv';
    try {
      // [Start stop_adv]
      const type = softbusBase.PerceptionType.PERCEPTION_TYPE_COLLABORATIVE_WAKE;
      await softbusBase.stopPerceptionAdv(type);
      // [End stop_adv]
      this.addLog(apiName, true, this.getString($r('app.string.log_stop_adv_success')));
    } catch (e) {
      const err = e as BusinessError;
      this.addLog(apiName, false, `code=${err.code}, message=${err.message}`);
    }
  }

  async callStartPerceptionScan(): Promise<void> {
    const apiName = 'startPerceptionScan';
    try {
      // [Start start_scan]
      const type = softbusBase.PerceptionType.PERCEPTION_TYPE_COLLABORATIVE_WAKE;
      const cycle = softbusBase.PerceptionCycle.PERCEPTION_CYCLE_MEDIUM;
      await softbusBase.startPerceptionScan(type, cycle);
      // [End start_scan]
      this.addLog(apiName, true, this.getString($r('app.string.log_start_scan_success')));
    } catch (e) {
      const err = e as BusinessError;
      this.addLog(apiName, false, `code=${err.code}, message=${err.message}`);
    }
  }

  async callStopPerceptionScan(): Promise<void> {
    const apiName = 'stopPerceptionScan';
    try {
      // [Start stop_scan]
      const type = softbusBase.PerceptionType.PERCEPTION_TYPE_COLLABORATIVE_WAKE;
      await softbusBase.stopPerceptionScan(type);
      // [End stop_scan]
      this.addLog(apiName, true, this.getString($r('app.string.log_stop_scan_success')));
    } catch (e) {
      const err = e as BusinessError;
      this.addLog(apiName, false, `code=${err.code}, message=${err.message}`);
    }
  }

  async callGetPerceptionDeviceList(): Promise<void> {
    const apiName = 'getPerceptionDeviceList';
    try {
      // [Start get_device_list]
      const type = softbusBase.PerceptionType.PERCEPTION_TYPE_COLLABORATIVE_WAKE;
      const devices = await softbusBase.getPerceptionDeviceList(type);
      // [End get_device_list]
      this.addLog(apiName, true, this.formatDeviceList(devices));
    } catch (e) {
      const err = e as BusinessError;
      this.addLog(apiName, false, `code=${err.code}, message=${err.message}`);
    }
  }

  clearLogs(): void {
    this.logs = [];
    Logger.info('%{public}s', this.getString($r('app.string.log_cleared')));
  }

  build() {
    Column() {
      // ===== Title =====
      Column() {
        Text($r('app.string.title_main'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.title_text'))
        Text($r('app.string.title_subtitle'))
          .fontSize(11)
          .fontColor($r('app.color.secondary_text'))
          .margin({ top: 4 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: 12 })

      // ===== Six API buttons =====
      Column() {
        Row() {
          Button() {
            Column() {
              Text($r('app.string.btn_start_adv'))
                .fontSize(15)
                .fontColor($r('app.color.button_text'))
                .fontWeight(FontWeight.Medium)
              Text($r('app.string.btn_start_adv_sub'))
                .fontSize(9)
                .fontColor($r('app.color.button_text'))
                .opacity(0.85)
                .margin({ top: 2 })
            }
          }
          .type(ButtonType.Capsule)
          .backgroundColor($r('app.color.start_adv'))
          .layoutWeight(1)
          .height(52)
          .margin({ right: 3 })
          .onClick(() => { this.callStartPerceptionAdv(); })

          Button() {
            Column() {
              Text($r('app.string.btn_set_high_freq'))
                .fontSize(15)
                .fontColor($r('app.color.button_text'))
                .fontWeight(FontWeight.Medium)
              Text($r('app.string.btn_set_high_freq_sub'))
                .fontSize(9)
                .fontColor($r('app.color.button_text'))
                .opacity(0.85)
                .margin({ top: 2 })
            }
          }
          .type(ButtonType.Capsule)
          .backgroundColor($r('app.color.high_freq'))
          .layoutWeight(1)
          .height(52)
          .margin({ left: 3 })
          .onClick(() => { this.callSetPerceptionAdvHighFreq(); })
        }
        .width('100%')
        .margin({ bottom: 8 })

        Row() {
          Button() {
            Column() {
              Text($r('app.string.btn_stop_adv'))
                .fontSize(15)
                .fontColor($r('app.color.button_text'))
                .fontWeight(FontWeight.Medium)
              Text($r('app.string.btn_stop_adv_sub'))
                .fontSize(9)
                .fontColor($r('app.color.button_text'))
                .opacity(0.85)
                .margin({ top: 2 })
            }
          }
          .type(ButtonType.Capsule)
          .backgroundColor($r('app.color.stop_adv'))
          .layoutWeight(1)
          .height(52)
          .margin({ right: 3 })
          .onClick(() => { this.callStopPerceptionAdv(); })

          Button() {
            Column() {
              Text($r('app.string.btn_start_scan'))
                .fontSize(15)
                .fontColor($r('app.color.button_text'))
                .fontWeight(FontWeight.Medium)
              Text($r('app.string.btn_start_scan_sub'))
                .fontSize(9)
                .fontColor($r('app.color.button_text'))
                .opacity(0.85)
                .margin({ top: 2 })
            }
          }
          .type(ButtonType.Capsule)
          .backgroundColor($r('app.color.start_scan'))
          .layoutWeight(1)
          .height(52)
          .margin({ left: 3 })
          .onClick(() => { this.callStartPerceptionScan(); })
        }
        .width('100%')
        .margin({ bottom: 8 })

        Row() {
          Button() {
            Column() {
              Text($r('app.string.btn_stop_scan'))
                .fontSize(15)
                .fontColor($r('app.color.button_text'))
                .fontWeight(FontWeight.Medium)
              Text($r('app.string.btn_stop_scan_sub'))
                .fontSize(9)
                .fontColor($r('app.color.button_text'))
                .opacity(0.85)
                .margin({ top: 2 })
            }
          }
          .type(ButtonType.Capsule)
          .backgroundColor($r('app.color.stop_scan'))
          .layoutWeight(1)
          .height(52)
          .margin({ right: 3 })
          .onClick(() => { this.callStopPerceptionScan(); })

          Button() {
            Column() {
              Text($r('app.string.btn_get_devices'))
                .fontSize(15)
                .fontColor($r('app.color.button_text'))
                .fontWeight(FontWeight.Medium)
              Text($r('app.string.btn_get_devices_sub'))
                .fontSize(9)
                .fontColor($r('app.color.button_text'))
                .opacity(0.85)
                .margin({ top: 2 })
            }
          }
          .type(ButtonType.Capsule)
          .backgroundColor($r('app.color.get_devices'))
          .layoutWeight(1)
          .height(52)
          .margin({ left: 3 })
          .onClick(() => { this.callGetPerceptionDeviceList(); })
        }
        .width('100%')

        Text($r('app.string.tip_system_api'))
          .fontSize(10)
          .fontColor($r('app.color.hint_text'))
          .margin({ top: 8 })
          .width('100%')
      }
      .width('100%')
      .margin({ bottom: 12 })

      // ===== Log window title bar =====
      Row() {
        Text($r('app.string.log_title'))
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.title_text'))
          .layoutWeight(1)
        Text($r('app.string.log_count', this.logs.length))
          .fontSize(11)
          .fontColor($r('app.color.secondary_text'))
          .margin({ right: 8 })
        Button($r('app.string.btn_clear'))
          .fontSize(12)
          .height(28)
          .type(ButtonType.Capsule)
          .backgroundColor($r('app.color.clear_button'))
          .fontColor($r('app.color.clear_button_text'))
          .onClick(() => this.clearLogs())
      }
      .width('100%')
      .margin({ bottom: 6 })

      // ===== Scrolling log window =====
      Scroll() {
        Column() {
          if (this.logs.length === 0) {
            Text($r('app.string.log_empty'))
              .fontSize(12)
              .fontColor($r('app.color.hint_text'))
              .margin({ top: 20 })
          }
          ForEach(this.logs, (item: LogEntry) => {
            Column() {
              Row() {
                Text(item.time)
                  .fontSize(10)
                  .fontColor($r('app.color.secondary_text'))
                Text(' ' + item.api)
                  .fontSize(11)
                  .fontWeight(FontWeight.Bold)
                  .fontColor($r('app.color.title_text'))
                Text(item.success ? '  PASS' : '  FAIL')
                  .fontSize(10)
                  .fontColor(item.success ? $r('app.color.success_text') : $r('app.color.fail_text'))
              }
              .width('100%')
              .alignItems(VerticalAlign.Center)

              Text(item.detail)
                .fontSize(11)
                .fontColor($r('app.color.detail_text'))
                .width('100%')
                .margin({ top: 4 })
            }
            .width('100%')
            .padding(8)
            .margin({ bottom: 6 })
            .borderRadius(6)
            .backgroundColor($r('app.color.card_background'))
            .alignItems(HorizontalAlign.Start)
          }, (item: LogEntry) => item.id.toString())
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .layoutWeight(1)
      .width('100%')
      .align(Alignment.Top)
      .backgroundColor($r('app.color.panel_background'))
      .border({ width: 1, color: $r('app.color.divider'), radius: 6 })
    }
    .width('100%')
    .height('100%')
    .padding(12)
    .backgroundColor($r('app.color.page_background'))
  }
}
