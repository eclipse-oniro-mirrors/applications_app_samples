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
import { i18n } from '@kit.LocalizationKit';

// Fallback text returned when the platform reports nothing useful.
const UNKNOWN: string = 'unknown';
// Sub string of the emulator product model, used as the only reliable emulator hint.
const EMULATOR_MARK: string = 'emulator';

/**
 * Thin wrapper around the read only device information constants.
 * Only stable fields are touched so the class keeps working across API levels.
 * The values returned here are safe to show on a debug screen and never contain user data.
 */
export class DeviceUtils {
  /**
   * Returns the commercial product model name.
   * @returns Product model such as "Mate 60" or the fallback text.
   */
  static getProductModel(): string {
    // Read the constant and normalize an empty answer to the fallback text.
    const model: string = deviceInfo.productModel;
    // Return the fallback when the platform gave an empty string.
    return model.length === 0 ? UNKNOWN : model;
  }

  /**
   * Returns the full operating system name, for example "OpenHarmony 5.0".
   * @returns OS full name or the fallback text.
   */
  static getOsFullName(): string {
    // Read the constant composed by the platform.
    const name: string = deviceInfo.osFullName;
    // Return the fallback when the platform gave an empty string.
    return name.length === 0 ? UNKNOWN : name;
  }

  /**
   * Returns the SDK API version of the running system.
   * @returns API version number, or 0 when it can not be read.
   */
  static getSdkApiVersion(): number {
    // Read the numeric constant exposed by the platform.
    const version: number = deviceInfo.sdkApiVersion;
    // A negative value would be meaningless, so clamp it to zero.
    return version > 0 ? version : 0;
  }

  /**
   * Returns the device type reported by the platform.
   * @returns Type string such as "phone" or "tablet".
   */
  static getDeviceType(): string {
    // Read the constant that classifies the hardware.
    const type: string = deviceInfo.deviceType;
    // Return the fallback when the platform gave an empty string.
    return type.length === 0 ? UNKNOWN : type;
  }

  /**
   * Best effort emulator detection based on the product model name.
   * @returns True when the model name contains the emulator mark.
   */
  static isEmulator(): boolean {
    // Take the normalized model name as the only evidence.
    const model: string = DeviceUtils.getProductModel().toLowerCase();
    // Report whether the emulator mark appears inside the model name.
    return model.indexOf(EMULATOR_MARK) >= 0;
  }

  /**
   * Returns the system language tag, for example "zh-Hans-CN".
   * @returns Language tag or the fallback text.
   */
  static getLanguage(): string {
    try {
      // Read the current system language through the localization kit.
      const language: string = i18n.System.getSystemLanguage();
      // Return the fallback when the platform gave an empty string.
      return language.length === 0 ? UNKNOWN : language;
    } catch (error) {
      // The kit can fail on a stripped down image, so the fallback keeps the call exception free.
      return UNKNOWN;
    }
  }
}
