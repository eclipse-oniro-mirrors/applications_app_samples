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

import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@kit.BasicServicesKit';
import window from '@ohos.window';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { logger } from '../util/Logger';

const TEST_TIMEOUT_MS: string = '180000';

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    let wantInfo = '';
    let launchParamInfo = '';
    try {
      wantInfo = JSON.stringify(want);
      launchParamInfo = JSON.stringify(launchParam);
    } catch (error) {
      logger.error(`Failed to serialize onCreate parameters: ${(error as Error).message}`);
    }
    logger.info(`TestAbility onCreate: ${wantInfo}, ${launchParamInfo}`);
    const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    abilityDelegatorArguments.parameters['timeout'] = TEST_TIMEOUT_MS;
    abilityDelegatorArguments.parameters['-s timeout'] = TEST_TIMEOUT_MS;
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('testability/pages/Index', (err: BusinessError) => {
      if (err.code) {
        logger.error(`Failed to load test page: ${JSON.stringify(err)}`);
        return;
      }
      logger.info('Test page loaded');
    });
  }

  onDestroy(): void {
    logger.info('TestAbility onDestroy');
  }

  onWindowStageDestroy(): void {
    logger.info('TestAbility onWindowStageDestroy');
  }
}
