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

export const FLAG_APPLICATION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
export const FLAG_HAP_MODULE: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
export const FLAG_ABILITY: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;
export const FLAG_EXTENSION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
export const FLAG_PERMISSION: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
export const FLAG_METADATA: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA;
export const FLAG_DISABLE: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE;
export const FLAG_SIGNATURE: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;

// The eight documented BundleFlag bits form a 256-entry combination matrix. Every case asks
// bundleManager for the self bundle with one combination and checks that the fields gated by
// the requested bits are present, while the always-present fields keep their declared values.
export const FLAG_BITS: number[] = [
  FLAG_APPLICATION,
  FLAG_HAP_MODULE,
  FLAG_ABILITY,
  FLAG_EXTENSION,
  FLAG_PERMISSION,
  FLAG_METADATA,
  FLAG_DISABLE,
  FLAG_SIGNATURE
];

export const FLAG_NAMES: string[] = [
  'APPLICATION',
  'HAP_MODULE',
  'ABILITY',
  'EXTENSION',
  'PERMISSION',
  'METADATA',
  'DISABLE',
  'SIGNATURE'
];

export const FLAG_COMBINATION_COUNT: number = 256;

export function flagsForIndex(index: number): number {
  let flags: number = 0;
  for (let i: number = 0; i < FLAG_BITS.length; i++) {
    if ((index & (1 << i)) !== 0) {
      flags |= FLAG_BITS[i];
    }
  }
  return flags;
}

export function hasFlag(flags: number, bit: number): boolean {
  return (flags & bit) === bit;
}

export function flagSummary(flags: number): string {
  let parts: string = '';
  for (let i: number = 0; i < FLAG_BITS.length; i++) {
    if (hasFlag(flags, FLAG_BITS[i])) {
      parts += (parts.length === 0 ? '' : '|') + FLAG_NAMES[i];
    }
  }
  return parts.length === 0 ? 'DEFAULT' : parts;
}
