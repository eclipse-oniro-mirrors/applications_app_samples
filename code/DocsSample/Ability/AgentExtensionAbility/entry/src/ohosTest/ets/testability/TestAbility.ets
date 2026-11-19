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

import { UIAbility, Want, AbilityConstant } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { window } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { DOMAIN, ENTRY_ABILITY_NAME, TAG } from '../test/Shared/AgentTestDriver';

export default class TestAbility extends UIAbility {
  private testsStarted: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onCreate');
    hilog.info(DOMAIN, TAG, 'Registering callback, profile and UI test suites');
    hilog.info(DOMAIN, TAG, 'Want bundle: %{public}s', want.bundleName ?? '');
    hilog.info(DOMAIN, TAG, 'Launch reason: %{public}d', launchParam.launchReason);
  }

  private async initializeTests(): Promise<void> {
    if (this.testsStarted) {
      return;
    }
    this.testsStarted = true;
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    const want: Want = {
      bundleName: args.bundleName,
      abilityName: ENTRY_ABILITY_NAME
    };
    await delegator.startAbility(want);
    hilog.info(DOMAIN, TAG, 'Entry ability launched before testsuite');
    Hypium.hypiumTest(delegator, args, testsuite);
  }

  private async failInitialization(reason: string): Promise<void> {
    hilog.error(DOMAIN, TAG, 'Test initialization failed: %{public}s', reason);
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    await delegator.finishTest('Agent test initialization failed: ' + reason, -1);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err) => {
      if (err.code) {
        this.failInitialization('Unable to load test page: ' + String(err.code))
          .catch((finishError: Error) => {
            hilog.error(DOMAIN, TAG, 'Unable to finish failed test: %{public}s', finishError.message);
          });
        return;
      }
      this.initializeTests().catch((startError: Error) => {
        this.failInitialization(startError.message).catch((finishError: Error) => {
          hilog.error(DOMAIN, TAG, 'Unable to finish failed test: %{public}s', finishError.message);
        });
      });
    });
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onDestroy');
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onForeground');
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onBackground');
  }
}
