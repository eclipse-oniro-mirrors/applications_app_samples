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
 * 扫描结果回调接口
 */
export interface ScanResultCallback {
  onDeviceFound(device: BluetoothDeviceModel): void;
  onScanComplete(devices: BluetoothDeviceModel[]): void;
  onScanFailed(error: string): void;
}

/**
 * 蓝牙扫描服务。
 * 管理蓝牙设备扫描和发现流程。
 */
export class BluetoothScanService {
  /** 当前扫描状态 */
  private scanState: BluetoothScanState = BluetoothScanState.IDLE;
  /** 扫描到的设备列表 */
  private discoveredDevices: BluetoothDeviceModel[] = [];
  /** 扫描回调 */
  private callbacks: ScanResultCallback[] = [];
  /** 扫描定时器 */
  private scanTimer: number = -1;
  /** 是否正在扫描 */
  private isScanning: boolean = false;

  /**
   * 开始扫描蓝牙设备。
   * @param {number} timeout - 扫描超时时间（毫秒）
   * @returns {Promise<boolean>} 是否成功启动扫描
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
      // 模拟扫描过程 - 生成mock设备
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
   * 停止扫描。
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
   * 获取扫描状态。
   * @returns {BluetoothScanState} 扫描状态
   */
  getScanState(): BluetoothScanState {
    return this.scanState;
  }

  /**
   * 检查是否正在扫描。
   * @returns {boolean} 是否正在扫描
   */
  getIsScanning(): boolean {
    return this.isScanning;
  }

  /**
   * 获取已发现的设备列表。
   * @returns {BluetoothDeviceModel[]} 设备列表
   */
  getDiscoveredDevices(): BluetoothDeviceModel[] {
    return [...this.discoveredDevices];
  }

  /**
   * 获取已发现设备数量。
   * @returns {number} 设备数量
   */
  getDeviceCount(): number {
    return this.discoveredDevices.length;
  }

  /**
   * 添加扫描回调。
   * @param {ScanResultCallback} callback - 回调
   */
  addCallback(callback: ScanResultCallback): void {
    this.callbacks.push(callback);
  }

  /**
   * 移除扫描回调。
   * @param {ScanResultCallback} callback - 回调
   */
  removeCallback(callback: ScanResultCallback): void {
    const index: number = this.callbacks.indexOf(callback);
    if (index !== -1) {
      this.callbacks.splice(index, 1);
    }
  }

  /**
   * 清除已发现的设备列表。
   */
  clearDevices(): void {
    hilog.info(DOMAIN, TAG, 'BluetoothScanService clearDevices: clearing %{public}d devices',
      this.discoveredDevices.length);
    this.discoveredDevices = [];
  }

  /**
   * 按信号强度排序设备列表。
   * @returns {BluetoothDeviceModel[]} 排序后的设备列表
   */
  getDevicesSortedByRssi(): BluetoothDeviceModel[] {
    return [...this.discoveredDevices].sort((a: BluetoothDeviceModel, b: BluetoothDeviceModel) => b.rssi - a.rssi);
  }

  /**
   * 按设备名称过滤。
   * @param {string} keyword - 关键字
   * @returns {BluetoothDeviceModel[]} 过滤后的设备列表
   */
  filterDevicesByName(keyword: string): BluetoothDeviceModel[] {
    if (!keyword) return [...this.discoveredDevices];
    const lower: string = keyword.toLowerCase();
    return this.discoveredDevices.filter((d: BluetoothDeviceModel) =>
      d.deviceName.toLowerCase().indexOf(lower) !== -1);
  }

  /**
   * 按设备类型过滤。
   * @param {BluetoothDeviceType} type - 设备类型
   * @returns {BluetoothDeviceModel[]} 过滤后的设备列表
   */
  filterDevicesByType(type: BluetoothDeviceType): BluetoothDeviceModel[] {
    return this.discoveredDevices.filter((d: BluetoothDeviceModel) => d.deviceType === type);
  }

  /**
   * 模拟扫描过程。
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
   * 生成模拟MAC地址。
   * @returns {string} MAC地址
   */
  private generateMockMac(): string {
    const hex: string = '0123456789ABCDEF';
    let mac: string = '';
    for (let i: number = 0; i < 6; i++) {
      if (i > 0) mac += ':';
      mac += hex.charAt(Math.floor(Math.random() * 16));
      mac += hex.charAt(Math.floor(Math.random() * 16));
    }
    return mac;
  }

  /**
   * 模拟延迟。
   * @param {number} ms - 毫秒
   * @returns {Promise<void>}
   */
  private simulateDelay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => setTimeout(() => resolve(), ms));
  }

  /**
   * 通知发现设备。
   * @param {BluetoothDeviceModel} device - 发现的设备
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
   * 通知扫描完成。
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
   * 通知扫描失败。
   * @param {string} error - 错误信息
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
   * 重置扫描服务。
   */
  reset(): void {
    this.stopScan();
    this.discoveredDevices = [];
    this.callbacks = [];
    this.scanState = BluetoothScanState.IDLE;
  }
}
