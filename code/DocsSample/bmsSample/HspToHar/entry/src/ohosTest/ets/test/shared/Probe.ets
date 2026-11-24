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

import { common, Want, UIAbility } from '@kit.AbilityKit';
import { bundleManager } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';
import { sleepMs } from './TestPace';

export const BUNDLE_NAME: string = 'ohos.app.hap.myapplication';
export const BUNDLE_VENDOR: string = 'example';
export const VERSION_CODE: number = 1000000;
export const VERSION_NAME: string = '1.0.0';
export const APP_NAME: string = 'simple008_hsp_to_har';
export const ENTRY_MODULE: string = 'entry';
export const TEST_MODULE: string = 'entry_test';
export const LIBRARY_MODULE: string = 'har';
export const ENTRY_ABILITY: string = 'EntryAbility';
export const BACKUP_ABILITY: string = 'EntryBackupAbility';
export const STR_MODULE_DESC: string = 'module description';
export const STR_ENTRY_DESC: string = 'description';
export const STR_ENTRY_LABEL: string = 'label';
export const STR_HAR_DESC: string = 'description';
export const ERR_RES_NAME_INVALID: number = 9001003;
export const ERR_RES_ID_INVALID: number = 9001001;

const SETTLE_MS: number = 800;

export const SELF_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;

export async function selfBundle(): Promise<bundleManager.BundleInfo> {
  return bundleManager.getBundleInfoForSelf(SELF_FLAGS);
}

export function findModule(info: bundleManager.BundleInfo, name: string): bundleManager.HapModuleInfo | undefined {
  return info.hapModulesInfo.find((item: bundleManager.HapModuleInfo) => item.name === name);
}

export function moduleNames(info: bundleManager.BundleInfo): string[] {
  return info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.name);
}

export function appContext(): common.Context {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  return delegator.getAppContext();
}

export function moduleContext(moduleName: string): common.Context {
  return appContext().createModuleContext(moduleName) as common.Context;
}

export function entryContext(): common.Context {
  return moduleContext(ENTRY_MODULE);
}

export function entryResources(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

export function hasModule(info: bundleManager.BundleInfo, name: string): boolean {
  return findModule(info, name) !== undefined;
}

export function errorCode(action: () => void): number {
  try {
    action();
    return 0;
  } catch (error) {
    const failure: BusinessErrorLike = error as BusinessErrorLike;
    return failure.code as number;
  }
}

interface BusinessErrorLike {
  code: number;
  message: string;
}

export class PngOracle {
  static readonly SIGNATURE: number[] = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];

  static hasSignature(bytes: Uint8Array): boolean {
    if (bytes.length < PngOracle.SIGNATURE.length) {
      return false;
    }
    return PngOracle.SIGNATURE.every((value: number, index: number) => bytes[index] === value);
  }

  static firstChunkType(bytes: Uint8Array): string {
    return String.fromCharCode(bytes[12], bytes[13], bytes[14], bytes[15]);
  }

  static readUint32(bytes: Uint8Array, offset: number): number {
    return ((bytes[offset] << 24) >>> 0) + (bytes[offset + 1] << 16) + (bytes[offset + 2] << 8) + bytes[offset + 3];
  }

  static width(bytes: Uint8Array): number {
    return PngOracle.readUint32(bytes, 16);
  }

  static height(bytes: Uint8Array): number {
    return PngOracle.readUint32(bytes, 20);
  }
}

export async function topAbility(): Promise<UIAbility | undefined> {
  try {
    return await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
  } catch (error) {
    return undefined;
  }
}

export async function stopHome(): Promise<void> {
  const top: UIAbility | undefined = await topAbility();
  if (top !== undefined && top.context.abilityInfo.name === ENTRY_ABILITY) {
    await top.context.terminateSelf();
    await sleepMs(SETTLE_MS);
  }
}

export function homeWant(): Want {
  return {
    bundleName: BUNDLE_NAME,
    moduleName: ENTRY_MODULE,
    abilityName: ENTRY_ABILITY
  };
}

export async function launchHome(): Promise<UIAbility> {
  await stopHome();
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const monitor: abilityDelegatorRegistry.AbilityMonitor = {
    abilityName: ENTRY_ABILITY,
    moduleName: ENTRY_MODULE
  };
  delegator.addAbilityMonitorSync(monitor);
  await delegator.startAbility(homeWant());
  await sleepMs(SETTLE_MS);
  return delegator.getCurrentTopAbility() as Promise<UIAbility>;
}
