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

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator | undefined = undefined;
let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs | undefined = undefined;

async function onAbilityCreateCallback(): Promise<void> {
  hilog.info(0x0000, 'testTag', '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: Error): Promise<void> {
  hilog.info(0x0000, 'testTag', 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun(): Promise<void> {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const bundleName: string = abilityDelegatorArguments.bundleName;
    const testAbilityName: string = 'TestAbility';
    let lMonitor: AbilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback
    };
    let monitorRegistered: boolean = false;
    const want: Want = {
      bundleName: bundleName,
      abilityName: testAbilityName
    };
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    try {
      await abilityDelegator.addAbilityMonitor(lMonitor);
      monitorRegistered = true;
      if (bundleName !== 'com.samples.applicationcontext') {
        throw new Error('Unexpected test target bundle: ' + bundleName);
      }
      await abilityDelegator.startAbility(want);
      hilog.info(0xF811, 'ContextRunner', 'TestAbility launched; awaiting Hypium completion');
    } catch (error) {
      const failure: Error = error as Error;
      const reason: string = 'Test runner startup failed: ' + failure.message;
      hilog.error(0xF811, 'ContextRunner', '%{public}s', reason);
      await abilityDelegator.finishTest(reason, -1);
    } finally {
      if (monitorRegistered) {
        await abilityDelegator.removeAbilityMonitor(lMonitor);
      }
    }
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
