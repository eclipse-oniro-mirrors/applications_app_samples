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

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import window from '@ohos.window';

const DOMAIN: number = 0xF811;
const TAG: string = 'SensorTestAbility';

export default class TestAbility extends UIAbility {
  private testsStarted: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility created');
    hilog.info(DOMAIN, TAG, 'Requested ability: %{public}s', want.abilityName);
    hilog.info(DOMAIN, TAG, 'Launch reason: %{public}d', launchParam.launchReason);
  }

  private startTests(): void {
    if (this.testsStarted) {
      hilog.info(DOMAIN, TAG, '%{public}s', 'Test execution already started');
      return;
    }
    this.testsStarted = true;
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const args = AbilityDelegatorRegistry.getArguments();
    hilog.info(DOMAIN, TAG, 'Running tests for %{public}s', args.bundleName);
    Hypium.hypiumTest(delegator, args, testsuite);
  }

  private reportStartupFailure(code: number, message: string): void {
    hilog.error(DOMAIN, TAG, 'Test page failed: %{public}d %{public}s', code, message);
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    delegator.finishTest('Sensor test page failed: ' + message, -1);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Test window created');
    windowStage.loadContent('testability/pages/Index', (error) => {
      if (error.code !== 0) {
        this.reportStartupFailure(error.code, error.message);
        return;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'Test page loaded');
      this.startTests();
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Test window destroyed');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility foreground');
    hilog.debug(DOMAIN, TAG, 'Tests started: %{public}s', String(this.testsStarted));
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility background');
    hilog.debug(DOMAIN, TAG, 'Tests started: %{public}s', String(this.testsStarted));
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility destroyed');
    this.testsStarted = false;
  }
}
