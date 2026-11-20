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
import { TabState, SkeletonCard, PageModel, ActionLog, TABS, TAB_KEYS, DATA_ROWS,
  TAB_COUNT, DATA_ROW_COUNT, TAB_WIDTH, BAR_WIDTH, BAR_HEIGHT, BAR_RADIUS, BAR_TOP_MARGIN,
  DEFAULT_COLOR, TOGGLE_COLOR, SCROLL_LEFT, SCROLL_RIGHT, SELECT_FONT_SIZE, UNSELECT_FONT_SIZE,
  CARD_HEIGHT, CARD_RADIUS, IMAGE_WIDTH, IMAGE_HEIGHT, IMAGE_RADIUS, TOPIC_WIDTH, TOPIC_HEIGHT,
  TOPIC_RADIUS, ACTION_WIDTH, ACTION_HEIGHT, PADDING, ROW_HEIGHT, TITLE_HEIGHT, TEXT_HEIGHT,
  TEXT_GAP_HEIGHT, FLOAT_ENTRIES, INT_ENTRIES, COLOR_ENTRIES, floatOf, integerOf, colorOf,
  clampIndex, oracleDisplacement, oracleScrollFinal, oracleScrollTrail, oracleLinear, dragTotal,
  settleTargetIndex, settleRebounds, colorAfterToggles, uniqueCount, totalCells, sequenceTotal,
  rgbOf, luminanceOf, contrastOf, sanitizeLabel, isBlank, tabToPageKey, pageKeyToIndex,
  logFingerprint, expectedSelectedFont, selectedCountAt, barOffsetAt, isVisibleBar, wrapDisabled,
  percentage, average, maxOf, minOf, ascending, displacementInvariant, scrollInvariant } from '../Shared/SharedDriver';
import { logSuite } from '../Shared/Support';

export default function TabAccessibilityNavigationTest(): void {
  describe('TabAccessibilityNavigationTest', () => {
    beforeAll(() => {
      logSuite('TabAccessibilityNavigationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TabAccessibilityNavigationTest', 'end');
    });

    /**
     * @tc.name accessibilityNavigationToggleParitySweep
     * @tc.desc accessibilityNavigation baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('accessibilityNavigationToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 110; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(110);
      expect(model.color).assertEqual(colorAfterToggles(110));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name dragThenPathAllThenLayoutThenOther
     * @tc.desc A drag composed with AllThenLayoutThenOther preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 4];
      model.drag(58);
      expect(model.displacement).assertEqual(-
      58
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(4);
      expect(model.displacement).assertEqual(380 - 58);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:58'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name fontPathAllThenMotionThenOther
     * @tc.desc Font emphasis tracks the active tab while walking AllThenMotionThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 4];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        for (let tab = 0; tab < TAB_COUNT; tab++) {
          expect(expectedSelectedFont(tab, model.index)).assertEqual(tab === model.index ? SELECT_FONT_SIZE : UNSELECT_FONT_SIZE);
        }
      }
      expect(SELECT_FONT_SIZE - UNSELECT_FONT_SIZE).assertEqual(1);
      expect(selectedCountAt(model.index)).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
    });

    /**
     * @tc.name barPathAllThenThirdPartyThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenThirdPartyThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 2];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(barOffsetAt(model.index)).assertEqual(model.index * TAB_WIDTH);
        expect(model.displacement).assertEqual(barOffsetAt(model.index));
        expect(isVisibleBar(model.index, TAB_WIDTH * TAB_COUNT)).assertTrue();
      }
      expect(BAR_WIDTH < TAB_WIDTH).assertTrue();
      expect(model.displacement % TAB_WIDTH).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name swipePathAllThenOtherThenMotion
     * @tc.desc Swiper onChange over AllThenOtherThenMotion mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 4, 2];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(2);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name dragThenPathLayoutThenAllThenMotion
     * @tc.desc A drag composed with LayoutThenAllThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 2];
      model.drag(94);
      expect(model.displacement).assertEqual(-
      94
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(2);
      expect(model.displacement).assertEqual(190 - 94);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:94'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name historyPathLayoutThenMotionThenThirdParty
     * @tc.desc Selection history for LayoutThenMotionThenThirdParty records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 3];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.history[i]).assertEqual(
      'select:' + String(path[i]));
      }
      expect(model.history.length).assertEqual(path.length);
      expect(model.history[model.history.length - 1]).assertEqual('select:3');
      expect(model.history[0].indexOf(
      'select:'
      )).assertEqual(0);
      expect(uniqueCount(model.history) <= model.history.length).assertTrue();
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name swipePathLayoutThenThirdPartyThenMotion
     * @tc.desc Swiper onChange over LayoutThenThirdPartyThenMotion mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 3, 2];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(2);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(90);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name historyPathLayoutThenOtherThenMotion
     * @tc.desc Selection history for LayoutThenOtherThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 2];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.history[i]).assertEqual(
      'select:' + String(path[i]));
      }
      expect(model.history.length).assertEqual(path.length);
      expect(model.history[model.history.length - 1]).assertEqual('select:2');
      expect(model.history[0].indexOf(
      'select:'
      )).assertEqual(0);
      expect(uniqueCount(model.history) <= model.history.length).assertTrue();
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name roundTripMotionThenAllThenThirdParty
     * @tc.desc A forward and reverse tour of MotionThenAllThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 0, 3];
      const backward: number[] = [0, 2, 0];
      for (let i = 0; i < forward.length; i++) { model.select(forward[i]); }
      for (let i = 0; i < backward.length; i++) { model.select(backward[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
      expect(model.selects).assertEqual(forward.length + backward.length);
      expect(model.scrollX).assertEqual(oracleScrollFinal(forward.concat(backward)));
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history.length).assertEqual(forward.length + backward.length);
    });

    /**
     * @tc.name dragThenPathMotionThenLayoutThenThirdParty
     * @tc.desc A drag composed with MotionThenLayoutThenThirdParty preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathMotionThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 3];
      model.drag(67);
      expect(model.displacement).assertEqual(-
      67
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(3);
      expect(model.displacement).assertEqual(285 - 67);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:67'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name barPathMotionThenOtherThenAll
     * @tc.desc Indicator offsets stay on the tab grid while walking MotionThenOtherThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathMotionThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 4, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(barOffsetAt(model.index)).assertEqual(model.index * TAB_WIDTH);
        expect(model.displacement).assertEqual(barOffsetAt(model.index));
        expect(isVisibleBar(model.index, TAB_WIDTH * TAB_COUNT)).assertTrue();
      }
      expect(BAR_WIDTH < TAB_WIDTH).assertTrue();
      expect(model.displacement % TAB_WIDTH).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name scrollPathThirdPartyThenAllThenMotion
     * @tc.desc Scroll focus offsets along ThirdPartyThenAllThenMotion follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathThirdPartyThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 0, 2];
      const expected: number[] = [90, 90, 90];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.scrollX).assertEqual(expected[i]);
      }
      expect(model.scrollX).assertEqual(90);
      expect(expected.length).assertEqual(path.length);
      expect(model.path[0]).assertEqual(path[0]);
      expect(model.scrollX >= SCROLL_RIGHT && model.scrollX <= SCROLL_LEFT).assertTrue();
      expect(oracleScrollFinal(path)).assertEqual(90);
    });

    /**
     * @tc.name scrollPathThirdPartyThenLayoutThenThirdParty
     * @tc.desc Scroll focus offsets along ThirdPartyThenLayoutThenThirdParty follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathThirdPartyThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 1, 3];
      const expected: number[] = [90, -90, 90];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.scrollX).assertEqual(expected[i]);
      }
      expect(model.scrollX).assertEqual(90);
      expect(expected.length).assertEqual(path.length);
      expect(model.path[0]).assertEqual(path[0]);
      expect(model.scrollX >= SCROLL_RIGHT && model.scrollX <= SCROLL_LEFT).assertTrue();
      expect(oracleScrollFinal(path)).assertEqual(90);
    });

    /**
     * @tc.name fontPathThirdPartyThenMotionThenOther
     * @tc.desc Font emphasis tracks the active tab while walking ThirdPartyThenMotionThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathThirdPartyThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 2, 4];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        for (let tab = 0; tab < TAB_COUNT; tab++) {
          expect(expectedSelectedFont(tab, model.index)).assertEqual(tab === model.index ? SELECT_FONT_SIZE : UNSELECT_FONT_SIZE);
        }
      }
      expect(SELECT_FONT_SIZE - UNSELECT_FONT_SIZE).assertEqual(1);
      expect(selectedCountAt(model.index)).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
    });

    /**
     * @tc.name barPathOtherThenAllThenLayout
     * @tc.desc Indicator offsets stay on the tab grid while walking OtherThenAllThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathOtherThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 0, 1];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(barOffsetAt(model.index)).assertEqual(model.index * TAB_WIDTH);
        expect(model.displacement).assertEqual(barOffsetAt(model.index));
        expect(isVisibleBar(model.index, TAB_WIDTH * TAB_COUNT)).assertTrue();
      }
      expect(BAR_WIDTH < TAB_WIDTH).assertTrue();
      expect(model.displacement % TAB_WIDTH).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name roundTripOtherThenLayoutThenMotion
     * @tc.desc A forward and reverse tour of OtherThenLayoutThenMotion restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripOtherThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const forward: number[] = [4, 1, 2];
      const backward: number[] = [1, 4, 0];
      for (let i = 0; i < forward.length; i++) { model.select(forward[i]); }
      for (let i = 0; i < backward.length; i++) { model.select(backward[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
      expect(model.selects).assertEqual(forward.length + backward.length);
      expect(model.scrollX).assertEqual(oracleScrollFinal(forward.concat(backward)));
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history.length).assertEqual(forward.length + backward.length);
    });

    /**
     * @tc.name swipePathOtherThenMotionThenOther
     * @tc.desc Swiper onChange over OtherThenMotionThenOther mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathOtherThenMotionThenOther', 0, () => {
      const model = new TabState();
      const swipes: number[] = [4, 2, 4];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(4);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name barPathAllThenLayoutThenAllThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenLayoutThenAllThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenLayoutThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 0, 2];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(barOffsetAt(model.index)).assertEqual(model.index * TAB_WIDTH);
        expect(model.displacement).assertEqual(barOffsetAt(model.index));
        expect(isVisibleBar(model.index, TAB_WIDTH * TAB_COUNT)).assertTrue();
      }
      expect(BAR_WIDTH < TAB_WIDTH).assertTrue();
      expect(model.displacement % TAB_WIDTH).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name barPathAllThenLayoutThenMotionThenOther
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenLayoutThenMotionThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenLayoutThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2, 4];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(barOffsetAt(model.index)).assertEqual(model.index * TAB_WIDTH);
        expect(model.displacement).assertEqual(barOffsetAt(model.index));
        expect(isVisibleBar(model.index, TAB_WIDTH * TAB_COUNT)).assertTrue();
      }
      expect(BAR_WIDTH < TAB_WIDTH).assertTrue();
      expect(model.displacement % TAB_WIDTH).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name clickPathAllThenLayoutThenOtherThenMotion
     * @tc.desc Clicking AllThenLayoutThenOtherThenMotion updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenLayoutThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 4, 2];
      const trail: number[] = [0, -90, -90, -90];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.index).assertEqual(path[i]);
        expect(model.displacement).assertEqual(path[i] * TAB_WIDTH);
        expect(model.scrollX).assertEqual(trail[i]);
      }
      expect(model.index).assertEqual(2);
      expect(model.displacement).assertEqual(oracleDisplacement(path));
      expect(model.selects).assertEqual(path.length);
      expect(model.path.length).assertEqual(path.length);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name fontPathAllThenMotionThenLayoutThenMotion
     * @tc.desc Font emphasis tracks the active tab while walking AllThenMotionThenLayoutThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenMotionThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 1, 2];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        for (let tab = 0; tab < TAB_COUNT; tab++) {
          expect(expectedSelectedFont(tab, model.index)).assertEqual(tab === model.index ? SELECT_FONT_SIZE : UNSELECT_FONT_SIZE);
        }
      }
      expect(SELECT_FONT_SIZE - UNSELECT_FONT_SIZE).assertEqual(1);
      expect(selectedCountAt(model.index)).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
    });

    /**
     * @tc.name clickPathAllThenMotionThenOtherThenAll
     * @tc.desc Clicking AllThenMotionThenOtherThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenMotionThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 4, 0];
      const trail: number[] = [0, 0, 0, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.index).assertEqual(path[i]);
        expect(model.displacement).assertEqual(path[i] * TAB_WIDTH);
        expect(model.scrollX).assertEqual(trail[i]);
      }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(oracleDisplacement(path));
      expect(model.selects).assertEqual(path.length);
      expect(model.path.length).assertEqual(path.length);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name fontPathAllThenThirdPartyThenAllThenOther
     * @tc.desc Font emphasis tracks the active tab while walking AllThenThirdPartyThenAllThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenThirdPartyThenAllThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 0, 4];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        for (let tab = 0; tab < TAB_COUNT; tab++) {
          expect(expectedSelectedFont(tab, model.index)).assertEqual(tab === model.index ? SELECT_FONT_SIZE : UNSELECT_FONT_SIZE);
        }
      }
      expect(SELECT_FONT_SIZE - UNSELECT_FONT_SIZE).assertEqual(1);
      expect(selectedCountAt(model.index)).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
    });

    /**
     * @tc.name scrollPathAllThenThirdPartyThenMotionThenThirdParty
     * @tc.desc Scroll focus offsets along AllThenThirdPartyThenMotionThenThirdParty follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathAllThenThirdPartyThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 2, 3];
      const expected: number[] = [0, 90, 90, 90];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.scrollX).assertEqual(expected[i]);
      }
      expect(model.scrollX).assertEqual(90);
      expect(expected.length).assertEqual(path.length);
      expect(model.path[0]).assertEqual(path[0]);
      expect(model.scrollX >= SCROLL_RIGHT && model.scrollX <= SCROLL_LEFT).assertTrue();
      expect(oracleScrollFinal(path)).assertEqual(90);
    });

    /**
     * @tc.name barPathAllThenOtherThenAllThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenOtherThenAllThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenOtherThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 0, 2];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(barOffsetAt(model.index)).assertEqual(model.index * TAB_WIDTH);
        expect(model.displacement).assertEqual(barOffsetAt(model.index));
        expect(isVisibleBar(model.index, TAB_WIDTH * TAB_COUNT)).assertTrue();
      }
      expect(BAR_WIDTH < TAB_WIDTH).assertTrue();
      expect(model.displacement % TAB_WIDTH).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name roundTripAllThenOtherThenMotionThenAll
     * @tc.desc A forward and reverse tour of AllThenOtherThenMotionThenAll restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenOtherThenMotionThenAll', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 4, 2, 0];
      const backward: number[] = [2, 4, 0];
      for (let i = 0; i < forward.length; i++) { model.select(forward[i]); }
      for (let i = 0; i < backward.length; i++) { model.select(backward[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
      expect(model.selects).assertEqual(forward.length + backward.length);
      expect(model.scrollX).assertEqual(oracleScrollFinal(forward.concat(backward)));
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history.length).assertEqual(forward.length + backward.length);
    });

    /**
     * @tc.name swipePathLayoutThenAllThenLayoutThenAll
     * @tc.desc Swiper onChange over LayoutThenAllThenLayoutThenAll mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenAllThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 0, 1, 0];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(0);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(-90);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name barPathLayoutThenAllThenThirdPartyThenAll
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenAllThenThirdPartyThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenAllThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 3, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(barOffsetAt(model.index)).assertEqual(model.index * TAB_WIDTH);
        expect(model.displacement).assertEqual(barOffsetAt(model.index));
        expect(isVisibleBar(model.index, TAB_WIDTH * TAB_COUNT)).assertTrue();
      }
      expect(BAR_WIDTH < TAB_WIDTH).assertTrue();
      expect(model.displacement % TAB_WIDTH).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name roundTripLayoutThenMotionThenAllThenLayout
     * @tc.desc A forward and reverse tour of LayoutThenMotionThenAllThenLayout restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenMotionThenAllThenLayout', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 2, 0, 1];
      const backward: number[] = [0, 2, 1, 0];
      for (let i = 0; i < forward.length; i++) { model.select(forward[i]); }
      for (let i = 0; i < backward.length; i++) { model.select(backward[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
      expect(model.selects).assertEqual(forward.length + backward.length);
      expect(model.scrollX).assertEqual(oracleScrollFinal(forward.concat(backward)));
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history.length).assertEqual(forward.length + backward.length);
    });

    /**
     * @tc.name barPathLayoutThenMotionThenThirdPartyThenAll
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenMotionThenThirdPartyThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenMotionThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 3, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(barOffsetAt(model.index)).assertEqual(model.index * TAB_WIDTH);
        expect(model.displacement).assertEqual(barOffsetAt(model.index));
        expect(isVisibleBar(model.index, TAB_WIDTH * TAB_COUNT)).assertTrue();
      }
      expect(BAR_WIDTH < TAB_WIDTH).assertTrue();
      expect(model.displacement % TAB_WIDTH).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name fontPathLayoutThenThirdPartyThenAllThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenThirdPartyThenAllThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenThirdPartyThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 0, 1];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        for (let tab = 0; tab < TAB_COUNT; tab++) {
          expect(expectedSelectedFont(tab, model.index)).assertEqual(tab === model.index ? SELECT_FONT_SIZE : UNSELECT_FONT_SIZE);
        }
      }
      expect(SELECT_FONT_SIZE - UNSELECT_FONT_SIZE).assertEqual(1);
      expect(selectedCountAt(model.index)).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
    });

    /**
     * @tc.name fontPathLayoutThenThirdPartyThenMotionThenAll
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenThirdPartyThenMotionThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenThirdPartyThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 2, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        for (let tab = 0; tab < TAB_COUNT; tab++) {
          expect(expectedSelectedFont(tab, model.index)).assertEqual(tab === model.index ? SELECT_FONT_SIZE : UNSELECT_FONT_SIZE);
        }
      }
      expect(SELECT_FONT_SIZE - UNSELECT_FONT_SIZE).assertEqual(1);
      expect(selectedCountAt(model.index)).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
    });

    /**
     * @tc.name dragThenPathLayoutThenOtherThenAllThenLayout
     * @tc.desc A drag composed with LayoutThenOtherThenAllThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenOtherThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 0, 1];
      model.drag(58);
      expect(model.displacement).assertEqual(-
      58
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(1);
      expect(model.displacement).assertEqual(95 - 58);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:58'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name fontPathLayoutThenOtherThenThirdPartyThenAll
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenOtherThenThirdPartyThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenOtherThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 3, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        for (let tab = 0; tab < TAB_COUNT; tab++) {
          expect(expectedSelectedFont(tab, model.index)).assertEqual(tab === model.index ? SELECT_FONT_SIZE : UNSELECT_FONT_SIZE);
        }
      }
      expect(SELECT_FONT_SIZE - UNSELECT_FONT_SIZE).assertEqual(1);
      expect(selectedCountAt(model.index)).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
    });

    /**
     * @tc.name roundTripMotionThenAllThenMotionThenAll
     * @tc.desc A forward and reverse tour of MotionThenAllThenMotionThenAll restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenAllThenMotionThenAll', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 0, 2, 0];
      const backward: number[] = [2, 0, 2, 0];
      for (let i = 0; i < forward.length; i++) { model.select(forward[i]); }
      for (let i = 0; i < backward.length; i++) { model.select(backward[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
      expect(model.selects).assertEqual(forward.length + backward.length);
      expect(model.scrollX).assertEqual(oracleScrollFinal(forward.concat(backward)));
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history.length).assertEqual(forward.length + backward.length);
    });

    /**
     * @tc.name scrollPathMotionThenAllThenOtherThenLayout
     * @tc.desc Scroll focus offsets along MotionThenAllThenOtherThenLayout follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathMotionThenAllThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 4, 1];
      const expected: number[] = [0, 0, 0, -90];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.scrollX).assertEqual(expected[i]);
      }
      expect(model.scrollX).assertEqual(-90);
      expect(expected.length).assertEqual(path.length);
      expect(model.path[0]).assertEqual(path[0]);
      expect(model.scrollX >= SCROLL_RIGHT && model.scrollX <= SCROLL_LEFT).assertTrue();
      expect(oracleScrollFinal(path)).assertEqual(-90);
    });

    /**
     * @tc.name scrollPathMotionThenLayoutThenMotionThenThirdParty
     * @tc.desc Scroll focus offsets along MotionThenLayoutThenMotionThenThirdParty follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathMotionThenLayoutThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 2, 3];
      const expected: number[] = [0, -90, -90, 90];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.scrollX).assertEqual(expected[i]);
      }
      expect(model.scrollX).assertEqual(90);
      expect(expected.length).assertEqual(path.length);
      expect(model.path[0]).assertEqual(path[0]);
      expect(model.scrollX >= SCROLL_RIGHT && model.scrollX <= SCROLL_LEFT).assertTrue();
      expect(oracleScrollFinal(path)).assertEqual(90);
    });

    /**
     * @tc.name barPathMotionThenLayoutThenOtherThenThirdParty
     * @tc.desc Indicator offsets stay on the tab grid while walking MotionThenLayoutThenOtherThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathMotionThenLayoutThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 4, 3];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(barOffsetAt(model.index)).assertEqual(model.index * TAB_WIDTH);
        expect(model.displacement).assertEqual(barOffsetAt(model.index));
        expect(isVisibleBar(model.index, TAB_WIDTH * TAB_COUNT)).assertTrue();
      }
      expect(BAR_WIDTH < TAB_WIDTH).assertTrue();
      expect(model.displacement % TAB_WIDTH).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name scrollPathMotionThenThirdPartyThenMotionThenAll
     * @tc.desc Scroll focus offsets along MotionThenThirdPartyThenMotionThenAll follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathMotionThenThirdPartyThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 2, 0];
      const expected: number[] = [0, 90, 90, 90];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.scrollX).assertEqual(expected[i]);
      }
      expect(model.scrollX).assertEqual(90);
      expect(expected.length).assertEqual(path.length);
      expect(model.path[0]).assertEqual(path[0]);
      expect(model.scrollX >= SCROLL_RIGHT && model.scrollX <= SCROLL_LEFT).assertTrue();
      expect(oracleScrollFinal(path)).assertEqual(90);
    });

  });
}
