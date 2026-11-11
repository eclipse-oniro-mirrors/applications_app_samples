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
import { UIAbility, Want, common, application } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
let tag: string = 'testTag';
const UNLOCK_ERROR = -3;
const global: object = new Function("return this")();

async function onAbilityCreateCallback(data: UIAbility) {
  hilog.info(0x0000, tag, 'onAbilityCreateCallback, data: ${}', JSON.stringify(data));
}

async function addAbilityMonitorCallback(err: BusinessError) {
  hilog.info(0x0000, tag, 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare() {
    hilog.info(0x0000, tag, '%{public}s', 'OpenHarmonyTestRunner OnPrepare');
  }

  async onRun() {
    hilog.info(0x0000, tag, '%{public}s', 'OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments()
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    let moduleName = abilityDelegatorArguments.parameters['-m'];

    const savePath: string = '__savePath__';
    const readPath: string = '__readPath__';
    const testMode: string = '__testMode__';
    let uid: number = Math.floor(abilityDelegator.getAppContext().applicationInfo.uid / 200000);
    const bundleName: string = abilityDelegatorArguments.bundleName;
    global[savePath] = '/data/storage/el2/base/js_coverage.json';
    global[readPath] = '/data/app/el2/' + uid + '/base/' + bundleName + '/js_coverage.json';
    global[testMode] = 'ohostest';

    try {
      application.createModuleContext(abilityDelegator.getAppContext().getApplicationContext(), moduleName)
        .then((data: Context) => {
          doOnRun(data, moduleName);
        }).catch((error: BusinessError) => {
        console.error(`test runner createModuleContext failed, error.code: ${(error as
          BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        return;
      })
    } catch (error) {
      console.error(`test runner createModuleContext failed, error.code: ${(error as
        BusinessError).code}, error.message: ${(error as BusinessError).message}`);
      return;
    }
  }
}

async function doOnRun(context: common.Context, moduleName: string) {
  const bundleName = abilityDelegatorArguments.bundleName;
  const testAbilityName: string = 'TestAbility';
  let lMonitor: abilityDelegatorRegistry.AbilityMonitor = {
    abilityName: testAbilityName,
    onAbilityCreate: onAbilityCreateCallback,
    moduleName: moduleName
  };
  abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback)
  await startAbility(bundleName, testAbilityName, moduleName);
  hilog.info(0x0000, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
}

async function startAbility(bundleName: string, abilityName: string, moduleName: string) {
  const want: Want = {
    bundleName: bundleName,
    abilityName: abilityName,
    moduleName: moduleName
  };
  try {
    await abilityDelegator.startAbility(want);
    hilog.info(0x0000, tag, '%{public}s', 'TestAbility started');
  } catch (error) {
    const code: number = (error as BusinessError).code;
    const message: string = (error as BusinessError).message;
    hilog.error(0x0000, tag, 'startAbility failed, code: %{public}d, message: %{public}s', code, message);
    if (code === UNLOCK_ERROR) {
      abilityDelegator.finishTest('device is locked', UNLOCK_ERROR, () => {
      });
    }
  }
}