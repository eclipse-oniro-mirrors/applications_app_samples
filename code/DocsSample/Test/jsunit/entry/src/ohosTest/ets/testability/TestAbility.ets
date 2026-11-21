/*
* Copyright (c) 2023-2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License")
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

// [Start dataDriverAbility_sample]
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { setTestContext } from '../test/JsUiSession';
import data from '../test/data.json';
import Logger from '../util/Logger';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = 'testTag';

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    setTestContext(this.context);
    Logger.info(TAG, 'TestAbility onCreate');
    Logger.info(TAG, 'want param:' + JSON.stringify(want));
    Logger.info(TAG, 'launchParam:' + JSON.stringify(launchParam));
    const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
      abilityDelegatorRegistry.getArguments();
    Logger.info(TAG, 'start run testcase!!!');
    // 设置数据
    Hypium.setData(data);
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  onDestroy(): void {
    Logger.info('testTag', '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info(TAG, 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err: BusinessError, result: void): void => {
      if (err.code) {
        Logger.error(TAG, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      Logger.info(TAG, 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(result) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    Logger.info('testTag', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    Logger.info('testTag', '%{public}s', 'TestAbility onForeground');
  }

  onBackground(): void {
    Logger.info('testTag', '%{public}s', 'TestAbility onBackground');
  }
}
// [End dataDriverAbility_sample]