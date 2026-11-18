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
 * Profile 探测结果与枚举映射：把蓝牙服务的 BusinessError 错误码翻译成页面可展示的状态。
 * 全部为纯函数（不 import ConnectivityKit），文本统一经 StringResource 从 string.json 读取，
 * 因此可以脱离设备做本地单测；设备侧用例再用 constant / access 的真实枚举反查这些字面量是否仍然一致。
 */

import { text } from '../common/StringResource';

export enum ProbeStatus {
  IDLE = 0,
  READY = 1,
  NO_DEVICE = 2,
  PERMISSION_DENIED = 3,
  CAPABILITY_UNSUPPORTED = 4,
  BLUETOOTH_DISABLED = 5,
  SERVICE_STOPPED = 6,
  PROFILE_UNSUPPORTED = 7,
  FAILED = 8
}

/** Profile 接口文档中列出的错误码 */
export const ERROR_CODE_PERMISSION_DENIED: number = 201;
export const ERROR_CODE_INVALID_PARAM: number = 401;
export const ERROR_CODE_CAPABILITY_UNSUPPORTED: number = 801;
export const ERROR_CODE_SERVICE_STOPPED: number = 2900001;
export const ERROR_CODE_BLUETOOTH_DISABLED: number = 2900003;
export const ERROR_CODE_PROFILE_UNSUPPORTED: number = 2900004;
export const ERROR_CODE_OPERATION_FAILED: number = 2900099;

/** constant.ProfileConnectionState 的四个取值 */
export const CONNECTION_STATE_DISCONNECTED: number = 0;
export const CONNECTION_STATE_CONNECTING: number = 1;
export const CONNECTION_STATE_CONNECTED: number = 2;
export const CONNECTION_STATE_DISCONNECTING: number = 3;

/** access.BluetoothState 的七个取值 */
export const BT_STATE_OFF: number = 0;
export const BT_STATE_TURNING_ON: number = 1;
export const BT_STATE_ON: number = 2;
export const BT_STATE_TURNING_OFF: number = 3;
export const BT_STATE_BLE_TURNING_ON: number = 4;
export const BT_STATE_BLE_ON: number = 5;
export const BT_STATE_BLE_TURNING_OFF: number = 6;

/** baseProfile.DisconnectCause 的六个取值（连接状态变化回调里的断开原因） */
export const DISCONNECT_CAUSE_USER: number = 0;
export const DISCONNECT_CAUSE_KEYBOARD: number = 1;
export const DISCONNECT_CAUSE_MOUSE: number = 2;
export const DISCONNECT_CAUSE_CAR: number = 3;
export const DISCONNECT_CAUSE_TOO_MANY_DEVICES: number = 4;
export const DISCONNECT_CAUSE_INTERNAL_FAILURE: number = 5;

/** 201/801/2900001/2900003/2900004 有专属状态，其余（含 401 与 2900099）统一归为 FAILED */
export function classifyErrorCode(code: number): ProbeStatus {
  switch (code) {
    case ERROR_CODE_PERMISSION_DENIED:
      return ProbeStatus.PERMISSION_DENIED;
    case ERROR_CODE_CAPABILITY_UNSUPPORTED:
      return ProbeStatus.CAPABILITY_UNSUPPORTED;
    case ERROR_CODE_SERVICE_STOPPED:
      return ProbeStatus.SERVICE_STOPPED;
    case ERROR_CODE_BLUETOOTH_DISABLED:
      return ProbeStatus.BLUETOOTH_DISABLED;
    case ERROR_CODE_PROFILE_UNSUPPORTED:
      return ProbeStatus.PROFILE_UNSUPPORTED;
    default:
      return code > 0 ? ProbeStatus.FAILED : ProbeStatus.IDLE;
  }
}

/** 状态名对应的资源名称：模块级常量只保存名称，展示时再解析 */
export function probeStatusNameKey(status: ProbeStatus): string {
  switch (status) {
    case ProbeStatus.READY:
      return 'probe_name_ready';
    case ProbeStatus.NO_DEVICE:
      return 'probe_name_no_device';
    case ProbeStatus.PERMISSION_DENIED:
      return 'probe_name_permission_denied';
    case ProbeStatus.CAPABILITY_UNSUPPORTED:
      return 'probe_name_capability_unsupported';
    case ProbeStatus.BLUETOOTH_DISABLED:
      return 'probe_name_bluetooth_disabled';
    case ProbeStatus.SERVICE_STOPPED:
      return 'probe_name_service_stopped';
    case ProbeStatus.PROFILE_UNSUPPORTED:
      return 'probe_name_profile_unsupported';
    case ProbeStatus.FAILED:
      return 'probe_name_failed';
    default:
      return 'probe_name_idle';
  }
}

export function probeStatusName(status: ProbeStatus): string {
  return text(probeStatusNameKey(status));
}

/** 处理建议对应的资源名称 */
export function probeStatusHintKey(status: ProbeStatus): string {
  switch (status) {
    case ProbeStatus.READY:
      return 'probe_hint_ready';
    case ProbeStatus.NO_DEVICE:
      return 'probe_hint_no_device';
    case ProbeStatus.PERMISSION_DENIED:
      return 'probe_hint_permission_denied';
    case ProbeStatus.CAPABILITY_UNSUPPORTED:
      return 'probe_hint_capability_unsupported';
    case ProbeStatus.BLUETOOTH_DISABLED:
      return 'probe_hint_bluetooth_disabled';
    case ProbeStatus.SERVICE_STOPPED:
      return 'probe_hint_service_stopped';
    case ProbeStatus.PROFILE_UNSUPPORTED:
      return 'probe_hint_profile_unsupported';
    default:
      return 'probe_hint_default';
  }
}

export function probeStatusHint(status: ProbeStatus): string {
  return text(probeStatusHintKey(status));
}

/** READY 与 NO_DEVICE 都说明实例本身可用 */
export function isReadyStatus(status: ProbeStatus): boolean {
  return status === ProbeStatus.READY || status === ProbeStatus.NO_DEVICE;
}

export function shouldRefreshDevices(status: ProbeStatus): boolean {
  return isReadyStatus(status);
}

export function connectionStateName(state: number): string {
  switch (state) {
    case CONNECTION_STATE_DISCONNECTED:
      return text('conn_disconnected');
    case CONNECTION_STATE_CONNECTING:
      return text('conn_connecting');
    case CONNECTION_STATE_CONNECTED:
      return text('conn_connected');
    case CONNECTION_STATE_DISCONNECTING:
      return text('conn_disconnecting');
    default:
      return text('state_unknown');
  }
}

export function isConnected(state: number): boolean {
  return state === CONNECTION_STATE_CONNECTED;
}

export function isTransitionState(state: number): boolean {
  return state === CONNECTION_STATE_CONNECTING || state === CONNECTION_STATE_DISCONNECTING;
}

export function bluetoothStateName(state: number): string {
  switch (state) {
    case BT_STATE_OFF:
      return text('bt_off');
    case BT_STATE_TURNING_ON:
      return text('bt_turning_on');
    case BT_STATE_ON:
      return text('bt_on');
    case BT_STATE_TURNING_OFF:
      return text('bt_turning_off');
    case BT_STATE_BLE_TURNING_ON:
      return text('bt_ble_turning_on');
    case BT_STATE_BLE_ON:
      return text('bt_ble_on');
    case BT_STATE_BLE_TURNING_OFF:
      return text('bt_ble_turning_off');
    default:
      return text('state_unknown');
  }
}

/** BR/EDR 的 Profile（HFP/PAN/MAP 都是）需要经典蓝牙可用 */
export function isBluetoothUsable(state: number): boolean {
  return state === BT_STATE_ON;
}

export function disconnectCauseName(cause: number): string {
  switch (cause) {
    case DISCONNECT_CAUSE_USER:
      return text('cause_user');
    case DISCONNECT_CAUSE_KEYBOARD:
      return text('cause_keyboard');
    case DISCONNECT_CAUSE_MOUSE:
      return text('cause_mouse');
    case DISCONNECT_CAUSE_CAR:
      return text('cause_car');
    case DISCONNECT_CAUSE_TOO_MANY_DEVICES:
      return text('cause_too_many');
    case DISCONNECT_CAUSE_INTERNAL_FAILURE:
      return text('cause_internal');
    default:
      return text('cause_unknown');
  }
}

/** 订阅成功后才允许取消订阅，未订阅时先订阅，避免无效调用 */
export function nextSubscriptionAction(subscribed: boolean): string {
  return subscribed ? text('action_unsubscribe') : text('action_subscribe');
}

export function summarizeDeviceList(devices: string[]): string {
  if (devices.length === 0) {
    return text('device_list_empty');
  }
  if (devices.length === 1) {
    return text('device_list_one');
  }
  return text('device_list_many', devices.length);
}
