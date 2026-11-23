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

import { UIAbility, Want, AbilityConstant } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns]';

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onCreate');
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `want param:${JSON.stringify(want)}`);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', `launchParam:${JSON.stringify(launchParam)}`);
    const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator =
      AbilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
      AbilityDelegatorRegistry.getArguments();
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  onDestroy() {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err: BusinessError) => {
      if (err.code) {
        hilog.error(LOG_DOMAIN, LOG_TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy() {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'TestAbility onBackground');
  }
}
