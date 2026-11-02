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
 
import { deviceInfo } from '@kit.BasicServicesKit';
import { display } from '@kit.ArkUI';
import {
  DeviceForm,
  DisplaySnapshot,
  LayoutProfile,
  buildLayoutProfile,
  pxToVp,
  resolveDeviceForm
} from '../model/DeviceProfile';

export class DeviceSnapshot {
  deviceType: string;
  display: DisplaySnapshot;
  profile: LayoutProfile;

  constructor(deviceType: string, displaySnapshot: DisplaySnapshot, profile: LayoutProfile) {
    this.deviceType = deviceType;
    this.display = displaySnapshot;
    this.profile = profile;
  }
}

export function readDeviceType(): string {
  try {
    const type = deviceInfo.deviceType;
    return type.length > 0 ? type : DeviceForm.DEFAULT;
  } catch (err) {
    return DeviceForm.DEFAULT;
  }
}

export function readDisplaySnapshot(): DisplaySnapshot {
  try {
    const info = display.getDefaultDisplaySync();
    const density = info.densityPixels > 0 ? info.densityPixels : 1;
    return new DisplaySnapshot(pxToVp(info.width, density), pxToVp(info.height, density), density);
  } catch (err) {
    return new DisplaySnapshot(360, 780, 1);
  }
}

export function readDeviceSnapshot(): DeviceSnapshot {
  const deviceType = readDeviceType();
  const snapshot = readDisplaySnapshot();
  const profile = buildLayoutProfile(resolveDeviceForm(deviceType), snapshot);
  return new DeviceSnapshot(deviceType, snapshot, profile);
}

export class DisplayWatcher {
  private listener: ((data: number) => void) | null = null;
  private active: boolean = false;

  attach(callback: (snapshot: DisplaySnapshot) => void): boolean {
    if (this.active) {
      return true;
    }
    const listener = (data: number): void => {
      callback(readDisplaySnapshot());
    };
    this.listener = listener;
    try {
      display.on('change', listener);
      this.active = true;
      return true;
    } catch (err) {
      this.listener = null;
      return false;
    }
  }

  detach(): void {
    if (!this.active || this.listener === null) {
      return;
    }
    try {
      display.off('change', this.listener);
    } catch (err) {
      // 忽略注销失败，页面销毁后监听不会再影响 UI
    }
    this.active = false;
    this.listener = null;
  }
}

export const displayWatcher: DisplayWatcher = new DisplayWatcher();
