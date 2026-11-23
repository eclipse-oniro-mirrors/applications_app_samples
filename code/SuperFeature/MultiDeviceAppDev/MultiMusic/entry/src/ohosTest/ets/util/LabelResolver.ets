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

// The main source keeps song labels in string resources, so tests must resolve the
// Resource into text before asserting on its content.
//
// Three implementation details matter here:
// 1. The Resource overload of getStringSync is used instead of the numeric id one,
//    because the overload also carries bundleName/moduleName and can be resolved
//    from the ohosTest hap. An overridden resource manager cannot see these
//    resources, so the device locale is used to resolve the expected texts.
// 2. Expected texts are requested by resource name instead of being written as
//    literals, so a suite does not hard code the content of the zh_CN resources.
// 3. Every resolved text is cached by resource id or name. getStringSync is a
//    synchronous IPC to the resource manager, and the label suites resolve the
//    twelve song labels thousands of times; without the cache the runner blocks the
//    main thread long enough for the system to report THREAD_BLOCK_6S and kill it.
import { abilityDelegatorRegistry } from '@kit.TestKit';
import resourceManager from '@ohos.resourceManager';

const labelCache: Map<number, string> = new Map<number, string>();
const nameCache: Map<string, string> = new Map<string, string>();

let systemManager: resourceManager.ResourceManager | undefined = undefined;

function getManager(): resourceManager.ResourceManager {
  if (systemManager === undefined) {
    systemManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
  }
  return systemManager;
}

/**
 * Resolves a label that can be either a plain string (test-created data) or a Resource
 * (data coming from the main module) into its text.
 */
export function resolveLabel(description: Resource | string): string {
  if (typeof description === 'string') {
    return description;
  }
  const cached: string | undefined = labelCache.get(description.id);
  if (cached !== undefined) {
    return cached;
  }
  let text: string = '';
  try {
    text = getManager().getStringSync(description);
  } catch (error) {
    text = '';
  }
  if (text.length > 0) {
    labelCache.set(description.id, text);
  }
  return text;
}

/**
 * Resolves a string resource by name against the reference locale. Results are cached
 * per name so that a suite never pays the IPC cost twice.
 */
export function labelByName(name: string): string {
  const cached: string | undefined = nameCache.get(name);
  if (cached !== undefined) {
    return cached;
  }
  let text: string = '';
  try {
    text = getManager().getStringByNameSync(name);
  } catch (error) {
    text = '';
  }
  if (text.length > 0) {
    nameCache.set(name, text);
  }
  return text;
}

/**
 * Resolves a string resource by name against the current device locale. Used by the UI
 * suites, which have to match the text that is actually rendered on screen.
 */
export function systemLabelByName(name: string): string {
  return labelByName(name);
}

/**
 * Returns the part of a label that precedes the first ':' separator. Labels
 * without a separator are returned unchanged.
 */
export function labelPrefixByName(name: string): string {
  const text: string = labelByName(name);
  const cut: number = text.indexOf(':');
  return cut > 0 ? text.substring(0, cut) : text;
}
