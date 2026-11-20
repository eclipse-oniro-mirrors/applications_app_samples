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

import { resourceManager } from '@kit.LocalizationKit';
import { AppLogger } from './AppLogger';

const SCOPE: string = 'StringResources';

/**
 * Reads resource strings synchronously for non-UI layers such as ViewModels and services.
 * The ResourceManager is injected from ApplicationContext when EntryAbility starts.
 */
export class StringResources {
  private static manager: resourceManager.ResourceManager | undefined = undefined;

  /** Stores the ResourceManager instance obtained from the application context. */
  static init(manager: resourceManager.ResourceManager): void {
    // The manager is injected once at startup and reused by every caller.
    StringResources.manager = manager;
  }

  /** Returns the localized string for the given resource, or an empty string when unavailable. */
  static get(resource: Resource): string {
    // Guard against calls that happen before EntryAbility injects the manager.
    if (StringResources.manager === undefined) {
      return '';
    }
    try {
      return StringResources.manager.getStringSync(resource.id);
    } catch (error) {
      // Missing or invalid resources must never crash non-UI layers.
      AppLogger.error(SCOPE, 'Failed to read string resource');
      return '';
    }
  }

  /** Returns the localized string with placeholders replaced by the given arguments. */
  static format(resource: Resource, ...args: Array<string | number>): string {
    if (StringResources.manager === undefined) {
      return '';
    }
    try {
      return StringResources.manager.getStringSync(resource.id, ...args);
    } catch (error) {
      AppLogger.error(SCOPE, 'Failed to format string resource');
      return '';
    }
  }
}
