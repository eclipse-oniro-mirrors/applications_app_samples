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
import { TestRunner, abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

const LOG_DOMAIN: number = 0x0000;
const LOG_TAG: string = '[Sample_MultiNavBar]';

function translateParamsToString(parameters: Record<string, string>): string {
  const keySet = new Set<string>([
    '-s class', '-s notClass', '-s suite', '-s it',
    '-s level', '-s testType', '-s size', '-s timeout',
    '-s dryRun'
  ]);
  let targetParams = '';
  for (const key in parameters) {
    if (keySet.has(key)) {
      targetParams = `${targetParams} ${key} ${parameters[key]}`;
    }
  }
  return targetParams.trim();
}

async function onAbilityCreateCallback(): Promise<void> {
  hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: BusinessError): Promise<void> {
  hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
  hilog.info(LOG_DOMAIN, LOG_TAG, 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun(): Promise<void> {
    hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner onRun run');
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const delegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    const testAbilityName: string = delegatorArguments.bundleName + '.TestAbility';
    const lMonitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    delegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
    let cmd: string = 'aa start -d 0 -a TestAbility' + ' -b ' + delegatorArguments.bundleName;
    cmd += ' ' + translateParamsToString(delegatorArguments.parameters);
    const debug: string = delegatorArguments.parameters['-D'];
    if (debug === 'true') {
      cmd += ' -D';
    }
    hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
    hilog.info(LOG_DOMAIN, LOG_TAG, 'cmd : %{public}s', cmd);
    delegator.executeShellCommand(cmd,
      (err: BusinessError, d: abilityDelegatorRegistry.ShellCmdResult) => {
        hilog.isLoggable(LOG_DOMAIN, LOG_TAG, hilog.LogLevel.INFO);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'executeShellCommand : data : %{public}s', d.stdResult ?? '');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'executeShellCommand : data : %{public}s', String(d.exitCode));
      });
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
