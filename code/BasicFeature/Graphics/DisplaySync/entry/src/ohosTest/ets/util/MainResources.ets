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

import { bundleManager, common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

interface MainPages {
  src: string[];
}

export async function readMainPage(expected: string): Promise<string> {
  // metadata 引用的是 module.pages 使用的同一份 main_pages，而不是测试副本。
  const profiles: string[] = await bundleManager.getProfileByAbility('entry', 'EntryAbility', 'samplePages');
  if (profiles.length !== 1) {
    throw new Error('entry 的 main_pages 资源缺失或不唯一');
  }
  const pages: MainPages = JSON.parse(profiles[0]) as MainPages;
  if (!Array.isArray(pages.src) || pages.src.length !== 5 || new Set(pages.src).size !== pages.src.length) {
    throw new Error('实际 main_pages 路由数量或唯一性不符合示例配置');
  }
  const actual: string | undefined = pages.src.find((page: string) => page === expected);
  if (actual === undefined) {
    throw new Error('实际 main_pages 缺少路由：' + expected);
  }
  return actual;
}

export function readMainText(resourceName: string): string {
  const appContext: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
  const entryContext: common.Context = appContext.createModuleContext('entry');
  return entryContext.resourceManager.getStringByNameSync(resourceName);
}
