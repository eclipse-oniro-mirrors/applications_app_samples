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
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import window from '@ohos.window';

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';
const ON_DESTROY_ERROR: number = -2;

/*
 * Test case registration must run after the foreground flow completes.
 *
 * Hypium writes one sync log line per registered case; registering dozens of
 * suites occupies the main thread for a while. AAFWK starts timing from
 * ForegroundLifecycle and reports LIFECYCLE_TIMEOUT (shown as "App died")
 * if the foreground callback does not finish within 5 seconds. Scheduling
 * the registration with setTimeout after onForeground keeps that window free.
 */
const REGISTER_DELAY_MS: number = 1000;

export default class TestAbility extends UIAbility {
  private abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
  private registerScheduled: boolean = false;

  constructor() {
    super();
    this.abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
    try {
      hilog.info(DOMAIN, TAG, '%{public}s', 'want param:' + JSON.stringify(want));
    } catch (error) {
      hilog.warn(DOMAIN, TAG, '%{public}s', 'want param cannot be serialized');
      hilog.warn(DOMAIN, TAG, '%{public}s', String(error));
    }
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onForeground');
    if (this.registerScheduled) {
      return;
    }
    this.registerScheduled = true;
    setTimeout(() => {
      const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
        abilityDelegatorRegistry.getArguments();
      hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase!!!');
      Hypium.hypiumTest(this.abilityDelegator, abilityDelegatorArguments, testsuite);
      hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility register end');
    }, REGISTER_DELAY_MS);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
    this.abilityDelegator.finishTest('TestAbility onDestroy unexpectedly!', ON_DESTROY_ERROR, () => {
    });
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }
}
