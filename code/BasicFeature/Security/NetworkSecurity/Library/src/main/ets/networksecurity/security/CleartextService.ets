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

import { networkSecurity } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../utils/Logger';

// Sentinel length meaning an empty host name.
const EMPTY_LENGTH: number = 0;

/**
 * Queries the cleartext HTTP policy defined in network_config.json.
 * Both methods never throw: when the platform call fails the failure is logged and false is returned.
 */
export class CleartextService {
  /**
   * Global cleartext switch (base-config.cleartextTrafficPermitted).
   */
  static globalAllowed(): boolean {
    // Open the trace section for the profiler before doing any work.
    Logger.beginTrace('NetworkSecurity.security.globalAllowed', 1);
    Logger.enter('[CleartextService#globalAllowed]', 'params: none');
    // Query the global cleartext switch; the call may fail on some platforms.
    try {
      const allowed: boolean = networkSecurity.isCleartextPermitted();
      Logger.info('[Cleartext] Global cleartext permitted: ' + allowed.toString());
      Logger.exit('[CleartextService#globalAllowed]', 'result: ' + allowed.toString());
      // Close the trace section before returning the queried decision.
      Logger.endTrace('NetworkSecurity.security.globalAllowed', 1);
      return allowed;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.warn('[Cleartext] isCleartextPermitted failed, code ' + err.code.toString());
      Logger.exit('[CleartextService#globalAllowed]', 'result: false, query failed');
      // Close the trace section before returning the safe fallback.
      Logger.endTrace('NetworkSecurity.security.globalAllowed', 1);
      // Report false when the platform call fails so the demo keeps working.
      return false;
    }
  }

  /**
   * Per host cleartext decision, resolved against base-config and domain-config.
   */
  static hostAllowed(host: string): boolean {
    // Open the trace section for the profiler before doing any work.
    Logger.beginTrace('NetworkSecurity.security.hostAllowed', 1);
    Logger.enter('[CleartextService#hostAllowed]', 'params: host ' + host);
    // Trim the input so blank host names are rejected uniformly.
    const target: string = host.trim();
    // Reject empty host names before touching the platform API.
    if (target.length === EMPTY_LENGTH) {
      Logger.warn('[Cleartext] Empty host name, query skipped');
      Logger.exit('[CleartextService#hostAllowed]', 'result: false, empty host');
      // Close the trace section before returning the rejected outcome.
      Logger.endTrace('NetworkSecurity.security.hostAllowed', 1);
      return false;
    }
    // Query the per host cleartext decision; the call may fail on some platforms.
    try {
      const allowed: boolean = networkSecurity.isCleartextPermittedByHostName(target);
      Logger.info('[Cleartext] Host ' + target + ' cleartext permitted: ' + allowed.toString());
      Logger.exit('[CleartextService#hostAllowed]', 'result: ' + allowed.toString());
      // Close the trace section before returning the queried decision.
      Logger.endTrace('NetworkSecurity.security.hostAllowed', 1);
      return allowed;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.warn('[Cleartext] Host query failed, code ' + err.code.toString());
      Logger.exit('[CleartextService#hostAllowed]', 'result: false, query failed');
      // Close the trace section before returning the safe fallback.
      Logger.endTrace('NetworkSecurity.security.hostAllowed', 1);
      // Report false when the platform call fails so the demo keeps working.
      return false;
    }
  }
}
