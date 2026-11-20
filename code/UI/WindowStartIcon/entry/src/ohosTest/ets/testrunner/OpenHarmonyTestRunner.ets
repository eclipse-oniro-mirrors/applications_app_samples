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
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';
import { Hypium } from '@ohos/hypium';

interface MockItem {
  source: string;
}

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
const coverageGlobal: Record<string, string> = new Function('return this')();
const JSON_PATH: string = 'mock/mock-config.json';
const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';

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
    const savePath: string = '__savePath__';
    const readPath: string = '__readPath__';
    const testMode: string = '__testMode__';
    coverageGlobal[savePath] = '/data/storage/el2/base/js_coverage.json';
    coverageGlobal[readPath] = '/data/app/el2/' + uid + '/base/' + bundleName + '/js_coverage.json';
    coverageGlobal[testMode] = 'ohostest';

    const context: common.Context = abilityDelegator.getAppContext().getApplicationContext()
      .createModuleContext(moduleName);
    await checkMock(abilityDelegator, context.resourceManager);
    const testModule = await import('../test/List.test');
    hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testModule.default);
  }
}

async function checkMock(delegator: abilityDelegatorRegistry.AbilityDelegator,
  resources: resourceManager.ResourceManager): Promise<void> {
  try {
    const rawFile: Uint8Array = resources.getRawFileContentSync(JSON_PATH);
    const mockStr: string = util.TextDecoder.create('utf-8', { ignoreBOM: true }).decodeToString(rawFile);
    delegator.setMockList(getMockList(mockStr));
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'Mock initialization failed: %{public}s', JSON.stringify(error));
  }
}

function getMockList(jsonStr: string): Record<string, string> {
  const jsonObj: Record<string, MockItem> = JSON.parse(jsonStr);
  const mockList: Record<string, string> = {};
  Object.keys(jsonObj).forEach((key: string) => {
    mockList[key] = jsonObj[key].source;
  });
  return mockList;
}
