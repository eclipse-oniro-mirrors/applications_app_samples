/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

// 与 main 侧 common/Logger.ets 保持一致，便于 hilog 按统一 DOMAIN/TAG 过滤。
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkRenderNodeDrawing]';

export default class TestAbility extends UIAbility {
  // Hypium 只允许启动一次，onForeground 可能被多次回调，用标记做幂等。
  private testStarted: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
    hilog.info(DOMAIN, TAG, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(DOMAIN, TAG, '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onForeground');
    // 页面级用例依赖窗口已创建并完成首帧，因此在 onForeground 后延迟一帧再拉起 Hypium；
    // 若在 onCreate 里启动，测试页尚未上屏，UiTest 会拿到空组件树。
    if (!this.testStarted) {
      this.testStarted = true;
      setTimeout(() => {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
        abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
        hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase!!!');
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      }, 300);
    }
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
  }
}