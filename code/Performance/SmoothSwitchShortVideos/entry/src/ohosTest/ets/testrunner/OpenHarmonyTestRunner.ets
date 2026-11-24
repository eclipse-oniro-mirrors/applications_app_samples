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

import hilog from '@ohos.hilog';
import TestRunner from '@ohos.application.testRunner';
import registry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

const TAG: string = 'ShortVideoTestRunner';
const DOMAIN: number = 0x0000;
const TEST_MODULE: string = 'entry_test';
const TEST_ABILITY: string = 'TestAbility';

function onAbilityCreateCallback(): void {
  hilog.info(DOMAIN, TAG, 'Test ability created');
}

function createTestWant(bundleName: string): Want {
  if (bundleName.length === 0) {
    throw new Error('Missing test bundle name');
  }
  return {
    bundleName: bundleName,
    moduleName: TEST_MODULE,
    abilityName: TEST_ABILITY
  };
}

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, 'Preparing short video device tests');
  }

  async onRun(): Promise<void> {
    const args = registry.getArguments();
    const delegator = registry.getAbilityDelegator();
    const monitor: registry.AbilityMonitor = {
      abilityName: TEST_ABILITY,
      onAbilityCreate: onAbilityCreateCallback
    };
    try {
      await delegator.addAbilityMonitor(monitor);
      try {
        await delegator.startAbility(createTestWant(args.bundleName));
        hilog.info(DOMAIN, TAG, 'Test ability start requested');
      } finally {
        await delegator.removeAbilityMonitor(monitor);
      }
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'Runner startup failed: %{public}s', String(error));
      await delegator.finishTest('Unable to launch the short video test ability', 1);
    }
  }
}

// The runner only starts the host. Hypium reports suite results from TestAbility.
