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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { router } from '@kit.ArkUI';
import { KeyCode } from '@kit.InputKit';
import { UIAbility } from '@kit.AbilityKit';
import { globalIdle } from '../../../main/ets/utils/GlobalScreenSaver';
import { startAppWithRetry } from './TestScenarioUtils';


const SCREEN_SAVER_CONTRACT_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};
const PRODUCTION_IDLE_TIME: number = 5 * 60 * 1000;

interface FeatureRouteParams {
  index: number;
}

export default function screenSaverContractTest(): void {
  // GlobalIdleDetector.init(context, idleTime) accepts a custom interval, so every
  // suite below injects a short deadline instead of waiting for the default 10 s.
  describe('GlobalScreenSaverTest', () => {
    // 400 ms leaves safe margins both for "timer must not fire yet" and for
    // "timer must have fired" assertions in the rewritten timeout cases.
    const GS_IDLE_TIME: number = 400;
    let driver: Driver;
    let ability: UIAbility;

    const restoreRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(180);
        state = router.getState();
      }
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      globalIdle.stopDetect();
      await driver.assertComponentExist(ON.id('tab0'));
    };

    const exitSaverByKey = async (): Promise<void> => {
      // ScreenSaver consumes any key and exits after its 500 ms guard delay.
      // DPAD_RIGHT avoids conflating the component handler with system Back.
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.delayMs(750);
    };

    beforeAll(async (): Promise<void> => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await startAppWithRetry(SCREEN_SAVER_CONTRACT_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      ability = await delegator.getCurrentTopAbility();
      globalIdle.init(ability.context, GS_IDLE_TIME);
      await restoreRoot();
    });

    beforeEach(async (): Promise<void> => {
      await restoreRoot();
      globalIdle.init(ability.context, GS_IDLE_TIME);
    });

    afterEach(async (): Promise<void> => {
      globalIdle.stopDetect();
      await restoreRoot();
      globalIdle.init(ability.context, PRODUCTION_IDLE_TIME);
      globalIdle.stopDetect();
    });

    afterAll(async (): Promise<void> => {
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      globalIdle.stopDetect();
      globalIdle.init(ability.context, PRODUCTION_IDLE_TIME);
      await driver.pressHome();
    });




    /**
     * @tc.number SUB_TV_DEMONSTRATION_IDLE_0400
     * @tc.name globalIdleStressReset010
     * @tc.desc Verify a second idle timeout after a complete saver cycle routes exactly once more
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('globalIdleStressReset010', 0, async (): Promise<void> => {
      globalIdle.resetScreensaver();
      await driver.delayMs(GS_IDLE_TIME + 300);
      await driver.assertComponentExist(ON.type('Swiper'));
      await exitSaverByKey();
      expect(router.getState().path).assertEqual('pages/');
      // Second cycle: the detector must stay reusable after a real activation.
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      await driver.delayMs(GS_IDLE_TIME + 300);
      await driver.assertComponentExist(ON.type('Swiper'));
      expect(router.getStateByUrl('pages/ScreenSaver').length).assertEqual(1);
      expect(globalIdle.getTriggerPage()).assertEqual('pages/');
      await exitSaverByKey();
      expect(router.getState().path).assertEqual('pages/');
    });

  });





}
