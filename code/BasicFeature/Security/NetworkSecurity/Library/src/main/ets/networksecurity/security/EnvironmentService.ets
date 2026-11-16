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

import { connection, networkSecurity } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { EnvironmentCheck } from './SecurityTypes';
import { Logger } from '../utils/Logger';

// Sentinel network id meaning no default network was resolved.
const NET_ID_NONE: number = 0;
// Sentinel length meaning an empty list or string.
const EMPTY_LENGTH: number = 0;
// Sample host name used for the per host cleartext query.
const SAMPLE_HOST: string = 'www.example.com';
// Display text used when a value cannot be queried at all.
const TEXT_UNAVAILABLE: string = 'Unavailable';
// Display text used when a value has no known mapping.
const TEXT_UNKNOWN: string = 'Unknown';

/**
 * Collects the runtime network facts that the certificate and cleartext demos depend on.
 */
export class EnvironmentService {
  /**
   * Map a NetBearType enum value to a short display name.
   * @param bearer bearer type reported by the network capabilities.
   * @returns a short English bearer name, or Unknown when the type is not handled.
   */
  private static bearerText(bearer: connection.NetBearType): string {
    // Map the WiFi bearer to its display name.
    if (bearer === connection.NetBearType.BEARER_WIFI) {
      return 'WiFi';
    }
    // Map the cellular bearer to its display name.
    if (bearer === connection.NetBearType.BEARER_CELLULAR) {
      return 'Cellular';
    }
    // Map the ethernet bearer to its display name.
    if (bearer === connection.NetBearType.BEARER_ETHERNET) {
      return 'Ethernet';
    }
    // Map the VPN bearer to its display name.
    if (bearer === connection.NetBearType.BEARER_VPN) {
      return 'VPN';
    }
    // Map the bluetooth bearer to its display name.
    if (bearer === connection.NetBearType.BEARER_BLUETOOTH) {
      return 'Bluetooth';
    }
    // Unknown bearer types fall back to a generic name.
    return TEXT_UNKNOWN;
  }

  /**
   * Convert a bearer type list into a comma separated display text.
   * @param bearers bearer types reported by the network capabilities.
   * @returns comma separated bearer names, or Unknown when the list is empty.
   */
  private static bearerTexts(bearers: connection.NetBearType[]): string {
    // An empty capability list cannot be described meaningfully.
    if (bearers.length === EMPTY_LENGTH) {
      return TEXT_UNKNOWN;
    }
    // Accumulate bearer names into one display string.
    let text: string = '';
    // Append every bearer name, separating all but the first with a comma.
    for (let index = 0; index < bearers.length; index++) {
      const name: string = EnvironmentService.bearerText(bearers[index]);
      // Use the bare name for the first item and a comma prefix afterwards.
      text = index === 0 ? name : text + ', ' + name;
    }
    // Return the joined display text.
    return text;
  }

  /**
   * Returns six checks: default network, bearer type, MTU, DNS count, global cleartext switch,
   * and whether the per host cleartext query works. A missing default network is reported as unavailable.
   */
  static async check(): Promise<EnvironmentCheck[]> {
    // Open the trace section for the profiler before doing any work.
    Logger.beginTrace('NetworkSecurity.security.check', 1);
    Logger.enter('[EnvironmentService#check]', 'params: none');
    // Result list rendered by the environment page.
    const checks: EnvironmentCheck[] = [];
    // Default network id, 0 means no default network was resolved.
    let netId: number = NET_ID_NONE;
    // Read the default network synchronously; failure is tolerated.
    try {
      const handle: connection.NetHandle = connection.getDefaultNetSync();
      // Remember the default network id for the online decision.
      netId = handle.netId;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.warn('[Environment] getDefaultNetSync failed, code ' + err.code.toString());
    }

    // The device is online only when a default network id was resolved.
    const online: boolean = netId !== NET_ID_NONE;
    // Report the default network check first.
    checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_default_net'),
      online ? 'netId ' + netId.toString() : 'No default network', online));

    if (!online) {
      // Without a default network the dependent checks are unavailable.
      checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_bearer'), TEXT_UNAVAILABLE, false));
      checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_mtu'), TEXT_UNAVAILABLE, false));
      checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_dns'), TEXT_UNAVAILABLE, false));
    } else {
      // Read capability and property details for the default network.
      try {
        const handle: connection.NetHandle = connection.getDefaultNetSync();
        const capabilities: connection.NetCapabilities = connection.getNetCapabilitiesSync(handle);
        const bearerText: string = EnvironmentService.bearerTexts(capabilities.bearerTypes);
        // Report the bearer types of the active network.
        checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_bearer'), bearerText,
          capabilities.bearerTypes.length > EMPTY_LENGTH));
        // Read connection properties asynchronously to inspect MTU and DNS.
        const properties: connection.ConnectionProperties = await connection.getConnectionProperties(handle);
        // Report the interface MTU.
        checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_mtu'), properties.mtu.toString(),
          properties.mtu > 0));
        // Report the number of configured DNS servers.
        checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_dns'), properties.dnses.length.toString(),
          properties.dnses.length > EMPTY_LENGTH));
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        Logger.warn('[Environment] Network capabilities unavailable, code ' + err.code.toString());
        // Mark the dependent checks unavailable when the query fails.
        checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_bearer'), TEXT_UNAVAILABLE, false));
        checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_mtu'), TEXT_UNAVAILABLE, false));
        checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_dns'), TEXT_UNAVAILABLE, false));
      }
    }

    // Global cleartext switch value, false when the API is not queryable.
    let globalAllowed: boolean = false;
    // Whether the global cleartext API answered at all.
    let globalQueryable: boolean = true;
    // Query the global cleartext switch synchronously.
    try {
      globalAllowed = networkSecurity.isCleartextPermitted();
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      // Mark the query as failed so the UI shows unavailable.
      globalQueryable = false;
      Logger.warn('[Environment] isCleartextPermitted failed, code ' + err.code.toString());
    }
    // Report the global cleartext check.
    checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_cleartext'),
      globalQueryable ? (globalAllowed ? 'Permitted' : 'Blocked') : TEXT_UNAVAILABLE, globalQueryable));

    // Host cleartext decision for the sample host, false when the API is not queryable.
    let hostAllowed: boolean = false;
    // Whether the per host cleartext API answered at all.
    let hostQueryable: boolean = true;
    // Query the per host cleartext decision for the sample host.
    try {
      hostAllowed = networkSecurity.isCleartextPermittedByHostName(SAMPLE_HOST);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      // Mark the query as failed so the UI shows unavailable.
      hostQueryable = false;
      Logger.warn('[Environment] Host cleartext query failed, code ' + err.code.toString());
    }
    // Report the per host cleartext check.
    checks.push(new EnvironmentCheck($r('app.string.ns_sec_env_cleartext_api'),
      hostQueryable ? (hostAllowed ? 'Allowed' : 'Blocked') : TEXT_UNAVAILABLE, hostQueryable));

    Logger.info('[Environment] Environment check finished, items ' + checks.length.toString());
    Logger.exit('[EnvironmentService#check]', 'result: items ' + checks.length.toString());
    // Close the trace section before returning the collected checks.
    Logger.endTrace('NetworkSecurity.security.check', 1);
    return checks;
  }
}
