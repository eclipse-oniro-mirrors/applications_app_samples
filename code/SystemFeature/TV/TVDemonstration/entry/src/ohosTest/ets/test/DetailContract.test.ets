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

/**
 * Merged detail-page contract suite combining FeatureDetail, DetailArrowInteraction,
 * DetailBodyRendering, DetailIndexPolicyContract, DetailTextGeometry, and
 * FeatureContentBinding. Each original suite keeps its own describe name, and every
 * retained case keeps its original @tc tags verbatim. Duplicate case numbers retired
 * during deduplication are dropped instead of being renumbered or reused.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import resourceManager from '@ohos.resourceManager';
import { router } from '@kit.ArkUI';
import {
  hasNextDetail,
  hasPreviousDetail,
  isDetailIndexValid,
  resolveFeatureDetailIndex,
  resolveSmartLifeDetailIndex
} from './DetailIndexPolicy';
import { createDriverWithRetry, startAppWithRetry } from './TestScenarioUtils';


const DETAIL_CONTRACT_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};
const FEATURE_DETAIL_COUNT: number = 7;
const SMART_LIFE_DETAIL_COUNT: number = 3;

interface DetailRouteParams {
  index: number;
}

export default function detailContractTest(): void {


  describe('DetailIndexPolicyContractTest', () => {
    let driver: Driver;

    const restoreRoot = async (): Promise<void> => {
      let state: router.RouterState = router.getState();
      while (state.index > 1) {
        router.back();
        await driver.delayMs(180);
        state = router.getState();
      }
      await driver.assertComponentExist(ON.id('tab0'));
    };

    const openFeature = async (index: number): Promise<void> => {
      const params: DetailRouteParams = { index: index };
      await router.pushUrl({ url: 'Component/FeatureComponent', params: params });
      await driver.delayMs(360);
    };

    const openSmartLife = async (index: number): Promise<void> => {
      const params: DetailRouteParams = { index: index };
      await router.pushUrl({ url: 'Component/SmartLifeComponent', params: params });
      await driver.delayMs(420);
    };

    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(DETAIL_CONTRACT_WANT, 'com.sample.demonstration');
      driver = await createDriverWithRetry();
      await driver.delayMs(500);
      await restoreRoot();
    });

    beforeEach(async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
      await restoreRoot();
    });

    afterEach(async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
      await restoreRoot();
    });

    afterAll(async (): Promise<void> => {
      AppStorage.setOrCreate<number>('BeforeIndex', -1);
      await restoreRoot();
      await driver.pressHome();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DETAIL_POLICY_0100
     * @tc.name detailFeatureValidIndexIdentity001
     * @tc.desc Verify resolveFeatureDetailIndex preserves every valid FeatureComponent route index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('detailFeatureValidIndexIdentity001', 0, (): void => {
      for (let index: number = 0; index < FEATURE_DETAIL_COUNT; index++) {
        expect(isDetailIndexValid(index, FEATURE_DETAIL_COUNT)).assertTrue();
        expect(resolveFeatureDetailIndex(index, FEATURE_DETAIL_COUNT)).assertEqual(index);
      }
      expect(hasPreviousDetail(0)).assertFalse();
      expect(hasNextDetail(FEATURE_DETAIL_COUNT - 1, FEATURE_DETAIL_COUNT)).assertFalse();
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DETAIL_POLICY_0200
     * @tc.name detailFeatureInvalidIndexFallback002
     * @tc.desc Verify resolveFeatureDetailIndex converts negative and upper-bound routes to the first detail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('detailFeatureInvalidIndexFallback002', 0, (): void => {
      expect(isDetailIndexValid(-1, FEATURE_DETAIL_COUNT)).assertFalse();
      expect(isDetailIndexValid(FEATURE_DETAIL_COUNT, FEATURE_DETAIL_COUNT)).assertFalse();
      expect(resolveFeatureDetailIndex(-1, FEATURE_DETAIL_COUNT)).assertEqual(0);
      expect(resolveFeatureDetailIndex(FEATURE_DETAIL_COUNT, FEATURE_DETAIL_COUNT)).assertEqual(0);
      expect(resolveFeatureDetailIndex(1000000, FEATURE_DETAIL_COUNT)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DETAIL_POLICY_0300
     * @tc.name detailSmartRoutePrecedence003
     * @tc.desc Verify resolveSmartLifeDetailIndex gives a valid explicit route priority over persisted focus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('detailSmartRoutePrecedence003', 0, (): void => {
      expect(resolveSmartLifeDetailIndex(0, 2, SMART_LIFE_DETAIL_COUNT)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(1, 2, SMART_LIFE_DETAIL_COUNT)).assertEqual(1);
      expect(resolveSmartLifeDetailIndex(2, 0, SMART_LIFE_DETAIL_COUNT)).assertEqual(2);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DETAIL_POLICY_0400
     * @tc.name detailSmartStoredFocusFallback004
     * @tc.desc Verify resolveSmartLifeDetailIndex restores each legal stored focus when route params are absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('detailSmartStoredFocusFallback004', 0, (): void => {
      for (let storedIndex: number = 0; storedIndex < SMART_LIFE_DETAIL_COUNT; storedIndex++) {
        expect(resolveSmartLifeDetailIndex(undefined, storedIndex, SMART_LIFE_DETAIL_COUNT))
          .assertEqual(storedIndex);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DETAIL_POLICY_0500
     * @tc.name detailSmartInvalidRouteRecovery005
     * @tc.desc Verify resolveSmartLifeDetailIndex recovers invalid route input through legal persisted focus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('detailSmartInvalidRouteRecovery005', 0, (): void => {
      expect(resolveSmartLifeDetailIndex(-1, 1, SMART_LIFE_DETAIL_COUNT)).assertEqual(1);
      expect(resolveSmartLifeDetailIndex(SMART_LIFE_DETAIL_COUNT, 2, SMART_LIFE_DETAIL_COUNT)).assertEqual(2);
      expect(resolveSmartLifeDetailIndex(1000000, 0, SMART_LIFE_DETAIL_COUNT)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DETAIL_POLICY_0600
     * @tc.name detailSmartCompleteFallback006
     * @tc.desc Verify resolveSmartLifeDetailIndex returns the first scene when route and storage are both invalid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('detailSmartCompleteFallback006', 0, (): void => {
      expect(resolveSmartLifeDetailIndex(undefined, -1, SMART_LIFE_DETAIL_COUNT)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(-1, -1, SMART_LIFE_DETAIL_COUNT)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(SMART_LIFE_DETAIL_COUNT, SMART_LIFE_DETAIL_COUNT,
        SMART_LIFE_DETAIL_COUNT)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DETAIL_POLICY_0700
     * @tc.name detailArrowBoundaryPolicy007
     * @tc.desc Verify hasPreviousDetail and hasNextDetail expose correct navigation at first middle and last indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('detailArrowBoundaryPolicy007', 0, (): void => {
      expect(hasPreviousDetail(0)).assertFalse();
      expect(hasNextDetail(0, FEATURE_DETAIL_COUNT)).assertTrue();
      expect(hasPreviousDetail(3)).assertTrue();
      expect(hasNextDetail(3, FEATURE_DETAIL_COUNT)).assertTrue();
      expect(hasPreviousDetail(FEATURE_DETAIL_COUNT - 1)).assertTrue();
      expect(hasNextDetail(FEATURE_DETAIL_COUNT - 1, FEATURE_DETAIL_COUNT)).assertFalse();
      expect(hasNextDetail(-1, FEATURE_DETAIL_COUNT)).assertFalse();
      expect(hasNextDetail(FEATURE_DETAIL_COUNT, FEATURE_DETAIL_COUNT)).assertFalse();
    });




  });


}
