/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { window } from '@kit.ArkUI';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = 'MultiMusicTest';
const START_DELAY_MS: number = 300;
const TEST_PAGE: string = 'testability/pages/Index';

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onCreate');
    // The suite registers more than 2000 cases. Registering it synchronously inside onCreate
    // would exceed the lifecycle budget, so it is deferred until the current transaction ends.
    setTimeout(() => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'Start to run the test cases');
      const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
        abilityDelegatorRegistry.getArguments();
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    }, START_DELAY_MS);
  }

  onDestroy(): void {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent(TEST_PAGE, (err: BusinessError) => {
      if (err.code) {
        hilog.error(LOG_DOMAIN, LOG_TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onForeground');
  }

  onBackground(): void {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onBackground');
  }
}
