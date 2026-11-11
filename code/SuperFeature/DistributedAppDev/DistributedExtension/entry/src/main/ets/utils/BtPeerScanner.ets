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
 * 经典蓝牙（BR/EDR）对端地址：proxyChannelManager 的 peerDevAddr 要的是经典蓝牙地址，
 * 与 linkEnhance 用的 BLE 广播地址是两套地址，所以这里走 @ohos.bluetooth.connection：
 * - getPairedDevices()：系统里已配对的对端，最稳，配对过的设备一定在；
 * - startBluetoothDiscovery() + on('bluetoothDeviceFind')：发现周围处于可被发现状态的对端。
 *
 * 实测依据（connection.d.ts）：API 26 起，未持有 ohos.permission.GET_BLUETOOTH_PEERS_MAC
 * （PermissionDefinitions.json 记为 system_basic + SYSTEM，普通应用申请不到）时，
 * 系统返回的是**虚拟地址**而不是硬件 MAC，页面必须把这一点标出来。
 */

import { connection } from '@kit.ConnectivityKit';
import { codeOfThrown, messageOfThrown } from './ErrorUtil';
import { text } from '../common/StringResource';
import { Logger } from './Logger';

/** 经典蓝牙发现的有效窗口：实测约 12 s 后系统自行结束，到点由工具层主动收尾 */
const DISCOVERY_WINDOW_MS: number = 12000;

/** 一台候选对端：地址来自已配对列表或主动发现，名称可能取不到 */
export class BtPeer {
  public addr: string;
  public name: string;
  public paired: boolean;

  constructor(addr: string, name: string, paired: boolean) {
    this.addr = addr;
    this.name = name;
    this.paired = paired;
  }

  /** 列表里的一行：名称 + 地址，地址等宽显示方便逐段核对 */
  label(): string {
    const shown = this.name.length > 0 ? this.name : text('bt_name_missing');
    return `${shown} · ${this.addr}`;
  }

  /** 地址来源：已配对列表比一次性发现更可信 */
  sourceName(): string {
    return this.paired ? text('bt_source_paired') : text('bt_source_found');
  }
}

export class BtPeerScanner {
  private source: string;
  private peers: BtPeer[] = [];
  private finding: boolean = false;
  private timer: number = -1;
  private listener: ((addrs: Array<string>) => void) | null = null;
  public onUpdate: ((peers: BtPeer[]) => void) | null = null;
  public onError: ((code: number, message: string) => void) | null = null;

  constructor(source: string) {
    this.source = source;
  }

  isFinding(): boolean {
    return this.finding;
  }

  list(): BtPeer[] {
    return this.peers;
  }

  /** 读系统里的已配对设备；只查记录，不触发扫描，失败时把系统码透给页面 */
  loadPaired(): void {
    try {
      const addrs: Array<string> = connection.getPairedDevices();
      for (let i = 0; i < addrs.length; i++) {
        this.upsert(addrs[i], true);
      }
      Logger.info(this.source, 'getPairedDevices', `paired devices=${addrs.length}`);
      this.notify();
    } catch (err) {
      this.reportError('getPairedDevices', err);
    }
  }

  /** 开始经典蓝牙发现；发现到的地址按 maxPeers 台上限去重累积 */
  startDiscovery(maxPeers: number): void {
    if (this.finding) {
      return;
    }
    const listener = (addrs: Array<string>): void => {
      this.mergeFound(addrs, maxPeers);
    };
    try {
      connection.on('bluetoothDeviceFind', listener);
      connection.startBluetoothDiscovery();
      this.listener = listener;
      this.finding = true;
      this.startTimer();
      Logger.info(this.source, 'startBluetoothDiscovery', 'discovery started');
      this.notify();
    } catch (err) {
      this.reportError('startBluetoothDiscovery', err);
    }
  }

  stopDiscovery(): void {
    if (!this.finding) {
      return;
    }
    this.finding = false;
    this.clearTimer();
    const listener = this.listener;
    this.listener = null;
    try {
      connection.stopBluetoothDiscovery();
      Logger.info(this.source, 'stopBluetoothDiscovery', `discovery stopped, candidates=${this.peers.length}`);
    } catch (err) {
      // 实测：发现已自行结束后再调 stop 会抛 2900099（底层 napi assert failed）；
      // 这只说明“停的时候已经不是发现中”，不能因此跳过下面的 off
      const code = codeOfThrown(err);
      Logger.warn(this.source, 'stopBluetoothDiscovery', `fail code=${code}: ${messageOfThrown(err)}`);
    }
    if (listener !== null) {
      try {
        connection.off('bluetoothDeviceFind', listener);
      } catch (err) {
        const code = codeOfThrown(err);
        Logger.warn(this.source, 'off bluetoothDeviceFind', `fail code=${code}: ${messageOfThrown(err)}`);
      }
    }
    this.notify();
  }

  /** 页面销毁时调用：发现是系统级操作，不退订会一直占着蓝牙适配器 */
  release(): void {
    this.stopDiscovery();
  }

  private startTimer(): void {
    this.clearTimer();
    this.timer = setTimeout(() => {
      this.timer = -1;
      this.stopDiscovery();
    }, DISCOVERY_WINDOW_MS);
  }

  private clearTimer(): void {
    if (this.timer >= 0) {
      clearTimeout(this.timer);
      this.timer = -1;
    }
  }

  private mergeFound(addrs: Array<string>, maxPeers: number): void {
    let changed = false;
    for (let i = 0; i < addrs.length; i++) {
      const addr = addrs[i];
      if (addr.length === 0) {
        continue;
      }
      if (this.indexOf(addr) < 0 && this.peers.length >= maxPeers) {
        continue;
      }
      changed = this.upsert(addr, false) || changed;
    }
    if (changed) {
      this.notify();
    }
  }

  /** 地址统一转大写：页面校验按 12:34:56:78:9A:BC 书写，避免同一台设备出现两种写法 */
  private upsert(rawAddr: string, paired: boolean): boolean {
    const addr = rawAddr.toUpperCase();
    const index = this.indexOf(addr);
    if (index >= 0) {
      const old = this.peers[index];
      // 已配对信息比一次发现更可信；名称同理，先拿到的非空名称不再被空值覆盖
      const name = old.name.length > 0 ? old.name : this.queryName(addr);
      if (old.paired === paired && old.name === name) {
        return false;
      }
      this.peers[index] = new BtPeer(addr, name, old.paired || paired);
      return true;
    }
    const name = this.queryName(addr);
    this.peers.push(new BtPeer(addr, name, paired));
    Logger.info(this.source, paired ? 'getPairedDevices' : 'bluetoothDeviceFind',
      `candidate name="${name}", paired=${paired}`);
    return true;
  }

  /** 名称只是展示用，取不到不算失败（d.ts 里这条会抛 2900099） */
  private queryName(addr: string): string {
    try {
      return connection.getRemoteDeviceName(addr);
    } catch (err) {
      return '';
    }
  }

  private indexOf(addr: string): number {
    for (let i = 0; i < this.peers.length; i++) {
      if (this.peers[i].addr === addr) {
        return i;
      }
    }
    return -1;
  }

  private reportError(action: string, err: Object): void {
    const code = codeOfThrown(err);
    const message = messageOfThrown(err);
    Logger.error(this.source, action, `fail code=${code}: ${message}`);
    const notify = this.onError;
    if (notify !== null) {
      notify(code, message);
    }
  }

  private notify(): void {
    const notify = this.onUpdate;
    if (notify !== null) {
      notify(this.peers);
    }
  }
}
