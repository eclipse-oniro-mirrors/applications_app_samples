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
import { Hypium } from '@ohos/hypium';
import { RUNNER_TIMEOUT_MS } from '../support/BoundedCase';
import { BUNDLE, parameterSummary, runRunner, testSelector } from '../support/TestLog';
import { logInfo, logError } from '../../../main/ets/core/Logger';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void { logInfo(`${BUNDLE} OpenHarmonyTestRunner prepare`); }

  async onRun(): Promise<void> {
    await runRunner('OpenHarmonyTestRunner', (): Promise<void> => this.run());
  }

  private async run(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    if (args.parameters['-s timeout'] === undefined && args.parameters['timeout'] === undefined) {
      args.parameters['-s timeout'] = `${RUNNER_TIMEOUT_MS}`;
    }
    for (const key of ['class', '-s class', 'notClass', '-s notClass', 'itName', '-s itName']) {
      const value = args.parameters[key];
      if (typeof value === 'string') { args.parameters[key] = testSelector(value); }
    }
    logInfo(`${BUNDLE} [AP_RUNNER] init selectors=${parameterSummary(
      args.parameters['class'] ?? args.parameters['-s class'])}` +
      ` dryRun=${parameterSummary(args.parameters['dryRun'] ?? args.parameters['-s dryRun'])}` +
      ` timeout=${parameterSummary(args.parameters['timeout'] ?? args.parameters['-s timeout'])}`);
    let stage: string = 'import-list';
    try {
      const suite = await import('../test/List.test');
      stage = 'register-suites';
      logInfo('[AP_RUNNER] List imported; registering leaf describe names');
      Hypium.hypiumTest(delegator, args, suite.default);
      logInfo('[AP_RUNNER] Hypium scheduled; test result requires framework summary');
    } catch (error) {
      const message: string = `Test initialization failed at ${stage}: ${(error as Error).message}`;
      logError(`${BUNDLE} [AP_RUNNER] initialization failure at ${stage}: ${parameterSummary((error as Error).message)}`);
      await delegator.finishTest(message, 1);
    }
  }
}
