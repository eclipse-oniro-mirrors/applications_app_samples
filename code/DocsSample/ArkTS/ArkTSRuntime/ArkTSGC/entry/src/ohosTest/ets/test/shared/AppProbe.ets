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

import { bundleManager, common, UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleepMs } from './TestPace';
import { logCase } from './TestLog';

export const BUNDLE_NAME: string = 'com.sample.ArkTSGC';
export const ENTRY_MODULE: string = 'entry';
export const TEST_MODULE: string = 'entry_test';
export const ENTRY_ABILITY: string = 'EntryAbility';
export const BACKUP_ABILITY: string = 'EntryBackupAbility';
export const BACKUP_METADATA: string = 'ohos.extension.backup';
export const ERR_RES_NAME_INVALID: number = 9001003;
export const ERR_RES_ID_INVALID: number = 9001001;

const LAUNCH_WAIT_MS: number = 5000;
const POLL_MS: number = 100;
const ERR_TOP_UNAVAILABLE: number = 16000100;

export const SELF_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL;

export async function selfBundle(): Promise<bundleManager.BundleInfo> {
  return await bundleManager.getBundleInfoForSelf(SELF_FLAGS);
}

export function findModule(info: bundleManager.BundleInfo, name: string): bundleManager.HapModuleInfo {
  return info.hapModulesInfo.find((item: bundleManager.HapModuleInfo) => item.name === name) as
    bundleManager.HapModuleInfo;
}

export function entryContext(): common.Context {
  const appContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  return appContext.createModuleContext(ENTRY_MODULE);
}

export function errorCode(action: () => void): number {
  try {
    action();
  } catch (error) {
    return Number((error as BusinessError).code);
  }
  return 0;
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

  static bitDepth(bytes: Uint8Array): number {
    return bytes[24];
  }

  static colorType(bytes: Uint8Array): number {
    return bytes[25];
  }
}

// '#RRGGBB' gets an opaque alpha, '#AARRGGBB' keeps its own
export function argbFromHex(hex: string): number {
  const digits: string = hex.substring(1);
  const full: string = digits.length === 6 ? 'FF' + digits : digits;
  return parseInt(full, 16) >>> 0;
}

export async function topAbility(): Promise<UIAbility | undefined> {
  try {
    return await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
  } catch (error) {
    const failure: BusinessError = error as BusinessError;
    logCase('topAbility', `code=${failure.code} message=${failure.message}`);
    if (failure.code !== ERR_TOP_UNAVAILABLE) {
      throw new Error(`getCurrentTopAbility failed: ${failure.code} ${failure.message}`);
    }
    return undefined;
  }
}

export async function stopHome(): Promise<void> {
  const top: UIAbility | undefined = await topAbility();
  if (top === undefined || top.context.abilityInfo.name !== ENTRY_ABILITY) {
    return;
  }
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let destroyed: boolean = false;
  const monitor: abilityDelegatorRegistry.AbilityMonitor = {
    abilityName: ENTRY_ABILITY,
    moduleName: ENTRY_MODULE,
    onAbilityDestroy: (ability: UIAbility) => {
      if (ability === top) {
        destroyed = true;
      }
    }
  };
  delegator.addAbilityMonitorSync(monitor);
  try {
    await top.context.terminateSelf();
    for (let waited: number = 0; waited < LAUNCH_WAIT_MS; waited += POLL_MS) {
      if (destroyed) {
        return;
      }
      await sleepMs(POLL_MS);
    }
    if (!destroyed) {
      throw new Error('stopHome: timed out waiting for the EntryAbility destroy callback');
    }
  } finally {
    delegator.removeAbilityMonitorSync(monitor);
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
  let foreground: UIAbility | undefined = undefined;
  const monitor: abilityDelegatorRegistry.AbilityMonitor = {
    abilityName: ENTRY_ABILITY,
    moduleName: ENTRY_MODULE,
    onAbilityForeground: (ability: UIAbility) => {
      foreground = ability;
    }
  };
  delegator.addAbilityMonitorSync(monitor);
  try {
    await delegator.startAbility(homeWant());
    const ability: UIAbility = await delegator.waitAbilityMonitor(monitor, LAUNCH_WAIT_MS);
    for (let waited: number = 0; waited < LAUNCH_WAIT_MS; waited += POLL_MS) {
      if (foreground === ability &&
        delegator.getAbilityState(ability) === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND &&
        (await topAbility()) === ability) {
        return ability;
      }
      await sleepMs(POLL_MS);
    }
    throw new Error('launchHome: timed out waiting for the created EntryAbility to become foreground');
  } finally {
    delegator.removeAbilityMonitorSync(monitor);
  }
}
