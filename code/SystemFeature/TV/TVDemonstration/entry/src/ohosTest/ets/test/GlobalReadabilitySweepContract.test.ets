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
import { display, router } from '@kit.ArkUI';
import { startAppWithRetry } from './TestScenarioUtils';

const READABILITY_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};
const TAB_SETTLE_TIME: number = 180;
const ROUTE_SETTLE_TIME: number = 260;
const BACK_SETTLE_TIME: number = 180;
const PLACEHOLDER_UNDEFINED: string = 'undefined';
const PLACEHOLDER_NULL: string = 'null';
const PLACEHOLDER_NAN: string = 'NaN';

interface ReadabilitySnapshot {
  meaningfulCount: number;
  placeholderCount: number;
  outOfBoundsCount: number;
}

interface ReadabilityRouteParams {
  index: number;
}

export default function globalReadabilitySweepContractTest(): void {
  describe('GlobalReadabilitySweepContractTest', () => {
    let driver: Driver;
    let displayWidth: number = 0;
    let displayHeight: number = 0;

    const isPlaceholderLiteral = (value: string): boolean => {
      const normalized: string = value.trim().toLowerCase();
      return normalized === PLACEHOLDER_UNDEFINED || normalized === PLACEHOLDER_NULL || normalized === PLACEHOLDER_NAN;
    };

    const captureReadability = async (): Promise<ReadabilitySnapshot> => {
      const texts: Component[] = await driver.findComponents(ON.type('Text'));
      let meaningfulCount: number = 0;
      let placeholderCount: number = 0;
      let outOfBoundsCount: number = 0;
      for (let textIndex: number = 0; textIndex < texts.length; textIndex++) {
        const value: string = (await texts[textIndex].getText()) || '';
        if (isPlaceholderLiteral(value)) {
          placeholderCount++;
          continue;
        }
        if (value.trim().length > 0) {
          meaningfulCount++;
        }
        const bounds: Rect = await texts[textIndex].getBounds();
        if (bounds.right > displayWidth + 1 || bounds.bottom > displayHeight + 1 ||
          bounds.left < -1 || bounds.top < -1) {
          outOfBoundsCount++;
        }
      }
      return {
        meaningfulCount: meaningfulCount,
        placeholderCount: placeholderCount,
        outOfBoundsCount: outOfBoundsCount
      };
    };

    const assertReadable = async (floor: number): Promise<void> => {
      const snapshot: ReadabilitySnapshot = await captureReadability();
      expect(snapshot.placeholderCount).assertEqual(0);
      expect(snapshot.outOfBoundsCount).assertEqual(0);
      expect(snapshot.meaningfulCount).assertLargerOrEqual(floor);
    };

    const openTab = async (tabIndex: number): Promise<void> => {
      const tab: Component = await driver.findComponent(ON.id('tab' + tabIndex.toString()));
      await tab.click();
      await driver.delayMs(TAB_SETTLE_TIME);
    };

    const openFeature = async (index: number): Promise<void> => {
      const params: ReadabilityRouteParams = { index: index };
      await router.pushUrl({ url: 'Component/FeatureComponent', params: params }, router.RouterMode.Single);
      await driver.delayMs(ROUTE_SETTLE_TIME);
    };

    const openSmart = async (index: number): Promise<void> => {
      const params: ReadabilityRouteParams = { index: index };
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: params });
      await driver.delayMs(ROUTE_SETTLE_TIME);
    };

    const backToRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(BACK_SETTLE_TIME);
        state = router.getState();
      }
      await driver.assertComponentExist(ON.id('tab0'));
    };

    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(READABILITY_WANT, 'com.sample.demonstration');
      driver = Driver.create();
      await driver.delayMs(500);
      const defaultDisplay: display.Display = display.getDefaultDisplaySync();
      displayWidth = defaultDisplay.width;
      displayHeight = defaultDisplay.height;
      await backToRoot();
    });

    beforeEach(async (): Promise<void> => {
      await backToRoot();
    });

    afterEach(async (): Promise<void> => {
      await driver.delayMs(50);
    });

    afterAll(async (): Promise<void> => {
      await driver.pressHome();
    });



    /**
     * @tc.number SUB_TV_DEMONSTRATION_READABILITY_0300
     * @tc.name readabilitySmartLifePage003
     * @tc.desc Verify the Smart Life page exposes a readable scene catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readabilitySmartLifePage003', 0, async (): Promise<void> => {
      await openTab(2);
      await assertReadable(8);
      const titles: string[] = ['Entertainment & AV', 'Child Care', 'Efficient Office'];
      for (let titleIndex: number = 0; titleIndex < titles.length; titleIndex++) {
        expect((await driver.findComponents(ON.text(titles[titleIndex]))).length).assertEqual(1);
      }
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_READABILITY_0500
     * @tc.name readabilityFeatureDetailFirst005
     * @tc.desc Verify the first Feature detail keeps a readable in-bounds text tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readabilityFeatureDetailFirst005', 0, async (): Promise<void> => {
      await openFeature(0);
      await assertReadable(7);
      expect((await driver.findComponents(ON.text('Universal Interconnection'))).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_READABILITY_0600
     * @tc.name readabilityFeatureDetailLast006
     * @tc.desc Verify the last Feature detail keeps a readable in-bounds text tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readabilityFeatureDetailLast006', 0, async (): Promise<void> => {
      await openFeature(6);
      await assertReadable(7);
      expect((await driver.findComponents(ON.text('Distributed'))).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_READABILITY_0700
     * @tc.name readabilitySmartDetail007
     * @tc.desc Verify a Smart Life detail keeps a readable in-bounds tree with its video scene
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readabilitySmartDetail007', 0, async (): Promise<void> => {
      await openSmart(0);
      await assertReadable(7);
      expect((await driver.findComponents(ON.text('Entertainment & AV'))).length).assertEqual(1);
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
    });


    /**
     * @tc.number SUB_TV_DEMONSTRATION_READABILITY_0900
     * @tc.name readabilityVideoPage009
     * @tc.desc Verify VideoPage mounts a single in-bounds player without placeholder text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readabilityVideoPage009', 0, async (): Promise<void> => {
      await router.pushUrl({ url: 'Video/VideoPage' });
      await driver.delayMs(ROUTE_SETTLE_TIME);
      const snapshot: ReadabilitySnapshot = await captureReadability();
      expect(snapshot.placeholderCount).assertEqual(0);
      expect(snapshot.outOfBoundsCount).assertEqual(0);
      expect((await driver.findComponents(ON.type('Video'))).length).assertEqual(1);
    });



    /**
     * @tc.number SUB_TV_DEMONSTRATION_READABILITY_1200
     * @tc.name readabilityAllPagesPlaceholderFree012
     * @tc.desc Verify the whole reachable screen never renders a placeholder literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('readabilityAllPagesPlaceholderFree012', 0, async (): Promise<void> => {
      let totalPlaceholders: number = 0;
      const tabIndexes: number[] = [0, 1, 2, 3];
      for (let tabIndex: number = 0; tabIndex < tabIndexes.length; tabIndex++) {
        await openTab(tabIndexes[tabIndex]);
        totalPlaceholders += (await captureReadability()).placeholderCount;
      }
      await openFeature(0);
      totalPlaceholders += (await captureReadability()).placeholderCount;
      await backToRoot();
      await openSmart(1);
      totalPlaceholders += (await captureReadability()).placeholderCount;
      expect(totalPlaceholders).assertEqual(0);
    });
  });
}
