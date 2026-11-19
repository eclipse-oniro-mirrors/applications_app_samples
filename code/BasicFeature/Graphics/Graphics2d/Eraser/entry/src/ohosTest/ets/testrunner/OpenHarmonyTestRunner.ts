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
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Eraser]';
const TEST_ABILITY_NAME: string = 'TestAbility';
/** 开发者模式未解锁屏幕时 aa start 必然失败，用例无从跑起，直接结束测试并带上错误码。 */
const UNLOCK_ERROR: number = -3;

function onAbilityCreateCallback(): void {
  hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility created');
}

function addAbilityMonitorCallback(err: BusinessError): void {
  hilog.info(DOMAIN, TAG, 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

/** 测试框架的 unittest 参数只负责拉起测试进程，用例注册与执行由 TestAbility 驱动。 */
export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun');
    const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
      abilityDelegatorRegistry.getArguments();
    const moduleName: string = abilityDelegatorArguments.parameters['-m'] as string;
    const monitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: TEST_ABILITY_NAME,
      moduleName: moduleName,
      onAbilityCreate: onAbilityCreateCallback
    };
    abilityDelegator.addAbilityMonitor(monitor, addAbilityMonitorCallback);
    const command: string =
      `aa start -b ${abilityDelegatorArguments.bundleName} -a ${TEST_ABILITY_NAME} -m ${moduleName}`;
    try {
      const result = await abilityDelegator.executeShellCommand(command);
      if (result.stdResult.includes('unlock screen failed in developer mode') ||
        result.stdResult.includes('10106102')) {
        hilog.error(DOMAIN, TAG, '%{public}s', `startAbility failed ${result.stdResult}`);
        abilityDelegator.finishTest('', UNLOCK_ERROR, () => {
        });
        return;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `TestAbility started, ${result.stdResult}`);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'startAbility error: %{public}s', JSON.stringify(error) ?? '');
    }
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}
