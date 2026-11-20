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

// Import deviceInfo from the Basic Services kit for hardware and OS metadata.
import { deviceInfo } from '@kit.BasicServicesKit';

// Read-only device and OS information helpers built on @ohos.deviceInfo.
export class DeviceUtils {
  // Returns the marketing name of the device model.
  static marketName(): string {
    // Read the product marketing name reported by the system.
    return deviceInfo.marketName;
  }

  // Returns the technical product model, for example "ALN-AL00".
  static productModel(): string {
    // Read the product model identifier reported by the system.
    return deviceInfo.productModel;
  }

  // Returns the device form factor such as "phone", "tablet" or "wearable".
  static deviceType(): string {
    // Read the device type reported by the system.
    return deviceInfo.deviceType;
  }

  // Returns the full OS display name such as "OpenHarmony 5.0.0 Release".
  static osFullName(): string {
    // Read the human readable OS name reported by the system.
    return deviceInfo.osFullName;
  }

  // Returns the numeric SDK API version of the running system.
  static sdkApiVersion(): number {
    // Read the API level reported by the system.
    return deviceInfo.sdkApiVersion;
  }

  // Returns true when the running API level is greater than or equal to the target.
  static isApiAtLeast(target: number): boolean {
    // Compare the current API level against the requested target.
    return deviceInfo.sdkApiVersion >= target;
  }

  // Returns the major OS version number when available.
  static majorVersion(): number {
    // Read the major version field reported by the system.
    return deviceInfo.majorVersion;
  }

  // Returns the security patch label of the system image.
  static securityPatch(): string {
    // Read the security patch tag reported by the system.
    return deviceInfo.securityPatchTag;
  }

  // Returns the device serial identifier string.
  static serial(): string {
    // Read the serial reported by the system; may be restricted on some builds.
    return deviceInfo.serial;
  }

  // Returns the displayed build version of the system.
  static displayVersion(): string {
    // Read the display build version reported by the system.
    return deviceInfo.displayVersion;
  }

  // Builds a one-line device summary useful in support logs.
  static summaryText(): string {
    // Compose the summary from model, type and OS fields.
    return DeviceUtils.marketName() + ' (' + DeviceUtils.deviceType() + '), ' + DeviceUtils.osFullName() +
      ', API ' + DeviceUtils.sdkApiVersion().toString();
  }
}
