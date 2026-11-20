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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Core from '@ohos/hypium/src/main/core';
import ExpectExtend from '@ohos/hypium/src/main/module/assert/ExpectExtend';
import OhReport from '@ohos/hypium/src/main/module/report/OhReport';
import SysTestKit from '@ohos/hypium/src/main/module/kit/SysTestKit';

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => resolve(), 1);
  });
}

export async function runTestSuites(testSuites: Array<() => void>): Promise<void> {
  const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  try {
    const core = Core.getInstance();
    const expectExtend = new ExpectExtend({ id: 'extend' });
    const report = new OhReport({ delegator, abilityDelegatorArguments: args });
    SysTestKit.delegator = delegator;
    core.addService('expect', expectExtend);
    core.addService('report', report);
    core.init();
    core.subscribeEvent('spec', report);
    core.subscribeEvent('suite', report);
    core.subscribeEvent('task', report);
    core.subscribeEvent('spec', {
      specStart: yieldToEventLoop,
      specDone: () => { }
    });
    const config = core.getDefaultService('config');
    config.setConfig(config.translateParams(args.parameters));
    for (const register of testSuites) {
      register();
      await yieldToEventLoop();
    }
    hilog.info(DOMAIN, TAG, '%{public}s', 'All test suites registered');
    core.execute(delegator);
  } catch (err) {
    const message: string = 'Test runner failed: ' + String(err);
    hilog.error(DOMAIN, TAG, '%{public}s', message);
    delegator.finishTest(message, -1, () => { });
  }
}

async function onAbilityCreateCallback(): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: BusinessError): Promise<void> {
  hilog.info(DOMAIN, TAG, 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun run');
    const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const monitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: `${args.bundleName}.TestAbility`,
      onAbilityCreate: onAbilityCreateCallback
    };
    delegator.addAbilityMonitor(monitor, addAbilityMonitorCallback);
    let cmd: string = `aa start -d 0 -a TestAbility -b ${args.bundleName}`;
    const debug: string | undefined = args.parameters['-D'];
    if (debug === 'true') {
      cmd += ' -D';
    }
    hilog.info(DOMAIN, TAG, 'cmd : %{public}s', cmd);
    try {
      const result: abilityDelegatorRegistry.ShellCmdResult = await delegator.executeShellCommand(cmd);
      if (result.exitCode !== 0) {
        throw new Error('TestAbility start failed: ' + result.stdResult);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
    } catch (err) {
      const message: string = 'Test runner failed: ' + String(err);
      hilog.error(DOMAIN, TAG, '%{public}s', message);
      delegator.finishTest(message, -1, () => { });
    }
  }
}
