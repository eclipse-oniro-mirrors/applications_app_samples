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
const TAG: string = '[Sample_SendableDataStore]';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun begin');
    const abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const testAbilityName = `${abilityDelegatorArguments.bundleName}.TestAbility`;
    await abilityDelegator.addAbilityMonitor({
      abilityName: testAbilityName,
      onAbilityCreate: (): void => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'onAbilityCreateCallback');
      }
    });
    let cmd = `aa start -d 0 -a TestAbility -b ${abilityDelegatorArguments.bundleName}`;
    const debug = abilityDelegatorArguments.parameters['-D'];
    if (debug === 'true') {
      cmd += ' -D';
    }
    hilog.info(DOMAIN, TAG, 'cmd: %{public}s', cmd);
    const result = await abilityDelegator.executeShellCommand(cmd);
    hilog.info(DOMAIN, TAG, 'executeShellCommand stdResult: %{public}s, exitCode: %{public}d',
      result.stdResult, result.exitCode);
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
