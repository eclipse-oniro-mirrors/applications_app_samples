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
 * 测试入口 Ability，负责初始化 Hypium 测试框架并加载测试页面。
 */
export default class TestAbility extends UIAbility {
  /**
   * 创建 Ability 时调用。
   * 初始化 Hypium 测试框架。
   * @param want - 启动参数
   * @param launchParam - 启动参数
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onCreate');
    const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  /**
   * 销毁 Ability 时调用。
   */
  onDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onDestroy');
  }

  /**
   * 窗口阶段创建时调用。
   * 加载测试页面。
   * @param windowStage - 窗口阶段
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
   * 窗口阶段销毁时调用。
   */
  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onWindowStageDestroy');
  }

  /**
   * 前台时调用。
   */
  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onForeground');
  }

  /**
   * 后台时调用。
   */
  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onBackground');
  }
}
