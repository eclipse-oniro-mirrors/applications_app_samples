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

/**
 * Holds the stage-mode ability context handed over by TestAbility.
 *
 * `abilityDelegatorRegistry.getAppContext()` is rejected by
 * `createModuleContext`, while the context of a UIAbility is accepted, so the
 * test ability stores its own context here on create.
 */
export class TestContextHolder {
  private static abilityContext: common.UIAbilityContext | null = null;

  /** Called once from TestAbility.onCreate. */
  static set(context: common.UIAbilityContext): void {
    TestContextHolder.abilityContext = context;
  }

  /** Null until TestAbility has been created. */
  static get(): common.UIAbilityContext | null {
    return TestContextHolder.abilityContext;
  }

  /** Direct handle on the resource manager of the test module itself. */
  static testResourceManager(): common.Context | null {
    return TestContextHolder.abilityContext;
  }

  /**
   * Resource manager of another module of the same bundle, for example 'entry'.
   * Throws when the ability context has not been handed over yet, so a broken
   * wiring fails loudly instead of silently reading the test module.
   */
  static resourceManagerOf(moduleName: string): resourceManager.ResourceManager {
    const context: common.UIAbilityContext | null = TestContextHolder.abilityContext;
    if (context === null) {
      throw new Error('TestContextHolder is empty, TestAbility did not run');
    }
    return context.createModuleContext(moduleName).resourceManager;
  }
}
