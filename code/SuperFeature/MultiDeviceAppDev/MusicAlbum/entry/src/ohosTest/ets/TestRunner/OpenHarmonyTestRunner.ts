/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
const TAG: string = '[Sample_MusicAlbum]';

function translateParamsToString(parameters: Record<string, string>): string {
  const keySet: Set<string> = new Set<string>([
    '-s class', '-s notClass', '-s suite', '-s it',
    '-s level', '-s testType', '-s size', '-s timeout',
    '-s dryRun'
  ]);
  let targetParams: string = '';
  for (const key in parameters) {
    if (keySet.has(key)) {
      targetParams = `${targetParams} ${key} ${parameters[key]}`;
    }
  }
  return targetParams.trim();
}

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun begin');
    const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
      abilityDelegatorRegistry.getArguments();
    const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const parameters: Record<string, string> = abilityDelegatorArguments.parameters as Record<string, string>;
    const testAbilityName: string = `${abilityDelegatorArguments.bundleName}.TestAbility`;
    try {
      await abilityDelegator.addAbilityMonitor({
        abilityName: testAbilityName,
        onAbilityCreate: (): void => {
          hilog.info(DOMAIN, TAG, '%{public}s', 'onAbilityCreateCallback');
        }
      });
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'addAbilityMonitor failed: %{public}s', String(error));
      throw error;
    }
    let cmd: string = `aa start -d 0 -a TestAbility -b ${abilityDelegatorArguments.bundleName}`;
    cmd += ' ' + translateParamsToString(parameters);
    const debug: string = parameters['-D'];
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