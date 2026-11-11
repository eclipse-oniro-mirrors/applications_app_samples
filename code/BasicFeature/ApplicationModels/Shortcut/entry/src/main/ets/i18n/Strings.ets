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
import { resourceManager } from '@kit.LocalizationKit';
import { DEFAULT_STRINGS } from './DefaultStrings';
import { logWarning } from '../services/Logger';

let manager: resourceManager.ResourceManager | undefined = undefined;
let resolver: ((name: string) => string) | undefined = undefined;
let warned: boolean = false;

/** Inject a resource provider for isolated consumers; production binding resets this provider. */
export function setStringResolver(provider: ((name: string) => string) | undefined): void {
  resolver = provider;
  manager = undefined;
  warned = false;
}

/** Bind before initializing services; no global getContext() or pre-Ability resource access. */
export function bindStrings(context: common.ApplicationContext): void {
  manager = context.resourceManager;
  resolver = undefined;
  warned = false;
}

/** Resolve text for existing string-only models, dialogs, and APIs. */
export function uiText(name: string, args: string[] = []): string {
  let template: string = DEFAULT_STRINGS[name] || name;
  if (manager !== undefined || resolver !== undefined) {
    try {
      const provider = resolver;
      if (provider !== undefined) {
        template = provider(name) || template;
      } else if (manager !== undefined) {
        template = manager.getStringByNameSync(name);
      }
    } catch (_) {
      if (!warned) {
        warned = true;
        logWarning('String resource lookup failed; using English fallback');
      }
    }
  }
  // One replacement pass prevents user text such as "%2$s" from becoming another placeholder.
  return template.replace(/%([1-9][0-9]*)\$s/g, (token: string, index: string): string => {
    const value: string | undefined = args[Number(index) - 1];
    return value === undefined ? token : value;
  });
}

/** Resolve only explicitly tagged catalogue fields, never arbitrary user/business data. */
export function resourceText(value: string): string {
  const prefix: string = '@string/';
  return value.startsWith(prefix) ? uiText(value.substring(prefix.length)) : value;
}
