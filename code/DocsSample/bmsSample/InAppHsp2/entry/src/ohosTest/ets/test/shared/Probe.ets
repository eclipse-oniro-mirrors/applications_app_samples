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

export const BUNDLE_NAME: string = 'ohos.app.hap.myapplication';
export const VENDOR: string = 'example';
export const VERSION_NAME: string = '1.0.0';
export const VERSION_CODE: number = 1000000;
export const ENTRY_MODULE: string = 'entry';
export const LIB_MODULE: string = 'library';
export const ENTRY_ABILITY: string = 'EntryAbility';
export const BACKUP_ABILITY: string = 'EntryBackupAbility';
export const BACKUP_METADATA: string = 'ohos.extension.backup';
export const APP_NAME_TEXT: string = 'simple014_in_app_hsp02';
export const ROUTE_NAME: string = 'library_menu';
export const ROUTE_PAGE: string = 'src/main/ets/pages/library_menu.ets';
export const ROUTE_BUILDER: string = 'PageOneBuilder';
export const ROUTE_DESC: string = 'this is library_menu';
export const INDEX_TITLE: string = 'Navigation_Index';
export const MENU_TITLE: string = 'Library_Menu';
export const MENU_TEXT: string = 'Hello World';
export const MENU_TEXT_AFTER: string = 'Welcome';
export const BACK_BUTTON: string = 'back_to_index';
export const CLICK_ITEM_ID: string = 'clickToMenu';
export const ERR_NO_SUCH_FILE: number = 13900002;

export const SELF_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ROUTER_MAP |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;

let cachedInfo: bundleManager.BundleInfo | undefined = undefined;

export async function selfBundle(): Promise<bundleManager.BundleInfo> {
  const cached: bundleManager.BundleInfo | undefined = cachedInfo;
  if (cached !== undefined) {
    return cached;
  }
  const loaded: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(SELF_FLAGS);
  cachedInfo = loaded;
  return loaded;
}

export function findModule(info: bundleManager.BundleInfo, name: string): bundleManager.HapModuleInfo | undefined {
  return info.hapModulesInfo.find((item: bundleManager.HapModuleInfo) => item.name === name);
}

export async function libraryInstalled(): Promise<boolean> {
  const info: bundleManager.BundleInfo = await selfBundle();
  return findModule(info, LIB_MODULE) !== undefined;
}

export async function libraryModule(): Promise<bundleManager.HapModuleInfo | undefined> {
  const info: bundleManager.BundleInfo = await selfBundle();
  return findModule(info, LIB_MODULE);
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

export function pngWidth(bytes: Uint8Array): number {
  return (bytes[16] << 24 >>> 0) + (bytes[17] << 16) + (bytes[18] << 8) + bytes[19];
}

export function pngHeight(bytes: Uint8Array): number {
  return (bytes[20] << 24 >>> 0) + (bytes[21] << 16) + (bytes[22] << 8) + bytes[23];
}

export function pngColorType(bytes: Uint8Array): number {
  return bytes[25];
}

export function pngBitDepth(bytes: Uint8Array): number {
  return bytes[24];
}

export function pngChunkType(bytes: Uint8Array): string {
  return String.fromCharCode(bytes[12], bytes[13], bytes[14], bytes[15]);
}

export function bytesToText(bytes: Uint8Array): string {
  let text: string = '';
  for (let k: number = 0; k < bytes.length; k++) {
    text += String.fromCharCode(bytes[k]);
  }
  return text;
}

export function firstBytesSum(bytes: Uint8Array, count: number): number {
  let total: number = 0;
  for (let k: number = 0; k < count; k++) {
    total += bytes[k];
  }
  return total;
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
