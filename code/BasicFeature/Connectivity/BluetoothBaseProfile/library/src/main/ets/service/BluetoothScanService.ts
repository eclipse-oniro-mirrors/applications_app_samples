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
import { BluetoothConstants, BluetoothScanState } from '../constants/BluetoothConstants';
import { BluetoothDeviceModel, BluetoothDeviceType } from '../model/BluetoothDeviceModel';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * scan result callback interface
 */
export interface ScanResultCallback {
  onDeviceFound(device: BluetoothDeviceModel): void;
  onScanComplete(devices: BluetoothDeviceModel[]): void;
  onScanFailed(error: string): void;
}

/**
 * blue tooth scan service.
 * manage manage Bluetooth device scan and discover stream process.
 */
export class BluetoothScanService {
  /** current scan status */
  private scanState: BluetoothScanState = BluetoothScanState.IDLE;
  /** scanned devices list table */
  private discoveredDevices: BluetoothDeviceModel[] = [];
  /** scan callback */
  private callbacks: ScanResultCallback[] = [];
  /** scan timer */
  private scanTimer: number = -1;
  /** whether scanning */
  private isScanning: boolean = false;

  /**
   * start scanning Bluetooth device.
   * @param {number} timeout - scan timeout (ms)
   * @returns {Promise<boolean>} whether success start scan
   */
  async startScan(timeout: number = BluetoothConstants.SCAN_TIMEOUT_MS): Promise<boolean> {
    hiTraceMeter.startTrace('BluetoothScanService_startScan', 0);
    hilog.info(DOMAIN, TAG, 'BluetoothScanService startScan: timeout=%{public}d', timeout);

    if (this.isScanning) {
      hilog.warn(DOMAIN, TAG, 'BluetoothScanService startScan: already scanning');
      hiTraceMeter.finishTrace('BluetoothScanService_startScan', 0);
      return false;
    }

    this.isScanning = true;
    this.scanState = BluetoothScanState.SCANNING;
    this.discoveredDevices = [];

    try {
      // simulate scan over process - generate mock device
      await this.simulateScan();
      this.scanState = BluetoothScanState.SCAN_COMPLETE;
      this.isScanning = false;
      this.notifyScanComplete();
      hilog.info(DOMAIN, TAG, 'BluetoothScanService startScan: found %{public}d devices',
        this.discoveredDevices.length);
      hiTraceMeter.finishTrace('BluetoothScanService_startScan', 0);
      return true;
    } catch (err) {
      this.scanState = BluetoothScanState.SCAN_FAILED;
      this.isScanning = false;
      this.notifyScanFailed('Scan failed');
      hilog.error(DOMAIN, TAG, 'BluetoothScanService startScan: failed');
      hiTraceMeter.finishTrace('BluetoothScanService_startScan', 0);
      return false;
    }
  }

  /**
   * stop scanning.
   */
  stopScan(): void {
    hilog.info(DOMAIN, TAG, 'BluetoothScanService stopScan: stopping');
    this.isScanning = false;
    this.scanState = BluetoothScanState.SCAN_COMPLETE;
    if (this.scanTimer !== -1) {
      clearTimeout(this.scanTimer);
      this.scanTimer = -1;
    }
  }

  /**
   * get scan status.
   * @returns {BluetoothScanState} scan status
   */
  getScanState(): BluetoothScanState {
    return this.scanState;
  }

  /**
   * check whether scanning.
   * @returns {boolean} whether scanning
   */
  getIsScanning(): boolean {
    return this.isScanning;
  }

  /**
   * get discovered device list.
   * @returns {BluetoothDeviceModel[]} device list
   */
  getDiscoveredDevices(): BluetoothDeviceModel[] {
    return [...this.discoveredDevices];
  }

  /**
   * get discovered device count.
   * @returns {number} device number amount
   */
  getDeviceCount(): number {
    return this.discoveredDevices.length;
  }

  /**
   * add scan callback.
   * @param {ScanResultCallback} callback - callback
   */
  addCallback(callback: ScanResultCallback): void {
    this.callbacks.push(callback);
  }

  /**
   * remove scan callback.
   * @param {ScanResultCallback} callback - callback
   */
  removeCallback(callback: ScanResultCallback): void {
    const index: number = this.callbacks.indexOf(callback);
    if (index !== -1) {
      this.callbacks.splice(index, 1);
    }
  }

  /**
   * clear discovered device list.
   */
  clearDevices(): void {
    hilog.info(DOMAIN, TAG, 'BluetoothScanService clearDevices: clearing %{public}d devices',
      this.discoveredDevices.length);
    this.discoveredDevices = [];
  }

  /**
   * sort device list by signal strength.
   * @returns {BluetoothDeviceModel[]} sorted device list
   */
  getDevicesSortedByRssi(): BluetoothDeviceModel[] {
    return [...this.discoveredDevices].sort((a: BluetoothDeviceModel, b: BluetoothDeviceModel) => b.rssi - a.rssi);
  }

  /**
   * filter by device name.
   * @param {string} keyword - relate key character
   * @returns {BluetoothDeviceModel[]} filtered device list
   */
  filterDevicesByName(keyword: string): BluetoothDeviceModel[] {
    if (!keyword) {
      return [...this.discoveredDevices];
    }
    const lower: string = keyword.toLowerCase();
    return this.discoveredDevices.filter((d: BluetoothDeviceModel) =>
      d.deviceName.toLowerCase().indexOf(lower) !== -1);
  }

  /**
   * filter by device type.
   * @param {BluetoothDeviceType} type - device type
   * @returns {BluetoothDeviceModel[]} filtered device list
   */
  filterDevicesByType(type: BluetoothDeviceType): BluetoothDeviceModel[] {
    return this.discoveredDevices.filter((d: BluetoothDeviceModel) => d.deviceType === type);
  }

  /**
   * simulate scan over process.
   * @returns {Promise<void>}
   */
  private async simulateScan(): Promise<void> {
    const deviceNames: string[] = [
      'BT-Speaker-Pro', 'BT-Headphone-X', 'BT-Keyboard-K1', 'BT-Mouse-M2',
      'BT-Watch-Fit', 'BT-Health-Band', 'BT-Car-Audio', 'BT-Phone-S24',
      'BT-Headset-Air', 'BT-Gamepad-Pro'
    ];
    const types: BluetoothDeviceType[] = [
      BluetoothDeviceType.CLASSIC, BluetoothDeviceType.BLE,
      BluetoothDeviceType.DUAL_MODE, BluetoothDeviceType.CLASSIC
    ];

    for (let i: number = 0; i < deviceNames.length; i++) {
      await this.simulateDelay(100 + Math.random() * 200);
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(
        'dev_' + i + '_' + Date.now().toString(36),
        deviceNames[i],
        this.generateMockMac(),
        types[i % types.length]
      );
      device.updateRssi(-30 - Math.floor(Math.random() * 70));
      device.bondState = Math.random() > 0.5 ? 12 : 0;
      this.discoveredDevices.push(device);
      this.notifyDeviceFound(device);
    }
  }

  /**
   * generate mock MAC ground address.
   * @returns {string} MAC ground address
   */
  private generateMockMac(): string {
    const hex: string = '0123456789ABCDEF';
    let mac: string = '';
    for (let i: number = 0; i < 6; i++) {
      if (i > 0) {
        mac += ':';
      }
      mac += hex.charAt(Math.floor(Math.random() * 16));
      mac += hex.charAt(Math.floor(Math.random() * 16));
    }
    return mac;
  }

  /**
   * simulate delay.
   * @param {number} ms - ms
   * @returns {Promise<void>}
   */
  private simulateDelay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => setTimeout(() => resolve(), ms));
  }

  /**
   * notify device found.
   * @param {BluetoothDeviceModel} device - discovered device
   */
  private notifyDeviceFound(device: BluetoothDeviceModel): void {
    for (const callback of this.callbacks) {
      try {
        callback.onDeviceFound(device);
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'BluetoothScanService notifyDeviceFound: callback error');
      }
    }
  }

  /**
   * notify scan completed.
   */
  private notifyScanComplete(): void {
    for (const callback of this.callbacks) {
      try {
        callback.onScanComplete(this.discoveredDevices);
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'BluetoothScanService notifyScanComplete: callback error');
      }
    }
  }

  /**
   * notify scan failed.
   * @param {string} error - error info info
   */
  private notifyScanFailed(error: string): void {
    for (const callback of this.callbacks) {
      try {
        callback.onScanFailed(error);
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'BluetoothScanService notifyScanFailed: callback error');
      }
    }
  }

  /**
   * reset scan service.
   */
  reset(): void {
    this.stopScan();
    this.discoveredDevices = [];
    this.callbacks = [];
    this.scanState = BluetoothScanState.IDLE;
  }
}
