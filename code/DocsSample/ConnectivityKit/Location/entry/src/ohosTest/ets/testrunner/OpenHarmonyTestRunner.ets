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
const global: object = new Function('return this')();

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner OnPrepare');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun run');
    const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const savePath: string = '__savePath__';
    const readPath: string = '__readPath__';
    const testMode: string = '__testMode__';
    const uid: number = Math.floor(delegator.getAppContext().applicationInfo.uid / 200000);
    global[savePath] = '/data/storage/el2/base/js_coverage.json';
    global[readPath] = '/data/app/el2/' + uid + '/base/' + args.bundleName + '/js_coverage.json';
    global[testMode] = 'ohostest';

    const moduleName: string = args.parameters['-m'];
    const context = delegator.getAppContext().getApplicationContext().createModuleContext(moduleName);
    await checkMock(delegator, context.resourceManager);

    const testModule = await import('../test/List.test');
    hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(delegator, args, testModule.default);
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}

async function checkMock(delegator: abilityDelegatorRegistry.AbilityDelegator,
  resources: resourceManager.ResourceManager): Promise<void> {
  try {
    const rawFile: Uint8Array = resources.getRawFileContentSync(JSON_PATH);
    hilog.info(DOMAIN, TAG, 'MockList file exists');
    const mockStr: string = util.TextDecoder.create('utf-8', { ignoreBOM: true }).decodeToString(rawFile);
    const mockMap: Record<string, string> = getMockList(mockStr);
    try {
      delegator.setMockList(mockMap);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'abilityDelegator.setMockList failed: %{public}s', JSON.stringify(error) ?? '');
    }
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'ResourceManager getRawFileContent failed: %{public}s', JSON.stringify(error) ?? '');
  }
}

function getMockList(jsonStr: string): Record<string, string> {
  const jsonObj: Record<string, Object> = JSON.parse(jsonStr);
  const map: Map<string, object> = new Map<string, object>(Object.entries(jsonObj));
  const mockList: Record<string, string> = {};
  map.forEach((value: object, key: string) => {
    mockList[key] = value['source'].toString();
  });
  hilog.info(DOMAIN, TAG, '%{public}s', 'mock-json value:' + JSON.stringify(mockList) ?? '');
  return mockList;
}
