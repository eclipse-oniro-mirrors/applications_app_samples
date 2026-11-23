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
import { util } from '@kit.ArkTS';
import { Hypium } from '@ohos/hypium';

interface MockEntry {
  source: string;
}

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(0xF811, '[Sample_SearchComponent]', '%{public}s', 'Test runner prepared');
  }

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    const appContext = delegator.getAppContext();
    const context: common.Context = await application.createModuleContext(
      appContext.getApplicationContext(), args.parameters['-m']);
    const uid: number = Math.floor(appContext.applicationInfo.uid / 200000);
    const globalObject: object = new Function('return this')();
    // Coverage instrumentation reads these process-global keys.
    Reflect.set(globalObject, '__savePath__', '/data/storage/el2/base/js_coverage.json');
    Reflect.set(globalObject, '__readPath__', '/data/app/el2/' + uid + '/base/' + args.bundleName + '/js_coverage.json');
    Reflect.set(globalObject, '__testMode__', 'ohostest');

    let mockFile: Uint8Array | undefined;
    try {
      mockFile = context.resourceManager.getRawFileContentSync('mock/mock-config.json');
    } catch (error) {
      hilog.info(0xF811, '[Sample_SearchComponent]', '%{public}s', 'No mock configuration: ' + String(error));
    }
    if (mockFile !== undefined) {
      const mockJson: string = util.TextDecoder.create('utf-8', { ignoreBOM: true }).decodeToString(mockFile);
      const mockConfig: Record<string, MockEntry> = JSON.parse(mockJson);
      const mockList: Record<string, string> = {};
      Object.keys(mockConfig).forEach((name: string) => {
        mockList[name] = mockConfig[name].source;
      });
      delegator.setMockList(mockList);
    }

    const testModule = await import('../test/List.test');
    hilog.info(0xF811, '[Sample_SearchComponent]', '%{public}s', 'Registering tests outside TestAbility lifecycle');
    Hypium.hypiumTest(delegator, args, testModule.default);
  }
}
