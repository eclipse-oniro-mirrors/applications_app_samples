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
import { describe, expect, it } from '@ohos/hypium';
import {
  ClickResult,
  SCROLL_OFFSET_NONE,
  SCROLL_OFFSET_TAB_ONE,
  SCROLL_OFFSET_TAB_THREE,
  TAB_WIDTH,
  TabConsistencyModel,
  TabLayoutModel,
  expectedClickDelta,
  expectedScrollOffset,
  isIndexValid,
} from '../Shared/CustomAnimationTabFixtures';

/**
 * Pure model suite for backgroundBarDisplacement.
 * The production page moves the highlight by (index - swiperIndex) * 95 and
 * subtracts the horizontal scroll delta in onDidScroll.
 */
export default function tabLayoutModelTest(): void {
  describe('TabLayoutModelTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_0100
    // @tc.name tabLayoutModelTest001
    // @tc.desc Verify a new layout model starts at zero displacement.
    it('tabLayoutModelTest001', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      expect(layout.currentDisplacement()).assertEqual(0);
      expect(layout.scrollEventCount()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_0200
    // @tc.name tabLayoutModelTest002
    // @tc.desc Verify the click delta for a one-step move is 95.
    it('tabLayoutModelTest002', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      expect(layout.deltaForClick(0, 1)).assertEqual(TAB_WIDTH);
      expect(layout.deltaForClick(0, 1)).assertEqual(95);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_0300
    // @tc.name tabLayoutModelTest003
    // @tc.desc Verify the click delta for a four-step move is 380.
    it('tabLayoutModelTest003', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      expect(layout.deltaForClick(0, 4)).assertEqual(380);
      expect(layout.deltaForClick(4, 0)).assertEqual(-380);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_0400
    // @tc.name tabLayoutModelTest004
    // @tc.desc Verify a valid click applies the computed delta.
    it('tabLayoutModelTest004', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      const result: ClickResult = layout.applyClick(0, 2);
      expect(result.accepted).assertTrue();
      expect(result.displacementDelta).assertEqual(190);
      expect(layout.currentDisplacement()).assertEqual(190);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_0500
    // @tc.name tabLayoutModelTest005
    // @tc.desc Verify clicks to tab 1 and 3 return the production scroll offsets.
    it('tabLayoutModelTest005', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      expect(layout.applyClick(0, 1).scrollOffset).assertEqual(
        SCROLL_OFFSET_TAB_ONE,
      );
      expect(layout.applyClick(1, 3).scrollOffset).assertEqual(
        SCROLL_OFFSET_TAB_THREE,
      );
      expect(layout.applyClick(3, 2).scrollOffset).assertEqual(
        SCROLL_OFFSET_NONE,
      );
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_0600
    // @tc.name tabLayoutModelTest006
    // @tc.desc Verify invalid source or target indices are rejected.
    it('tabLayoutModelTest006', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      expect(layout.applyClick(-1, 2).accepted).assertFalse();
      expect(layout.applyClick(0, 5).accepted).assertFalse();
      expect(layout.currentDisplacement()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_0700
    // @tc.name tabLayoutModelTest007
    // @tc.desc Verify a positive scroll offset reduces displacement.
    it('tabLayoutModelTest007', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      layout.applyClick(0, 3);
      expect(layout.onScroll(90)).assertEqual(195);
      expect(layout.scrollEventCount()).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_0800
    // @tc.name tabLayoutModelTest008
    // @tc.desc Verify a negative scroll offset increases displacement.
    it('tabLayoutModelTest008', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      layout.onScroll(-90);
      expect(layout.currentDisplacement()).assertEqual(90);
      layout.onScroll(-10);
      expect(layout.currentDisplacement()).assertEqual(100);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_0900
    // @tc.name tabLayoutModelTest009
    // @tc.desc Verify reset clears displacement and scroll event count.
    it('tabLayoutModelTest009', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      layout.applyClick(0, 2);
      layout.onScroll(30);
      layout.reset();
      expect(layout.currentDisplacement()).assertEqual(0);
      expect(layout.scrollEventCount()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_1000
    // @tc.name tabLayoutModelTest010
    // @tc.desc Verify expected left positions follow index * 95.
    it('tabLayoutModelTest010', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      for (let index: number = 0; index < 5; index++) {
        expect(layout.expectedLeftFor(index)).assertEqual(index * TAB_WIDTH);
      }
      expect(layout.expectedLeftFor(4)).assertEqual(380);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_1100
    // @tc.name tabLayoutModelTest011
    // @tc.desc Verify sequential forward clicks accumulate to 380.
    it('tabLayoutModelTest011', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      for (let index: number = 1; index < 5; index++) {
        layout.applyClick(index - 1, index);
      }
      expect(layout.currentDisplacement()).assertEqual(380);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_1200
    // @tc.name tabLayoutModelTest012
    // @tc.desc Verify returning to tab 0 restores zero displacement.
    it('tabLayoutModelTest012', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      layout.applyClick(0, 4);
      expect(layout.currentDisplacement()).assertEqual(380);
      layout.applyClick(4, 0);
      expect(layout.currentDisplacement()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_1300
    // @tc.name tabLayoutModelTest013
    // @tc.desc Verify equal indices produce a zero delta.
    it('tabLayoutModelTest013', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      const result: ClickResult = layout.applyClick(2, 2);
      expect(result.accepted).assertTrue();
      expect(result.displacementDelta).assertEqual(0);
      expect(layout.currentDisplacement()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_1400
    // @tc.name tabLayoutModelTest014
    // @tc.desc Verify 100 endpoint clicks do not drift.
    it('tabLayoutModelTest014', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      for (let round: number = 0; round < 100; round++) {
        layout.applyClick(0, 4);
        layout.applyClick(4, 0);
      }
      expect(layout.currentDisplacement()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_1500
    // @tc.name tabLayoutModelTest015
    // @tc.desc Verify the helper delta matches the model delta.
    it('tabLayoutModelTest015', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      for (let from: number = 0; from < 5; from++) {
        for (let to: number = 0; to < 5; to++) {
          expect(layout.deltaForClick(from, to)).assertEqual(
            expectedClickDelta(from, to),
          );
        }
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_1600
    // @tc.name tabLayoutModelTest016
    // @tc.desc Verify scroll offsets are defined for all five tabs.
    it('tabLayoutModelTest016', 0, (): void => {
      expect(expectedScrollOffset(0)).assertEqual(0);
      expect(expectedScrollOffset(1)).assertEqual(-90);
      expect(expectedScrollOffset(2)).assertEqual(0);
      expect(expectedScrollOffset(3)).assertEqual(90);
      expect(expectedScrollOffset(4)).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_1700
    // @tc.name tabLayoutModelTest017
    // @tc.desc Verify displacement after 0 -> 4 -> 2 is 190.
    it('tabLayoutModelTest017', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      layout.applyClick(0, 4);
      layout.applyClick(4, 2);
      expect(layout.currentDisplacement()).assertEqual(190);
      expect(TabConsistencyModel.displacementMatches(4, 2, -190)).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_1800
    // @tc.name tabLayoutModelTest018
    // @tc.desc Verify scroll then click composes without corruption.
    it('tabLayoutModelTest018', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      layout.onScroll(30);
      layout.applyClick(0, 2);
      expect(layout.currentDisplacement()).assertEqual(160);
      expect(layout.scrollEventCount()).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_1900
    // @tc.name tabLayoutModelTest019
    // @tc.desc Verify ten scroll events of 9 subtract 90 in total.
    it('tabLayoutModelTest019', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      for (let event: number = 0; event < 10; event++) {
        layout.onScroll(9);
      }
      expect(layout.currentDisplacement()).assertEqual(-90);
      expect(layout.scrollEventCount()).assertEqual(10);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_LAYOUT_2000
    // @tc.name tabLayoutModelTest020
    // @tc.desc Verify click results are valid for every index pair.
    it('tabLayoutModelTest020', 0, (): void => {
      const layout: TabLayoutModel = new TabLayoutModel();
      for (let from: number = 0; from < 5; from++) {
        for (let to: number = 0; to < 5; to++) {
          const result: ClickResult = layout.applyClick(from, to);
          expect(result.accepted).assertTrue();
          expect(isIndexValid(result.from)).assertTrue();
          expect(isIndexValid(result.to)).assertTrue();
          expect(result.displacementDelta).assertEqual(
            expectedClickDelta(from, to),
          );
          layout.reset();
        }
      }
    });
  });
}
