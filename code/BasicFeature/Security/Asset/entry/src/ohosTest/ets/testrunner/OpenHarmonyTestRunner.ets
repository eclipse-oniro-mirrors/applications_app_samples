/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { common, UIAbility, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
let jsonPath: string = 'mock/mock-config.json';
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

async function onAbilityCreateCallback(data: UIAbility): Promise<void> {
  hilog.info(DOMAIN, TAG, 'onAbilityCreateCallback, data: ${}', JSON.stringify(data));
}

async function addAbilityMonitorCallback(err: BusinessError): Promise<void> {
  hilog.info(DOMAIN, TAG, 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner OnPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let moduleName: string = abilityDelegatorArguments.parameters['-m'];
    let context: common.Context =
      abilityDelegator.getAppContext().getApplicationContext().createModuleContext(moduleName);
    let mResourceManager: resourceManager.ResourceManager = context.resourceManager;
    await checkMock(abilityDelegator, mResourceManager);
    const bundleName: string = abilityDelegatorArguments.bundleName;
    const testAbilityName: string = 'TestAbility';
    let lMonitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
      moduleName: moduleName
    };
    abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
    // 透传 -s class/-s it 等过滤参数给 TestAbility，否则 Hypium 读不到（分批运行前提）
    let wantParameters: Record<string, Object> = {};
    Object.keys(abilityDelegatorArguments.parameters).forEach((key: string) => {
      wantParameters[key] = abilityDelegatorArguments.parameters[key];
    });
    const want: Want = {
      bundleName: bundleName,
      abilityName: testAbilityName,
      moduleName: moduleName,
      parameters: wantParameters
    };
    abilityDelegator.startAbility(want, (err: BusinessError, data: void) => {
      hilog.info(DOMAIN, TAG, 'startAbility : err : %{public}s', JSON.stringify(err) ?? '');
      hilog.info(DOMAIN, TAG, 'startAbility : data : %{public}s', JSON.stringify(data) ?? '');
    });
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}

async function checkMock(abilityDelegator: abilityDelegatorRegistry.AbilityDelegator,
  resourceManager: resourceManager.ResourceManager): Promise<void> {
  let rawFile: Uint8Array;
  try {
    rawFile = resourceManager.getRawFileContentSync(jsonPath);
    hilog.info(DOMAIN, TAG, 'MockList file exists');
    let mockStr: string = util.TextDecoder.create("utf-8", { ignoreBOM: true }).decodeWithStream(rawFile);
    let mockMap: Record<string, string> = getMockList(mockStr);
    try {
      abilityDelegator.setMockList(mockMap)
    } catch (error) {
      let code: number = (error as BusinessError).code;
      let message: string = (error as BusinessError).message;
      hilog.error(DOMAIN, TAG, `abilityDelegator.setMockList failed, error code: ${code}, message: ${message}.`);
    }
  } catch (error) {
    let code: number = (error as BusinessError).code;
    let message: string = (error as BusinessError).message;
    hilog.error(DOMAIN, TAG,
      `ResourceManager:callback getRawFileContent failed, error code: ${code}, message: ${message}.`);
  }
}

function getMockList(jsonStr: string): Record<string, string> {
  let jsonObj: Record<string, Object> = JSON.parse(jsonStr);
  let map: Map<string, object> = new Map<string, object>(Object.entries(jsonObj));
  let mockList: Record<string, string> = {};
  map.forEach((value: object, key: string) => {
    let realValue: string = (value as Record<string, string>).source.toString();
    mockList[key] = realValue;
  });
  hilog.info(DOMAIN, TAG, '%{public}s', 'mock-json value:' + JSON.stringify(mockList) ?? '');
  return mockList;
}