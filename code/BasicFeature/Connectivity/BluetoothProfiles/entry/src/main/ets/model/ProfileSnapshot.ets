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
 * Profile 状态快照与页面视图状态。
 * ProfileSnapshot 由 ProfileSession 产出（不可变，用 derive 生成新实例），
 * ProfileViewState 是页面直接绑定的展示模型，负责在刷新后保留用户的设备选择。
 */

import { ProfileKind } from './ProfileCatalog';
import { text } from '../common/StringResource';
import {
  CONNECTION_STATE_DISCONNECTED,
  ProbeStatus,
  connectionStateName,
  probeStatusHint,
  probeStatusName,
  summarizeDeviceList
} from './ProfileState';
import { maskDeviceId } from './DeviceAddress';
import { formatTime } from '../utils/FormatUtil';

export interface ProfileSnapshotOptions {
  status?: ProbeStatus;
  code?: number;
  message?: string;
  devices?: string[];
  currentDeviceId?: string;
  currentState?: number;
  subscribed?: boolean;
  date?: Date;
}

export class ProfileSnapshot {
  public readonly kind: ProfileKind;
  public readonly status: ProbeStatus;
  public readonly code: number;
  public readonly message: string;
  public readonly devices: string[];
  public readonly currentDeviceId: string;
  public readonly currentState: number;
  public readonly subscribed: boolean;
  public readonly updatedAt: string;

  constructor(kind: ProfileKind, options: ProfileSnapshotOptions) {
    this.kind = kind;
    this.status = options.status !== undefined ? options.status : ProbeStatus.IDLE;
    this.code = options.code !== undefined ? options.code : 0;
    this.message = options.message !== undefined ? options.message : text('snapshot_no_instance');
    this.devices = options.devices !== undefined ? options.devices.slice() : [];
    this.currentDeviceId = options.currentDeviceId !== undefined ? options.currentDeviceId : '';
    this.currentState = options.currentState !== undefined ?
      options.currentState : CONNECTION_STATE_DISCONNECTED;
    this.subscribed = options.subscribed !== undefined ? options.subscribed : false;
    this.updatedAt = formatTime(options.date !== undefined ? options.date : new Date());
  }

  /** 以当前快照为基线生成新快照，未传入的字段保持不变 */
  derive(options: ProfileSnapshotOptions): ProfileSnapshot {
    return new ProfileSnapshot(this.kind, {
      status: options.status !== undefined ? options.status : this.status,
      code: options.code !== undefined ? options.code : this.code,
      message: options.message !== undefined ? options.message : this.message,
      devices: options.devices !== undefined ? options.devices : this.devices,
      currentDeviceId: options.currentDeviceId !== undefined ? options.currentDeviceId : this.currentDeviceId,
      currentState: options.currentState !== undefined ? options.currentState : this.currentState,
      subscribed: options.subscribed !== undefined ? options.subscribed : this.subscribed,
      date: options.date !== undefined ? options.date : new Date()
    });
  }

  withStatus(status: ProbeStatus, code: number, message: string, date: Date = new Date()): ProfileSnapshot {
    return this.derive({ status: status, code: code, message: message, date: date });
  }

  withDevices(devices: string[], date: Date = new Date()): ProfileSnapshot {
    return this.derive({ devices: devices, date: date });
  }

  withConnection(deviceId: string, state: number, date: Date = new Date()): ProfileSnapshot {
    return this.derive({ currentDeviceId: deviceId, currentState: state, date: date });
  }

  withSubscription(subscribed: boolean, date: Date = new Date()): ProfileSnapshot {
    return this.derive({ subscribed: subscribed, date: date });
  }

  deviceCount(): number {
    return this.devices.length;
  }

  hasDevice(deviceId: string): boolean {
    return this.devices.includes(deviceId);
  }

  describe(): string {
    return text('snapshot_describe', probeStatusName(this.status), this.code, this.message);
  }
}

export class ProfileViewState {
  public status: ProbeStatus = ProbeStatus.IDLE;
  public code: number = 0;
  message: string = text('snapshot_no_instance');
  public devices: string[] = [];
  public selectedDevice: string = '';
  public currentState: number = CONNECTION_STATE_DISCONNECTED;
  public subscribed: boolean = false;
  public updatedAt: string = '--:--:--';
  statusText: string = probeStatusName(ProbeStatus.IDLE);
  hintText: string = probeStatusHint(ProbeStatus.IDLE);
  deviceSummary: string = summarizeDeviceList([]);
  connectionText: string = text('snapshot_no_query');
  public maskedDevices: string[] = [];

  /** 刷新后仍保留用户选择：优先当前快照指向的设备，其次上一次选择，最后取第一个设备 */
  static fromSnapshot(snapshot: ProfileSnapshot, previous: ProfileViewState | null): ProfileViewState {
    const view = new ProfileViewState();
    view.status = snapshot.status;
    view.code = snapshot.code;
    view.message = snapshot.message;
    view.devices = snapshot.devices.slice();
    view.selectedDevice = pickSelectedDevice(snapshot, previous);
    view.currentState = snapshot.currentState;
    view.subscribed = snapshot.subscribed;
    view.updatedAt = snapshot.updatedAt;
    view.statusText = probeStatusName(snapshot.status);
    view.hintText = probeStatusHint(snapshot.status);
    view.deviceSummary = summarizeDeviceList(snapshot.devices);
    view.maskedDevices = snapshot.devices.map((device: string) => maskDeviceId(device));
    view.connectionText = snapshot.currentDeviceId.length > 0 ?
      `${maskDeviceId(snapshot.currentDeviceId)} · ${connectionStateName(snapshot.currentState)}` :
      text('snapshot_no_query');
    return view;
  }

  hasDevices(): boolean {
    return this.devices.length > 0;
  }
}

export function pickSelectedDevice(snapshot: ProfileSnapshot, previous: ProfileViewState | null): string {
  if (snapshot.currentDeviceId.length > 0 && snapshot.hasDevice(snapshot.currentDeviceId)) {
    return snapshot.currentDeviceId;
  }
  const wanted = previous !== null ? previous.selectedDevice : '';
  if (wanted.length > 0 && snapshot.devices.includes(wanted)) {
    return wanted;
  }
  return snapshot.devices.length > 0 ? snapshot.devices[0] : '';
}
