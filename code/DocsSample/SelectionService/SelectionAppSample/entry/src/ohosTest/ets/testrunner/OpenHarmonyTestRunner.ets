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

const DOMAIN: number = 0x0000;
const TAG: string = 'SelectionTestRunner';

export default class OpenHarmonyTestRunner implements TestRunner {
  private prepared: boolean = false;
  private running: boolean = false;

  onPrepare(): void {
    this.prepared = true;
    hilog.info(DOMAIN, TAG, 'Test runner prepared');
  }

  async onRun(): Promise<void> {
    if (this.running) {
      hilog.warn(DOMAIN, TAG, 'Test runner is already active');
      return;
    }
    this.running = true;
    if (!this.prepared) {
      this.onPrepare();
    }
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const args = AbilityDelegatorRegistry.getArguments();
    const want: Want = {
      bundleName: args.bundleName,
      abilityName: 'TestAbility'
    };
    const monitor: AbilityDelegatorRegistry.AbilityMonitor = {
      abilityName: 'TestAbility'
    };
    try {
      await delegator.addAbilityMonitor(monitor);
      await delegator.startAbility(want);
      const ability = await delegator.waitAbilityMonitor(monitor, 10000);
      if (ability === undefined || ability === null) {
        throw new Error('TestAbility startup timed out');
      }
      hilog.info(DOMAIN, TAG, 'TestAbility started');
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'Runner failed: %{public}s', JSON.stringify(error));
      await delegator.finishTest('TestAbility startup failed', -1);
    } finally {
      await delegator.removeAbilityMonitor(monitor);
    }
  }
}
