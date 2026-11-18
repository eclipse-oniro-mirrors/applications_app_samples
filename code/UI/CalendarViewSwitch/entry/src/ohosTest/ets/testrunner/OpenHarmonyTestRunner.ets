/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import testsuite from '../test/List.test';

interface CoverageGlobals {
  __savePath__: string;
  __readPath__: string;
  __testMode__: string;
}

interface MockSource {
  source: string;
}

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    try {
      const context: common.Context = await application.createModuleContext(
        delegator.getAppContext().getApplicationContext(), args.parameters['-m']);
      const coverageGlobals: CoverageGlobals = new Function('return this')();
      const userId: number = Math.floor(delegator.getAppContext().applicationInfo.uid / 200000);
      coverageGlobals.__savePath__ = '/data/storage/el2/base/js_coverage.json';
      coverageGlobals.__readPath__ = '/data/app/el2/' + userId + '/base/' + args.bundleName + '/js_coverage.json';
      coverageGlobals.__testMode__ = 'ohostest';
      loadMocks(delegator, context.resourceManager);
      hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner start run testcase');
      Hypium.hypiumTest(delegator, args, testsuite);
    } catch (error) {
      const message: string = 'Test initialization failed: ' + String(error);
      hilog.error(DOMAIN, TAG, '%{public}s', message);
      await delegator.finishTest(message, -1);
    }
  }
}

function loadMocks(delegator: abilityDelegatorRegistry.AbilityDelegator,
  manager: resourceManager.ResourceManager): void {
  try {
    const rawFile: Uint8Array = manager.getRawFileContentSync('mock/mock-config.json');
    const mockText: string = util.TextDecoder.create('utf-8', { ignoreBOM: true }).decodeToString(rawFile);
    const mockConfig: Record<string, MockSource> = JSON.parse(mockText);
    const mockList: Record<string, string> = {};
    Object.keys(mockConfig).forEach((key: string) => {
      mockList[key] = mockConfig[key].source.toString();
    });
    delegator.setMockList(mockList);
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', 'Mock initialization failed: ' + String(error));
  }
}
