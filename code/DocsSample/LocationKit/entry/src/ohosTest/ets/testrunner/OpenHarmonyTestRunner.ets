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

import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = 'OpenHarmonyTestRunner';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    hilog.info(DOMAIN, TAG, 'OpenHarmonyTestRunner OnPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'OpenHarmonyTestRunner onRun begin');
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    let testAbilityName: string = 'TestAbility';
    let lMonitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(lMonitor);
    let want: Want = {
      bundleName: abilityDelegatorArguments.bundleName,
      abilityName: testAbilityName,
      moduleName: 'entry_test'
    };
    await abilityDelegator.startAbility(want);
    hilog.info(DOMAIN, TAG, 'OpenHarmonyTestRunner onRun end');
  }
}

function onAbilityCreateCallback(ability: UIAbility): void {
  hilog.info(DOMAIN, TAG, 'onAbilityCreateCallback, ability: %{public}s', ability.context.abilityInfo.name);
}
