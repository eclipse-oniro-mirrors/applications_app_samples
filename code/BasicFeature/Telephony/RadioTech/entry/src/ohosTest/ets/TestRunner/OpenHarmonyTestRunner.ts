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

import { TestRunner, abilityDelegatorRegistry } from '@kit.TestKit';
import Logger from '../../../main/ets/model/Logger';

const TAG: string = 'OpenHarmonyTestRunner';
const PASS_THROUGH_KEYS: string[] = [
  '-s class', '-s notClass', '-s suite', '-s it',
  '-s level', '-s testType', '-s size', '-s timeout',
  '-s dryRun'
];

function translateParamsToString(parameters: Record<string, string>): string {
  let targetParams: string = '';
  for (let index: number = 0; index < PASS_THROUGH_KEYS.length; index++) {
    const key: string = PASS_THROUGH_KEYS[index];
    const value: string = parameters[key];
    if (value !== undefined && value !== null && value !== '') {
      targetParams = `${targetParams} ${key} ${value}`;
    }
  }
  return targetParams.trim();
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    Logger.info(TAG, 'OpenHarmonyTestRunner OnPrepare');
  }

  async onRun(): Promise<void> {
    Logger.info(TAG, 'OpenHarmonyTestRunner onRun start');
    const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let cmd: string = `aa start -d 0 -a TestAbility -b ${args.bundleName}`;
    const params: string = translateParamsToString(args.parameters);
    if (params.length > 0) {
      cmd += ' ' + params;
    }
    if (args.parameters['-D'] === 'true') {
      cmd += ' -D';
    }
    Logger.info(TAG, cmd);
    try {
      const result: object = await delegator.executeShellCommand(cmd);
      Logger.info(TAG, JSON.stringify(result));
    } catch (error) {
      Logger.error(TAG, JSON.stringify(error));
    }
    Logger.info(TAG, 'OpenHarmonyTestRunner onRun end');
  }
}
