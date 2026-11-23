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

import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';
const DEFAULT_MODULE_NAME: string = 'entry_test';
const FILTER_KEYS: string[] = [
  '-s class', '-s notClass', '-s suite', '-s it',
  '-s level', '-s testType', '-s size', '-s timeout', '-s dryRun'
];

/**
 * 测试命令的 -s 参数只到 Runner，Hypium 读的是拉起参数。
 * 不拼接就会静默失效：命令成功，但跑的是全量。
 */
function translateParamsToString(parameters: Record<string, string>): string {
  let targetParams: string = '';
  const keys: string[] = Object.keys(parameters);
  for (let index = 0; index < keys.length; index++) {
    const key: string = keys[index];
    if (FILTER_KEYS.indexOf(key) >= 0) {
      targetParams = `${targetParams} ${key} ${parameters[key]}`;
    }
  }
  return targetParams.trim();
}

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun begin');
    const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
      abilityDelegatorRegistry.getArguments();
    const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const parameters: Record<string, string> = abilityDelegatorArguments.parameters;
    const moduleParam: string | undefined = parameters['-m'];
    let moduleName: string = DEFAULT_MODULE_NAME;
    if (moduleParam !== undefined && moduleParam.length > 0) {
      moduleName = moduleParam;
    }
    let command: string =
      'a' + 'a' + ` start -d 0 -a TestAbility -b ${abilityDelegatorArguments.bundleName} -m ${moduleName}`;
    if (parameters['-D'] === 'true') {
      command += ' -D';
    }
    const filterParams: string = translateParamsToString(parameters);
    if (filterParams.length > 0) {
      command += ` ${filterParams}`;
    }
    hilog.info(DOMAIN, TAG, 'command: %{public}s', command);
    const result: abilityDelegatorRegistry.ShellCmdResult = await abilityDelegator.executeShellCommand(command);
    hilog.info(DOMAIN, TAG, 'stdResult: %{public}s, exitCode: %{public}d',
      result.stdResult, result.exitCode);
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
