/*
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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
import Logger from '../util/Logger';
import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

function onAbilityCreateCallback(ability: UIAbility): void {
  Logger.info('testTag', 'onAbilityCreateCallback: %{public}s', ability.context.abilityInfo.name);
}

function addAbilityMonitorCallback(error: BusinessError, result: void): void {
  Logger.info('testTag', 'addAbilityMonitorCallback: %{public}s', JSON.stringify(error) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    Logger.info('testTag', '%{public}s', 'OpenHarmonyTestRunner OnPrepare');
  }

  async onRun(): Promise<void> {
    Logger.info('testTag', '%{public}s', 'OpenHarmonyTestRunner onRun run');
    const argumentsInfo: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const monitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: argumentsInfo.bundleName + '.TestAbility',
      onAbilityCreate: onAbilityCreateCallback
    };
    delegator.addAbilityMonitor(monitor, addAbilityMonitorCallback);
    let command: string = 'aa start -d 0 -a TestAbility -b ' + argumentsInfo.bundleName;
    const debug: string = argumentsInfo.parameters['-D'];
    if (debug === 'true') {
      command += ' -D';
    }
    Logger.info('testTag', 'cmd: %{public}s', command);
    delegator.executeShellCommand(command,
      (error: BusinessError, result: abilityDelegatorRegistry.ShellCmdResult): void => {
        Logger.info('testTag', 'executeShellCommand error: %{public}s', JSON.stringify(error) ?? '');
        Logger.info('testTag', 'executeShellCommand output: %{public}s', result.stdResult ?? '');
        Logger.info('testTag', 'executeShellCommand exit: %{public}s', String(result.exitCode));
      });
    Logger.info('testTag', '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
