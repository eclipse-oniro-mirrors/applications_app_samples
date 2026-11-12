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
import { window } from '@kit.ArkUI';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

const ON_DESTROY_ERROR: number = -2;
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PatternLock_TestAbility]';

export default class TestAbility extends UIAbility {
  private abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;

  constructor() {
    super();
    this.abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
    hilog.info(DOMAIN, TAG, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(DOMAIN, TAG, '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(this.abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  onDestroy() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
    this.abilityDelegator.finishTest('TestAbility onDestroy unexpectedly!', ON_DESTROY_ERROR, () => {});
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
  }
}
