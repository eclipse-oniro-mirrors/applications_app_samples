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
import { window } from '@kit.ArkUI';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { TestContextHolder } from '../test/utils/TestContextHolder';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ResourceManager]';
/** Registration of thousands of cases is synchronous JS, so it is pushed past the
 *  lifecycle callback budget; otherwise the ability hits LIFECYCLE_TIMEOUT. */
const REGISTER_DELAY_MS: number = 300;

export default class TestAbility extends UIAbility {
  private testStarted: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
    hilog.info(DOMAIN, TAG, 'want param: %{public}s', JSON.stringify(want) ?? '');
    hilog.info(DOMAIN, TAG, 'launchParam: %{public}s', JSON.stringify(launchParam) ?? '');
    TestContextHolder.set(this.context);
  }

  onDestroy() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onForeground');
    this.startTests();
  }

  onBackground() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
  }

  /** Runs Hypium once, after the ability reached the foreground. */
  private startTests(): void {
    if (this.testStarted) {
      return;
    }
    this.testStarted = true;
    const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
      abilityDelegatorRegistry.getArguments();
    hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase!!!');
    setTimeout(() => {
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    }, REGISTER_DELAY_MS);
  }
}
