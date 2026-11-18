/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { BusinessError } from '@kit.BasicServicesKit';
import testNapi, { FreeResult, UsbDeviceInfo } from 'libentry.so';

const ERROR_MARK = 'ERR:';

function pad2(value: number): string {
  return value < 10 ? `0${value}` : `${value}`;
}

function nowText(): string {
  const date = new Date();
  return `${pad2(date.getHours())}:${pad2(date.getMinutes())}:${pad2(date.getSeconds())}`;
}

function hex4(value: number): string {
  const text = value.toString(16).toUpperCase();
  return `0x${text.padStart(4, '0')}`;
}

@Entry
@Component
struct Index {
  @State devices: UsbDeviceInfo[] = [];
  @State selectedIndex: number = -1;
  @State logs: string[] = [];
  @State connected: boolean = false;
  @State currentFd: number = -1;
  @State busy: boolean = false;
  private scroller: Scroller = new Scroller();

  private rstr(resource: Resource, ...args: Array<string | number>): string {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return '';
    }
    return context.resourceManager.getStringSync(resource.id, ...args);
  }

  aboutToAppear(): void {
    this.connected = testNapi.isPipeConnected();
    this.log(this.rstr($r('app.string.log_ready')));
    this.log(this.rstr($r('app.string.log_api_coverage')));
  }

  private log(message: string): void {
    this.logs.push(`[${nowText()}] ${message}`);
    this.scroller.scrollEdge(Edge.Bottom);
  }

  private selectedDevice(): UsbDeviceInfo | undefined {
    if (this.selectedIndex >= 0 && this.selectedIndex < this.devices.length) {
      return this.devices[this.selectedIndex];
    }
    return undefined;
  }

  private selectedNameText(): string {
    const device = this.selectedDevice();
    if (device === undefined) {
      return this.rstr($r('app.string.status_none'));
    }
    return device.name;
  }

  private interfaceTotal(device: UsbDeviceInfo): number {
    let total: number = 0;
    for (const config of device.configs) {
      total += config.interfaceCount;
    }
    return total;
  }

  private endpointTotal(device: UsbDeviceInfo): number {
    let total: number = 0;
    for (const config of device.configs) {
      for (const iface of config.interfaces) {
        total += iface.endpointCount;
      }
    }
    return total;
  }

  private logError(action: string, error: Error): void {
    const businessError = error as BusinessError;
    this.log(this.rstr($r('app.string.log_action_failed'), action, `${businessError.code}`,
      businessError.message));
  }

  private refreshDevices(): void {
    this.busy = true;
    try {
      const list: UsbDeviceInfo[] = testNapi.getDeviceList();
      this.devices = list;
      this.selectedIndex = list.length > 0 ? 0 : -1;
      this.log(this.rstr($r('app.string.log_get_list_success'), list.length));
      for (let i = 0; i < list.length; i++) {
        const device = list[i];
        const manufacturer = device.manufacturerName === '' ? 'N/A' : device.manufacturerName;
        const product = device.productName === '' ? 'N/A' : device.productName;
        this.log(`  [${i}] ${device.name} | VID=${hex4(device.vendorId)} PID=${hex4(device.productId)} | ` +
          `${this.rstr($r('app.string.label_manufacturer'))}${manufacturer} ` +
          `${this.rstr($r('app.string.label_product'))}${product} ` +
          `${this.rstr($r('app.string.label_version'))}${device.version} | ` +
          `class=${device.clazz}/${device.subClass}/${device.protocol} | ` +
          `${this.rstr($r('app.string.label_config'))}${device.configCount} ` +
          `${this.rstr($r('app.string.label_interface'))}${this.interfaceTotal(device)} ` +
          `${this.rstr($r('app.string.label_endpoint'))}${this.endpointTotal(device)}`);
      }
      if (list.length === 0) {
        this.log(this.rstr($r('app.string.log_no_device')));
      }
    } catch (e) {
      this.logError('GetUsbDeviceList', e as Error);
    }
    this.busy = false;
  }

  private releaseDevices(): void {
    try {
      const result: FreeResult = testNapi.freeDeviceList();
      if (result.freed) {
        this.log(this.rstr($r('app.string.log_free_success'), result.deviceCount));
      } else {
        this.log(this.rstr($r('app.string.log_free_nothing')));
      }
      this.devices = [];
      this.selectedIndex = -1;
    } catch (e) {
      this.logError('FreeDeviceList', e as Error);
    }
  }

  private queryPermission(): void {
    const device = this.selectedDevice();
    if (device === undefined) {
      this.log(this.rstr($r('app.string.log_select_device_first')));
      return;
    }
    try {
      const granted: boolean = testNapi.hasPermission(device.name);
      const state: string = granted ? this.rstr($r('app.string.status_granted')) :
        this.rstr($r('app.string.status_not_granted'));
      this.log(`HasPermission("${device.name}") = ${state}`);
    } catch (e) {
      this.logError('HasPermission', e as Error);
    }
  }

  private async requestPermission(): Promise<void> {
    const device = this.selectedDevice();
    if (device === undefined) {
      this.log(this.rstr($r('app.string.log_select_device_first')));
      return;
    }
    this.busy = true;
    this.log(this.rstr($r('app.string.log_request_sent'), device.name));
    try {
      const granted: boolean = await testNapi.requestPermission(device.name);
      const state: string = granted ? this.rstr($r('app.string.status_user_allowed')) :
        this.rstr($r('app.string.status_user_denied'));
      this.log(this.rstr($r('app.string.log_request_result'), state));
    } catch (e) {
      this.logError('RequestPermission', e as Error);
    }
    this.busy = false;
  }

  private connectDevice(): void {
    const device = this.selectedDevice();
    if (device === undefined) {
      this.log(this.rstr($r('app.string.log_select_device_first')));
      return;
    }
    try {
      const pipe = testNapi.connectDevice(device.busNum, device.devAddress);
      this.connected = true;
      this.currentFd = -1;
      this.log(this.rstr($r('app.string.log_connect_success'), pipe.busNum, pipe.devAddress));
    } catch (e) {
      this.logError('ConnectDevice', e as Error);
    }
  }

  private queryFd(): void {
    try {
      const fd: number = testNapi.getFileDescriptor();
      this.currentFd = fd;
      this.log(this.rstr($r('app.string.log_get_fd_success'), fd));
    } catch (e) {
      this.logError('GetFileDescriptor', e as Error);
    }
  }

  private closePipe(): void {
    try {
      const closed: boolean = testNapi.closePipe();
      this.connected = false;
      this.currentFd = -1;
      this.log(this.rstr($r('app.string.log_close_result'), `${closed}`));
    } catch (e) {
      this.logError('ClosePipe', e as Error);
    }
  }

  private clearLogs(): void {
    this.logs = [];
  }

  build() {
    Column({ space: 10 }) {
      Text($r('app.string.page_title'))
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')

      Row({ space: 10 }) {
        Button($r('app.string.btn_get_device_list'))
          .fontSize(13)
          .height(40)
          .layoutWeight(1)
          .enabled(this.devices.length === 0 && !this.busy)
          .onClick(() => {
            this.refreshDevices();
          })
        Button($r('app.string.btn_free_device_list'))
          .fontSize(13)
          .height(40)
          .layoutWeight(1)
          .enabled(this.devices.length > 0 && !this.busy)
          .onClick(() => {
            this.releaseDevices();
          })
      }
      .width('100%')

      List({ space: 8 }) {
        ForEach(this.devices, (device: UsbDeviceInfo, index: number) => {
          ListItem() {
            Column({ space: 4 }) {
              Row({ space: 8 }) {
                Text(this.selectedIndex === index ? '●' : '○')
                  .fontSize(16)
                  .fontColor(this.selectedIndex === index ? '#0A59F7' : '#6B7B8D')
                Text(device.name)
                  .fontSize(15)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#182431')
                Text(device.productName === '' ? 'N/A' : device.productName)
                  .fontSize(13)
                  .fontColor('#6B7B8D')
                  .layoutWeight(1)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
              }
              .width('100%')

              Text(`VID=${hex4(device.vendorId)} PID=${hex4(device.productId)} bus=${device.busNum} ` +
                `addr=${device.devAddress} ` +
                `${this.rstr($r('app.string.label_manufacturer'))}${device.manufacturerName === '' ? 'N/A' : device.manufacturerName}`)
                .fontSize(12)
                .fontColor('#6B7B8D')
                .width('100%')
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })

              Text(`${this.rstr($r('app.string.label_config'))}${device.configCount} ` +
                `${this.rstr($r('app.string.label_interface'))}${this.interfaceTotal(device)} ` +
                `${this.rstr($r('app.string.label_endpoint'))}${this.endpointTotal(device)}`)
                .fontSize(12)
                .fontColor('#6B7B8D')
                .width('100%')
            }
            .padding(10)
            .borderRadius(10)
            .backgroundColor(this.selectedIndex === index ? '#E8F0FF' : '#F1F3F5')
            .onClick(() => {
              this.selectedIndex = index;
            })
          }
        }, (device: UsbDeviceInfo) => device.name)
      }
      .layoutWeight(1)
      .width('100%')
      .scrollBar(BarState.Auto)

      if (this.devices.length === 0) {
        Text($r('app.string.empty_device_list'))
          .fontSize(13)
          .fontColor('#9AA5B1')
          .padding(8)
      }

      Row({ space: 10 }) {
        Button($r('app.string.btn_has_permission'))
          .fontSize(13)
          .height(40)
          .layoutWeight(1)
          .enabled(this.selectedIndex >= 0 && !this.busy)
          .onClick(() => {
            this.queryPermission();
          })
        Button($r('app.string.btn_request_permission'))
          .fontSize(13)
          .height(40)
          .layoutWeight(1)
          .enabled(this.selectedIndex >= 0 && !this.busy)
          .onClick(() => {
            this.requestPermission();
          })
      }
      .width('100%')

      Row({ space: 10 }) {
        Button($r('app.string.btn_connect_device'))
          .fontSize(13)
          .height(40)
          .layoutWeight(1)
          .enabled(this.selectedIndex >= 0)
          .onClick(() => {
            this.connectDevice();
          })
        Button($r('app.string.btn_get_fd'))
          .fontSize(13)
          .height(40)
          .layoutWeight(1)
          .enabled(this.connected)
          .onClick(() => {
            this.queryFd();
          })
      }
      .width('100%')

      Row({ space: 10 }) {
        Button($r('app.string.btn_close_pipe'))
          .fontSize(13)
          .height(40)
          .layoutWeight(1)
          .enabled(this.connected)
          .onClick(() => {
            this.closePipe();
          })
        Button($r('app.string.btn_clear_logs'))
          .fontSize(13)
          .height(40)
          .layoutWeight(1)
          .onClick(() => {
            this.clearLogs();
          })
      }
      .width('100%')

      Row({ space: 8 }) {
        Text(this.rstr($r('app.string.status_selected'), this.selectedNameText()))
          .fontSize(12)
          .fontColor('#182431')
        Text(this.rstr($r('app.string.status_pipe'), this.connected ?
          this.rstr($r('app.string.status_connected')) : this.rstr($r('app.string.status_disconnected'))))
          .fontSize(12)
          .fontColor(this.connected ? '#0F9D58' : '#6B7B8D')
        Text(`| fd: ${this.currentFd >= 0 ? this.currentFd : '-'}`)
          .fontSize(12)
          .fontColor('#182431')
      }
      .width('100%')

      Scroll(this.scroller) {
        Column({ space: 2 }) {
          ForEach(this.logs, (line: string) => {
            Text(line)
              .fontSize(11)
              .fontColor(line.includes(ERROR_MARK) ? '#FF7A7A' : '#C9D5E3')
              .width('100%')
              .textAlign(TextAlign.Start)
          }, (line: string, index: number) => `${index}-${line}`)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .width('100%')
      .height(180)
      .padding(8)
      .borderRadius(10)
      .backgroundColor('#101828')
    }
    .height('100%')
    .width('100%')
    .padding(12)
    .backgroundColor('#FFFFFF')
  }
}
