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
import { EVENT_LOOP_YIELD_MS } from '../test/Shared/TestScheduler';
import { setTestWindowStage } from '../test/Shared/SharedDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'SelectionTestAbility';

export default class TestAbility extends UIAbility {
  private started: boolean = false;
  private destroyed: boolean = false;
  private startupTimer: number | undefined;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.started = false;
    this.destroyed = false;
    hilog.info(DOMAIN, TAG, 'Test ability created');
  }

  onWindowStageCreate(stage: window.WindowStage): void {
    setTestWindowStage(stage);
    stage.loadContent('testability/pages/Index', (error) => {
      if (error.code) {
        hilog.error(DOMAIN, TAG, 'Test page failed: %{public}s', JSON.stringify(error));
        AbilityDelegatorRegistry.getAbilityDelegator().finishTest('Test page failed', -1);
        return;
      }
      if (this.destroyed) {
        return;
      }
      /** Start in a new native event turn, outside the loadContent callback. */
      this.startupTimer = setTimeout(() => {
        this.startupTimer = undefined;
        if (!this.destroyed) {
          this.startTests();
        }
      }, EVENT_LOOP_YIELD_MS);
    });
  }

  private startTests(): void {
    if (this.started) {
      hilog.info(DOMAIN, TAG, 'Duplicate suite start prevented');
      return;
    }
    this.started = true;
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const args = AbilityDelegatorRegistry.getArguments();
    hilog.info(DOMAIN, TAG, 'Starting selection suites');
    try {
      Hypium.hypiumTest(delegator, args, testsuite);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'Suite startup failed: %{public}s', JSON.stringify(error));
      delegator.finishTest('Suite startup failed', -1);
    }
  }

  private cancelStartup(): void {
    if (this.startupTimer !== undefined) {
      clearTimeout(this.startupTimer);
      this.startupTimer = undefined;
    }
  }

  onWindowStageDestroy(): void {
    this.cancelStartup();
    setTestWindowStage(undefined);
    hilog.info(DOMAIN, TAG, 'Test window destroyed');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'Test ability foreground');
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'Test ability background');
  }

  onDestroy(): void {
    this.destroyed = true;
    this.cancelStartup();
    setTestWindowStage(undefined);
    hilog.info(DOMAIN, TAG, 'Test ability destroyed');
  }
}
