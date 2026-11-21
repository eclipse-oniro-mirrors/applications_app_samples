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

import { UIAbility, Want, AbilityConstant } from '@kit.AbilityKit';
import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import Logger from '../../../main/ets/util/Logger';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { window } from '@kit.ArkUI';

export default class TestAbility extends UIAbility {
  private testStarted: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('[Sample_CryptoFramework]', 'TestAbility onCreate');
    Logger.info('[Sample_CryptoFramework]', 'want param:' + JSON.stringify(want) ?? '');
    Logger.info('[Sample_CryptoFramework]', 'launchParam:' + JSON.stringify(launchParam) ?? '');
  }

  onDestroy(): void {
    Logger.info('[Sample_CryptoFramework]', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info('[Sample_CryptoFramework]', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        Logger.error('[Sample_CryptoFramework]', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '');
        return;
      }
      Logger.info('[Sample_CryptoFramework]', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    Logger.info('[Sample_CryptoFramework]', 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    Logger.info('[Sample_CryptoFramework]', 'TestAbility onForeground');
    if (this.testStarted) {
      return;
    }
    this.testStarted = true;
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
      AbilityDelegatorRegistry.getArguments();
    Logger.info('[Sample_CryptoFramework]', 'start run testcase!!!');
    setTimeout(() => {
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    }, 300);
  }

  onBackground(): void {
    Logger.info('[Sample_CryptoFramework]', 'TestAbility onBackground');
  }
}
