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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

const TAG: string = 'UIExtensionTestAbility';
const DOMAIN: number = 0x0000;
const FORMAT: string = '%{public}s';

/**
 * Lifecycle logger used by the test ability so every callback is traceable
 * inside the ohosTest hilog output. Messages are kept in English only.
 */
function logLifecycle(event: string): void {
  hilog.info(DOMAIN, TAG, FORMAT, 'lifecycle event: ' + event);
}

/**
 * Logs the launch Want payload. The Want passed to a test ability can be
 * undefined when the framework starts it directly, so the helper guards it.
 */
function logWant(want: Want): void {
  const wantText: string = want === undefined ? '{}' : JSON.stringify(want);
  hilog.info(DOMAIN, TAG, FORMAT, 'want param: ' + wantText);
}

/**
 * Logs the launch parameters supplied by the ability framework. Keeping this
 * separate makes the onCreate flow easier to follow in the hilog stream.
 */
function logLaunchParam(launchParam: AbilityConstant.LaunchParam): void {
  const paramText: string = launchParam === undefined ? '{}' : JSON.stringify(launchParam);
  hilog.info(DOMAIN, TAG, FORMAT, 'launch param: ' + paramText);
}

/**
 * Loads the test runner page and reports the result. The test ability only
 * needs the index page so Hypium can drive the suites registered in List.test.
 */
function loadTestContent(windowStage: window.WindowStage): void {
  windowStage.loadContent('testability/pages/Index', (err, data) => {
    if (err.code) {
      hilog.error(DOMAIN, TAG, FORMAT, 'Failed to load the content: ' + JSON.stringify(err));
      return;
    }
    hilog.info(DOMAIN, TAG, FORMAT, 'Succeeded in loading the content: ' + JSON.stringify(data));
  });
}

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logLifecycle('onCreate');
    logWant(want);
    logLaunchParam(launchParam);
    logLifecycle('start run testcase');
    const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  onDestroy(): void {
    logLifecycle('onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    logLifecycle('onWindowStageCreate');
    loadTestContent(windowStage);
  }

  onWindowStageDestroy(): void {
    logLifecycle('onWindowStageDestroy');
  }

  onForeground(): void {
    logLifecycle('onForeground');
  }

  onBackground(): void {
    logLifecycle('onBackground');
  }
}
