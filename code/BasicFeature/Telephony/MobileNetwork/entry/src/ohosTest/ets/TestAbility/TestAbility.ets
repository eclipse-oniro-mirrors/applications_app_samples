/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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
import testsuite from '../test/List.test';
import type window from '@ohos.window';
import { UIAbility, Want, AbilityConstant } from '@kit.AbilityKit';
import { Hypium } from '@ohos/hypium';
import { logger } from '../util/Logger';

const TAG: string = '[Sample_MobileNetwork_Test]';

export default class TestAbility extends UIAbility {
  private testStarted: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logger.info(TAG, `TestAbility onCreate, want param: ${JSON.stringify(want)},` +
      `launchParam: ${JSON.stringify(launchParam)}`);
  }

  onDestroy(): void {
    logger.info(TAG, 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    logger.info(TAG, 'TestAbility onWindowStageCreate');
    try {
      windowStage.loadContent('TestAbility/pages/Index');
    } catch (err) {
      logger.error(TAG, `TestAbility loadContent failed, err is ${JSON.stringify(err)}`);
    }
  }

  onWindowStageDestroy(): void {
    logger.info(TAG, 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    logger.info(TAG, 'TestAbility onForeground');
    if (this.testStarted) {
      return;
    }
    this.testStarted = true;
    const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
      AbilityDelegatorRegistry.getArguments();
    logger.info(TAG, 'start run testcase!!!');
    setTimeout(() => {
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    }, 300);
  }

  onBackground(): void {
    logger.info(TAG, 'TestAbility onBackground');
  }
}
