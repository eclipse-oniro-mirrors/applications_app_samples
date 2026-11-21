'use static';
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
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

export default class OpenHarmonyTestRunner implements TestRunner {
  private dispatched: boolean = false;

  onPrepare: () => void = (): void => {
    hilog.info(0x0000, 'NetworkSampleTest', '%{public}s', 'Preparing network sample tests');
    hilog.info(0x0000, 'NetworkSampleTest', '%{public}s', 'Scope: all registered suites');
    hilog.info(0x0000, 'NetworkSampleTest', '%{public}s', 'Logical model and resource contracts');
  };

  private logArguments(args: abilityDelegatorRegistry.AbilityDelegatorArgs): void {
    hilog.info(0x0000, 'NetworkSampleTest', 'Bundle: %{public}s', args.bundleName);
    if (args.testCaseNames.length > 0) {
      hilog.info(0x0000, 'NetworkSampleTest', 'Case filter: %{public}s', args.testCaseNames);
    }
    const parameters: string = JSON.stringify(args.parameters);
    hilog.info(0x0000, 'NetworkSampleTest', 'Parameters: %{public}s', parameters);
  }

  onRun: () => void = (): void => {
    if (this.dispatched) {
      hilog.warn(0x0000, 'NetworkSampleTest', '%{public}s', 'Test dispatch was already requested');
      return;
    }
    this.dispatched = true;
    const delegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const args: abilityDelegatorRegistry.AbilityDelegatorArgs =
      abilityDelegatorRegistry.getArguments();
    // Notify DevEco before registering the full suite on the static runtime.
    delegator.printSync('start ability successfully.\n');
    this.logArguments(args);
    hilog.info(0x0000, 'NetworkSampleTest', '%{public}s', 'Dispatching all registered test cases');
    Hypium.hypiumTest(delegator, args, testsuite);
  };
}
