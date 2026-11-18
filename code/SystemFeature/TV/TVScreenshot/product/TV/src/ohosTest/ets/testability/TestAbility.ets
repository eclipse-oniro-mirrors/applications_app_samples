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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import testsuite from '../test/List.test';

const DOMAIN: number = 0x55EE;
const TAG: string = 'Screenshot-TestAbility';
const CAPTURE_SERVICE: string = 'com.ohos.screenshot.ServiceExtAbility';

/**
 * Start the capture service extension before the suites run. The preview window is
 * created by the service, therefore most of the interaction suites expect it to be
 * present. A failure to start is logged and never blocks the test run.
 */
async function startCaptureService(): Promise<void> {
  const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  const args: AbilityDelegatorRegistry.AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments();
  const want: Want = {
    bundleName: args.bundleName,
    abilityName: CAPTURE_SERVICE
  };
  await delegator.startAbility(want);
}

/**
 * Test ability hosting the screenshot suites. It mirrors the production ability stage
 * so the suites observe the same resource state as the shipped sample.
 */
export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
    hilog.info(DOMAIN, TAG, '%{public}s', 'want: ' + JSON.stringify(want));
    hilog.info(DOMAIN, TAG, '%{public}s', 'launchParam: ' + JSON.stringify(launchParam));

    const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator =
      AbilityDelegatorRegistry.getAbilityDelegator();
    const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
      AbilityDelegatorRegistry.getArguments();

    setTimeout(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'starting capture service and test suite');
      startCaptureService().then(() => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'capture service started');
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, 'capture service start failed: %{public}s', JSON.stringify(error));
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
      });
    }, 1000);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (error: BusinessError) => {
      if (error && error.code) {
        hilog.error(DOMAIN, TAG, 'loadContent failed: %{public}s', JSON.stringify(error));
        return;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'loadContent succeeded');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onForeground');
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
  }
}
