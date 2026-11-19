/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

const DOMAIN = 0x0000;
const TAG = '[AbilityStage_Test]';
const ENTRY_ABILITY_NAME = 'EntryAbility';

async function startEntryAbility(): Promise<void> {
  const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  const args = AbilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: ENTRY_ABILITY_NAME
  };
  await delegator.startAbility(want);
}

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
    hilog.info(DOMAIN, TAG, 'want param: %{public}s', JSON.stringify(want) ?? '');
    hilog.info(DOMAIN, TAG, 'launchParam: %{public}s', JSON.stringify(launchParam) ?? '');
    const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator =
      AbilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
      AbilityDelegatorRegistry.getArguments();
    hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase');
    setTimeout(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase in timer');
      startEntryAbility().then(() => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'EntryAbility launched');
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      }).catch((err: Error) => {
        hilog.error(DOMAIN, TAG, 'Failed to launch EntryAbility: %{public}s', JSON.stringify(err) ?? '');
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      });
    }, 1000);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onForeground');
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
  }
}
