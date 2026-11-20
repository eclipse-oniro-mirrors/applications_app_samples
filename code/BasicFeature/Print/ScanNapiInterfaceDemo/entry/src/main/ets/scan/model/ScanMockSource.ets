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
import { scan } from '@kit.BasicServicesKit';

/**
 * 内存中的扫描仪数据源，供无真机调试与界面预览使用。
 * 规则：scannerId 唯一；容量 16；getAll 返回副本，外部修改不影响内部列表。
 */
export class ScanMockSource {
  static readonly CAPACITY: number = 16;

  private devices: scan.ScannerDevice[] = [];

  static createDevice(scannerId: string, uniqueId: string, manufacturer: string, model: string,
    deviceName: string, discoveryMode: scan.ScannerDiscoveryMode): scan.ScannerDevice {
    const device: scan.ScannerDevice = {
      scannerId: scannerId,
      discoveryMode: discoveryMode,
      uniqueId: uniqueId,
      manufacturer: manufacturer,
      model: model,
      deviceName: deviceName
    };
    return device;
  }

  add(device: scan.ScannerDevice): boolean {
    if (this.isFull()) {
      return false;
    }
    if (this.indexOf(device.scannerId) >= 0) {
      return false;
    }
    this.devices.push(device);
    return true;
  }

  remove(scannerId: string): boolean {
    const index: number = this.indexOf(scannerId);
    if (index < 0) {
      return false;
    }
    this.devices.splice(index, 1);
    return true;
  }

  rename(scannerId: string, deviceName: string): boolean {
    const index: number = this.indexOf(scannerId);
    if (index < 0) {
      return false;
    }
    const origin: scan.ScannerDevice = this.devices[index];
    const renamed: scan.ScannerDevice = {
      scannerId: origin.scannerId,
      discoveryMode: origin.discoveryMode,
      uniqueId: origin.uniqueId,
      manufacturer: origin.manufacturer,
      model: origin.model,
      deviceName: deviceName
    };
    this.devices[index] = renamed;
    return true;
  }

  /**
   * 整体替换：容量外的部分直接截断，重复 scannerId 只保留最先出现的一条。
   */
  replace(devices: scan.ScannerDevice[]): void {
    this.devices = [];
    for (let index = 0; index < devices.length; index++) {
      if (this.devices.length >= ScanMockSource.CAPACITY) {
        return;
      }
      if (this.indexOf(devices[index].scannerId) < 0) {
        this.devices.push(devices[index]);
      }
    }
  }

  getAll(): scan.ScannerDevice[] {
    return this.devices.slice(0);
  }

  count(): number {
    return this.devices.length;
  }

  isEmpty(): boolean {
    return this.devices.length === 0;
  }

  isFull(): boolean {
    return this.devices.length >= ScanMockSource.CAPACITY;
  }

  indexOf(scannerId: string): number {
    for (let index = 0; index < this.devices.length; index++) {
      if (this.devices[index].scannerId === scannerId) {
        return index;
      }
    }
    return -1;
  }

  first(): scan.ScannerDevice | undefined {
    if (this.devices.length === 0) {
      return undefined;
    }
    return this.devices[0];
  }

  countByMode(mode: scan.ScannerDiscoveryMode): number {
    let count: number = 0;
    for (let index = 0; index < this.devices.length; index++) {
      if (this.devices[index].discoveryMode === mode) {
        count++;
      }
    }
    return count;
  }

  reset(): void {
    this.devices = [];
  }
}
