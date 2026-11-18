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
import { Component, Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { router } from '@kit.ArkUI';
import { KeyCode } from '@kit.InputKit';
import { UIAbility } from '@kit.AbilityKit';
import { globalIdle } from '../../../main/ets/utils/GlobalScreenSaver';
import { resolveSmartLifeDetailIndex } from './DetailIndexPolicy';
import { startAppWithRetry } from './TestScenarioUtils';

const PERSISTENCE_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};
const PRODUCTION_IDLE_TIME: number = 5 * 60 * 1000;
const TAB_SETTLE_TIME: number = 180;
const ROUTE_SETTLE_TIME: number = 260;
const SWIPE_SETTLE_TIME: number = 300;
const KEY_ACTION_TIME: number = 120;
const FLAG_CONSUME_TIME: number = 420;
const SMART_DETAIL_COUNT: number = 3;
const CONCURRENT_WRITE_COUNT: number = 12;
const STORED_INDEX_KEY: string = 'BeforeIndex';
const TAB_FLAG_KEY: string = 'isTab';
const NEW_WANT_FLAG_KEY: string = 'isOnNewWant';
const SMART_TITLES: string[] = ['Entertainment & AV', 'Child Care', 'Efficient Office'];

interface PersistenceRouteParams {
  index: number;
}

export default function appStoragePersistenceContractTest(): void {
  describe('AppStoragePersistenceContractTest', () => {
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
      await driver.assertComponentExist(ON.id('tab0'));
    };

    const openSmart = async (routeIndex: number): Promise<void> => {
      const params: PersistenceRouteParams = { index: routeIndex };
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: params });
      await driver.delayMs(ROUTE_SETTLE_TIME);
    };

    const readStoredIndex = (): number => {
      const value: number | undefined = AppStorage.get<number>(STORED_INDEX_KEY);
      return value === undefined ? -1 : value;
    };

    const indexIsValid = (index: number): boolean => {
      return index >= 0 && index < SMART_DETAIL_COUNT;
    };

    const swipeForwardOnce = async (): Promise<void> => {
      const firstArrow = await driver.findComponents(ON.id('SmartLifeComponent20'));
      const secondArrow = await driver.findComponents(ON.id('SmartLifeComponent21'));
      if (firstArrow !== null && firstArrow.length > 0) {
        await firstArrow[0].click();
      } else if (secondArrow !== null && secondArrow.length > 0) {
        await secondArrow[0].click();
      } else {
        const swiper: Component = await driver.findComponent(ON.type('Swiper'));
        const bounds = await swiper.getBounds();
        const y: number = (bounds.top + bounds.bottom) / 2;
        await driver.swipe(bounds.right - 180, y, bounds.left + 180, y, 180);
      }
      await driver.delayMs(SWIPE_SETTLE_TIME + 300);
    };

    beforeAll(async (): Promise<void> => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await startAppWithRetry(PERSISTENCE_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      ability = await delegator.getCurrentTopAbility();
      globalIdle.init(ability.context, PRODUCTION_IDLE_TIME);
      globalIdle.stopDetect();
      AppStorage.setOrCreate<number>(STORED_INDEX_KEY, -1);
      await restoreRoot();
    });

    beforeEach(async (): Promise<void> => {
      globalIdle.init(ability.context, PRODUCTION_IDLE_TIME);
      globalIdle.stopDetect();
      AppStorage.setOrCreate<number>(STORED_INDEX_KEY, -1);
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
      AppStorage.setOrCreate<number>(STORED_INDEX_KEY, -1);
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PERSIST_0100
     * @tc.name persistBeforeIndexBlurWriteFullLoop001
     * @tc.desc Verify the production blur path writes the selected Smart detail index and that page show alone never writes it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('persistBeforeIndexBlurWriteFullLoop001', 0, async (): Promise<void> => {
      expect(readStoredIndex()).assertEqual(-1);
      await openSmart(0);
      // A route-driven page show must not mutate the stored index; only the Swiper
      // blur handler writes BeforeIndex in SmartLifeComponent.
      expect(readStoredIndex()).assertEqual(-1);
      await swipeForwardOnce();
      await driver.assertComponentExist(ON.text('Child Care'));
      await driver.pressBack();
      await driver.delayMs(180);
      expect(readStoredIndex()).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PERSIST_0200
     * @tc.name persistBeforeIndexConcurrentStormValidResolution002
     * @tc.desc Verify concurrent BeforeIndex writes settle on a value that resolves to a legal scene
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('persistBeforeIndexConcurrentStormValidResolution002', 0, async (): Promise<void> => {
      const writes: Promise<number>[] = [];
      for (let writeIndex: number = 0; writeIndex < CONCURRENT_WRITE_COUNT; writeIndex++) {
        const value: number = writeIndex % 5 - 1; // cycles through -1,0,1,2,3
        writes.push(new Promise<number>((resolve: (value: number) => void): void => {
          AppStorage.setOrCreate<number>(STORED_INDEX_KEY, value);
          resolve(value);
        }));
      }
      const results: number[] = await Promise.all(writes);
      expect(results.length).assertEqual(CONCURRENT_WRITE_COUNT);
      const finalValue: number = readStoredIndex();
      const resolved: number = resolveSmartLifeDetailIndex(undefined, finalValue, SMART_DETAIL_COUNT);
      expect(indexIsValid(resolved)).assertTrue();
      // The same resolved index must be observable through a real invalid route.
      await openSmart(99);
      await driver.delayMs(600);
      expect(indexIsValid(resolved)).assertTrue();
      const resolvedTitleNodes = await driver.findComponents(ON.text(SMART_TITLES[resolved]));
      expect(resolvedTitleNodes !== null && resolvedTitleNodes.length === 1).assertTrue();
      const resolvedSwipers = await driver.findComponents(ON.type('Swiper'));
      expect(resolvedSwipers !== null && resolvedSwipers.length === 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PERSIST_0300
     * @tc.name persistBeforeIndexInvalidConcurrentUiRecovery003
     * @tc.desc Verify an invalid concurrent stored index still recovers through the production resolver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('persistBeforeIndexInvalidConcurrentUiRecovery003', 0, async (): Promise<void> => {
      const invalidValues: number[] = [-1, 99, 3, -7, 5];
      const writes: Promise<void>[] = [];
      for (let writeIndex: number = 0; writeIndex < invalidValues.length; writeIndex++) {
        const value: number = invalidValues[writeIndex];
        writes.push(new Promise<void>((resolve: () => void): void => {
          AppStorage.setOrCreate<number>(STORED_INDEX_KEY, value);
          resolve();
        }));
      }
      await Promise.all(writes);
      const resolved: number = resolveSmartLifeDetailIndex(undefined, readStoredIndex(), SMART_DETAIL_COUNT);
      expect(indexIsValid(resolved)).assertTrue();
      await openSmart(-1);
      await driver.delayMs(600);
      const recoveredTitleNodes = await driver.findComponents(ON.text(SMART_TITLES[resolved]));
      expect(recoveredTitleNodes !== null && recoveredTitleNodes.length === 1).assertTrue();
      const recoveredSwipers = await driver.findComponents(ON.type('Swiper'));
      expect(recoveredSwipers !== null && recoveredSwipers.length === 1).assertTrue();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_PERSIST_0400
     * @tc.name persistBeforeIndexCrossRouteIsolation004
     * @tc.desc Verify the stored Smart index never leaks into Feature detail resolution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('persistBeforeIndexCrossRouteIsolation004', 0, async (): Promise<void> => {
      AppStorage.setOrCreate<number>(STORED_INDEX_KEY, 2);
      const params: PersistenceRouteParams = { index: 0 };
      await router.pushUrl({ url: 'Component/FeatureComponent', params: params }, router.RouterMode.Single);
      await driver.delayMs(ROUTE_SETTLE_TIME);
      expect((await driver.findComponents(ON.text('Universal Interconnection'))).length).assertEqual(1);
      // Feature detail rendering does not touch the Smart persistence key.
      expect(readStoredIndex()).assertEqual(2);
    });









  });
}
