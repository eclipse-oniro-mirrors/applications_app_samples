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

import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { resourceManager } from '@kit.LocalizationKit';

export const BUNDLE_NAME: string = 'com.example.nativeembed';
export const ENTRY_MODULE: string = 'entry';
export const ENTRY_ABILITY: string = 'EntryAbility';
const TEST_MODULE: string = 'entry_test';

function moduleContext(moduleName: string): common.Context {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  return delegator.getAppContext().createModuleContext(moduleName);
}

export function entryResources(): resourceManager.ResourceManager {
  return moduleContext(ENTRY_MODULE).resourceManager;
}

export function testResources(): resourceManager.ResourceManager {
  return moduleContext(TEST_MODULE).resourceManager;
}
