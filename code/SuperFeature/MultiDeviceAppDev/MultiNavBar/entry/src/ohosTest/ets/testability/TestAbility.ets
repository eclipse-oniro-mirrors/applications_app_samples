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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIAbility, Want, AbilityConstant } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { window } from '@kit.ArkUI';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default class TestAbility extends UIAbility {
  private testStarted: boolean = false;
  private abilityDelegator: abilityDelegatorRegistry.AbilityDelegator | null = null;
  private abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs | null = null;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onCreate');
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    this.abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    this.abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
  }

  /**
   * The suite registers more than 2000 cases, so Hypium must start after the window stage is
   * foreground; starting it in onCreate triggers LIFECYCLE_TIMEOUT.
   */
  private startTestSuite(): void {
    if (this.testStarted || this.abilityDelegator === null || this.abilityDelegatorArguments === null) {
      return;
    }
    this.testStarted = true;
    hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(this.abilityDelegator, this.abilityDelegatorArguments, testsuite);
  }

  onDestroy() {
    hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.ERROR);
        hilog.error(LOG_DOMAIN, LOG_TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onForeground');
    setTimeout(() => {
      this.startTestSuite();
    }, 300);
  }

  onBackground() {
    hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onBackground');
  }
}
