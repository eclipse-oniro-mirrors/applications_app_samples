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

import { hilog } from '@kit.PerformanceAnalysisKit';
import testRunner from '@ohos.application.testRunner';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Want } from '@kit.AbilityKit';

// Keep the runner independent of UiTest until AbilityDelegator is registered.
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AgentExtension]';
const TEST_ABILITY_NAME: string = 'TestAbility';

export default class OpenHarmonyTestRunner implements testRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    const args = abilityDelegatorRegistry.getArguments();
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const monitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: TEST_ABILITY_NAME
    };
    let monitorAdded: boolean = false;
    try {
      await delegator.addAbilityMonitor(monitor);
      monitorAdded = true;
      const want: Want = {
        bundleName: args.bundleName,
        abilityName: TEST_ABILITY_NAME
      };
      await delegator.startAbility(want);
      const ability = await delegator.waitAbilityMonitor(monitor, 10000);
      if (ability === null || ability === undefined) {
        throw new Error('TestAbility monitor returned no ability');
      }
      hilog.info(DOMAIN, TAG, 'TestAbility started; waiting for Hypium result');
    } catch (startError) {
      const error = startError as Error;
      hilog.error(DOMAIN, TAG, 'Test runner startup failed: %{public}s', error.message);
      await delegator.finishTest('Agent test runner startup failed: ' + error.message, -1);
    } finally {
      if (monitorAdded) {
        try {
          await delegator.removeAbilityMonitor(monitor);
          hilog.info(DOMAIN, TAG, 'TestAbility startup monitor removed');
        } catch (removeError) {
          const error = removeError as Error;
          hilog.error(DOMAIN, TAG, 'Unable to remove startup monitor: %{public}s', error.message);
          await delegator.finishTest('Agent monitor cleanup failed: ' + error.message, -1);
        }
      }
    }
  }
}
