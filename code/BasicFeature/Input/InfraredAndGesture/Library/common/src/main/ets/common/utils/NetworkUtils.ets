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

import { AppLogger } from '../AppLogger';

/** Type name returned for WiFi bearers. */
const NET_TYPE_WIFI: string = 'wifi';
/** Type name returned for cellular bearers. */
const NET_TYPE_CELLULAR: string = 'cellular';
/** Type name returned for ethernet bearers. */
const NET_TYPE_ETHERNET: string = 'ethernet';
/** Type name returned when the network type cannot be determined. */
const NET_TYPE_UNKNOWN: string = 'unknown';

/**
 * Utility class for network status queries based on @kit.NetworkKit.
 * All methods are static, never throw and return safe fallbacks;
 * every failure branch logs a warning through AppLogger.
 */
export class NetworkUtils {
  /**
   * Checks whether the device currently has any default network.
   */
  public static async isNetworkAvailable(): Promise<boolean> {
    try {
      // hasDefaultNet is the cheapest availability probe.
      return await connection.hasDefaultNet();
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('NetworkUtils', `isNetworkAvailable failed: ${error.message}`);
      return false;
    }
  }

  /**
   * Returns the default network handle, or null when offline or on failure.
   */
  public static async getDefaultNetHandle(): Promise<connection.NetHandle | null> {
    try {
      const handle: connection.NetHandle = await connection.getDefaultNet();
      // A netId of zero means that no default network is bound.
      if (handle.netId <= 0) {
        return null;
      }
      return handle;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('NetworkUtils', `getDefaultNetHandle failed: ${error.message}`);
      return null;
    }
  }

  /**
   * Returns the human readable type name of the default network.
   * Possible values: 'wifi', 'cellular', 'ethernet' or 'unknown'.
   */
  public static async getNetworkTypeName(): Promise<string> {
    try {
      const handle: connection.NetHandle | null = await NetworkUtils.getDefaultNetHandle();
      if (handle === null) {
        return NET_TYPE_UNKNOWN;
      }
      // Capabilities describe the bearer behind the default network.
      const capabilities: connection.NetCapabilities = await connection.getNetCapabilities(handle);
      // bearerTypes is the array of bearers behind the default network.
      const bearerTypes: connection.NetBearType[] = capabilities.bearerTypes;
      if (bearerTypes.includes(connection.NetBearType.BEARER_WIFI)) {
        return NET_TYPE_WIFI;
      }
      if (bearerTypes.includes(connection.NetBearType.BEARER_CELLULAR)) {
        return NET_TYPE_CELLULAR;
      }
      if (bearerTypes.includes(connection.NetBearType.BEARER_ETHERNET)) {
        return NET_TYPE_ETHERNET;
      }
      return NET_TYPE_UNKNOWN;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('NetworkUtils', `getNetworkTypeName failed: ${error.message}`);
      return NET_TYPE_UNKNOWN;
    }
  }

  /**
   * Checks whether the default network is a WiFi connection.
   */
  public static async isWifiConnected(): Promise<boolean> {
    return (await NetworkUtils.getNetworkTypeName()) === NET_TYPE_WIFI;
  }

  /**
   * Checks whether the default network is a cellular connection.
   */
  public static async isCellularConnected(): Promise<boolean> {
    return (await NetworkUtils.getNetworkTypeName()) === NET_TYPE_CELLULAR;
  }

  /**
   * Checks whether the default network is an ethernet connection.
   */
  public static async isEthernetConnected(): Promise<boolean> {
    return (await NetworkUtils.getNetworkTypeName()) === NET_TYPE_ETHERNET;
  }
}
