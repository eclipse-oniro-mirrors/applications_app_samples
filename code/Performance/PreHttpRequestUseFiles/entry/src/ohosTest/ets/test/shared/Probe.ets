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
import { fileIo as fs } from '@kit.CoreFileKit';
import { sleepMs } from './TestPace';

export const BUNDLE_NAME: string = 'com.example.useimagehttprequest';
export const VENDOR: string = 'example';
export const VERSION_NAME: string = '1.0.0';
export const VERSION_CODE: number = 1000000;
export const ENTRY_MODULE: string = 'entry';
export const ENTRY_ABILITY: string = 'EntryAbility';
export const BACKUP_ABILITY: string = 'EntryBackupAbility';
export const BACKUP_METADATA: string = 'ohos.extension.backup';
export const CACHE_FILE: string = 'abc.png';
export const PAGE_TITLE: string = 'ParentNavigation';
export const NAV_NAME: string = 'pageOne';
export const INTERNET_PERMISSION: string = 'ohos.permission.INTERNET';
export const ERR_NO_SUCH_FILE: number = 13900002;

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

export function appContext(): common.Context {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
}

export function moduleContext(name: string): common.Context {
  return appContext().createModuleContext(name);
}

export function errorCode(action: () => void): number {
  try {
    action();
  } catch (error) {
    return Number((error as BusinessError).code);
  }
  return 0;
}

export function cachePath(): string {
  return appContext().filesDir + '/' + CACHE_FILE;
}

export function testPath(suffix: string): string {
  return appContext().filesDir + '/' + suffix;
}

export function dirPath(suffix: string): string {
  return appContext().filesDir + '/' + suffix;
}

export function writeText(path: string, text: string): number {
  const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
  const written: number = fs.writeSync(file.fd, text);
  fs.closeSync(file);
  return written;
}

export function appendText(path: string, text: string): number {
  const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.APPEND | fs.OpenMode.WRITE_ONLY);
  const written: number = fs.writeSync(file.fd, text);
  fs.closeSync(file);
  return written;
}

export async function topAbility(): Promise<UIAbility | undefined> {
  try {
    return await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
  } catch (error) {
    return undefined;
  }
}

const LAUNCH_WAIT_MS: number = 5000;
const SETTLE_MS: number = 700;

export function homeWant(): Want {
  return {
    bundleName: BUNDLE_NAME,
    moduleName: ENTRY_MODULE,
    abilityName: ENTRY_ABILITY
  };
}

export async function stopHome(): Promise<void> {
  const top: UIAbility | undefined = await topAbility();
  if (top !== undefined && top.context.abilityInfo.name === ENTRY_ABILITY) {
    await top.context.terminateSelf();
    await sleepMs(SETTLE_MS);
  }
}

export async function launchHome(): Promise<UIAbility> {
  await stopHome();
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const monitor: abilityDelegatorRegistry.AbilityMonitor = {
    abilityName: ENTRY_ABILITY,
    moduleName: ENTRY_MODULE
  };
  delegator.addAbilityMonitorSync(monitor);
  try {
    await delegator.startAbility(homeWant());
    const ability: UIAbility = await delegator.waitAbilityMonitor(monitor, LAUNCH_WAIT_MS);
    await sleepMs(SETTLE_MS);
    return ability;
  } finally {
    delegator.removeAbilityMonitorSync(monitor);
  }
}
