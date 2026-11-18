/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Logger from 'ets/util/Logger';

export default class TestAbility extends UIAbility {
  private static readonly LOG_TAG: string = '[Sample_AppXComponent3D]';
  private static readonly START_DELAY_MS: number = 300;

  private testStarted: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info(TestAbility.LOG_TAG, '%{public}s', 'TestAbility onCreate');
    Logger.info(TestAbility.LOG_TAG, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    Logger.info(TestAbility.LOG_TAG, '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
  }

  onDestroy(): void {
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        Logger.error(TestAbility.LOG_TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      Logger.info(TestAbility.LOG_TAG, 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
  }

  onForeground(): void {
    if (this.testStarted) {
      return;
    }
    this.testStarted = true;
    const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
      AbilityDelegatorRegistry.getArguments();
    Logger.info(TestAbility.LOG_TAG, 'start hypium after foreground, parameters: %{public}s',
      JSON.stringify(abilityDelegatorArguments.parameters) ?? '');
    setTimeout(() => {
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    }, TestAbility.START_DELAY_MS);
  }

  onBackground(): void {
  }
}