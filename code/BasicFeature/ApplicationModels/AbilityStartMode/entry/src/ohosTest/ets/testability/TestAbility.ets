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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

const DOMAIN: number = 0x0000;
const TAG: string = 'StartModeTest';

/** Starts the main ability of the sample so that the home page is rendered. */
async function startMainAbility(): Promise<void> {
  const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  const args: AbilityDelegatorRegistry.AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: 'MainAbility'
  };
  hilog.info(DOMAIN, TAG, '%{public}s', `startMainAbility: ${JSON.stringify(want)}`);
  await delegator.startAbility(want);
}

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
    hilog.info(DOMAIN, TAG, 'TestAbility want: %{public}s', JSON.stringify(want) ?? '');
    hilog.info(DOMAIN, TAG, 'TestAbility launchParam: %{public}s', JSON.stringify(launchParam) ?? '');

    const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
      AbilityDelegatorRegistry.getArguments();

    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility start run testcase');
    setTimeout(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility timer fired');
      startMainAbility().then(() => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'MainAbility launched');
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      }).catch((err: Error) => {
        hilog.error(DOMAIN, TAG, 'Failed to launch MainAbility: %{public}s', JSON.stringify(err) ?? '');
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      });
    }, 1000);
  }

  onDestroy() {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content: %{public}s', JSON.stringify(data) ?? '');
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
