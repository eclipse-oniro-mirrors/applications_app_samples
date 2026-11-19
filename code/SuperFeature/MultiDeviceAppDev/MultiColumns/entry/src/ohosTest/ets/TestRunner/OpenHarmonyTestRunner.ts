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

import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TestRunner, abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns]';

async function onAbilityCreateCallback() {
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: BusinessError) {
  hilog.info(LOG_DOMAIN, LOG_TAG, 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err));
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare() {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun() {
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner onRun start');
    const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
      AbilityDelegatorRegistry.getArguments();
    const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator =
      AbilityDelegatorRegistry.getAbilityDelegator();
    const testAbilityName: string = `${abilityDelegatorArguments.bundleName}.TestAbility`;
    const monitor: AbilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(monitor, addAbilityMonitorCallback);
    let cmd: string = `aa start -d 0 -a TestAbility -b ${abilityDelegatorArguments.bundleName}`;
    const debug: string = abilityDelegatorArguments.parameters['-D'];
    if (debug === 'true') {
      cmd += ' -D';
    }
    hilog.info(LOG_DOMAIN, LOG_TAG, 'cmd : %{public}s', cmd);
    abilityDelegator.executeShellCommand(cmd,
      (err: BusinessError, result: AbilityDelegatorRegistry.ShellCmdResult) => {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'executeShellCommand : err : %{public}s', JSON.stringify(err));
        hilog.info(LOG_DOMAIN, LOG_TAG, 'executeShellCommand : stdResult : %{public}s', result.stdResult);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'executeShellCommand : exitCode : %{public}d', result.exitCode);
      });
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
