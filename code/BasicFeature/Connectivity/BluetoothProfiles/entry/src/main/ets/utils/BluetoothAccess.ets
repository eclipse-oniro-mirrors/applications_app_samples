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
 * 系统蓝牙开关与已配对设备访问。
 * HFP/PAN/MAP 都是 BR/EDR 上的 Profile，若手机侧蓝牙未开启，Profile 接口会直接返回
 * 2900003（Bluetooth disabled），因此示例在探测前先读一次开关状态并给出明确提示。
 *
 * 展示文本取自 string.json（经 StringResource 解析），日志保持英文，便于与 hilog 检索对齐。
 */

import { access, connection } from '@kit.ConnectivityKit';
import { text } from '../common/StringResource';
import { ProbeStatus, bluetoothStateName, classifyErrorCode } from '../model/ProfileState';
import { Logger } from './Logger';
import { codeOfThrown, messageOfThrown } from './ErrorUtil';

const SOURCE: string = 'BluetoothAccess';

export class BluetoothStateResult {
  public state: number;
  public status: ProbeStatus;
  public code: number;
  public message: string;

  constructor(state: number, status: ProbeStatus, code: number, message: string) {
    this.state = state;
    this.status = status;
    this.code = code;
    this.message = message;
  }

  describe(): string {
    return text('access_state', bluetoothStateName(this.state), this.state);
  }
}

export class PairedDeviceResult {
  public devices: string[];
  public code: number;
  public message: string;

  constructor(devices: string[], code: number, message: string) {
    this.devices = devices;
    this.code = code;
    this.message = message;
  }
}

/** 读取系统蓝牙开关状态：对应 access.getState() */
export function readBluetoothState(): BluetoothStateResult {
  try {
    const state: number = access.getState();
    Logger.info(SOURCE, 'getState', `state=${state}`);
    const message = text('access_get_state_ok', bluetoothStateName(state));
    return new BluetoothStateResult(state, ProbeStatus.READY, 0, message);
  } catch (err) {
    const code = codeOfThrown(err);
    Logger.error(SOURCE, 'getState', `failed, code=${code}, detail=${messageOfThrown(err)}`);
    const message = text('err_action_failed_code', 'access.getState()', code, messageOfThrown(err));
    return new BluetoothStateResult(-1, classifyErrorCode(code), code, message);
  }
}

/** 打开蓝牙：对应 access.enableBluetooth()，需要 ACCESS_BLUETOOTH 权限 */
export function enableBluetooth(): BluetoothStateResult {
  try {
    access.enableBluetooth();
    const state: number = access.getState();
    Logger.info(SOURCE, 'enableBluetooth', `enabled, state=${state}`);
    const message = text('access_enable_ok', bluetoothStateName(state));
    return new BluetoothStateResult(state, ProbeStatus.READY, 0, message);
  } catch (err) {
    const code = codeOfThrown(err);
    Logger.error(SOURCE, 'enableBluetooth', `failed, code=${code}, detail=${messageOfThrown(err)}`);
    const message = text('err_action_failed_code', 'access.enableBluetooth()', code, messageOfThrown(err));
    return new BluetoothStateResult(-1, classifyErrorCode(code), code, message);
  }
}

/** 关闭蓝牙：对应 access.disableBluetooth() */
export function disableBluetooth(): BluetoothStateResult {
  try {
    access.disableBluetooth();
    const state: number = access.getState();
    Logger.info(SOURCE, 'disableBluetooth', `disabled, state=${state}`);
    const message = text('access_disable_ok', bluetoothStateName(state));
    return new BluetoothStateResult(state, ProbeStatus.READY, 0, message);
  } catch (err) {
    const code = codeOfThrown(err);
    Logger.error(SOURCE, 'disableBluetooth', `failed, code=${code}, detail=${messageOfThrown(err)}`);
    const message = text('err_action_failed_code', 'access.disableBluetooth()', code, messageOfThrown(err));
    return new BluetoothStateResult(-1, classifyErrorCode(code), code, message);
  }
}

/** 已配对设备列表：Profile 示例里用来让用户从真实设备中挑选 deviceId */
export function listPairedDevices(): PairedDeviceResult {
  try {
    const devices: string[] = connection.getPairedDevices();
    Logger.info(SOURCE, 'getPairedDevices', `count=${devices.length}`);
    const message = text('access_paired_count', devices.length);
    return new PairedDeviceResult(devices, 0, message);
  } catch (err) {
    const code = codeOfThrown(err);
    Logger.error(SOURCE, 'getPairedDevices', `failed, code=${code}, detail=${messageOfThrown(err)}`);
    const message = text('err_action_failed_code', 'connection.getPairedDevices()', code, messageOfThrown(err));
    return new PairedDeviceResult([], code, message);
  }
}

/** 读取远端设备名：对应 connection.getRemoteDeviceName(deviceId) */
export function readRemoteDeviceName(deviceId: string): string {
  try {
    return connection.getRemoteDeviceName(deviceId);
  } catch (err) {
    // 设备标识属于敏感信息，日志里只记失败原因，不写任何形式的地址
    Logger.warn(SOURCE, 'getRemoteDeviceName', `failed, detail=${messageOfThrown(err)}`);
    return '';
  }
}

/** 订阅蓝牙开关变化：对应 access.on('stateChange', callback) */
export class BluetoothStateWatcher {
  private readonly onChange: (state: number) => void;
  private listener: ((state: number) => void) | null = null;

  constructor(onChange: (state: number) => void) {
    this.onChange = onChange;
  }

  isWatching(): boolean {
    return this.listener !== null;
  }

  start(): boolean {
    if (this.listener !== null) {
      return true;
    }
    const listener = (state: number): void => {
      Logger.info(SOURCE, 'stateChange', `state=${state}`);
      this.onChange(state);
    };
    try {
      access.on('stateChange', listener);
      this.listener = listener;
      Logger.info(SOURCE, 'on', 'subscribed stateChange');
      return true;
    } catch (err) {
      Logger.error(SOURCE, 'on', `subscribe failed, detail=${messageOfThrown(err)}`);
      return false;
    }
  }

  stop(): void {
    const listener = this.listener;
    if (listener === null) {
      return;
    }
    try {
      access.off('stateChange', listener);
      Logger.info(SOURCE, 'off', 'unsubscribed stateChange');
    } catch (err) {
      Logger.warn(SOURCE, 'off', `unsubscribe failed, detail=${messageOfThrown(err)}`);
    }
    this.listener = null;
  }
}
