'use static'


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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';

function onAbilityCreateCallback(data: UIAbility): void {
  hilog.info(0x0000, 'testTag', '%{public}s', 'onAbilityCreateCallback');
}

function addAbilityMonitorCallback(err: BusinessError<void> | null): void {
  hilog.info(0x0000, 'testTag', 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare: () => void = (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
  };

  onRun: () => void = (): void => {
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun run');
    const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
      abilityDelegatorRegistry.getArguments();
    const bundleName: string = abilityDelegatorArguments.bundleName;
    const testAbilityName: string = 'TestAbility';
    const monitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(monitor, addAbilityMonitorCallback);
    const want: Want = {
      bundleName: bundleName,
      abilityName: testAbilityName
    };
    abilityDelegator.startAbility(want, (err: BusinessError<void> | null, data: void | undefined): void => {
      hilog.info(0x0000, 'testTag', 'startAbility : err : %{public}s', JSON.stringify(err) ?? '');
      hilog.info(0x0000, 'testTag', 'startAbility : data : %{public}s', JSON.stringify(data) ?? '');
    });
    hilog.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun end');
  };
}
