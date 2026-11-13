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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { Hypium } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { ResourceHelper } from 'library';
import testsuite from '../test/List.test';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;

/**
 * Test ability class.
 * Extends UIAbility to load and run Hypium test cases in the ohosTest environment.
 */
export default class TestAbility extends UIAbility {
  /**
   * Ability creation callback.
   * Initializes the Hypium test framework and starts test execution here.
   * @param {Want} want - launch parameters
   * @param {AbilityConstant.LaunchParam} launchParam - launch parameters
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onCreate: test ability created');
    ResourceHelper.init(this.context);
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    hilog.info(DOMAIN, TAG, 'TestAbility onCreate: hypium test started');
  }

  /**
   * Window stage callback.
   * Loads the test page.
   * @param {window.WindowStage} windowStage - window stage instance
   */
  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onWindowStageCreate: window stage created');
    windowStage.loadContent('testability/pages/Index', (err: Error, data: void) => {
      if (err) {
        hilog.error(DOMAIN, TAG, `Failed to load content: ${JSON.stringify(err)}`);
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content');
    });
  }

  /**
   * Window destruction callback.
   */
  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onWindowStageDestroy: window stage destroyed');
  }

  /**
   * Ability destruction callback.
   * Releases test-related resources.
   */
  onAbilityDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onAbilityDestroy: test ability destroyed');
  }

  /**
   * Ability foreground callback.
   */
  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onForeground: test ability foreground');
  }

  /**
   * Ability background callback.
   */
  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onBackground: test ability background');
  }
}
