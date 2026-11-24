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
import { common, application } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';
import { Hypium } from '@ohos/hypium';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
const jsonPath: string = 'mock/mock-config.json';
const tag: string = 'testTag';
const global: object = new Function('return this')();

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(0x0000, tag, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(0x0000, tag, '%{public}s', 'OpenHarmonyTestRunner onRun');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const moduleName: string = abilityDelegatorArguments.parameters['-m'];
    const savePath: string = '__savePath__';
    const readPath: string = '__readPath__';
    const testMode: string = '__testMode__';
    const uid: number = Math.floor(abilityDelegator.getAppContext().applicationInfo.uid / 200000);
    const bundleName: string = abilityDelegatorArguments.bundleName;
    global[savePath] = '/data/storage/el2/base/js_coverage.json';
    global[readPath] = '/data/app/el2/' + uid + '/base/' + bundleName + '/js_coverage.json';
    global[testMode] = 'ohostest';

    try {
      const context: common.Context = await application.createModuleContext(
        abilityDelegator.getAppContext().getApplicationContext(), moduleName);
      await doOnRun(context);
    } catch (error) {
      console.error('test runner initialization failed: ' + JSON.stringify(error));
    }
  }
}

async function doOnRun(context: common.Context): Promise<void> {
  await checkMock(abilityDelegator, context.resourceManager);
  const testModule = await import('../test/List.test');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testModule.default);
}

async function checkMock(delegator: abilityDelegatorRegistry.AbilityDelegator,
  resources: resourceManager.ResourceManager): Promise<void> {
  try {
    const rawFile: Uint8Array = resources.getRawFileContentSync(jsonPath);
    hilog.info(0x0000, tag, '%{public}s', 'MockList file exists');
    const mockStr: string = util.TextDecoder.create('utf-8', { ignoreBOM: true }).decodeToString(rawFile);
    const mockMap: Record<string, string> = getMockList(mockStr);
    try {
      delegator.setMockList(mockMap);
    } catch (error) {
      hilog.error(0x0000, tag, '%{public}s', 'abilityDelegator.setMockList failed: ' + JSON.stringify(error));
    }
  } catch (error) {
    hilog.error(0x0000, tag, '%{public}s', 'getRawFileContentSync failed: ' + JSON.stringify(error));
  }
}

function getMockList(jsonStr: string): Record<string, string> {
  const jsonObj: Record<string, Object> = JSON.parse(jsonStr);
  const map: Map<string, object> = new Map<string, object>(Object.entries(jsonObj));
  const mockList: Record<string, string> = {};
  map.forEach((value: object, key: string) => {
    mockList[key] = value['source'].toString();
  });
  hilog.info(0x0000, tag, '%{public}s', 'mock-json value: ' + JSON.stringify(mockList));
  return mockList;
}
