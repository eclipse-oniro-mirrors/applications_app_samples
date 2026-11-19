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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import type Want from '@ohos.app.ability.Want';
import type AbilityConstant from '@ohos.app.ability.AbilityConstant';
import type window from '@ohos.window';
import type { BusinessError } from '@ohos.base';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { logger } from '../util/Logger';

const TAG: string = 'TestAbility';

/**
 * Test entry ability of the RunJsInWeb ohosTest module.
 *
 * The ability only bootstraps Hypium and loads an empty page. Every real check
 * lives in the suites registered through List.test.ets so that a single
 * `test` command invocation executes the complete regression set.
 */
export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logger.info(TAG, `TestAbility onCreate, want: ${JSON.stringify(want) ?? ''}, launchParam: ${JSON.stringify(launchParam) ?? ''}`);
    logger.info(TAG, 'TestAbility onCreate: preparing hypium');
    const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    logger.info(TAG, `TestAbility bundle: ${abilityDelegatorArguments.bundleName ?? ''}`);
    logger.info(TAG, 'TestAbility onCreate: start run testcase');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  onDestroy(): void {
    this.logLifecycle('onDestroy', 'release test resources');
    logger.info(TAG, 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    this.logLifecycle('onWindowStageCreate', 'load testability page');
    logger.info(TAG, 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err: BusinessError) => {
      if (err.code) {
        logger.error(TAG, `Failed to load the content. Cause: ${JSON.stringify(err) ?? ''}`);
        return;
      }
      logger.info(TAG, 'Succeeded in loading the content');
    });
  }

  onWindowStageDestroy(): void {
    this.logLifecycle('onWindowStageDestroy', 'window stage released');
    logger.info(TAG, 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    this.logLifecycle('onForeground', 'test ability visible');
    logger.info(TAG, 'TestAbility onForeground');
  }

  onBackground(): void {
    this.logLifecycle('onBackground', 'test ability hidden');
    logger.info(TAG, 'TestAbility onBackground');
  }

  /**
   * Emits a uniform lifecycle trace. Kept as a private helper so that future
   * lifecycle callbacks can reuse the same log format.
   *
   * The harness only relies on the side effect of the log call; the returned
   * value is intentionally void so the helper can be used from any callback.
   */
  private logLifecycle(stage: string, detail: string): void {
    logger.info(TAG, `TestAbility ${stage}: ${detail}`);
  }
}
