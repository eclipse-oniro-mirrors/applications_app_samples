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
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Module tag used by every log line emitted from this file. */
const TAG: string = '[Sample_PhotoPickerAndSendable]';

/**
 * Test ability that boots hypium and loads the placeholder page of the test runner.
 */
export default class TestAbility extends UIAbility {
  /**
   * Starts the hypium suite as soon as the test ability is created.
   * @param want Want that launched the test ability.
   * @param launchParam Launch parameters of the test ability.
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // Log the ability creation so the hilog stream can be split per run.
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
    // Take the delegator that drives the test lifecycle.
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    // Read the arguments injected by the test framework.
    const args = abilityDelegatorRegistry.getArguments();
    // Hand the suite to hypium, which reports every case result to the delegator.
    Hypium.hypiumTest(delegator, args, testsuite);
  }

  /**
   * Releases nothing but keeps the lifecycle hook for the log stream.
   */
  onDestroy(): void {
    // Log the ability destruction.
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
  }

  /**
   * Loads the placeholder page of the test ability.
   * @param windowStage Window stage of the test ability.
   */
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Load the placeholder page, the real cases run in the sample ability.
    windowStage.loadContent('testability/pages/Index', (err: BusinessError) => {
      // Handle the failed content load before touching the window stage further.
      if (err.code) {
        // Log the failure together with the numeric error code.
        hilog.error(DOMAIN, TAG, 'Failed to load the content, code: %{public}d', err.code);
        // Leave the callback without further work.
        return;
      }
      // Log the successful content load.
      hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility content loaded');
    });
  }

  /**
   * Keeps the lifecycle hook for the log stream.
   */
  onWindowStageDestroy(): void {
    // Log the window stage destruction.
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  /**
   * Keeps the lifecycle hook for the log stream.
   */
  onForeground(): void {
    // Log the foreground transition.
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onForeground');
  }

  /**
   * Keeps the lifecycle hook for the log stream.
   */
  onBackground(): void {
    // Log the background transition.
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
  }
}
