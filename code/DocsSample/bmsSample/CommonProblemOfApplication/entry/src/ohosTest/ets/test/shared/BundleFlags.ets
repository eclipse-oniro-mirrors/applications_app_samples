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

import { bundleManager } from '@kit.AbilityKit';

// [mirror of @ohos.bundle.bundleManager BundleFlag]
// The numeric literal alongside every SDK member is the documented value; it lets the mask
// oracle recompute flag semantics without trusting the very constant the app under test uses.
export class FlagSpec {
  readonly name: string;
  readonly bit: number;
  readonly sdkValue: number;

  constructor(name: string, bit: number, sdkValue: number) {
    this.name = name;
    this.bit = bit;
    this.sdkValue = sdkValue;
  }
}

export const DEFAULT_SPEC: FlagSpec =
  new FlagSpec('GET_BUNDLE_INFO_DEFAULT', 0x00000000, bundleManager.BundleFlag.GET_BUNDLE_INFO_DEFAULT);

export const WITH_APPLICATION_SPEC: FlagSpec =
  new FlagSpec('GET_BUNDLE_INFO_WITH_APPLICATION', 0x00000001, bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);

export const WITH_HAP_MODULE_SPEC: FlagSpec =
  new FlagSpec('GET_BUNDLE_INFO_WITH_HAP_MODULE', 0x00000002, bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);

export const WITH_ABILITY_SPEC: FlagSpec =
  new FlagSpec('GET_BUNDLE_INFO_WITH_ABILITY', 0x00000004, bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY);

export const WITH_EXTENSION_ABILITY_SPEC: FlagSpec =
  new FlagSpec('GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY', 0x00000008,
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY);

export const WITH_REQUESTED_PERMISSION_SPEC: FlagSpec =
  new FlagSpec('GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION', 0x00000010,
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);

export const WITH_METADATA_SPEC: FlagSpec =
  new FlagSpec('GET_BUNDLE_INFO_WITH_METADATA', 0x00000020, bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA);

export const WITH_DISABLE_SPEC: FlagSpec =
  new FlagSpec('GET_BUNDLE_INFO_WITH_DISABLE', 0x00000040, bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE);

export const WITH_SIGNATURE_INFO_SPEC: FlagSpec =
  new FlagSpec('GET_BUNDLE_INFO_WITH_SIGNATURE_INFO', 0x00000080,
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO);


export const SIGNATURE_FLAGS: number =
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;

export function maskOf(flags: number, bit: number): number {
  return flags & bit;
}

export function hasBit(flags: number, bit: number): boolean {
  return (flags & bit) === bit;
}

// [end of mirror]
