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

import { deviceInfo, BusinessError } from '@kit.BasicServicesKit';
import { display } from '@kit.ArkUI';
import { Logger } from './Logger';

// Density value reported when the display cannot be inspected.
const DENSITY_UNKNOWN: number = 0;

/**
 * Device helpers built on BasicServicesKit deviceInfo and the display
 * module: brand, model, OS version, API version, screen density, device
 * type and ABI list. All values are read-only constants of the running
 * device, so every method is cheap to call repeatedly.
 */
export class DeviceUtils {
  /**
   * Return the device brand name.
   * @returns the brand, for example HUAWEI.
   */
  static getBrand(): string {
    const tag: string = '[DeviceUtils#getBrand]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.getBrand', 1);
    // deviceInfo.brand is a read-only system constant.
    const result: string = deviceInfo.brand;
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.getBrand', 1);
    return result;
  }

  /**
   * Return the certified product model.
   * @returns the product model, for example ALN-AL00.
   */
  static getModel(): string {
    const tag: string = '[DeviceUtils#getModel]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.getModel', 1);
    // productModel is the certified model string of the device.
    const result: string = deviceInfo.productModel;
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.getModel', 1);
    return result;
  }

  /**
   * Return the full operating system version name.
   * @returns the OS full name, for example OpenHarmony-5.0.0.1.
   */
  static getOsVersion(): string {
    const tag: string = '[DeviceUtils#getOsVersion]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.getOsVersion', 1);
    // osFullName carries the complete system version text.
    const result: string = deviceInfo.osFullName;
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.getOsVersion', 1);
    return result;
  }

  /**
   * Return the system software API version.
   * @returns the SDK API version, for example 12.
   */
  static getApiVersion(): number {
    const tag: string = '[DeviceUtils#getApiVersion]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.getApiVersion', 1);
    // sdkApiVersion is the numeric API level of the running system.
    const result: number = deviceInfo.sdkApiVersion;
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.getApiVersion', 1);
    return result;
  }

  /**
   * Return the physical screen density of the default display in DPI.
   * @returns the density DPI, or 0 when the display cannot be inspected.
   */
  static getScreenDensity(): number {
    const tag: string = '[DeviceUtils#getScreenDensity]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.getScreenDensity', 1);
    // Display lookup may fail very early in startup, so guard it.
    let result: number = DENSITY_UNKNOWN;
    try {
      // getDefaultDisplaySync exposes densityDPI directly.
      const defaultDisplay: display.Display = display.getDefaultDisplaySync();
      result = defaultDisplay.densityDPI;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(tag + ' display lookup failed, code ' + err.code.toString());
      result = DENSITY_UNKNOWN;
    }
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.getScreenDensity', 1);
    return result;
  }

  /**
   * Return the device type declared by the system.
   * @returns the device type, for example phone or tablet.
   */
  static getDeviceType(): string {
    const tag: string = '[DeviceUtils#getDeviceType]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.getDeviceType', 1);
    // deviceType mirrors the module.json deviceTypes declaration.
    const result: string = deviceInfo.deviceType;
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.getDeviceType', 1);
    return result;
  }

  /**
   * Return the supported ABI list of the running device.
   * @returns the ABI list, for example arm64-v8a.
   */
  static getAbiList(): string {
    const tag: string = '[DeviceUtils#getAbiList]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.getAbiList', 1);
    // abiList lists every supported application binary interface.
    const result: string = deviceInfo.abiList;
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.getAbiList', 1);
    return result;
  }
}
