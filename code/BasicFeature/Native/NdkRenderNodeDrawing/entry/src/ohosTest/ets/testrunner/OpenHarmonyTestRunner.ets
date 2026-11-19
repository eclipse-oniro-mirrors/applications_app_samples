/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
// 与 main 侧 common/Logger.ets 保持一致，便于 hilog 按统一 DOMAIN/TAG 过滤。
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRenderNodeDrawing]';

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
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments()
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    let moduleName: string = abilityDelegatorArguments.parameters['-m'];
    // application.createModuleContext 在本 SDK 上返回 Promise，测试运行器线程无法等待它完成，
    // 因此继续使用 Context 自带的同步接口取模块资源；该接口已标记废弃，是本文件唯一的告警来源。
    let context: common.Context = abilityDelegator.getAppContext().createModuleContext(moduleName);
    let mResourceManager: resourceManager.ResourceManager = context.resourceManager;
    await checkMock(abilityDelegator, mResourceManager);
    const bundleName: string = abilityDelegatorArguments.bundleName;
    const testAbilityName: string = 'TestAbility';
    let lMonitor: abilityDelegatorRegistry.AbilityMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
      moduleName: moduleName
    };
    abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback)
    const want: Want = {
      bundleName: bundleName,
      abilityName: testAbilityName,
      moduleName: moduleName
    };
    abilityDelegator.startAbility(want, (err: BusinessError, data: void) => {
      hilog.info(DOMAIN, TAG, 'startAbility : err : %{public}s', JSON.stringify(err) ?? '');
      hilog.info(DOMAIN, TAG, 'startAbility : data : %{public}s', JSON.stringify(data) ?? '');
    })
    hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
}

async function checkMock(abilityDelegator: abilityDelegatorRegistry.AbilityDelegator,
  resourceManager: resourceManager.ResourceManager): Promise<void> {
  let rawFile: Uint8Array;
  try {
    rawFile = resourceManager.getRawFileContentSync(jsonPath);
    hilog.info(DOMAIN, TAG, 'MockList file exists');
    let mockStr: string = util.TextDecoder.create("utf-8", { ignoreBOM: true }).decodeToString(rawFile);
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
    let realValue: string = value['source'].toString();
    mockList[key] = realValue;
  });
  hilog.info(DOMAIN, TAG, '%{public}s', 'mock-json value:' + JSON.stringify(mockList) ?? '');
  return mockList;
}