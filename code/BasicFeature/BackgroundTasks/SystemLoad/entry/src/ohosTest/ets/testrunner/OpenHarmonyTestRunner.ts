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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import type TestRunner from '@ohos.application.testRunner';
import { logger } from '../util/Logger';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;

function onAbilityCreateCallback(): void {
  logger.info('TestAbility created');
}

function addAbilityMonitorCallback(err: Error): void {
  logger.info(`Ability monitor added: ${JSON.stringify(err)}`);
}

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    logger.info('OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const testAbilityName = `${abilityDelegatorArguments.bundleName}.TestAbility`;
    const abilityMonitor: AbilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback
    };
    abilityDelegator.addAbilityMonitor(abilityMonitor, addAbilityMonitorCallback);
    let command = `aa start -d 0 -a TestAbility -b ${abilityDelegatorArguments.bundleName}`;
    const debug = abilityDelegatorArguments.parameters['-D'];
    if (debug === 'true') {
      command = `${command} -D`;
    }
    logger.info(`Execute command: ${command}`);
    abilityDelegator.executeShellCommand(command,
      (err: Error, data: { stdResult: string, exitCode: number }) => {
        logger.info(`Command result: ${JSON.stringify(err)}, ${data.stdResult}, ${data.exitCode}`);
      });
  }
}
