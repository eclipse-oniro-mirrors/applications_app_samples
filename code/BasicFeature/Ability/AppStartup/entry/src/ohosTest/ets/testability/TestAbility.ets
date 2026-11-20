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

const DOMAIN: number = 0xFF00;
const TAG: string = 'TestAbility';
const ON_DESTROY_ERROR: number = -2;
/**
 * 从前台回调返回后，还要等这么久才做用例注册。
 *
 * hypium 每注册一条用例都会同步写一行日志，几十个套件注册时主线程会被独占若干秒。
 * AAFWK 从 ForegroundLifecycle 开始计时，5 s 内收不到前台完成就判 LIFECYCLE_TIMEOUT
 * 并回收测试进程（报告里表现为 App died）。用 setTimeout 把注册排到前台完成之后执行，
 * 前台计时已经结束，不再受这段长占用影响。
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
    windowStage.loadContent('testability/pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
      }
    });
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility register end');
    }, REGISTER_DELAY_MS);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
    this.abilityDelegator.finishTest('TestAbility onDestroy unexpectedly!', ON_DESTROY_ERROR, () => {
    });
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
  }
}
