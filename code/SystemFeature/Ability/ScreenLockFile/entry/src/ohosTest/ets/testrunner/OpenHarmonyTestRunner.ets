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
import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScreenLockFile]';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const testAbilityName: string = `${args.bundleName}.TestAbility`;
    await delegator.addAbilityMonitor({
      abilityName: testAbilityName,
      onAbilityCreate: (): void => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility created');
      }
    });
    let command: string = `aa start -d 0 -a TestAbility -b ${args.bundleName} -m entry_test`;
    if (args.parameters['-D'] === 'true') {
      command += ' -D';
    }
    const result: abilityDelegatorRegistry.ShellCmdResult = await delegator.executeShellCommand(command);
    hilog.info(DOMAIN, TAG, 'stdResult: %{public}s, exitCode: %{public}d', result.stdResult, result.exitCode);
  }
}
