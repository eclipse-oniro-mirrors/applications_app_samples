/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { application, common, UIAbility } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';
import { fileIo } from '@kit.CoreFileKit';

export const ENTRY_ABILITY: string = 'EntryAbility';
export const NEW_ABILITY: string = 'NewAbility';

export function getDelegator(): abilityDelegatorRegistry.AbilityDelegator {
  return abilityDelegatorRegistry.getAbilityDelegator();
}

/** 测试进程所在应用的 Context，用它取沙箱目录、资源与配置。 */
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

export async function startEntryAbility(): Promise<void> {
  await getDelegator().startAbility({
    bundleName: getBundleName(),
    abilityName: ENTRY_ABILITY
  });
}

/**
 * 取首页 EntryAbility 的 UIAbilityContext。
 * setLanguage / setColorMode 要求对应 UIAbility 的窗口已创建、页面已加载，所以只能用它。
 */
export async function loadEntryContext(): Promise<common.UIAbilityContext> {
  let top: UIAbility | undefined = await waitForTopAbility(ENTRY_ABILITY, 800);
  if (getAbilityName(top) !== ENTRY_ABILITY) {
    await startEntryAbility();
    top = await waitForTopAbility(ENTRY_ABILITY, 8000);
  }
  if (top === undefined) {
    throw new Error('EntryAbility is not on top of the stack');
  }
  return top.context;
}

export function getConfiguration(): resourceManager.Configuration {
  return getAppContext().resourceManager.getConfigurationSync();
}

export function getAppLocale(): string {
  return getConfiguration().locale;
}

export function getAppColorMode(): resourceManager.ColorMode {
  return getConfiguration().colorMode;
}

export function getStringByName(resName: string): string {
  return getAppContext().resourceManager.getStringByNameSync(resName);
}

export function fileExists(filePath: string): boolean {
  return fileIo.accessSync(filePath);
}

let entryModuleContext: common.Context | undefined = undefined;

/**
 * entry 模块的 Context，不需要拉起页面。
 * 测试 HAP 自带一份同名字符串资源（值不同），取 entry 的资源与模块级沙箱目录都要用它。
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

/** 删除测试残留文件；文件不存在时什么也不做。 */
export function removeFileIfExists(filePath: string): void {
  if (fileIo.accessSync(filePath)) {
    fileIo.unlinkSync(filePath);
  }
}
