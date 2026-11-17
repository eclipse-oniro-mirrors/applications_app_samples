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
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import hilog from '@ohos.hilog';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { resetDriver } from '../test/Shared/SharedDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'SensorTestAbility';

/**
 * Load test-suite dependencies only after AbilityDelegator is available.
 * Register Hypium before any suite performs UI or sensor operations.
 * UI suites launch the production EntryAbility from their own hooks.
 */
export default class TestAbility extends UIAbility {
  private testsStarted: boolean = false;
  private pageLoaded: boolean = false;
  private stageAvailable: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.pageLoaded = false;
    this.stageAvailable = false;
    hilog.info(DOMAIN, TAG, 'Test host created for %{public}s', want.abilityName ?? 'TestAbility');
    hilog.info(DOMAIN, TAG, 'Launch reason: %{public}d', launchParam.launchReason);
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'Test host received want for %{public}s', want.abilityName ?? 'TestAbility');
    hilog.info(DOMAIN, TAG, 'New launch reason: %{public}d', launchParam.launchReason);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    this.stageAvailable = true;
    this.pageLoaded = false;
    hilog.info(DOMAIN, TAG, '%{public}s', 'Test host window stage created');
    windowStage.loadContent('testability/pages/Index', (error) => {
      if (error && error.code !== 0) {
        this.pageLoaded = false;
        hilog.error(DOMAIN, TAG, 'Test host page failed: %{public}d %{public}s', error.code, error.message);
        this.startTests();
        return;
      }
      this.pageLoaded = true;
      hilog.info(DOMAIN, TAG, '%{public}s', 'Test host page loaded');
      this.startTests();
    });
  }

  onWindowStageDestroy(): void {
    this.stageAvailable = false;
    this.pageLoaded = false;
    hilog.info(DOMAIN, TAG, '%{public}s', 'Test host window stage destroyed');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'Test host foreground: stage=%{public}s page=%{public}s',
      String(this.stageAvailable), String(this.pageLoaded));
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'Test host background: stage=%{public}s page=%{public}s',
      String(this.stageAvailable), String(this.pageLoaded));
  }

  /** Start exactly once; page readiness is asserted by the selected UI suites. */
  private async startTests(): Promise<void> {
    if (this.testsStarted) {
      return;
    }
    this.testsStarted = true;
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const argumentsValue = AbilityDelegatorRegistry.getArguments();
    try {
      await resetDriver();
      hilog.info(DOMAIN, TAG, '%{public}s', 'Starting registered sensor suites');
      Hypium.hypiumTest(delegator, argumentsValue, testsuite);
    } catch (error) {
      const failure: Error = error as Error;
      hilog.error(DOMAIN, TAG, 'Hypium startup failed: %{public}s', failure.message);
      await delegator.finishTest('Sensor Hypium startup failed: ' + failure.message, -1).catch((finishError: Error) => {
        hilog.error(DOMAIN, TAG, 'Failed to finish test run: %{public}s', finishError.message);
      });
    }
  }

  /** Release transient host state; Hypium owns test completion and reporting. */
  onDestroy(): void {
    this.pageLoaded = false;
    this.stageAvailable = false;
    hilog.info(DOMAIN, TAG, '%{public}s', 'Test host destroyed');
  }
}
