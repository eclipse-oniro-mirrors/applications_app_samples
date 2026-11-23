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
import { ScanParameterBuilder } from './ScanParameterBuilder';

/**
 * 设备目录的过滤、去重与聚合工具。全部是纯静态运算，
 * 输入为 ScanParameterBuilder.device 构造的设备数组，便于离线用例按数据表驱动。
 */
export class ScanDeviceFilter {
  static byManufacturer(list: scan.ScannerDevice[], manufacturer: string): scan.ScannerDevice[] {
    const result: scan.ScannerDevice[] = [];
    for (let index = 0; index < list.length; index++) {
      if (list[index].manufacturer === manufacturer) {
        result.push(list[index]);
      }
    }
    return result;
  }

  static byModel(list: scan.ScannerDevice[], model: string): scan.ScannerDevice[] {
    const result: scan.ScannerDevice[] = [];
    for (let index = 0; index < list.length; index++) {
      if (list[index].model === model) {
        result.push(list[index]);
      }
    }
    return result;
  }

  static byMode(list: scan.ScannerDevice[], modeText: string): scan.ScannerDevice[] {
    const target: scan.ScannerDiscoveryMode = ScanParameterBuilder.discoveryMode(modeText);
    const result: scan.ScannerDevice[] = [];
    for (let index = 0; index < list.length; index++) {
      if (list[index].discoveryMode === target) {
        result.push(list[index]);
      }
    }
    return result;
  }

  static byIdPrefix(list: scan.ScannerDevice[], prefix: string): scan.ScannerDevice[] {
    const result: scan.ScannerDevice[] = [];
    for (let index = 0; index < list.length; index++) {
      if (list[index].scannerId.indexOf(prefix) === 0) {
        result.push(list[index]);
      }
    }
    return result;
  }

  static uniqueIds(list: scan.ScannerDevice[]): string[] {
    const result: string[] = [];
    for (let index = 0; index < list.length; index++) {
      if (result.indexOf(list[index].scannerId) < 0) {
        result.push(list[index].scannerId);
      }
    }
    return result;
  }

  static uniqueDevices(list: scan.ScannerDevice[]): scan.ScannerDevice[] {
    const result: scan.ScannerDevice[] = [];
    for (let index = 0; index < list.length; index++) {
      if (result.indexOf(list[index]) < 0) {
        result.push(list[index]);
      }
    }
    return result;
  }

  static count(list: scan.ScannerDevice[]): number {
    return list.length;
  }

  static firstId(list: scan.ScannerDevice[]): string {
    if (list.length === 0) {
      return '';
    }
    return list[0].scannerId;
  }

  static lastId(list: scan.ScannerDevice[]): string {
    if (list.length === 0) {
      return '';
    }
    return list[list.length - 1].scannerId;
  }

  static hasDevice(list: scan.ScannerDevice[], scannerId: string): boolean {
    for (let index = 0; index < list.length; index++) {
      if (list[index].scannerId === scannerId) {
        return true;
      }
    }
    return false;
  }

  static sortById(list: scan.ScannerDevice[]): scan.ScannerDevice[] {
    const result: scan.ScannerDevice[] = list.slice(0);
    result.sort((left: scan.ScannerDevice, right: scan.ScannerDevice) => {
      if (left.scannerId < right.scannerId) {
        return -1;
      }
      if (left.scannerId > right.scannerId) {
        return 1;
      }
      return 0;
    });
    return result;
  }

  static intersect(left: scan.ScannerDevice[], right: scan.ScannerDevice[]): scan.ScannerDevice[] {
    const result: scan.ScannerDevice[] = [];
    for (let index = 0; index < left.length; index++) {
      if (ScanDeviceFilter.hasDevice(right, left[index].scannerId)) {
        result.push(left[index]);
      }
    }
    return result;
  }

  /**
   * 聚合摘要串：数量 + 首尾 id，供快照断言使用，避免携带全量 id 列表。
   */
  static summary(list: scan.ScannerDevice[]): string {
    return `count=${list.length} first=${ScanDeviceFilter.firstId(list)} last=${ScanDeviceFilter.lastId(list)}`;
  }
}
