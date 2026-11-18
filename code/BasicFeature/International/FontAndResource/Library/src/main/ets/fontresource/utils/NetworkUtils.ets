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

// Import the connection module from the Network kit for connectivity queries.
import { connection } from '@kit.NetworkKit';

// The module tag used for log lines emitted by this utility.
const TAG: string = 'NetworkUtils';

// Connectivity helpers built on @ohos.net.connection with defensive error handling.
export class NetworkUtils {
  // Returns true when the system has any usable default network (Wi-Fi or cellular).
  static async isOnline(): Promise<boolean> {
    try {
      // Ask the connection service whether a default network exists.
      return await connection.hasDefaultNet();
    } catch (error) {
      // Connectivity queries can fail when the service is not ready; report offline.
      return false;
    }
  }

  // Returns the numeric bearer type of the default network, -1 when offline.
  static async networkType(): Promise<number> {
    try {
      // Resolve the default network handle first.
      const netHandle: connection.NetHandle = await connection.getDefaultNet();
      // Report the offline sentinel when no default network exists.
      if (netHandle.netId === 0) {
        // No usable network is present.
        return -1;
      }
      // Query the capability profile of the default network.
      const capabilities: connection.NetCapabilities = await connection.getNetCapabilities(netHandle);
      // Return the bearer type so callers can distinguish Wi-Fi from cellular.
      return capabilities.bearerTypes.length > 0 ? capabilities.bearerTypes[0] : -1;
    } catch (error) {
      // Any failure is treated as no network.
      return -1;
    }
  }

  // Returns true when the default network bearer is Wi-Fi.
  static async isWifi(): Promise<boolean> {
    try {
      // Resolve the default network handle first.
      const netHandle: connection.NetHandle = await connection.getDefaultNet();
      // No Wi-Fi is possible without a default network.
      if (netHandle.netId === 0) {
        // Report false for the offline case.
        return false;
      }
      // Query the capability profile of the default network.
      const capabilities: connection.NetCapabilities = await connection.getNetCapabilities(netHandle);
      // Walk the bearer list looking for the Wi-Fi bearer.
      for (let i: number = 0; i < capabilities.bearerTypes.length; i++) {
        // Compare against the Wi-Fi bearer constant.
        if (capabilities.bearerTypes[i] === connection.NetBearType.BEARER_WIFI) {
          // The Wi-Fi bearer was found.
          return true;
        }
      }
      // No Wi-Fi bearer was present in the profile.
      return false;
    } catch (error) {
      // Any failure is treated as not Wi-Fi.
      return false;
    }
  }

  // Returns true when the default network bearer is cellular.
  static async isCellular(): Promise<boolean> {
    try {
      // Resolve the default network handle first.
      const netHandle: connection.NetHandle = await connection.getDefaultNet();
      // No cellular network is possible without a default network.
      if (netHandle.netId === 0) {
        // Report false for the offline case.
        return false;
      }
      // Query the capability profile of the default network.
      const capabilities: connection.NetCapabilities = await connection.getNetCapabilities(netHandle);
      // Walk the bearer list looking for the cellular bearer.
      for (let i: number = 0; i < capabilities.bearerTypes.length; i++) {
        // Compare against the cellular bearer constant.
        if (capabilities.bearerTypes[i] === connection.NetBearType.BEARER_CELLULAR) {
          // The cellular bearer was found.
          return true;
        }
      }
      // No cellular bearer was present in the profile.
      return false;
    } catch (error) {
      // Any failure is treated as not cellular.
      return false;
    }
  }
}
