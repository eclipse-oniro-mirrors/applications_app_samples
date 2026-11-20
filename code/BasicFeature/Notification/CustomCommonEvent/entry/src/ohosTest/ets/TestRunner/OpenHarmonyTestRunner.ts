/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = '[Sample_CustomCommonEvent]';

async function onAbilityCreateCallback(): Promise<void> {
  logger.info(TAG, 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: BusinessError): Promise<void> {
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
    const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator =
      AbilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
      AbilityDelegatorRegistry.getArguments();
    let testAbilityName: string = abilityDelegatorArguments.bundleName + '.TestAbility';
    let lMonitor: AbilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
    let cmd: string = 'aa start -d 0 -a TestAbility' + ' -b ' + abilityDelegatorArguments.bundleName;
    let debug: string = abilityDelegatorArguments.parameters['-D'];
    if (debug === 'true') {
      cmd += ' -D';
    }
    // 透传用例筛选参数，否则按 class 过滤执行时会静默失效
    let forwardKeys: Array<string> = ['class', 'suite', 'it', 'level', 'size', 'timeout'];
    for (let index = 0; index < forwardKeys.length; index++) {
      let key: string = forwardKeys[index];
      let value: string = abilityDelegatorArguments.parameters[key];
      if (value !== undefined && value !== null && value !== '') {
        cmd += ' -s ' + key + ' ' + value;
      }
    }
    logger.info(TAG, `cmd : ${cmd}`);
    abilityDelegator.executeShellCommand(cmd,
      (err: Error, d: {
        stdResult: string,
        exitCode: number
      }) => {
        logger.info(TAG, `executeShellCommand : err : ${JSON.stringify(err) ?? ''},data: ${d.stdResult ?? ''}, ${d.exitCode ?? ''}`);
      });
    logger.info(TAG, 'OpenHarmonyTestRunner onRun end');
  }
}