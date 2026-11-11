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

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;

/**
 * 测试能力类。
 * 继承自 UIAbility，用于在 ohosTest 环境下加载并运行 Hypium 测试用例。
 */
export default class TestAbility extends UIAbility {
  /**
   * 能力创建回调。
   * 在此处初始化 Hypium 测试框架并启动测试执行。
   * @param {Want} want - 启动参数
   * @param {AbilityConstant.LaunchParam} launchParam - 启动参数
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onCreate: test ability created');
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    hilog.info(DOMAIN, TAG, 'TestAbility onCreate: hypium test started');
  }

  /**
   * 窗口阶段回调。
   * 加载测试页面。
   * @param {window.WindowStage} windowStage - 窗口阶段实例
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
   * 窗口销毁回调。
   */
  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onWindowStageDestroy: window stage destroyed');
  }

  /**
   * 能力销毁回调。
   * 释放测试相关资源。
   */
  onAbilityDestroy(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onAbilityDestroy: test ability destroyed');
  }

  /**
   * 能力前台回调。
   */
  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onForeground: test ability foreground');
  }

  /**
   * 能力后台回调。
   */
  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'TestAbility onBackground: test ability background');
  }
}
