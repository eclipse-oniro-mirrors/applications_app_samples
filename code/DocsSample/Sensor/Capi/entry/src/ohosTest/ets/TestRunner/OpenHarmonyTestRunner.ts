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

import hilog from '@ohos.hilog';
import TestRunner from '@ohos.application.testRunner';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

const DOMAIN: number = 0xF811;
const TAG: string = 'SensorTestRunner';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'Preparing sensor tests');
  }

  private buildWant(): Want {
    const args = AbilityDelegatorRegistry.getArguments();
    if (args.bundleName.length === 0) {
      throw new Error('Test bundle name is empty');
    }
    const want: Want = {
      bundleName: args.bundleName,
      abilityName: 'TestAbility'
    };
    return want;
  }

  private logArguments(): void {
    const args = AbilityDelegatorRegistry.getArguments();
    hilog.info(DOMAIN, TAG, 'Bundle: %{public}s', args.bundleName);
    hilog.info(DOMAIN, TAG, '%{public}s', 'Using EntryAbility for compass UI checks');
  }

  async onRun(): Promise<void> {
    this.logArguments();
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const want: Want = this.buildWant();
    hilog.info(DOMAIN, TAG, '%{public}s', 'Starting TestAbility');
    try {
      await delegator.startAbility(want);
      hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility start completed');
    } catch (error) {
      const message: string = String(error);
      hilog.error(DOMAIN, TAG, 'TestAbility start failed: %{public}s', message);
      await delegator.finishTest('Cannot start Sensor TestAbility: ' + message, -1);
    }
  }
}
