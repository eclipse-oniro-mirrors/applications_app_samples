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

import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ResourceUtils } from '../utils/ResourceUtils';

export const ACCESS_FAILED_STRING: string = '';
export const ACCESS_FAILED_NUMBER: number = -1;
export const ACCESS_EMPTY_JSON: string = '{}';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ResourceManager]';

/**
 * Thin, fail-soft wrapper around ResourceManager.
 *
 * The wrapper never rethrows: every failure is logged and mapped to a documented
 * sentinel (empty string, empty array, -1 or '{}'), which keeps the page code free
 * of try/catch and lets ohosTest assert the contract without mocking the system.
 */
export class ResourceAccessService {
  private resMgr: resourceManager.ResourceManager;

  constructor(resMgr: resourceManager.ResourceManager) {
    this.resMgr = resMgr;
  }

  /** Raw string resource, ACCESS_FAILED_STRING when the id cannot be resolved. */
  async getString(resId: number): Promise<string> {
    try {
      return await this.resMgr.getStringValue(resId);
    } catch (error) {
      this.logFailure('getStringValue', error as BusinessError);
      return ACCESS_FAILED_STRING;
    }
  }

  /** String array resource, empty array when the id cannot be resolved. */
  async getStringArray(resource: resourceManager.Resource): Promise<string[]> {
    try {
      return await this.resMgr.getStringArrayValue(resource);
    } catch (error) {
      this.logFailure('getStringArrayValue', error as BusinessError);
      return [];
    }
  }

  /** Plural resource, ACCESS_FAILED_STRING for bad quantities or unresolvable ids. */
  async getPluralString(resId: number, num: number): Promise<string> {
    if (!ResourceUtils.isValidPluralNum(num)) {
      hilog.warn(DOMAIN, TAG, 'getPluralString rejected quantity: %{public}d', num);
      return ACCESS_FAILED_STRING;
    }
    try {
      return await this.resMgr.getPluralStringValue(resId, num);
    } catch (error) {
      this.logFailure('getPluralStringValue', error as BusinessError);
      return ACCESS_FAILED_STRING;
    }
  }

  /** Media payload length in bytes, ACCESS_FAILED_NUMBER on failure. */
  async getMediaByteLength(resId: number): Promise<number> {
    try {
      const bytes: Uint8Array = await this.resMgr.getMediaContent(resId);
      return bytes.length;
    } catch (error) {
      this.logFailure('getMediaContent', error as BusinessError);
      return ACCESS_FAILED_NUMBER;
    }
  }

  /** Media payload encoded as base64, ACCESS_FAILED_STRING on failure. */
  async getMediaBase64(resId: number): Promise<string> {
    try {
      return await this.resMgr.getMediaContentBase64(resId);
    } catch (error) {
      this.logFailure('getMediaContentBase64', error as BusinessError);
      return ACCESS_FAILED_STRING;
    }
  }

  /** Length of the base64 form of a media resource, ACCESS_FAILED_NUMBER on failure. */
  async getMediaBase64Length(resId: number): Promise<number> {
    const encoded: string = await this.getMediaBase64(resId);
    return encoded.length;
  }

  /** Base64 payload rendered for a specific density bucket. */
  async getDensityMediaBase64(resId: number, density: number): Promise<string> {
    const bucket: number = ResourceUtils.normalizeDensity(density);
    try {
      return await this.resMgr.getMediaContentBase64(resId, bucket);
    } catch (error) {
      this.logFailure('getMediaContentBase64(density)', error as BusinessError);
      return ACCESS_FAILED_STRING;
    }
  }

  /** Formatted string resource, ACCESS_FAILED_STRING on failure. */
  formatString(resId: number, world: string): string {
    try {
      return this.resMgr.getStringSync(resId, ResourceUtils.sanitizeWorld(world));
    } catch (error) {
      this.logFailure('getStringSync', error as BusinessError);
      return ACCESS_FAILED_STRING;
    }
  }

  /** Serialized device configuration, ACCESS_EMPTY_JSON on failure. */
  async getConfigurationJson(): Promise<string> {
    try {
      const configuration: resourceManager.Configuration = await this.resMgr.getConfiguration();
      return JSON.stringify(configuration);
    } catch (error) {
      this.logFailure('getConfiguration', error as BusinessError);
      return ACCESS_EMPTY_JSON;
    }
  }

  /** Serialized device capability, ACCESS_EMPTY_JSON on failure. */
  async getCapabilityJson(): Promise<string> {
    try {
      const capability: resourceManager.DeviceCapability = await this.resMgr.getDeviceCapability();
      return JSON.stringify(capability);
    } catch (error) {
      this.logFailure('getDeviceCapability', error as BusinessError);
      return ACCESS_EMPTY_JSON;
    }
  }

  /** Base64 payload of a system resource, ACCESS_FAILED_STRING on failure. */
  async getSystemMediaBase64(resId: number): Promise<string> {
    try {
      const systemMgr: resourceManager.ResourceManager = resourceManager.getSystemResourceManager();
      return await systemMgr.getMediaContentBase64(resId);
    } catch (error) {
      this.logFailure('getSystemResourceManager', error as BusinessError);
      return ACCESS_FAILED_STRING;
    }
  }

  /** True when the last read produced a usable value. */
  static isUsable(value: string): boolean {
    return value !== undefined && value !== null && value.length > 0;
  }

  private logFailure(api: string, error: BusinessError): void {
    hilog.error(DOMAIN, TAG, '%{public}s failed, code: %{public}d, message: %{public}s',
      api, error.code, error.message);
  }
}
