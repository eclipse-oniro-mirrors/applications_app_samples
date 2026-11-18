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
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from './Logger';

/**
 * Resolves user-visible result messages from string resources, so that managers
 * never hand hard-coded English text to the UI.
 *
 * The ability context is injected once by EntryAbility. When no context can be
 * obtained (for example a manager used from an automated test case that runs
 * outside any page), the English template supplied by the caller is used, so
 * that the returned message stays predictable.
 */
export class ResultText {
  private static context: common.Context | undefined = undefined;

  /**
   * Injects the ability context used to resolve string resources.
   */
  static init(context: common.Context): void {
    ResultText.context = context;
  }

  /**
   * Resolves a result message without format parameters.
   */
  static of(resource: Resource, fallback: string): string {
    return ResultText.resolve(resource, [], fallback);
  }

  /**
   * Resolves a result message and replaces its placeholders in order
   * with the given parameters.
   */
  static ofArgs(resource: Resource, args: Array<string | number>, fallback: string): string {
    return ResultText.resolve(resource, args, fallback);
  }

  private static resolve(resource: Resource, args: Array<string | number>, fallback: string): string {
    try {
      const manager: resourceManager.ResourceManager | undefined = ResultText.getResourceManager();
      if (manager === undefined) {
        return fallback;
      }
      const text: string = args.length === 0 ? manager.getStringSync(resource.id) :
        manager.getStringSync(resource.id, ...args);
      return text.length === 0 ? fallback : text;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`Failed to resolve result text: ${err.code}, ${err.message}`);
      return fallback;
    }
  }

  private static getResourceManager(): resourceManager.ResourceManager | undefined {
    if (ResultText.context !== undefined) {
      return ResultText.context.resourceManager;
    }
    const context: common.Context | undefined = getContext() as common.Context;
    if (context === undefined || context === null) {
      return undefined;
    }
    return context.resourceManager;
  }
}
