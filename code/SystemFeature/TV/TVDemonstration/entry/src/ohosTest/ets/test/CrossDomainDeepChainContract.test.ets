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
import { Component, DisplayRotation, Driver, ON, On } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { router } from '@kit.ArkUI';
import { KeyCode } from '@kit.InputKit';
import { UIAbility } from '@kit.AbilityKit';
import { globalIdle } from '../../../main/ets/utils/GlobalScreenSaver';
import { startAppWithRetry } from './TestScenarioUtils';

const DEEP_CHAIN_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};
const PRODUCTION_IDLE_TIME: number = 5 * 60 * 1000;
const CHAIN_IDLE_TIME: number = 250;
const ROUTE_SETTLE_TIME: number = 260;
const BACK_SETTLE_TIME: number = 180;
const KEY_ACTION_TIME: number = 120;
const FEATURE_DETAIL_COUNT: number = 7;
const SMART_DETAIL_COUNT: number = 3;

interface DeepRouteParams {
  index: number;
}

export default function crossDomainDeepChainContractTest(): void {
  describe('CrossDomainDeepChainContractTest', () => {
    let driver: Driver;
    let ability: UIAbility;

    const restoreRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(BACK_SETTLE_TIME);
        state = router.getState();
      }
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      await driver.assertComponentExist(ON.id('tab0'));
    };

    const openFeature = async (index: number): Promise<void> => {
      const params: DeepRouteParams = { index: index };
      await router.pushUrl({ url: 'Component/FeatureComponent', params: params }, router.RouterMode.Single);
      await driver.delayMs(ROUTE_SETTLE_TIME);
    };

    const openSmart = async (index: number): Promise<void> => {
      const params: DeepRouteParams = { index: index };
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: params });
      await driver.delayMs(ROUTE_SETTLE_TIME);
    };

    const openMedia = async (): Promise<void> => {
      await router.pushUrl({ url: 'Video/VideoPage' });
      await driver.delayMs(ROUTE_SETTLE_TIME);
    };

    const openVideo = async (): Promise<void> => {
      await router.pushUrl({ url: 'Video/VideoPage' });
      await driver.delayMs(ROUTE_SETTLE_TIME);
    };

    const backOnce = async (): Promise<void> => {
      await driver.pressBack();
      await driver.delayMs(BACK_SETTLE_TIME);
    };

    const routeIndex = (): number => {
      return router.getState().index;
    };

    const routePath = (): string => {
      return router.getState().path;
    };

    const componentCount = async (matcher: On): Promise<number> => {
      const matches: Component[] = await driver.findComponents(matcher);
      return matches == null ? 0 : matches.length;
    };

    beforeAll(async (): Promise<void> => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await startAppWithRetry(DEEP_CHAIN_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      ability = await delegator.getCurrentTopAbility();
      globalIdle.init(ability.context, PRODUCTION_IDLE_TIME);
      globalIdle.stopDetect();
      await restoreRoot();
    });

    beforeEach(async (): Promise<void> => {
      globalIdle.init(ability.context, PRODUCTION_IDLE_TIME);
      globalIdle.stopDetect();
      await restoreRoot();
    });

    afterEach(async (): Promise<void> => {
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      await restoreRoot();
    });

    afterAll(async (): Promise<void> => {
      globalIdle.stopDetect();
      globalIdle.resetScreensaver();
      globalIdle.init(ability.context, PRODUCTION_IDLE_TIME);
      await driver.pressHome();
    });





    /**
     * @tc.number SUB_TV_DEMONSTRATION_DEEP_CHAIN_0500
     * @tc.name deepChainSmartThenVideo005
     * @tc.desc Verify a Smart detail to VideoPage chain keeps each hop isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deepChainSmartThenVideo005', 0, async (): Promise<void> => {
      await openSmart(2);
      expect(routeIndex()).assertEqual(2);
      await backOnce();
      await openVideo();
      expect(routePath()).assertEqual('Video/');
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await backOnce();
      expect(routeIndex()).assertEqual(1);
      expect(await componentCount(ON.type('Video'))).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DEEP_CHAIN_0600
     * @tc.name deepChainMediaThenSmart006
     * @tc.desc Verify a MediaExperiencePage to Smart detail chain preserves route order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deepChainMediaThenSmart006', 0, async (): Promise<void> => {
      await openMedia();
      expect(routePath()).assertEqual('Video/');
      await backOnce();
      await openSmart(1);
      expect(routePath()).assertEqual('Component/');
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
      await backOnce();
      expect(routeIndex()).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DEEP_CHAIN_0700
     * @tc.name deepChainVideoThenFeature007
     * @tc.desc Verify a VideoPage to Feature detail chain keeps each hop isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deepChainVideoThenFeature007', 0, async (): Promise<void> => {
      await openVideo();
      expect(routePath()).assertEqual('Video/');
      await backOnce();
      await openFeature(3);
      expect(routePath()).assertEqual('Component/');
      expect((await driver.findComponents(ON.text('Pointing Remote'))).length).assertEqual(1);
      await backOnce();
      expect(routeIndex()).assertEqual(1);
      expect(await componentCount(ON.text('Pointing Remote'))).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DEEP_CHAIN_0800
     * @tc.name deepChainFourHopRapidNoGhost008
     * @tc.desc Verify a rapid no-delay four-hop chain leaves no ghost route behind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deepChainFourHopRapidNoGhost008', 0, async (): Promise<void> => {
      await openFeature(0);
      await backOnce();
      await openSmart(0);
      await backOnce();
      await openMedia();
      await backOnce();
      await openVideo();
      await backOnce();
      expect(routeIndex()).assertEqual(1);
      expect(Number(router.getLength())).assertEqual(1);
      expect(router.getStateByUrl('Component/FeatureComponent').length).assertEqual(0);
      expect(router.getStateByUrl('Component/SmartLifeComponent').length).assertEqual(0);
      expect(router.getStateByUrl('Video/VideoPage').length).assertEqual(0);
      expect(router.getStateByUrl('Video/VideoPage').length).assertEqual(0);
      expect((await driver.findComponents(ON.id('tab0'))).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DEEP_CHAIN_0900
     * @tc.name deepChainFiveHopStackInvariants009
     * @tc.desc Verify the router stack index and path at every hop of a five-hop chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deepChainFiveHopStackInvariants009', 0, async (): Promise<void> => {
      await openFeature(0);
      expect(routeIndex()).assertEqual(2);
      await backOnce();
      expect(routeIndex()).assertEqual(1);
      await openSmart(1);
      expect(routeIndex()).assertEqual(2);
      await backOnce();
      expect(routeIndex()).assertEqual(1);
      await openFeature(3);
      expect(routeIndex()).assertEqual(2);
      await backOnce();
      await openMedia();
      expect(routeIndex()).assertEqual(2);
      await backOnce();
      expect(routeIndex()).assertEqual(1);
      expect((await driver.findComponents(ON.id('tab0'))).length).assertEqual(1);
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_DEEP_CHAIN_1100
     * @tc.name deepChainBackStackCleanup011
     * @tc.desc Verify three consecutive backs fully clear a three-hop stack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deepChainBackStackCleanup011', 0, async (): Promise<void> => {
      await openFeature(4);
      await openMedia();
      await openVideo();
      expect(routeIndex()).assertEqual(4);
      expect(Number(router.getLength())).assertEqual(4);
      await backOnce();
      await backOnce();
      await backOnce();
      expect(routeIndex()).assertEqual(1);
      expect(Number(router.getLength())).assertEqual(1);
      expect(router.getStateByUrl('Component/FeatureComponent').length).assertEqual(0);
      expect(router.getStateByUrl('Video/VideoPage').length).assertEqual(0);
      expect(router.getStateByUrl('Video/VideoPage').length).assertEqual(0);
    });




    /**
     * @tc.number SUB_TV_DEMONSTRATION_DEEP_CHAIN_1500
     * @tc.name deepChainAfterChainFocusAlive015
     * @tc.desc Verify focus input still moves after returning from a deep chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deepChainAfterChainFocusAlive015', 0, async (): Promise<void> => {
      await openFeature(3);
      await backOnce();
      await openSmart(2);
      await backOnce();
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await driver.delayMs(KEY_ACTION_TIME);
      expect((await componentCount(ON.focused())) > 0).assertTrue();
      await driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await driver.delayMs(KEY_ACTION_TIME);
      expect((await componentCount(ON.focused())) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DEEP_CHAIN_1600
     * @tc.name deepChainThreeHopBackToMiddle016
     * @tc.desc Verify back(index) from a three-hop stack lands on the middle detail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deepChainThreeHopBackToMiddle016', 0, async (): Promise<void> => {
      await openFeature(0);
      await openMedia();
      await openVideo();
      expect(routeIndex()).assertEqual(4);
      router.back(2);
      await driver.delayMs(180);
      expect(routePath()).assertEqual('Component/');
      expect(routeIndex()).assertEqual(2);
      expect(router.getStateByUrl('Video/VideoPage').length).assertEqual(0);
      expect(router.getStateByUrl('Video/VideoPage').length).assertEqual(0);
      await backOnce();
      expect(routeIndex()).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DEEP_CHAIN_1700
     * @tc.name deepChainRotationPreservesDetail017
     * @tc.desc Verify a rotation round trip while on a detail keeps the chain intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deepChainRotationPreservesDetail017', 0, async (): Promise<void> => {
      await openFeature(4);
      expect((await driver.findComponents(ON.text('Smart Screensaver'))).length).assertEqual(1);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(200);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(200);
      expect((await driver.findComponents(ON.text('Smart Screensaver'))).length).assertEqual(1);
      expect(routeIndex()).assertEqual(2);
      await backOnce();
      expect(routeIndex()).assertEqual(1);
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_DEEP_CHAIN_1900
     * @tc.name deepChainFourRouteTourClearsStack019
     * @tc.desc Verify a four-route tour fully clears its stack back to the root
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('deepChainFourRouteTourClearsStack019', 0, async (): Promise<void> => {
      await openFeature(0);
      await openMedia();
      await openSmart(0);
      await openVideo();
      expect(routeIndex()).assertEqual(5);
      await backOnce();
      await backOnce();
      await backOnce();
      await backOnce();
      expect(routeIndex()).assertEqual(1);
      expect(Number(router.getLength())).assertEqual(1);
      expect(router.getStateByUrl('Component/FeatureComponent').length).assertEqual(0);
      expect(router.getStateByUrl('Video/VideoPage').length).assertEqual(0);
      expect(router.getStateByUrl('Component/SmartLifeComponent').length).assertEqual(0);
      expect(router.getStateByUrl('Video/VideoPage').length).assertEqual(0);
    });
  });
}
