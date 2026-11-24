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
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import testsuite from '../test/List.test';

export default class TestAbility extends UIAbility {
  private hasStarted: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'MetadataTest', 'TestAbility onCreate');
    hilog.info(0x0000, 'MetadataTest', 'Launch reason: %{public}d', launchParam.launchReason);
    hilog.info(0x0000, 'MetadataTest', 'Ability: %{public}s', want.abilityName ?? 'TestAbility');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'MetadataTest', 'Test window created');
    windowStage.loadContent('testability/pages/Index', (error): void => {
      if (error.code) {
        hilog.error(0x0000, 'MetadataTest', 'Test page load failed: %{public}d', error.code);
        const delegator = abilityDelegatorRegistry.getAbilityDelegator();
        delegator.finishTest('Test page load failed: ' + error.code, -1);
        return;
      }
      this.startTests();
    });
  }

  private startTests(): void {
    if (this.hasStarted) {
      hilog.warn(0x0000, 'MetadataTest', 'Ignoring duplicate test start');
      return;
    }
    this.hasStarted = true;
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    hilog.info(0x0000, 'MetadataTest', 'Starting metadata tests for %{public}s', args.bundleName);
    Hypium.hypiumTest(delegator, args, testsuite);
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'MetadataTest', 'TestAbility received a new Want');
    hilog.info(0x0000, 'MetadataTest', 'Target ability: %{public}s', want.abilityName ?? 'TestAbility');
    hilog.info(0x0000, 'MetadataTest', 'New launch reason: %{public}d', launchParam.launchReason);
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'MetadataTest', 'Test window destroyed');
  }

  onForeground(): void {
    hilog.info(0x0000, 'MetadataTest', 'TestAbility foreground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'MetadataTest', 'TestAbility background');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'MetadataTest', 'TestAbility destroyed');
  }

  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    hilog.warn(0x0000, 'MetadataTest', 'Memory pressure level: %{public}d', level);
    if (this.hasStarted) {
      hilog.warn(0x0000, 'MetadataTest', 'Memory pressure received while test ability is active');
    }
  }
}
