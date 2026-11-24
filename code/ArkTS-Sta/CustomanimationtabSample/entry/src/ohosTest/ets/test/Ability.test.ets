'use static';
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
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { TAB_COUNT, TAB_WIDTH, DATA_ROW_COUNT, DEFAULT_COLOR, TABS } from './Shared/SharedDriver';
import { logSuite } from './Shared/Support';

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      logSuite('ActsAbilityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ActsAbilityTest', 'end');
    });

    /**
     * @tc.name moduleExposesFiveTabLabels
     * @tc.desc Module exports five labels on a four hundred seventy five vp track.
     * @tc.type Function
     * @tc.level Level0
     */
    it('moduleExposesFiveTabLabels', 0, () => {
      expect(TABS.length).assertEqual(TAB_COUNT);
      expect(TAB_COUNT).assertEqual(5);
      expect(TABS.length * TAB_WIDTH).assertEqual(475);
    });

    /**
     * @tc.name dataModelCarriesEightRows
     * @tc.desc Data model holds eight rows and forty swiper cells.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dataModelCarriesEightRows', 0, () => {
      expect(DATA_ROW_COUNT).assertEqual(8);
      expect(DATA_ROW_COUNT * TAB_COUNT).assertEqual(40);
    });

    /**
     * @tc.name defaultIndicatorStartsGray
     * @tc.desc Indicator starts on the neutral grey before any colour toggle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('defaultIndicatorStartsGray', 0, () => {
      expect(DEFAULT_COLOR).assertEqual('#C0C0C0');
      expect(DEFAULT_COLOR.length).assertEqual(7);
    });

    /**
     * @tc.name tabPitchMatchesIndicatorGeometry
     * @tc.desc Tab pitch exceeds the ninety vp indicator bar by a five vp gap.
     * @tc.type Function
     * @tc.level Level2
     */
    it('tabPitchMatchesIndicatorGeometry', 0, () => {
      expect(TAB_WIDTH).assertEqual(95);
      expect(TAB_WIDTH * 4).assertEqual(380);
      expect(TAB_WIDTH * 5).assertEqual(475);
    });
  });
}
