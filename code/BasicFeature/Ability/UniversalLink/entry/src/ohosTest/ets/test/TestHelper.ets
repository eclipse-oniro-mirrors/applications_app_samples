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

import { application, bundleManager, common, UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

export const BUNDLE_NAME: string = 'com.example.universallink';
export const ENTRY_ABILITY: string = 'EntryAbility';
export const OPEN_LINK_ABILITY: string = 'OpenLinkAbility';
export const TEST_ABILITY: string = 'TestAbility';
export const LINK: string = 'http://docs.openharmony.cn';
export const ACTION_VIEW_DATA: string = 'ohos.want.action.viewData';
export const ENTITY_BROWSABLE: string = 'entity.system.browsable';

export function getDelegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

/** 测试进程所在应用的 Context。 */
export function getAppContext(): common.Context {
  return getDelegator().getAppContext();
}

export function getBundleName(): string {
  return getAppContext().applicationInfo.name;
}

export function sleep(timeMs: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, timeMs));
}

export async function getTopAbility(): Promise<UIAbility | undefined> {
  try {
    return await getDelegator().getCurrentTopAbility();
  } catch (error) {
    return undefined;
  }
}

export function getAbilityName(ability: UIAbility | undefined): string {
  if (ability === undefined) {
    return '';
  }
  return ability.context.abilityInfo.name;
}

/** 轮询等待某个 Ability 成为栈顶；超时后返回最后一次取到的栈顶。 */
export async function waitForTopAbility(name: string, timeoutMs: number = 6000): Promise<UIAbility | undefined> {
  const deadline: number = Date.now() + timeoutMs;
  let top: UIAbility | undefined = await getTopAbility();
  while (getAbilityName(top) !== name && Date.now() < deadline) {
    await sleep(200);
    top = await getTopAbility();
  }
  return top;
}

export interface StartResult {
  code: number;
  message: string;
}

/** 执行一次 startAbility 并捕获错误码；成功时 code 为 0。 */
export async function startAndCapture(want: Want): Promise<StartResult> {
  try {
    await getDelegator().startAbility(want);
    return { code: 0, message: '' };
  } catch (error) {
    const failure: BusinessError = error as BusinessError;
    return { code: failure.code, message: failure.message };
  }
}

/**
 * 显式拉起本应用的某个 Ability，并等它成为栈顶。
 * 连续 startAbility 时真机会报 16000017，所以先等当前栈顶稳定再发起。
 */
export async function launchAbility(name: string): Promise<UIAbility | undefined> {
  await sleep(800);
  await startAndCapture({ bundleName: BUNDLE_NAME, abilityName: name });
  return await waitForTopAbility(name, 8000);
}

/** 取首页 EntryAbility 的 UIAbilityContext；openLink 只能从 UIAbilityContext 发起。 */
export async function loadEntryContext(): Promise<common.UIAbilityContext> {
  let top: UIAbility | undefined = await waitForTopAbility(ENTRY_ABILITY, 800);
  if (getAbilityName(top) !== ENTRY_ABILITY) {
    top = await launchAbility(ENTRY_ABILITY);
  }
  if (top === undefined || getAbilityName(top) !== ENTRY_ABILITY) {
    throw new Error('EntryAbility is not on top of the stack');
  }
  return top.context;
}

let entryModuleContext: common.Context | undefined = undefined;

/**
 * entry 模块的 Context，不需要拉起页面。
 * 测试 HAP 也有 module_desc 等同名资源，取 entry 的资源要用它。
 */
export async function loadEntryModuleContext(): Promise<common.Context> {
  if (entryModuleContext === undefined) {
    // delegator 返回的 Context 不能直接传给 createModuleContext（报 must be a context of stageMode），先转成 ApplicationContext。
    entryModuleContext = await application.createModuleContext(getAppContext().getApplicationContext(), 'entry');
  }
  return entryModuleContext;
}

const overrideManagers: Map<string, resourceManager.ResourceManager> = new Map();

/**
 * 按指定语言与深浅色取 entry 模块的资源管理器。
 * 走 getOverrideResourceManager，不改应用全局配置，用例之间互不影响。
 */
export async function loadOverrideResourceManager(locale: string,
  colorMode: resourceManager.ColorMode): Promise<resourceManager.ResourceManager> {
  const key: string = `${locale}|${colorMode}`;
  const cached: resourceManager.ResourceManager | undefined = overrideManagers.get(key);
  if (cached !== undefined) {
    return cached;
  }
  const base: resourceManager.ResourceManager = (await loadEntryModuleContext()).resourceManager;
  const configuration: resourceManager.Configuration = base.getOverrideConfiguration();
  configuration.locale = locale;
  configuration.colorMode = colorMode;
  const manager: resourceManager.ResourceManager = base.getOverrideResourceManager(configuration);
  overrideManagers.set(key, manager);
  return manager;
}

let selfBundleInfo: bundleManager.BundleInfo | undefined = undefined;

/** 本应用的 BundleInfo，带 HAP、Ability 与 skills 信息；结果只取一次。 */
export function getSelfBundleInfo(): bundleManager.BundleInfo {
  if (selfBundleInfo === undefined) {
    const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SKILL |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
    selfBundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
  }
  return selfBundleInfo;
}

export function findHapModule(moduleName: string): bundleManager.HapModuleInfo | undefined {
  return getSelfBundleInfo().hapModulesInfo.find((m: bundleManager.HapModuleInfo) => m.name === moduleName);
}

export function findAbility(moduleName: string, abilityName: string): bundleManager.AbilityInfo | undefined {
  const hap: bundleManager.HapModuleInfo | undefined = findHapModule(moduleName);
  if (hap === undefined) {
    return undefined;
  }
  return hap.abilitiesInfo.find((a: bundleManager.AbilityInfo) => a.name === abilityName);
}
