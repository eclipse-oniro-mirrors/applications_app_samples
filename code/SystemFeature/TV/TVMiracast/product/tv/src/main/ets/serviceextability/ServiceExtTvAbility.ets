/*
 * Copyright (C) 2026 HiHope Open Source Organization.
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

import { rpc } from '@kit.IPCKit';
import { settings } from '@kit.BasicServicesKit';
import type { Want, Configuration } from '@kit.AbilityKit';
import MiracastPlayerServiceImpl from './MiracastPlayerServiceImpl';
import { Log, MIRACAST_SETTINGS_KEY, TrustDeviceManager } from 'library';
import { DeviceConnectListener, onConnectCallback, onDisconnectCallback } from './DeviceConnectListener';

const TAG = 'ServiceExtTvAbility';
const ON = '1';
const OFF = '0';

class ServiceExtTvAbility {
  private impl: MiracastPlayerServiceImpl = new MiracastPlayerServiceImpl('MiracastPlayerService');

  onCreate(want: Want) {
    Log.info(TAG, `onCreate, want: ${want.abilityName}`);
    // Note: Stage mode does not support registerKeyObserver
    // The quickstart functionality should be handled differently in Stage mode
    Log.info(TAG, 'Stage mode: registerKeyObserver not available');
    globalThis.miracastImpl = this.impl;
  }

  onSettingChanged() {
    Log.info(TAG, `onSettingChanged - not available in Stage mode`);
  }

  onDestroy() {
    Log.info(TAG, `onDestroy`);
    this.impl.stopMiracastService((errCode: number, returnValue: number) => undefined);
  }

  onRequest(want: Want, startId: number) {
    Log.info(TAG, `onRequest, want: ${want.abilityName}, startId: ${startId}`);
    if (want && want.parameters && want.parameters.startMiracastService) {
      setTimeout(() => {
        this.impl.startMiracastService((errCode: number, returnValue: number) => {
        });
      }, 8000);
    }
  }

  onConnect(want: Want): rpc.RemoteObject | Promise<rpc.RemoteObject> {
    Log.info(TAG, `onConnect , want: ${want.abilityName}`);
    return this.impl;
  }

  onDisconnect(want: Want): void | Promise<void> {
    Log.info(TAG, `onDisconnect, want: ${want.abilityName}`);
  }

  onReconnect(want: Want) {
    Log.info(TAG, `onReconnect, want: ${want.abilityName}`);
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    Log.info(TAG, `onConfigurationUpdate, config: ${JSON.stringify(newConfig)}`);
  }

  onDump(params: Array<string>) {
    Log.info(TAG, `onDump, params: ${JSON.stringify(params)}`);
    return ['params'];
  }
}

export default ServiceExtTvAbility;
