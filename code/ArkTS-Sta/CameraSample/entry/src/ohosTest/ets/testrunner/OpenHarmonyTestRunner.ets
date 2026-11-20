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
import { Hypium, afterEachIt } from '@ohos/hypium';
import testsuite from '../test/List.test';

function registerTests(): void {
  // Release completed static async calls before dispatching the next case.
  afterEachIt((): Promise<void> => new Promise<void>((
    resolve: (value: PromiseLike<void> | undefined) => void,
    reject: (reason: Error) => void
  ): void => {
    setTimeout((): void => { resolve(undefined); }, 0);
  }));
  testsuite();
}

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare: () => void = (): void => {
    hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'Preparing headless model tests');
    hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'Scope: Comment fields and Constants');
    hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'No camera hardware is required');
  };

  private logArguments(args: abilityDelegatorRegistry.AbilityDelegatorArgs): void {
    const bundleName: string = args.bundleName;
    const runnerName: string = args.testRunnerClassName;
    const caseNames: string = args.testCaseNames;
    hilog.info(0x0000, 'CameraModelTest', 'Bundle: %{public}s', bundleName);
    if (runnerName.length > 0) {
      hilog.info(0x0000, 'CameraModelTest', 'Runner: %{public}s', runnerName);
    } else {
      hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'Runner name is supplied by the test framework');
    }
    if (caseNames.length > 0) {
      hilog.info(0x0000, 'CameraModelTest', 'Case filter: %{public}s', caseNames);
    } else {
      hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'All registered model cases are eligible');
    }
    const serializedParameters: string = JSON.stringify(args.parameters);
    hilog.info(0x0000, 'CameraModelTest', 'Parameters: %{public}s', serializedParameters);
  }

  private validateArguments(args: abilityDelegatorRegistry.AbilityDelegatorArgs): void {
    if (args.bundleName.length === 0) {
      throw new Error('The headless test runner requires a bundle name');
    }
    const action: string = 'Comment data contract';
    hilog.info(0x0000, 'CameraModelTest', 'Test scope: %{public}s', action);
  }

  onRun: () => void = (): void => {
    const delegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const args: abilityDelegatorRegistry.AbilityDelegatorArgs =
      abilityDelegatorRegistry.getArguments();
    this.validateArguments(args);
    this.logArguments(args);
    hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'Registering independent model cases');
    // Confirm runner startup before the full static suite is registered.
    delegator.printSync('start ability successfully.\n');
    Hypium.hypiumTest(delegator, args, registerTests);
    hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'Headless model suite dispatched');
  };
}
