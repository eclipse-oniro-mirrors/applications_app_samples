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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { window } from '@kit.ArkUI';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import Logger from '../../../main/ets/model/Logger';

const TAG: string = 'TestAbility';
let testStarted: boolean = false;

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info(TAG, 'TestAbility onCreate');
    Logger.info(TAG, `want param:${JSON.stringify(want)}`);
    Logger.info(TAG, `launchParam:${JSON.stringify(launchParam)}`);
  }

  onDestroy(): void {
    Logger.info(TAG, 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info(TAG, 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        Logger.error(TAG, `Failed to load the content. Cause: ${JSON.stringify(err)}`);
        return;
      }
      Logger.info(TAG, `Succeeded in loading the content. Data: ${JSON.stringify(data)}`);
    });
  }

  onWindowStageDestroy(): void {
    Logger.info(TAG, 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    Logger.info(TAG, 'TestAbility onForeground');
    if (testStarted) {
      return;
    }
    testStarted = true;
    setTimeout(() => {
      Logger.info(TAG, 'start run testcase!!!');
      Hypium.hypiumTest(abilityDelegatorRegistry.getAbilityDelegator(),
        abilityDelegatorRegistry.getArguments(), testsuite);
    }, 300);
  }

  onBackground(): void {
    Logger.info(TAG, 'TestAbility onBackground');
  }
}
