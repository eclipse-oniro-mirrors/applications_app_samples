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
import { application, common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';
import { Hypium } from '@ohos/hypium';

interface CoverageGlobal {
  savePath: string;
  readPath: string;
  testMode: string;
}

interface MockConfig {
  source: string;
}

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
const JSON_PATH: string = 'mock/mock-config.json';
const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';
const global: CoverageGlobal = new Function('return this')();

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner OnPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const moduleName: string = abilityDelegatorArguments.parameters['-m'];
    const uid: number = Math.floor(abilityDelegator.getAppContext().applicationInfo.uid / 200000);
    const bundleName: string = abilityDelegatorArguments.bundleName;
    global.savePath = '/data/storage/el2/base/js_coverage.json';
    global.readPath = '/data/app/el2/' + uid + '/base/' + bundleName + '/js_coverage.json';
    global.testMode = 'ohostest';

    try {
      const context: common.Context = await application.createModuleContext(
        abilityDelegator.getAppContext().getApplicationContext(), moduleName);
      await checkMock(abilityDelegator, context.resourceManager);
      const testList = await import('../test/List.test');
      hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase!!!');
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testList.default);
      hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
    } catch (error) {
      console.error('test runner initialization failed: ' + String(error));
    }
  }
}

async function checkMock(delegator: abilityDelegatorRegistry.AbilityDelegator,
  resources: resourceManager.ResourceManager): Promise<void> {
  try {
    const rawFile: Uint8Array = resources.getRawFileContentSync(JSON_PATH);
    hilog.info(DOMAIN, TAG, '%{public}s', 'MockList file exists');
    const mockStr: string = util.TextDecoder.create('utf-8', { ignoreBOM: true }).decodeToString(rawFile);
    const mockMap: Record<string, string> = getMockList(mockStr);
    delegator.setMockList(mockMap);
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'Mock initialization failed: ' + String(error));
  }
}

function getMockList(jsonStr: string): Record<string, string> {
  const jsonObject: Record<string, MockConfig> = JSON.parse(jsonStr);
  const mockList: Record<string, string> = {};
  Object.keys(jsonObject).forEach((key: string) => {
    mockList[key] = jsonObject[key].source;
  });
  hilog.info(DOMAIN, TAG, '%{public}s', 'mock-json value:' + JSON.stringify(mockList));
  return mockList;
}
