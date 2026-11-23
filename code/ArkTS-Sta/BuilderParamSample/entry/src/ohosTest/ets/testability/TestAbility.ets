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
import window from '@ohos.window';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { openMain } from '../test/SharedDriver';

export default class TestAbility extends UIAbility {
  private started: boolean = false;
  private failureReported: boolean = false;

  onCreate(): void {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    delegator.printSync('start ability successfully.\n');
    hilog.info(0, 'BuilderParamTests', 'Test host created');
  }

  onWindowStageCreate(stage: window.WindowStage): void {
    hilog.info(0, 'BuilderParamTests', 'Loading test host page');
    stage.loadContent('testability/pages/Index', (error) => {
      if (error && error.code) {
        this.fail('Unable to load test host: ' + error.code);
        return;
      }
      this.startTests().catch((failure: Error) => {
        this.fail('Unable to initialize sample: ' + failure.message);
      });
    });
  }

  private async startTests(): Promise<void> {
    if (this.started || this.failureReported) {
      return;
    }
    this.started = true;
    hilog.info(0, 'BuilderParamTests', 'Waiting for the real application page');
    await openMain();
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    hilog.info(0, 'BuilderParamTests', 'Registering original and adapted suites');
    Hypium.hypiumTest(delegator, args, testsuite);
  }

  private fail(message: string): void {
    if (this.failureReported) {
      return;
    }
    this.failureReported = true;
    hilog.error(0, 'BuilderParamTests', 'Initialization failed: %{public}s', message);
    abilityDelegatorRegistry.getAbilityDelegator().finishTest(message, -1);
  }

  onForeground(): void {
    hilog.info(0, 'BuilderParamTests', 'Test host entered foreground');
  }

  onBackground(): void {
    hilog.info(0, 'BuilderParamTests', 'Test host entered background');
  }

  onWindowStageDestroy(): void {
    hilog.info(0, 'BuilderParamTests', 'Test host window destroyed');
  }

  onDestroy(): void {
    hilog.info(0, 'BuilderParamTests', 'Test host destroyed');
  }
}
