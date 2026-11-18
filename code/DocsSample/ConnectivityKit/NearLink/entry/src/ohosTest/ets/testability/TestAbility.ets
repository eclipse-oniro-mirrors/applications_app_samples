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
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { window } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const DOMAIN: number = 0xF811;
const TAG: string = 'TestAbility';

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onCreate');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err) => {
      if (err && err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading content.');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onForeground');
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onBackground');
  }
}
