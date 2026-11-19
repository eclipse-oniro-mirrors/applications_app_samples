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
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomCommonEventRely]';
const TEST_ABILITY_NAME: string = 'TestAbility';
const PARAM_KEYS: string[] = [
  '-s class', '-s notClass', '-s suite', '-s it',
  '-s level', '-s testType', '-s size', '-s timeout', '-s dryRun'
];

/**
 * Forwards the filter parameters to the start command of the test ability.
 * Hypium reads them from the arguments of the started ability, so dropping them here makes
 * -s class silently fall back to the whole suite.
 */
function translateParamsToString(parameters: Record<string, string>): string {
  let targetParams: string = '';
  for (let index: number = 0; index < PARAM_KEYS.length; index++) {
    const key: string = PARAM_KEYS[index];
    const value: string = parameters[key] ?? '';
    if (value.length > 0) {
      targetParams = `${targetParams} ${key} ${value}`;
    }
  }
  return targetParams.trim();
}

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun');
    let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    let monitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: TEST_ABILITY_NAME,
      onAbilityCreate: (): void => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility created');
      }
    };
    delegator.addAbilityMonitor(monitor, (error: BusinessError) => {
      hilog.warn(DOMAIN, TAG, 'addAbilityMonitor: %{public}s', JSON.stringify(error) ?? '');
    });
    let cmd: string = `aa start -d 0 -b ${args.bundleName} -a ${TEST_ABILITY_NAME}`;
    let extraParams: string = translateParamsToString(args.parameters);
    if (extraParams.length > 0) {
      cmd = `${cmd} ${extraParams}`;
    }
    if ((args.parameters['-D'] ?? '') === 'true') {
      cmd = `${cmd} -D`;
    }
    hilog.info(DOMAIN, TAG, 'start cmd: %{public}s', cmd);
    delegator.executeShellCommand(cmd,
      (error: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
        hilog.info(DOMAIN, TAG, 'executeShellCommand error: %{public}s', JSON.stringify(error) ?? '');
        hilog.info(DOMAIN, TAG, 'executeShellCommand result: %{public}s', JSON.stringify(data) ?? '');
      });
  }
}
