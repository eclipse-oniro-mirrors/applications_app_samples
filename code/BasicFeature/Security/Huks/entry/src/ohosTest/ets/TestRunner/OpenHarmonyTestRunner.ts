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
import { BusinessError } from '@kit.BasicServicesKit';
import Logger from '../../../main/ets/model/Logger';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;

// 把运行命令传入的 -s 筛选参数（class/suite/it/level/size/testType/notClass/timeout/dryRun）
// 透传给内部启动命令，保证增量复跑与按 describe 分批真正生效，而不是静默全量。
function translateParamsToString(parameters: Record<string, string>): string {
  const keys: string[] = Object.keys(parameters);
  const skipKeys: string[] = ['-D', '-p'];
  let result: string = '';
  for (let i: number = 0; i < keys.length; i++) {
    const key: string = keys[i];
    let skipped: boolean = false;
    for (let j: number = 0; j < skipKeys.length; j++) {
      if (key === skipKeys[j]) {
        skipped = true;
        break;
      }
    }
    if (skipped) {
      continue;
    }
    result += ' -s ' + key + ' ' + parameters[key];
  }
  return result;
}

async function onAbilityCreateCallback(): Promise<void> {
  Logger.info('[Sample_Huks]', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: BusinessError): Promise<void> {
  Logger.info('[Sample_Huks]', `addAbilityMonitorCallback : ${JSON.stringify(err) ?? ''}`);
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    Logger.info('[Sample_Huks]', 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun(): Promise<void> {
    Logger.info('[Sample_Huks]', 'OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let testAbilityName: string = abilityDelegatorArguments.bundleName + '.TestAbility';
    let lMonitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
    let cmd: string = 'a' + 'a' + ' start -d 0 -a TestAbility' + ' -b ' + abilityDelegatorArguments.bundleName;
    let debug: string = abilityDelegatorArguments.parameters['-D'];
    if (debug == 'true') {
      cmd += ' -D';
    }
    let params: Record<string, string> = abilityDelegatorArguments.parameters;
    if (params !== undefined) {
      cmd += translateParamsToString(params);
    }
    Logger.info('[Sample_Huks]', `cmd : ${cmd}`);
    abilityDelegator.executeShellCommand(cmd,
      (err: BusinessError, d: abilityDelegatorRegistry.ShellCmdResult) => {
        Logger.info('[Sample_Huks]', `executeShellCommand : err : ${JSON.stringify(err) ?? ''}`);
        Logger.info('[Sample_Huks]', `executeShellCommand : data : ${d.stdResult ?? ''}`);
        Logger.info('[Sample_Huks]', `executeShellCommand : data : ${d.exitCode ?? ''}`);
      });
    Logger.info('[Sample_Huks]', 'OpenHarmonyTestRunner onRun end');
  }
}
