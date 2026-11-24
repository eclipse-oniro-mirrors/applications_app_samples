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
 * 扫描仪目录：发现结果与同步事件合并成一份设备列表。
 * 规则：delete 按 scannerId 移除；update 只改 id，不新增设备（同步事件不含厂商信息）。
 */
export class ScannerDirectory {
  public static readonly CAPACITY: number = 16;
  public static readonly UNKNOWN_LABEL: string = 'scan_device_unknown';

  static findIndex(devices: scan.ScannerDevice[], scannerId: string): number {
    for (let index = 0; index < devices.length; index++) {
      if (devices[index].scannerId === scannerId) {
        return index;
      }
    }
    return -1;
  }

  static findById(devices: scan.ScannerDevice[], scannerId: string): scan.ScannerDevice | undefined {
    const index: number = ScannerDirectory.findIndex(devices, scannerId);
    if (index < 0) {
      return undefined;
    }
    return devices[index];
  }

  static removeById(devices: scan.ScannerDevice[], scannerId: string): scan.ScannerDevice[] {
    const result: scan.ScannerDevice[] = [];
    for (let index = 0; index < devices.length; index++) {
      if (devices[index].scannerId !== scannerId) {
        result.push(devices[index]);
      }
    }
    return result;
  }

  /**
   * update 事件：oldScannerId 存在时按旧 id 定位并替换 id；否则按新 id 定位刷新发现方式。
   */
  static applyUpdate(devices: scan.ScannerDevice[], sync: scan.ScannerSyncDevice): scan.ScannerDevice[] {
    const result: scan.ScannerDevice[] = devices.slice(0);
    const oldId: string | undefined = sync.oldScannerId;
    let targetIndex: number = -1;
    if (oldId !== undefined && oldId.length > 0) {
      targetIndex = ScannerDirectory.findIndex(result, oldId);
    }
    if (targetIndex < 0) {
      targetIndex = ScannerDirectory.findIndex(result, sync.scannerId);
    }
    if (targetIndex < 0) {
      return result;
    }
    const updated: scan.ScannerDevice = {
      scannerId: sync.scannerId,
      discoveryMode: sync.discoveryMode,
      uniqueId: sync.uniqueId,
      manufacturer: result[targetIndex].manufacturer,
      model: result[targetIndex].model,
      deviceName: result[targetIndex].deviceName
    };
    result[targetIndex] = updated;
    return result;
  }

  static merge(devices: scan.ScannerDevice[], sync: scan.ScannerSyncDevice): scan.ScannerDevice[] {
    if (sync.syncMode === scan.ScannerSyncMode.DELETE_STR) {
      return ScannerDirectory.removeById(devices, sync.scannerId);
    }
    return ScannerDirectory.applyUpdate(devices, sync);
  }

  static mergeAll(devices: scan.ScannerDevice[], syncList: scan.ScannerSyncDevice[]): scan.ScannerDevice[] {
    let current: scan.ScannerDevice[] = devices.slice(0);
    for (let index = 0; index < syncList.length; index++) {
      current = ScannerDirectory.merge(current, syncList[index]);
    }
    return current;
  }

  /**
   * 展示名：厂商 + 型号优先，缺失时退回设备名。
   */
  static labelOf(device: scan.ScannerDevice): string {
    if (device.manufacturer.length > 0 && device.model.length > 0) {
      return `${device.manufacturer} ${device.model}`;
    }
    if (device.model.length > 0) {
      return device.model;
    }
    if (device.deviceName.length > 0) {
      return device.deviceName;
    }
    return ScannerDirectory.UNKNOWN_LABEL;
  }

  static uniqueIds(devices: scan.ScannerDevice[]): string[] {
    const ids: string[] = [];
    for (let index = 0; index < devices.length; index++) {
      const id: string = devices[index].uniqueId;
      if (ids.indexOf(id) < 0) {
        ids.push(id);
      }
    }
    return ids;
  }

  static sortByName(devices: scan.ScannerDevice[]): scan.ScannerDevice[] {
    const sorted: scan.ScannerDevice[] = devices.slice(0);
    sorted.sort((left: scan.ScannerDevice, right: scan.ScannerDevice) =>
      ScannerDirectory.labelOf(left).localeCompare(ScannerDirectory.labelOf(right)));
    return sorted;
  }

  static countByMode(devices: scan.ScannerDevice[], mode: scan.ScannerDiscoveryMode): number {
    let count: number = 0;
    for (let index = 0; index < devices.length; index++) {
      if (devices[index].discoveryMode === mode) {
        count++;
      }
    }
    return count;
  }

  static isFull(devices: scan.ScannerDevice[]): boolean {
    return devices.length >= ScannerDirectory.CAPACITY;
  }

  static isKnownMode(mode: string): boolean {
    return mode === scan.ScannerDiscoveryMode.TCP_STR || mode === scan.ScannerDiscoveryMode.USB_STR;
  }
}
