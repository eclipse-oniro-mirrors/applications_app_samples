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
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

export default class TestAbility extends UIAbility {
  private started: boolean = false;
  private destroyed: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.started = false;
    this.destroyed = false;
    hilog.info(0x0000, 'SensorCapiTest', 'TestAbility created: %{public}s', want.abilityName);
    hilog.debug(0x0000, 'SensorCapiTest', 'Launch reason: %{public}d', launchParam.launchReason);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'SensorCapiTest', 'Loading test ability content');
    windowStage
      .loadContent('testability/pages/Index')
      .then((): void => {
        this.startTests();
      })
      .catch((error: Error): void => {
        this.reportStartupFailure(error);
      });
  }

  private startTests(): void {
    if (this.destroyed) {
      this.reportStartupFailure(new Error('Test ability was destroyed before suite startup'));
      return;
    }
    if (this.started) {
      hilog.warn(0x0000, 'SensorCapiTest', 'Ignoring duplicate suite startup');
      return;
    }
    this.started = true;
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const args = AbilityDelegatorRegistry.getArguments();
    hilog.info(0x0000, 'SensorCapiTest', 'Starting suites for %{public}s', args.bundleName);
    Hypium.hypiumTest(delegator, args, testsuite);
  }

  private reportStartupFailure(error: Error): void {
    hilog.error(0x0000, 'SensorCapiTest', 'Test startup failed: %{public}s', error.message);
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    delegator.finishTest('Sensor test startup failed: ' + error.message, -1).catch((finishError: Error): void => {
      hilog.error(0x0000, 'SensorCapiTest', 'Reporting startup failure failed: %{public}s', finishError.message);
    });
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'SensorCapiTest', 'TestAbility received want: %{public}s', want.abilityName);
    hilog.debug(0x0000, 'SensorCapiTest', 'New launch reason: %{public}d', launchParam.launchReason);
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'SensorCapiTest', 'TestAbility window destroyed');
  }

  onForeground(): void {
    hilog.info(0x0000, 'SensorCapiTest', 'TestAbility foreground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'SensorCapiTest', 'TestAbility background');
  }

  onDestroy(): void {
    this.destroyed = true;
    hilog.info(0x0000, 'SensorCapiTest', 'TestAbility destroyed');
  }
}
