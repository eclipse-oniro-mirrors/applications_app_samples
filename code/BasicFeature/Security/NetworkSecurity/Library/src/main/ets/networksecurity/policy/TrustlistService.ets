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

import { policy } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../utils/Logger';
import { TrustlistView } from './PolicyTypes';

/**
 * Device idle and power save trust lists. Both APIs are @systemapi (MANAGE_NET_STRATEGY, system_basic).
 * setTrustlist() propagates errors, read() degrades safely.
 */
export class TrustlistService {
  /**
   * Add or remove the given UIDs on both trust lists, device idle and power save.
   * @param uids UID array to update on the trust lists.
   * @param allowed true to add the UIDs to both lists, false to remove them.
   */
  static async setTrustlist(uids: number[], allowed: boolean): Promise<void> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.setTrustlist', 1);
    Logger.enter('[TrustlistService#setTrustlist]', 'count: ' + uids.length + ', allowed: ' + allowed);
    // Update the device idle trust list; errors propagate to the caller.
    await policy.setDeviceIdleTrustlist(uids, allowed);
    // Update the power save trust list the same way; errors propagate to the caller.
    await policy.setPowerSaveTrustlist(uids, allowed);
    Logger.exit('[TrustlistService#setTrustlist]');
    // Close the trace section after the last await completes.
    Logger.endTrace('NetworkSecurity.policy.setTrustlist', 1);
  }

  /**
   * Read both trust lists for rendering. Never throws: a failure returns empty lists with loaded = false.
   * @returns the trust list view, degraded to loaded = false on error.
   */
  static async read(): Promise<TrustlistView> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.read', 1);
    Logger.enter('[TrustlistService#read]');
    try {
      // Query the current device idle trust list.
      const deviceIdle: number[] = await policy.getDeviceIdleTrustlist();
      // Query the current power save trust list.
      const powerSave: number[] = await policy.getPowerSaveTrustlist();
      Logger.info('[Trustlist] device idle count ' + deviceIdle.length + ', power save count ' + powerSave.length);
      Logger.exit('[TrustlistService#read]', 'loaded: true');
      // Close the trace section on the success return path.
      Logger.endTrace('NetworkSecurity.policy.read', 1);
      return new TrustlistView(deviceIdle, powerSave, true);
    } catch (error) {
      // Normalize the caught error so the code and message can be logged.
      const err: BusinessError = error as BusinessError;
      Logger.error('[Trustlist] failed to read trust lists, code ' + err.code + ': ' + err.message);
      Logger.exit('[TrustlistService#read]', 'loaded: false');
      // Close the trace section on the degraded return path.
      Logger.endTrace('NetworkSecurity.policy.read', 1);
      return new TrustlistView([], [], false);
    }
  }
}
