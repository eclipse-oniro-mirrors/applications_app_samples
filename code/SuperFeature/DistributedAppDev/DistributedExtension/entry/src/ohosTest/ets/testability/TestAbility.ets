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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';
const ON_DESTROY_ERROR: number = -2;
/**
 * 从前台回调返回后，还要等这么久才做用例注册。
 *
 * 本工程 66 个测试文件、3016 条用例，hypium 每注册一条都会 `console.info` 一行（`stress length`），
 * 在设备上要写 3016 次 hilog，实测独占 8 s 且期间不回到事件循环。AAFWK 从 ForegroundLifecycle
 * 开始计时，5 s 内收不到前台完成就判 LIFECYCLE_TIMEOUT 并回收测试进程（报告里是 App died）。
 * 所以注册不能放在 onCreate/onForeground 里同步做，否则前台流程走不完；
 * 用 setTimeout 排到前台完成之后再执行，前台计时已经结束，不再受这段长占用影响。
 */
const REGISTER_DELAY_MS: number = 1000;

export default class TestAbility extends UIAbility {
  private abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
  private registerScheduled: boolean = false;

  constructor() {
    super();
    this.abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
    try {
      hilog.info(DOMAIN, TAG, '%{public}s', 'want param:' + JSON.stringify(want));
    } catch (error) {
      hilog.warn(DOMAIN, TAG, '%{public}s', 'want param cannot be serialized');
      hilog.warn(DOMAIN, TAG, '%{public}s', String(error));
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageCreate');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onForeground');
    if (this.registerScheduled) {
      return;
    }
    this.registerScheduled = true;
    setTimeout(() => {
      const abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs =
        abilityDelegatorRegistry.getArguments();
      hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase!!!');
      Hypium.hypiumTest(this.abilityDelegator, abilityDelegatorArguments, testsuite);
      hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
    }, REGISTER_DELAY_MS);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
    this.abilityDelegator.finishTest('TestAbility onDestroy unexpectedly!', ON_DESTROY_ERROR, () => {
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
  }
}
