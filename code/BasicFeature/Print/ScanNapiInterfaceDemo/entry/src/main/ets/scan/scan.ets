/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { ScanLog } from './log';

export class Scan {
  static init(): Promise<void> {
    return scan.init();
  }

  static exit(): Promise<void> {
    return scan.exit();
  }

  static startScannerDiscovery(): Promise<void> {
    return scan.startScannerDiscovery();
  }

  static openScanner(scannerId: string): Promise<void> {
    return scan.openScanner(scannerId);
  }

  static closeScanner(scannerId: string): Promise<void> {
    return scan.closeScanner(scannerId);
  }

  static startScan(scannerId: string, batchMode: boolean): Promise<void> {
    return scan.startScan(scannerId, batchMode);
  }

  static cancelScan(scannerId: string): Promise<void> {
    return scan.cancelScan(scannerId);
  }

  static getScannerParameter(scannerId: string): Promise<scan.ScannerParameter[]> {
    return scan.getScannerParameter(scannerId);
  }

  static getScannerCurrentSetting(scannerId: string, optionIndex: number): Promise<scan.ScannerOptionValue> {
    return scan.getScannerCurrentSetting(scannerId, optionIndex);
  }

  static setScannerParameter(scannerId: string, optionIndex: number,
    value: scan.ScannerOptionValue): Promise<void> {
    return scan.setScannerParameter(scannerId, optionIndex, value);
  }

  static getScanProgress(scannerId: string): Promise<scan.PictureScanProgress> {
    return scan.getPictureScanProgress(scannerId);
  }

  static on(type: 'scanDeviceFound', callback: (device: scan.ScannerDevice) => void): void {
    try {
      scan.on(type, callback);
    } catch (error) {
      ScanLog.warn('scan on error');
    }
  }

  static onScanDeviceSync(callback: (device: scan.ScannerSyncDevice) => void): void {
    try {
      scan.on('scanDeviceSync', callback);
    } catch (error) {
      ScanLog.warn('scan on scanDeviceSync error');
    }
  }
}
