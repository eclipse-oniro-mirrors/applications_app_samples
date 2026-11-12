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
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Module tag used by every log line emitted from this file. */
const TAG: string = '[Sample_PhotoPickerAndSendable]';
/** Name of the test ability started by the runner. */
const TEST_ABILITY: string = 'TestAbility';

/**
 * Test runner that starts the test ability through the ability delegator shell.
 */
export default class OpenHarmonyTestRunner implements TestRunner {
  /**
   * Copies the mock configuration when the runner is prepared; kept as a log hook here.
   */
  onPrepare(): void {
    // Log the prepare stage of the runner.
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  /**
   * Starts the test ability and waits until the shell command returns.
   */
  async onRun(): Promise<void> {
    // Log the run stage start.
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun begin');
    // Take the delegator used to execute shell commands on the device.
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    // Read the arguments injected by the test framework.
    const args = abilityDelegatorRegistry.getArguments();
    // Build the aa start command of the test ability.
    let cmd: string = `aa start -d 0 -a ${TEST_ABILITY} -b ${args.bundleName}`;
    // Read the debug flag out of the injected parameters.
    const debug: string = args.parameters['-D'];
    // Append the debug flag when the framework requested a debug start.
    if (debug === 'true') {
      // Extend the command with the debug switch.
      cmd += ' -D';
    }
    try {
      // Execute the start command and wait for its completion.
      await delegator.executeShellCommand(cmd);
      // Log the successful start together with the executed command.
      hilog.info(DOMAIN, TAG, 'test ability started: %{public}s', cmd);
    } catch (error) {
      // Log the failed start together with the system error message.
      hilog.error(DOMAIN, TAG, 'start test ability failed: %{public}s', (error as Error).message);
    }
    // Log the run stage end.
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
