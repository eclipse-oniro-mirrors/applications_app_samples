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

/**
 * BLE 对端扫描：linkEnhance 的 deviceId 是对端设备的 BLE MAC。
 * 官方开发指导（增强连接 / 约束与限制）要求先用蓝牙广播、扫描接口拿到该地址，
 * 再交给 createConnection，所以「扫描」是链路增强的前置步骤而不是可选项。
 * 这里只做扫描、按地址去重、把结果回调给页面，不建立任何连接。
 */

import { ble } from '@kit.ConnectivityKit';
import { codeOfThrown, messageOfThrown } from './ErrorUtil';
import { text } from '../common/StringResource';
import { Logger } from './Logger';

/** 一次扫描看到的一台 BLE 设备 */
export class BlePeer {
  public deviceId: string;
  public name: string;
  public rssi: number;
  public connectable: boolean;

  constructor(deviceId: string, name: string, rssi: number, connectable: boolean) {
    this.deviceId = deviceId;
    this.name = name;
    this.rssi = rssi;
    this.connectable = connectable;
  }

  /** 列表里的一行：名称 + 地址 + 信号强度，地址放在中间方便核对 */
  label(): string {
    const shown = this.name.length > 0 ? this.name : text('ble_name_missing');
    return `${shown} · ${this.deviceId} · RSSI ${this.rssi}`;
  }
}

export class BlePeerScanner {
  private source: string;
  private peers: BlePeer[] = [];
  private scanning: boolean = false;
  private listener: ((results: ble.ScanResult[]) => void) | null = null;
  public onUpdate: ((peers: BlePeer[]) => void) | null = null;
  public onError: ((code: number, message: string) => void) | null = null;

  constructor(source: string) {
    this.source = source;
  }

  isScanning(): boolean {
    return this.scanning;
  }

  list(): BlePeer[] {
    return this.peers;
  }

  /**
   * 开始扫描。BLE 广播是周期性的，结果通过 BLEDeviceFind 分批回来，
   * 因此清空旧结果后由页面订阅 onUpdate 增量刷新，上限 maxPeers 台。
   */
  start(maxPeers: number): void {
    if (this.scanning) {
      return;
    }
    this.peers = [];
    const listener = (results: ble.ScanResult[]): void => {
      this.merge(results, maxPeers);
    };
    try {
      ble.on('BLEDeviceFind', listener);
      // 实测：空数组 filters 会被 napi 层拒掉（401 Invalid parameter）；d.ts 写明「不过滤传 null」，
      // 而 ArkTS 不接受 null 实参，因此改传一个字段全空的 ScanFilter——字段全为可选，等价于不做字段过滤
      const filters: ble.ScanFilter[] = [{}];
      ble.startBLEScan(filters);
      this.listener = listener;
      this.scanning = true;
      Logger.info(this.source, 'startBLEScan', 'scan started, waiting for BLE advertisement');
    } catch (err) {
      const code = codeOfThrown(err);
      const message = messageOfThrown(err);
      Logger.error(this.source, 'startBLEScan', `fail code=${code}: ${message}`);
      const notify = this.onError;
      if (notify !== null) {
        notify(code, message);
      }
    }
  }

  stop(): void {
    if (!this.scanning) {
      return;
    }
    this.scanning = false;
    const listener = this.listener;
    this.listener = null;
    try {
      ble.stopBLEScan();
      if (listener !== null) {
        ble.off('BLEDeviceFind', listener);
      }
      Logger.info(this.source, 'stopBLEScan', `scan stopped, devices=${this.peers.length}`);
    } catch (err) {
      const code = codeOfThrown(err);
      Logger.warn(this.source, 'stopBLEScan', `fail code=${code}: ${messageOfThrown(err)}`);
    }
  }

  private merge(results: ble.ScanResult[], maxPeers: number): void {
    let changed = false;
    for (let i = 0; i < results.length; i++) {
      const item = results[i];
      if (item.deviceId.length === 0) {
        continue;
      }
      const index = this.indexOf(item.deviceId);
      if (index >= 0) {
        // 同一台设备会反复上报，只更新信号强度，保持列表不跳动
        const old = this.peers[index];
        if (old.rssi !== item.rssi) {
          this.peers[index] = new BlePeer(old.deviceId, old.name, item.rssi, old.connectable);
          changed = true;
        }
        continue;
      }
      if (this.peers.length >= maxPeers) {
        continue;
      }
      this.peers.push(new BlePeer(item.deviceId, item.deviceName, item.rssi, item.connectable));
      changed = true;
      Logger.info(this.source, 'BLEDeviceFind',
        `found name="${item.deviceName}", rssi=${item.rssi}, connectable=${item.connectable}`);
    }
    if (changed) {
      const notify = this.onUpdate;
      if (notify !== null) {
        notify(this.peers);
      }
    }
  }

  private indexOf(deviceId: string): number {
    for (let i = 0; i < this.peers.length; i++) {
      if (this.peers[i].deviceId === deviceId) {
        return i;
      }
    }
    return -1;
  }
}

/**
 * BLE 广播：扫描的反向操作。实测 linkEnhance 的 start() 不会让本机在 BLE 上可见
 * （服务端执行 createServer + start 后，对端扫描不到它，蓝牙 HCI 也没有广播活动），
 * 所以服务端需要自己把广播打开，对端才能扫到本机地址。
 */
export class BleAdvertiser {
  private source: string;
  private advertising: boolean = false;
  public onStateChange: ((advertising: boolean, code: number, message: string) => void) | null = null;

  constructor(source: string) {
    this.source = source;
  }

  isAdvertising(): boolean {
    return this.advertising;
  }

  start(): void {
    if (this.advertising) {
      return;
    }
    const setting: ble.AdvertiseSetting = { interval: 160, txPower: 0, connectable: true };
    // serviceUuids / manufactureData / serviceData 是必填字段，这里不承载业务字段，只带设备名
    const data: ble.AdvertiseData = {
      serviceUuids: [],
      manufactureData: [],
      serviceData: [],
      includeDeviceName: true
    };
    try {
      ble.startAdvertising(setting, data);
      this.advertising = true;
      Logger.info(this.source, 'startAdvertising', 'advertising started');
      this.notify(true, 0, '');
    } catch (err) {
      const code = codeOfThrown(err);
      const message = messageOfThrown(err);
      Logger.error(this.source, 'startAdvertising', `fail code=${code}: ${message}`);
      this.notify(false, code, message);
    }
  }

  stop(): void {
    if (!this.advertising) {
      return;
    }
    this.advertising = false;
    try {
      ble.stopAdvertising();
      Logger.info(this.source, 'stopAdvertising', 'advertising stopped');
      this.notify(false, 0, '');
    } catch (err) {
      const code = codeOfThrown(err);
      const message = messageOfThrown(err);
      Logger.warn(this.source, 'stopAdvertising', `fail code=${code}: ${message}`);
      this.notify(false, code, message);
    }
  }

  private notify(advertising: boolean, code: number, message: string): void {
    const handler = this.onStateChange;
    if (handler !== null) {
      handler(advertising, code, message);
    }
  }
}
