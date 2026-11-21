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

import Logger from '../../../main/ets/util/Logger';
import { TestRunner } from '@kit.TestKit';
import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator | undefined = undefined;
let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs | undefined = undefined;

async function onAbilityCreateCallback(): Promise<void> {
  Logger.info('[Sample_CryptoFramework]', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: Error): Promise<void> {
  Logger.info('[Sample_CryptoFramework]', `addAbilityMonitorCallback : ${JSON.stringify(err) ?? ''}`);
}

function translateParamsToString(parameters: Record<string, string>): string {
  const keySet: Set<string> = new Set([
    '-s class', '-s notClass', '-s suite', '-s it',
    '-s level', '-s testType', '-s size', '-s timeout', '-s dryRun'
  ]);
  let targetParams: string = '';
  const keys: string[] = Object.keys(parameters);
  for (let i = 0; i < keys.length; i++) {
    const key: string = keys[i];
    if (keySet.has(key)) {
      targetParams = `${targetParams} ${key} ${parameters[key]}`;
    }
  }
  return targetParams.trim();
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    Logger.info('[Sample_CryptoFramework]', 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun(): Promise<void> {
    Logger.info('[Sample_CryptoFramework]', 'OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let testAbilityName: string = abilityDelegatorArguments.bundleName + '.TestAbility';
    let lMonitor: AbilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
    let cmd: string = 'a' + 'a' + ' start -d 0 -a TestAbility' + ' -b ' + abilityDelegatorArguments.bundleName;
    cmd += ' ' + translateParamsToString(abilityDelegatorArguments.parameters);
    let debug: string | undefined = abilityDelegatorArguments.parameters['-D'];
    if (debug == 'true') {
      cmd += ' -D';
    }
    Logger.info('[Sample_CryptoFramework]', `cmd : ${cmd}`);
    abilityDelegator.executeShellCommand(cmd, (err: Error, data: AbilityDelegatorRegistry.ShellCmdResult) => {
      Logger.info('[Sample_CryptoFramework]', `executeShellCommand : err : ${JSON.stringify(err) ?? ''}`);
      Logger.info('[Sample_CryptoFramework]', `executeShellCommand : data : ${data.stdResult ?? ''}`);
      Logger.info('[Sample_CryptoFramework]', `executeShellCommand : data : ${data.exitCode ?? ''}`);
    });
    Logger.info('[Sample_CryptoFramework]', 'OpenHarmonyTestRunner onRun end');
  }
}
