/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

export const ERR_CODE_OK: number = 0;
export const ERR_BUNDLE_NOT_FOUND: number = 17700001;
export const ERR_BUNDLE_DISABLED: number = 17700026;
export const ERR_USER_NOT_FOUND: number = 17700004;
export const ERR_PERMISSION_DENIED: number = 201;
export const ERR_PARAMETER: number = 401;

export const SELF_BUNDLE_NAME: string = abilityDelegatorRegistry.getArguments().bundleName;
export const NON_EXIST_BUNDLE_NAME: string = 'ohos.app.hap.notexist';
export const EXISTING_SYSTEM_BUNDLE_NAME: string = 'com.ohos.settings';

export class ProbeFailure {
  readonly code: number;
  readonly message: string;
  readonly isBusinessError: boolean;

  constructor(code: number, message: string, isBusinessError: boolean) {
    this.code = code;
    this.message = message;
    this.isBusinessError = isBusinessError;
  }
}

export interface SyncProbeResult {
  ok: boolean;
  info: bundleManager.BundleInfo | undefined;
  failure: ProbeFailure | undefined;
}

export async function querySelf(flags: number): Promise<bundleManager.BundleInfo> {
  return bundleManager.getBundleInfoForSelf(flags);
}

export async function querySelfSafely(flags: number): Promise<SyncProbeResult> {
  try {
    const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
    return { ok: true, info: info, failure: undefined };
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    return { ok: false, info: undefined, failure: new ProbeFailure(err.code, err.message, err instanceof Error) };
  }
}

export function querySelfSync(flags: number): bundleManager.BundleInfo {
  return bundleManager.getBundleInfoForSelfSync(flags);
}

export function querySelfSyncSafely(flags: number): SyncProbeResult {
  try {
    const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
    return { ok: true, info: info, failure: undefined };
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    return { ok: false, info: undefined, failure: new ProbeFailure(err.code, err.message, err instanceof Error) };
  }
}

export function queryByNamePromise(bundleName: string, flags: number): Promise<bundleManager.BundleInfo> {
  return bundleManager.getBundleInfo(bundleName, flags);
}

export function describeFailure(failure: ProbeFailure | undefined): string {
  if (failure === undefined) {
    return 'no failure';
  }
  return `code=${failure.code}, message=${failure.message}`;
}

export function isKnownBusinessCode(code: number): boolean {
  return code === ERR_BUNDLE_NOT_FOUND ||
    code === ERR_BUNDLE_DISABLED ||
    code === ERR_USER_NOT_FOUND ||
    code === ERR_PERMISSION_DENIED ||
    code === ERR_PARAMETER;
}

// [mirror of @ohos.bundle.bundleManager BundleFlag] and the documented "obtains" contract
// GET_BUNDLE_INFO_WITH_APPLICATION additionally carries appInfo; MODULE carries hapModulesInfo;
// ABILITY/EXTENSION populate their arrays only together with MODULE, SIGNATURE carries signatureInfo.
export const FLAGS_FOR_SIGNATURE: number =
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;

export const FLAGS_FOR_APP: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;

export const FLAGS_FOR_MODULE: number =
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;

export const FLAGS_FOR_FULL: number =
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
