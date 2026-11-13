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

import { connection } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from './Logger';

// NetHandle netId used when no default network exists.
const NET_ID_NONE: number = 0;
// Text returned when the bearer type cannot be resolved.
const TEXT_UNKNOWN: string = 'Unknown';

/**
 * Snapshot of the default network reported by NetworkUtils.
 */
export interface NetworkInfo {
  available: boolean;
  netId: number;
  bearerText: string;
}

/**
 * Network helpers built on the NetworkKit connection module: default
 * network reachability, bearer type naming and a combined network
 * snapshot. All methods catch their own failures and return plain values.
 */
export class NetworkUtils {
  /**
   * Check whether the system currently has a default network.
   * @returns true when a default network is present.
   */
  static async hasDefaultNetwork(): Promise<boolean> {
    const tag: string = '[NetworkUtils#hasDefaultNetwork]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.hasDefaultNetwork', 1);
    // hasDefaultNet resolves with the system level default network state.
    let result: boolean = false;
    try {
      result = await connection.hasDefaultNet();
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(tag + ' hasDefaultNet failed, code ' + err.code.toString());
      result = false;
    }
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.hasDefaultNetwork', 1);
    return result;
  }

  /**
   * Check whether the default network is usable, requiring both a default
   * network handle and readable capabilities.
   * @returns true when the default network is present and readable.
   */
  static async isNetworkAvailable(): Promise<boolean> {
    const tag: string = '[NetworkUtils#isNetworkAvailable]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.isNetworkAvailable', 1);
    // Reuse the snapshot logic so availability has one definition.
    const info: NetworkInfo = await NetworkUtils.getNetworkInfo();
    Logger.exit(tag, 'result: ' + info.available.toString());
    Logger.endTrace('NetworkSecurity.utils.isNetworkAvailable', 1);
    return info.available;
  }

  /**
   * Resolve the bearer type of the default network into a readable name.
   * @returns the bearer name such as WiFi or Cellular, or Unknown.
   */
  static async getBearerName(): Promise<string> {
    const tag: string = '[NetworkUtils#getBearerName]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.getBearerName', 1);
    // The snapshot already carries the resolved bearer text.
    const info: NetworkInfo = await NetworkUtils.getNetworkInfo();
    Logger.exit(tag, 'result: ' + info.bearerText);
    Logger.endTrace('NetworkSecurity.utils.getBearerName', 1);
    return info.bearerText;
  }

  /**
   * Collect the default network snapshot: availability, netId and bearer
   * name; failures degrade to an unavailable snapshot without throwing.
   * @returns a NetworkInfo describing the current default network.
   */
  static async getNetworkInfo(): Promise<NetworkInfo> {
    const tag: string = '[NetworkUtils#getNetworkInfo]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.getNetworkInfo', 1);
    // Start from the unavailable shape so failures fall through cleanly.
    let info: NetworkInfo = { available: false, netId: NET_ID_NONE, bearerText: TEXT_UNKNOWN };
    try {
      // getDefaultNetSync throws when no default network exists.
      const handle: connection.NetHandle = connection.getDefaultNetSync();
      // Capabilities expose the bearer types of the default network.
      const capabilities: connection.NetCapabilities = connection.getNetCapabilitiesSync(handle);
      const bearerText: string = NetworkUtils.bearerTexts(capabilities.bearerTypes);
      info = { available: capabilities.bearerTypes.length > 0, netId: handle.netId, bearerText: bearerText };
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(tag + ' snapshot failed, code ' + err.code.toString());
      info = { available: false, netId: NET_ID_NONE, bearerText: TEXT_UNKNOWN };
    }
    Logger.exit(tag, 'available: ' + info.available.toString() + ', bearer: ' + info.bearerText);
    Logger.endTrace('NetworkSecurity.utils.getNetworkInfo', 1);
    return info;
  }

  /**
   * Render bearer types as a comma separated readable list.
   * @param bearers bearer types reported by the capabilities object.
   * @returns the readable bearer list, or Unknown when it is empty.
   */
  private static bearerTexts(bearers: connection.NetBearType[]): string {
    // Unknown keeps the contract stable when no bearer is reported.
    if (bearers.length === 0) {
      return TEXT_UNKNOWN;
    }
    // Map each bearer to its name and join the list with commas.
    let text: string = '';
    for (let index = 0; index < bearers.length; index++) {
      const name: string = NetworkUtils.bearerText(bearers[index]);
      text = index === 0 ? name : text + ', ' + name;
    }
    return text;
  }

  /**
   * Map a single bearer type to its readable name.
   * @param bearer bearer type reported by the capabilities object.
   * @returns the readable name of the bearer type.
   */
  private static bearerText(bearer: connection.NetBearType): string {
    // Compare against the connection enum values one by one.
    if (bearer === connection.NetBearType.BEARER_WIFI) {
      return 'WiFi';
    }
    if (bearer === connection.NetBearType.BEARER_CELLULAR) {
      return 'Cellular';
    }
    if (bearer === connection.NetBearType.BEARER_ETHERNET) {
      return 'Ethernet';
    }
    if (bearer === connection.NetBearType.BEARER_VPN) {
      return 'VPN';
    }
    if (bearer === connection.NetBearType.BEARER_BLUETOOTH) {
      return 'Bluetooth';
    }
    return TEXT_UNKNOWN;
  }
}
