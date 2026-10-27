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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import { globalIdle } from '../../../main/ets/utils/GlobalScreenSaver';
import { startAppWithRetry, waitForRootTabBar } from './TestScenarioUtils';

const BOOTSTRAP_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};

export default function bootstrapContractTest(): void {
  describe('BootstrapContractTest', () => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = Driver.create();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_BOOTSTRAP_0100
     * @tc.name bootstrapAppLaunchedAtRoot001
     * @tc.desc Verify the launcher starts and lands on the persistent root tab bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bootstrapAppLaunchedAtRoot001', 0, async (): Promise<void> => {
      await startAppWithRetry(BOOTSTRAP_WANT, 'com.sample.demonstration');
      await waitForRootTabBar(driver);
      await driver.assertComponentExist(ON.id('tab0'));
      // Reading the app context here also proves the process under test is
      // resolvable before any later suite depends on it.
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      expect(context !== null && context !== undefined).assertTrue();
      // Park the app on the root and disable the idle-driven screensaver so
      // the pure-logic suites that follow cannot trigger the auto-playing
      // carousel while the process is otherwise untouched.
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      globalIdle.stopDetect();
    });
  });
}
