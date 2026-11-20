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
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';
import { Hypium } from '@ohos/hypium';

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';
const JSON_PATH: string = 'mock/mock-config.json';
const globalObject: object = new Function('return this')();

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun start');
    const abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const moduleName: string = abilityDelegatorArguments.parameters['-m'];
    const bundleName: string = abilityDelegatorArguments.bundleName;
    const uid: number = Math.floor(abilityDelegator.getAppContext().applicationInfo.uid / 200000);

    const savePath: string = '__savePath__';
    const readPath: string = '__readPath__';
    const testMode: string = '__testMode__';
    globalObject[savePath] = '/data/storage/el2/base/js_coverage.json';
    globalObject[readPath] = '/data/app/el2/' + uid + '/base/' + bundleName + '/js_coverage.json';
    globalObject[testMode] = 'ohostest';

    const context = abilityDelegator.getAppContext().getApplicationContext().createModuleContext(moduleName);
    await checkMock(abilityDelegator, context.resourceManager);

    const testModule = await import('../test/List.test');
    hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testModule.default);
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}

async function checkMock(abilityDelegator: abilityDelegatorRegistry.AbilityDelegator,
  resources: resourceManager.ResourceManager): Promise<void> {
  try {
    const rawFile: Uint8Array = resources.getRawFileContentSync(JSON_PATH);
    const mockStr: string = util.TextDecoder.create('utf-8', { ignoreBOM: true }).decodeWithStream(rawFile);
    const mockMap: Record<string, string> = getMockList(mockStr);
    abilityDelegator.setMockList(mockMap);
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'Mock initialization failed: ' + String(error));
  }
}

interface MockConfig {
  source: string;
}

function getMockList(jsonStr: string): Record<string, string> {
  const jsonObj: Record<string, MockConfig> = JSON.parse(jsonStr);
  const mockList: Record<string, string> = {};
  Object.keys(jsonObj).forEach((key: string) => {
    mockList[key] = jsonObj[key].source;
  });
  return mockList;
}
