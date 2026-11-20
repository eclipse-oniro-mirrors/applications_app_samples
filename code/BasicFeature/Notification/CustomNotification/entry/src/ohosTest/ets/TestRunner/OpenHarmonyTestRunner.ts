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
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';

function translateParamsToString(parameters: Record<string, string>): string {
  const keySet: Set<string> = new Set([
    '-s class', '-s notClass', '-s suite', '-s it',
    '-s level', '-s testType', '-s size', '-s timeout',
    '-s dryRun'
  ]);
  let targetParams: string = '';
  const keys: string[] = Object.keys(parameters);
  for (let i: number = 0; i < keys.length; i++) {
    const key: string = keys[i];
    if (keySet.has(key)) {
      targetParams = `${targetParams} ${key} ${parameters[key]}`;
    }
  }
  return targetParams.trim();
}

async function onAbilityCreateCallback(): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: BusinessError): Promise<void> {
  hilog.info(DOMAIN, TAG, 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun run');
    const delegatorArgs: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const testAbilityName: string = delegatorArgs.bundleName + '.TestAbility';
    const lMonitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback
    };
    delegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
    let cmd: string = 'aa start -d 0 -a TestAbility' + ' -b ' + delegatorArgs.bundleName;
    cmd += ' ' + translateParamsToString(delegatorArgs.parameters);
    const debug: string | undefined = delegatorArgs.parameters['-D'];
    if (debug === 'true') {
      cmd += ' -D';
    }
    hilog.info(DOMAIN, TAG, 'cmd : %{public}s', cmd);
    delegator.executeShellCommand(cmd,
      (err: BusinessError, d: abilityDelegatorRegistry.ShellCmdResult) => {
        hilog.info(DOMAIN, TAG, 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
        hilog.info(DOMAIN, TAG, 'executeShellCommand : stdResult : %{public}s', d.stdResult ?? '');
        hilog.info(DOMAIN, TAG, 'executeShellCommand : exitCode : %{public}d', d.exitCode);
      });
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
