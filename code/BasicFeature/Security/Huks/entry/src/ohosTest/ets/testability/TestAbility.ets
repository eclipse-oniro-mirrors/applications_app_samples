/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';
import Logger from '../../../main/ets/model/Logger';
import testsuite from '../test/List.test';

let testStarted: boolean = false;

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('[Sample_Huks]', 'TestAbility onCreate');
    Logger.info('[Sample_Huks]', `want param: ${JSON.stringify(want) ?? ''}`);
    Logger.info('[Sample_Huks]', `launchParam: ${JSON.stringify(launchParam) ?? ''}`);
  }

  onDestroy(): void {
    Logger.info('[Sample_Huks]', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info('[Sample_Huks]', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        Logger.error('[Sample_Huks]', `Failed to load the content. Cause: ${JSON.stringify(err) ?? ''}`);
        return;
      }
      Logger.info('[Sample_Huks]', `Succeeded in loading the content. Data: ${JSON.stringify(data) ?? ''}`);
    });
  }

  onWindowStageDestroy(): void {
    Logger.info('[Sample_Huks]', 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    Logger.info('[Sample_Huks]', 'TestAbility onForeground');
    if (testStarted) {
      return;
    }
    testStarted = true;
    setTimeout(() => {
      const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
        abilityDelegatorRegistry.getArguments();
      Logger.info('[Sample_Huks]', 'start run testcase!!!');
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    }, 300);
  }

  onBackground(): void {
    Logger.info('[Sample_Huks]', 'TestAbility onBackground');
  }
}
