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

export default function SkeletonStateManagerValidationTest(): void {
  describe('SkeletonStateManagerValidationTest', () => {
    beforeAll(() => {
      logSuite('SkeletonStateManagerValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SkeletonStateManagerValidationTest', 'end');
    });

    /**
     * @tc.name skeletonStateManagerValidationToggleParitySweep
     * @tc.desc skeletonStateManagerValidation baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('skeletonStateManagerValidationToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 96; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(96);
      expect(model.color).assertEqual(colorAfterToggles(96));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name barPathLayoutThenAll
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0];
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
     * @tc.name fontPathLayoutThenMotion
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2];
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
     * @tc.name scrollPathLayoutThenThirdParty
     * @tc.desc Scroll focus offsets along LayoutThenThirdParty follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3];
      const expected: number[] = [-90, 90];
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
     * @tc.name dragThenPathLayoutThenThirdParty
     * @tc.desc A drag composed with LayoutThenThirdParty preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3];
      model.drag(49);
      expect(model.displacement).assertEqual(-
      49
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(3);
      expect(model.displacement).assertEqual(285 - 49);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:49'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name scrollPathMotionThenAll
     * @tc.desc Scroll focus offsets along MotionThenAll follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0];
      const expected: number[] = [0, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.scrollX).assertEqual(expected[i]);
      }
      expect(model.scrollX).assertEqual(0);
      expect(expected.length).assertEqual(path.length);
      expect(model.path[0]).assertEqual(path[0]);
      expect(model.scrollX >= SCROLL_RIGHT && model.scrollX <= SCROLL_LEFT).assertTrue();
      expect(oracleScrollFinal(path)).assertEqual(0);
    });

    /**
     * @tc.name clickPathMotionThenLayout
     * @tc.desc Clicking MotionThenLayout updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1];
      const trail: number[] = [0, -90];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.index).assertEqual(path[i]);
        expect(model.displacement).assertEqual(path[i] * TAB_WIDTH);
        expect(model.scrollX).assertEqual(trail[i]);
      }
      expect(model.index).assertEqual(1);
      expect(model.displacement).assertEqual(oracleDisplacement(path));
      expect(model.selects).assertEqual(path.length);
      expect(model.path.length).assertEqual(path.length);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name fontPathMotionThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3];
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
     * @tc.name dragThenPathMotionThenOther
     * @tc.desc A drag composed with MotionThenOther preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 4];
      model.drag(85);
      expect(model.displacement).assertEqual(-
      85
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(4);
      expect(model.displacement).assertEqual(380 - 85);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:85'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name clickPathThirdPartyThenMotion
     * @tc.desc Clicking ThirdPartyThenMotion updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 2];
      const trail: number[] = [90, 90];
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
     * @tc.name historyPathThirdPartyThenOther
     * @tc.desc Selection history for ThirdPartyThenOther records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 4];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.history[i]).assertEqual(
      'select:' + String(path[i]));
      }
      expect(model.history.length).assertEqual(path.length);
      expect(model.history[model.history.length - 1]).assertEqual('select:4');
      expect(model.history[0].indexOf(
      'select:'
      )).assertEqual(0);
      expect(uniqueCount(model.history) <= model.history.length).assertTrue();
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name barPathOtherThenLayout
     * @tc.desc Indicator offsets stay on the tab grid while walking OtherThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 1];
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
     * @tc.name fontPathOtherThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking OtherThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 3];
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
     * @tc.name barPathAllThenLayoutThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenLayoutThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2];
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
     * @tc.name scrollPathAllThenMotionThenAll
     * @tc.desc Scroll focus offsets along AllThenMotionThenAll follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathAllThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 0];
      const expected: number[] = [0, 0, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.scrollX).assertEqual(expected[i]);
      }
      expect(model.scrollX).assertEqual(0);
      expect(expected.length).assertEqual(path.length);
      expect(model.path[0]).assertEqual(path[0]);
      expect(model.scrollX >= SCROLL_RIGHT && model.scrollX <= SCROLL_LEFT).assertTrue();
      expect(oracleScrollFinal(path)).assertEqual(0);
    });

    /**
     * @tc.name scrollPathAllThenMotionThenOther
     * @tc.desc Scroll focus offsets along AllThenMotionThenOther follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathAllThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 4];
      const expected: number[] = [0, 0, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.scrollX).assertEqual(expected[i]);
      }
      expect(model.scrollX).assertEqual(0);
      expect(expected.length).assertEqual(path.length);
      expect(model.path[0]).assertEqual(path[0]);
      expect(model.scrollX >= SCROLL_RIGHT && model.scrollX <= SCROLL_LEFT).assertTrue();
      expect(oracleScrollFinal(path)).assertEqual(0);
    });

    /**
     * @tc.name historyPathAllThenThirdPartyThenMotion
     * @tc.desc Selection history for AllThenThirdPartyThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 2];
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
     * @tc.name historyPathAllThenOtherThenMotion
     * @tc.desc Selection history for AllThenOtherThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 2];
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
     * @tc.name swipePathLayoutThenAllThenThirdParty
     * @tc.desc Swiper onChange over LayoutThenAllThenThirdParty mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 0, 3];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(3);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(90);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name clickPathLayoutThenMotionThenThirdParty
     * @tc.desc Clicking LayoutThenMotionThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 3];
      const trail: number[] = [-90, -90, 90];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.index).assertEqual(path[i]);
        expect(model.displacement).assertEqual(path[i] * TAB_WIDTH);
        expect(model.scrollX).assertEqual(trail[i]);
      }
      expect(model.index).assertEqual(3);
      expect(model.displacement).assertEqual(oracleDisplacement(path));
      expect(model.selects).assertEqual(path.length);
      expect(model.path.length).assertEqual(path.length);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name dragThenPathLayoutThenThirdPartyThenLayout
     * @tc.desc A drag composed with LayoutThenThirdPartyThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 1];
      model.drag(103);
      expect(model.displacement).assertEqual(-
      103
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(1);
      expect(model.displacement).assertEqual(95 - 103);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:103'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name roundTripLayoutThenOtherThenMotion
     * @tc.desc A forward and reverse tour of LayoutThenOtherThenMotion restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 4, 2];
      const backward: number[] = [4, 1, 0];
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
     * @tc.name fontPathMotionThenAllThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenAllThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 3];
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
     * @tc.name barPathMotionThenLayoutThenThirdParty
     * @tc.desc Indicator offsets stay on the tab grid while walking MotionThenLayoutThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathMotionThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 3];
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
     * @tc.name roundTripMotionThenThirdPartyThenMotion
     * @tc.desc A forward and reverse tour of MotionThenThirdPartyThenMotion restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 3, 2];
      const backward: number[] = [3, 2, 0];
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
     * @tc.name historyPathMotionThenOtherThenThirdParty
     * @tc.desc Selection history for MotionThenOtherThenThirdParty records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathMotionThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 4, 3];
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
     * @tc.name roundTripThirdPartyThenLayoutThenAll
     * @tc.desc A forward and reverse tour of ThirdPartyThenLayoutThenAll restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripThirdPartyThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const forward: number[] = [3, 1, 0];
      const backward: number[] = [1, 3, 0];
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
     * @tc.name dragThenPathThirdPartyThenMotionThenLayout
     * @tc.desc A drag composed with ThirdPartyThenMotionThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathThirdPartyThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 2, 1];
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
     * @tc.name fontPathOtherThenAllThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking OtherThenAllThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathOtherThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 0, 1];
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
     * @tc.name barPathOtherThenLayoutThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking OtherThenLayoutThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathOtherThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 1, 2];
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
     * @tc.name clickPathOtherThenMotionThenOther
     * @tc.desc Clicking OtherThenMotionThenOther updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathOtherThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 2, 4];
      const trail: number[] = [0, 0, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.index).assertEqual(path[i]);
        expect(model.displacement).assertEqual(path[i] * TAB_WIDTH);
        expect(model.scrollX).assertEqual(trail[i]);
      }
      expect(model.index).assertEqual(4);
      expect(model.displacement).assertEqual(oracleDisplacement(path));
      expect(model.selects).assertEqual(path.length);
      expect(model.path.length).assertEqual(path.length);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name scrollPathAllThenLayoutThenAllThenMotion
     * @tc.desc Scroll focus offsets along AllThenLayoutThenAllThenMotion follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathAllThenLayoutThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 0, 2];
      const expected: number[] = [0, -90, -90, -90];
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
     * @tc.name fontPathAllThenLayoutThenMotionThenOther
     * @tc.desc Font emphasis tracks the active tab while walking AllThenLayoutThenMotionThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenLayoutThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2, 4];
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
     * @tc.name dragThenPathAllThenLayoutThenOtherThenLayout
     * @tc.desc A drag composed with AllThenLayoutThenOtherThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenLayoutThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 4, 1];
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
     * @tc.name barPathAllThenMotionThenLayoutThenThirdParty
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenMotionThenLayoutThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenMotionThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 1, 3];
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
     * @tc.name swipePathAllThenMotionThenOtherThenLayout
     * @tc.desc Swiper onChange over AllThenMotionThenOtherThenLayout mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenMotionThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 2, 4, 1];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(1);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(-90);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name dragThenPathAllThenThirdPartyThenLayoutThenAll
     * @tc.desc A drag composed with AllThenThirdPartyThenLayoutThenAll preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenThirdPartyThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 1, 0];
      model.drag(94);
      expect(model.displacement).assertEqual(-
      94
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0 - 94);
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
     * @tc.name scrollPathAllThenThirdPartyThenOtherThenMotion
     * @tc.desc Scroll focus offsets along AllThenThirdPartyThenOtherThenMotion follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathAllThenThirdPartyThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 4, 2];
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
     * @tc.name dragThenPathAllThenOtherThenLayoutThenMotion
     * @tc.desc A drag composed with AllThenOtherThenLayoutThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenOtherThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 1, 2];
      model.drag(103);
      expect(model.displacement).assertEqual(-
      103
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(2);
      expect(model.displacement).assertEqual(190 - 103);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:103'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name historyPathAllThenOtherThenThirdPartyThenOther
     * @tc.desc Selection history for AllThenOtherThenThirdPartyThenOther records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenOtherThenThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 3, 4];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.history[i]).assertEqual(
      'select:' + String(path[i]));
      }
      expect(model.history.length).assertEqual(path.length);
      expect(model.history[model.history.length - 1]).assertEqual('select:4');
      expect(model.history[0].indexOf(
      'select:'
      )).assertEqual(0);
      expect(uniqueCount(model.history) <= model.history.length).assertTrue();
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name clickPathLayoutThenAllThenThirdPartyThenAll
     * @tc.desc Clicking LayoutThenAllThenThirdPartyThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenAllThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 3, 0];
      const trail: number[] = [-90, -90, 90, 90];
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
     * @tc.name clickPathLayoutThenMotionThenAllThenMotion
     * @tc.desc Clicking LayoutThenMotionThenAllThenMotion updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenMotionThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 0, 2];
      const trail: number[] = [-90, -90, -90, -90];
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
     * @tc.name swipePathLayoutThenMotionThenThirdPartyThenMotion
     * @tc.desc Swiper onChange over LayoutThenMotionThenThirdPartyThenMotion mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenMotionThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 2, 3, 2];
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
     * @tc.name roundTripLayoutThenThirdPartyThenAllThenOther
     * @tc.desc A forward and reverse tour of LayoutThenThirdPartyThenAllThenOther restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenThirdPartyThenAllThenOther', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 3, 0, 4];
      const backward: number[] = [0, 3, 1, 0];
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
     * @tc.name historyPathLayoutThenThirdPartyThenOtherThenAll
     * @tc.desc Selection history for LayoutThenThirdPartyThenOtherThenAll records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenThirdPartyThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 4, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.history[i]).assertEqual(
      'select:' + String(path[i]));
      }
      expect(model.history.length).assertEqual(path.length);
      expect(model.history[model.history.length - 1]).assertEqual('select:0');
      expect(model.history[0].indexOf(
      'select:'
      )).assertEqual(0);
      expect(uniqueCount(model.history) <= model.history.length).assertTrue();
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name roundTripLayoutThenOtherThenLayoutThenMotion
     * @tc.desc A forward and reverse tour of LayoutThenOtherThenLayoutThenMotion restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenOtherThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 4, 1, 2];
      const backward: number[] = [1, 4, 1, 0];
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
     * @tc.name scrollPathLayoutThenOtherThenThirdPartyThenMotion
     * @tc.desc Scroll focus offsets along LayoutThenOtherThenThirdPartyThenMotion follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenOtherThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 3, 2];
      const expected: number[] = [-90, -90, 90, 90];
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
     * @tc.name clickPathMotionThenAllThenMotionThenOther
     * @tc.desc Clicking MotionThenAllThenMotionThenOther updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenAllThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 2, 4];
      const trail: number[] = [0, 0, 0, 0];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.index).assertEqual(path[i]);
        expect(model.displacement).assertEqual(path[i] * TAB_WIDTH);
        expect(model.scrollX).assertEqual(trail[i]);
      }
      expect(model.index).assertEqual(4);
      expect(model.displacement).assertEqual(oracleDisplacement(path));
      expect(model.selects).assertEqual(path.length);
      expect(model.path.length).assertEqual(path.length);
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name barPathMotionThenLayoutThenAllThenLayout
     * @tc.desc Indicator offsets stay on the tab grid while walking MotionThenLayoutThenAllThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathMotionThenLayoutThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 0, 1];
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
     * @tc.name historyPathMotionThenLayoutThenThirdPartyThenLayout
     * @tc.desc Selection history for MotionThenLayoutThenThirdPartyThenLayout records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathMotionThenLayoutThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 3, 1];
      for (let i = 0; i < path.length; i++) {
        model.select(path[i]);
        expect(model.history[i]).assertEqual(
      'select:' + String(path[i]));
      }
      expect(model.history.length).assertEqual(path.length);
      expect(model.history[model.history.length - 1]).assertEqual('select:1');
      expect(model.history[0].indexOf(
      'select:'
      )).assertEqual(0);
      expect(uniqueCount(model.history) <= model.history.length).assertTrue();
      expect(displacementInvariant(model)).assertTrue();
    });

    /**
     * @tc.name fontPathMotionThenThirdPartyThenAllThenOther
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenThirdPartyThenAllThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenThirdPartyThenAllThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 0, 4];
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
     * @tc.name clickPathMotionThenThirdPartyThenOtherThenAll
     * @tc.desc Clicking MotionThenThirdPartyThenOtherThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenThirdPartyThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 4, 0];
      const trail: number[] = [0, 90, 90, 90];
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

  });
}
