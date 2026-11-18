/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import Logger from 'ets/util/Logger';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator | undefined = undefined
let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs | undefined = undefined

const LOG_TAG: string = '[Sample_AppXComponent3D]';
const TEST_ABILITY_NAME: string = 'TestAbility';

async function onAbilityCreateCallback(): Promise<void> {
  Logger.info(LOG_TAG, '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: Error): Promise<void> {
  Logger.info(LOG_TAG, 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    Logger.info(LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun(): Promise<void> {
    Logger.info(LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    const bundleName: string = abilityDelegatorArguments.bundleName;
    const testAbilityName: string = TEST_ABILITY_NAME;
    let lMonitor: AbilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback)
    const want: Want = {
      bundleName: bundleName,
      abilityName: testAbilityName,
      parameters: abilityDelegatorArguments.parameters
    };
    Logger.info(LOG_TAG, 'startAbility parameters: %{public}s',
      JSON.stringify(abilityDelegatorArguments.parameters) ?? '');
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    abilityDelegator.startAbility(want, (err, data) => {
      Logger.info(LOG_TAG, 'startAbility : err : %{public}s', JSON.stringify(err) ?? '');
    })
  }
}