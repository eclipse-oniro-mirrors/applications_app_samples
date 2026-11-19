/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { common, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';

const DOMAIN: number = 0xF812;
const TAG: string = 'InterfaceTestRunner';
const MOCK_JSON_PATH: string = 'mock/mock-config.json';

interface MockSource {
  source: string;
}

function onAbilityCreateCallback(): void {
  hilog.info(DOMAIN, TAG, 'Test ability created');
}

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(DOMAIN, TAG, 'Test runner prepared');
  }

  async onRun(): Promise<void> {
    hilog.info(DOMAIN, TAG, 'Test runner started');
    const argumentsValue: abilityDelegatorRegistry.AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const moduleName: string = argumentsValue.parameters['-m'];
    const context: common.Context = delegator.getAppContext().getApplicationContext().createModuleContext(moduleName);
    checkMock(delegator, context.resourceManager);
    const monitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: 'TestAbility',
      onAbilityCreate: onAbilityCreateCallback,
      moduleName: moduleName
    };
    await delegator.addAbilityMonitor(monitor);
    const want: Want = {
      bundleName: argumentsValue.bundleName,
      abilityName: 'TestAbility',
      moduleName: moduleName
    };
    await delegator.startAbility(want);
    hilog.info(DOMAIN, TAG, 'Test ability started');
  }
}

function checkMock(delegator: abilityDelegatorRegistry.AbilityDelegator,
  manager: resourceManager.ResourceManager): void {
  let rawFile: Uint8Array;
  try {
    rawFile = manager.getRawFileContentSync(MOCK_JSON_PATH);
  } catch (error) {
    hilog.info(DOMAIN, TAG, 'Optional mock configuration unavailable');
    return;
  }
  const mockText: string = util.TextDecoder.create('utf-8').decodeToString(rawFile);
  const mockMap: Record<string, string> = getMockList(mockText);
  delegator.setMockList(mockMap);
  hilog.info(DOMAIN, TAG, 'Mock configuration applied');
}

function getMockList(jsonText: string): Record<string, string> {
  const jsonObject: Record<string, MockSource> = JSON.parse(jsonText);
  const mockList: Record<string, string> = {};
  Object.keys(jsonObject).forEach((key: string): void => {
    const source: string = jsonObject[key].source;
    if (typeof source !== 'string') {
      throw new Error('Mock source must be a string');
    }
    mockList[key] = source;
  });
  return mockList;
}
