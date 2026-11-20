/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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
const TAG: string = '[Sample_MobileNetwork_Test]';

// 把测试命令透传的 -s 参数拼进拉起 TestAbility 的启动命令，保证按 describe/用例 分批执行生效。
function translateParamsToString(parameters: Record<string, string>): string {
  const keySet: Set<string> = new Set([
    '-s class', '-s notClass', '-s suite', '-s it',
    '-s level', '-s testType', '-s size', '-s timeout', '-s dryRun'
  ]);
  let targetParams: string = '';
  const keys: string[] = Object.keys(parameters);
  keys.forEach((key: string) => {
    if (keySet.has(key)) {
      targetParams = `${targetParams} ${key} ${parameters[key]}`;
    }
  });
  return targetParams.trim();
}

async function onAbilityCreateCallback(): Promise<void> {
  logger.info(TAG, 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: Error): Promise<void> {
  logger.info(TAG, `addAbilityMonitorCallback : ${JSON.stringify(err) ?? ''} `);
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    logger.info(TAG, 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun(): Promise<void> {
    logger.info(TAG, 'OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const testAbilityName: string = abilityDelegatorArguments.bundleName + '.TestAbility';
    const lMonitor: AbilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
    let cmd: string = 'aa start -d 0 -a TestAbility' + ' -b ' + abilityDelegatorArguments.bundleName;
    const debug: string = abilityDelegatorArguments.parameters['-D'];
    if (debug === 'true') {
      cmd += ' -D';
    }
    cmd += ' ' + translateParamsToString(abilityDelegatorArguments.parameters);
    logger.info(TAG, `cmd : ${cmd}`);
    abilityDelegator.executeShellCommand(cmd,
      (err: Error, d: {
        stdResult: string,
        exitCode: number
      }) => {
        logger.info(TAG, `executeShellCommand : err : ${JSON.stringify(err) ?? ''},` +
          `data: ${d.stdResult ?? ''}, ${d.exitCode ?? ''}`);
      });
    logger.info(TAG, 'OpenHarmonyTestRunner onRun end');
  }
}
