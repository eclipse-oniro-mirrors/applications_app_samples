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

import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = 'MultiMusicTest';

const KEY_SET: Set<string> = new Set([
  '-s class', '-s notClass', '-s suite', '-s it',
  '-s level', '-s testType', '-s size', '-s timeout', '-s dryRun'
]);

/**
 * Parameters passed through aa test are not forwarded to Hypium automatically,
 * so they have to be appended to the aa start command line.
 */
function translateParamsToString(parameters: Record<string, string>): string {
  let targetParams: string = '';
  for (const key in parameters) {
    if (KEY_SET.has(key)) {
      targetParams = `${targetParams} ${key} ${parameters[key]}`;
    }
  }
  return targetParams.trim();
}

async function onAbilityCreateCallback(): Promise<void> {
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: BusinessError): Promise<void> {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'addAbilityMonitorCallback: %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner onRun start');
    const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
      abilityDelegatorRegistry.getArguments();
    const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const testAbilityName: string = abilityDelegatorArguments.bundleName + '.TestAbility';
    const lMonitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
    let cmd: string = 'aa start -d 0 -a TestAbility' + ' -b ' + abilityDelegatorArguments.bundleName;
    const extraParams: string = translateParamsToString(abilityDelegatorArguments.parameters);
    if (extraParams.length > 0) {
      cmd += ' ' + extraParams;
    }
    const debug: string = abilityDelegatorArguments.parameters['-D'];
    if (debug === 'true') {
      cmd += ' -D';
    }
    hilog.info(LOG_DOMAIN, LOG_TAG, 'cmd: %{public}s', cmd);
    abilityDelegator.executeShellCommand(cmd,
      (err: BusinessError, data: abilityDelegatorRegistry.ShellCmdResult) => {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'executeShellCommand err: %{public}s', JSON.stringify(err) ?? '');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'executeShellCommand result: %{public}s', data.stdResult ?? '');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'executeShellCommand exit code: %{public}d', data.exitCode ?? 0);
      });
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
