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
import { ScannerDirectory } from './ScannerDirectory';

/**
 * 设备目录的只读快照：把列表压成可比较的标量/字串，供界面日志与断言使用。
 */
export interface ScanDirectorySnapshot {
  count: number;
  ids: string;
  labels: string;
  modes: string;
  tcpCount: number;
  usbCount: number;
  uniqueCount: number;
}

/**
 * 目录快照工具：一次遍历拼出 id / 名称 / 发现方式，避免调用点各自写聚合逻辑。
 */
export class ScanDirectoryProbe {
  static take(devices: scan.ScannerDevice[]): ScanDirectorySnapshot {
    const ids: string[] = [];
    const labels: string[] = [];
    const modes: string[] = [];
    for (let index = 0; index < devices.length; index++) {
      const device: scan.ScannerDevice = devices[index];
      ids.push(device.scannerId);
      labels.push(ScannerDirectory.labelOf(device));
      modes.push(device.discoveryMode);
    }
    const snapshot: ScanDirectorySnapshot = {
      count: devices.length,
      ids: ids.join(','),
      labels: labels.join('|'),
      modes: modes.join(','),
      tcpCount: ScannerDirectory.countByMode(devices, scan.ScannerDiscoveryMode.TCP_STR),
      usbCount: ScannerDirectory.countByMode(devices, scan.ScannerDiscoveryMode.USB_STR),
      uniqueCount: ScannerDirectory.uniqueIds(devices).length
    };
    return snapshot;
  }

  /**
   * 合并一批同步事件后再取快照：update 只改 id 与发现方式，delete 按 id 移除。
   */
  static mergeTake(devices: scan.ScannerDevice[], events: scan.ScannerSyncDevice[]): ScanDirectorySnapshot {
    return ScanDirectoryProbe.take(ScannerDirectory.mergeAll(devices, events));
  }

  static sortedTake(devices: scan.ScannerDevice[]): ScanDirectorySnapshot {
    return ScanDirectoryProbe.take(ScannerDirectory.sortByName(devices));
  }
}
