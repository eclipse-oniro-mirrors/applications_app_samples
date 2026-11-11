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
import { logInfo, logError } from '../../../main/ets/core/Logger';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void { logInfo('[AP_RUNNER] prepare'); }

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    if (args.parameters['-s timeout'] === undefined && args.parameters['timeout'] === undefined) {
      args.parameters['-s timeout'] = `${RUNNER_TIMEOUT_MS}`;
    }
    logInfo(`[AP_RUNNER] init class=${args.parameters['class'] ?? args.parameters['-s class'] ?? '<all>'}` +
      ` dryRun=${args.parameters['dryRun'] ?? args.parameters['-s dryRun'] ?? 'false'}` +
      ` timeout=${args.parameters['timeout'] ?? args.parameters['-s timeout'] ?? '<default>'}`);
    let stage: string = 'import-list';
    try {
      const suite = await import('../test/List.test');
      stage = 'register-suites';
      logInfo('[AP_RUNNER] List imported; registering leaf describe names');
      Hypium.hypiumTest(delegator, args, suite.default);
      logInfo('[AP_RUNNER] Hypium scheduled; test result requires framework summary');
    } catch (error) {
      const message: string = `Test initialization failed at ${stage}: ${(error as Error).message}`;
      logError(`[AP_RUNNER] ${message}`);
      await delegator.finishTest(message, 1);
    }
  }
}
