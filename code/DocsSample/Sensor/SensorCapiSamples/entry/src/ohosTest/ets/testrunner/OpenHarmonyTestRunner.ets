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

export default class OpenHarmonyTestRunner implements TestRunner {
  private started: boolean = false;

  onPrepare(): void {
    this.started = false;
    hilog.info(0x0000, 'SensorCapiTest', 'Preparing sensor test runner');
  }

  async onRun(): Promise<void> {
    if (this.started) {
      throw new Error('Sensor test runner was started more than once');
    }
    this.started = true;
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const args = AbilityDelegatorRegistry.getArguments();
    const want: Want = {
      bundleName: args.bundleName,
      abilityName: 'TestAbility',
    };
    hilog.info(0x0000, 'SensorCapiTest', 'Launching TestAbility for %{public}s', args.bundleName);
    const monitor: AbilityDelegatorRegistry.AbilityMonitor = {
      abilityName: 'TestAbility',
    };
    await delegator.addAbilityMonitor(monitor);
    try {
      await delegator.startAbility(want);
      const ability = await delegator.waitAbilityMonitor(monitor, 10000);
      if (ability === null || ability === undefined) {
        throw new Error('TestAbility was not observed after startup');
      }
      hilog.info(0x0000, 'SensorCapiTest', 'TestAbility launch completed');
    } catch (error) {
      const failure: Error = error as Error;
      hilog.error(0x0000, 'SensorCapiTest', 'Runner startup failed: %{public}s', failure.message);
      await delegator.finishTest('Unable to launch TestAbility: ' + failure.message, -1);
      throw failure;
    } finally {
      await delegator.removeAbilityMonitor(monitor);
    }
  }
}
