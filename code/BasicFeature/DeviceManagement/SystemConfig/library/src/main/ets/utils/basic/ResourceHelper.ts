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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/** Context injected by the host (holds resourceManager for resolving string resources). */
let hostContext: common.Context | null = null;

/**
 * Localized resource resolution helper class.
 * Data models / service layer / utility classes inside the HAR cannot access the Ability context directly,
 * so the host (EntryAbility / ohosTest TestAbility) injects the context at startup,
 * enabling string resources from string.json to be resolved into localized text.
 *
 * This file is the .ts version: it can be referenced by both .ts utility files and .ets components
 * (.ts files must not import .ets files). $r references are produced by callers (.ets) and passed in
 * as the { id: number } structure; the .ts side uniformly resolves by resource name.
 */
export class ResourceHelper {
  /**
   * Injects the host context.
   * Should be called at app startup (EntryAbility.onCreate) and test startup (TestAbility.onCreate).
   * @param {common.Context | null} context - Host context; pass null to release it
   */
  static init(context: common.Context | null): void {
    hostContext = context;
    hilog.info(DOMAIN, TAG, 'ResourceHelper init: context %{public}s', context ? 'bound' : 'cleared');
  }

  /**
   * Resolves a string resource referenced by $r into localized text (for .ets callers).
   * @param {{ id: number }} resource - Resource object obtained via $r (structurally contains id)
   * @param {Array<string | number>} args - Format placeholder arguments
   * @returns {string} Resolved string, or an empty string when the context is not injected
   */
  static getString(resource: { id: number }, ...args: Array<string | number>): string {
    if (!hostContext) {
      hilog.warn(DOMAIN, TAG, 'ResourceHelper getString: context not initialized, return empty');
      return '';
    }
    return hostContext.resourceManager.getStringSync(resource.id, ...args);
  }

  /**
   * Resolves a string resource into localized text by resource name (for .ts utility files).
   * @param {string} resName - Resource name defined in string.json
   * @param {Array<string | number>} args - Format placeholder arguments
   * @returns {string} Resolved string, or an empty string when the context is not injected
   */
  static getStringByName(resName: string, ...args: Array<string | number>): string {
    if (!hostContext) {
      hilog.warn(DOMAIN, TAG, 'ResourceHelper getStringByName: context not initialized, return empty');
      return '';
    }
    return hostContext.resourceManager.getStringByNameSync(resName, ...args);
  }
}
