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
import testsuite from '../test/List.test';

const TAG: string = '[Sample_BluetoothBaseProfile]';
const DOMAIN: number = 0xF830;

/**
 * TestAbility for ohosTest.
 * test try in port Ability, responsible for initialize Hypium test try box framework and add load test page.
 */
export default class TestAbility extends UIAbility {
  /**
   * create Ability time invoke.
   * initialize Hypium test try box framework.
   * @param want - start params
   * @param launchParam - start params
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onCreate');
    const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  /**
   * destroy Ability time invoke.
   */
  onDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onDestroy');
  }

  /**
   * window port stage segment create time invoke.
   * add load test page.
   * @param windowStage - window port stage segment
   */
  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load content: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading content.');
    });
  }

  /**
   * window port stage segment destroy time invoke.
   */
  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onWindowStageDestroy');
  }

  /**
   * before platform time invoke.
   */
  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onForeground');
  }

  /**
   * after platform time invoke.
   */
  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onBackground');
  }
}
