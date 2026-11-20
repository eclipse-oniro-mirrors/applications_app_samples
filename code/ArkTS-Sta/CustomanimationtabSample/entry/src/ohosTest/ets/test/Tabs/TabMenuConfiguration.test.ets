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

export default function TabMenuConfigurationTest(): void {
  describe('TabMenuConfigurationTest', () => {
    beforeAll(() => {
      logSuite('TabMenuConfigurationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TabMenuConfigurationTest', 'end');
    });

    /**
     * @tc.name menuConfigurationDragEquivalenceSweep
     * @tc.desc menuConfiguration baseline: every row of the drag equivalence table keeps the inverted offset.
     * @tc.type Function
     * @tc.level Level1
     */
    it('menuConfigurationDragEquivalenceSweep', 0, () => {
      const model = new TabState();
      const deltas: number[] = [95, -95, 190, -190, 380, -380, 476, -476, 0, 1, -1, 46];
      expect(dragTotal([95])).assertEqual(-95);
      expect(dragTotal([-95])).assertEqual(95);
      expect(dragTotal([190])).assertEqual(-190);
      expect(dragTotal([-190])).assertEqual(190);
      expect(dragTotal([380])).assertEqual(-380);
      expect(dragTotal([-380])).assertEqual(380);
      expect(dragTotal([476])).assertEqual(-476);
      expect(dragTotal([-476])).assertEqual(476);
      expect(dragTotal([0])).assertEqual(0);
      expect(dragTotal([1])).assertEqual(-1);
      expect(dragTotal([-1])).assertEqual(1);
      expect(dragTotal([46])).assertEqual(-46);
      for (let i = 0; i < deltas.length; i++) {
        model.drag(deltas[i]);
        expect(model.displacement).assertEqual(dragTotal(deltas.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(0);
      expect(model.drags).assertEqual(deltas.length);
      expect(model.dragPath.length).assertEqual(deltas.length);
      expect(model.displacement <= 0 || model.displacement >= 0).assertTrue();
    });

    /**
     * @tc.name menuConfigurationToggleParitySweep
     * @tc.desc menuConfiguration baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('menuConfigurationToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 60; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(60);
      expect(model.color).assertEqual(colorAfterToggles(60));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name barPathOtherThenAll
     * @tc.desc Indicator offsets stay on the tab grid while walking OtherThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 0];
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
     * @tc.name dragThenPathOtherThenMotion
     * @tc.desc A drag composed with OtherThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 2];
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
     * @tc.name historyPathAllThenLayoutThenMotion
     * @tc.desc Selection history for AllThenLayoutThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2];
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
     * @tc.name fontPathAllThenMotionThenAll
     * @tc.desc Font emphasis tracks the active tab while walking AllThenMotionThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 0];
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
     * @tc.name swipePathAllThenMotionThenOther
     * @tc.desc Swiper onChange over AllThenMotionThenOther mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenMotionThenOther', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 2, 4];
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
     * @tc.name swipePathAllThenThirdPartyThenOther
     * @tc.desc Swiper onChange over AllThenThirdPartyThenOther mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 3, 4];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(4);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(90);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name roundTripAllThenOtherThenMotion
     * @tc.desc A forward and reverse tour of AllThenOtherThenMotion restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 4, 2];
      const backward: number[] = [4, 0];
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
     * @tc.name scrollPathLayoutThenAllThenThirdParty
     * @tc.desc Scroll focus offsets along LayoutThenAllThenThirdParty follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 3];
      const expected: number[] = [-90, -90, 90];
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
     * @tc.name barPathLayoutThenMotionThenLayout
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenMotionThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 1];
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
     * @tc.name swipePathLayoutThenThirdPartyThenLayout
     * @tc.desc Swiper onChange over LayoutThenThirdPartyThenLayout mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 3, 1];
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
     * @tc.name swipePathLayoutThenOtherThenLayout
     * @tc.desc Swiper onChange over LayoutThenOtherThenLayout mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 4, 1];
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
     * @tc.name fontPathMotionThenAllThenMotion
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenAllThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 2];
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
     * @tc.name historyPathMotionThenLayoutThenMotion
     * @tc.desc Selection history for MotionThenLayoutThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathMotionThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 2];
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
     * @tc.name historyPathMotionThenThirdPartyThenMotion
     * @tc.desc Selection history for MotionThenThirdPartyThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathMotionThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 2];
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
     * @tc.name barPathMotionThenOtherThenThirdParty
     * @tc.desc Indicator offsets stay on the tab grid while walking MotionThenOtherThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathMotionThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 4, 3];
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
     * @tc.name fontPathThirdPartyThenLayoutThenAll
     * @tc.desc Font emphasis tracks the active tab while walking ThirdPartyThenLayoutThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathThirdPartyThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 1, 0];
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
     * @tc.name scrollPathThirdPartyThenMotionThenLayout
     * @tc.desc Scroll focus offsets along ThirdPartyThenMotionThenLayout follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathThirdPartyThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 2, 1];
      const expected: number[] = [90, 90, -90];
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
     * @tc.name dragThenPathThirdPartyThenOtherThenMotion
     * @tc.desc A drag composed with ThirdPartyThenOtherThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathThirdPartyThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 4, 2];
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
     * @tc.name fontPathOtherThenLayoutThenMotion
     * @tc.desc Font emphasis tracks the active tab while walking OtherThenLayoutThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathOtherThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 1, 2];
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
     * @tc.name roundTripOtherThenMotionThenThirdParty
     * @tc.desc A forward and reverse tour of OtherThenMotionThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripOtherThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [4, 2, 3];
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
     * @tc.name fontPathAllThenLayoutThenAllThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking AllThenLayoutThenAllThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenLayoutThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 0, 1];
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
     * @tc.name historyPathAllThenLayoutThenMotionThenThirdParty
     * @tc.desc Selection history for AllThenLayoutThenMotionThenThirdParty records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenLayoutThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2, 3];
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
     * @tc.name fontPathAllThenLayoutThenOtherThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking AllThenLayoutThenOtherThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenLayoutThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 4, 1];
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
     * @tc.name clickPathAllThenMotionThenLayoutThenAll
     * @tc.desc Clicking AllThenMotionThenLayoutThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenMotionThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 1, 0];
      const trail: number[] = [0, 0, -90, -90];
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
     * @tc.name fontPathAllThenMotionThenThirdPartyThenOther
     * @tc.desc Font emphasis tracks the active tab while walking AllThenMotionThenThirdPartyThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenMotionThenThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 3, 4];
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
     * @tc.name swipePathAllThenThirdPartyThenAllThenThirdParty
     * @tc.desc Swiper onChange over AllThenThirdPartyThenAllThenThirdParty mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenThirdPartyThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 3, 0, 3];
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
     * @tc.name clickPathAllThenThirdPartyThenMotionThenThirdParty
     * @tc.desc Clicking AllThenThirdPartyThenMotionThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenThirdPartyThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 2, 3];
      const trail: number[] = [0, 90, 90, 90];
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
     * @tc.name swipePathAllThenOtherThenAllThenThirdParty
     * @tc.desc Swiper onChange over AllThenOtherThenAllThenThirdParty mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenOtherThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 4, 0, 3];
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
     * @tc.name barPathAllThenOtherThenMotionThenThirdParty
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenOtherThenMotionThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenOtherThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 2, 3];
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
     * @tc.name swipePathLayoutThenAllThenLayoutThenThirdParty
     * @tc.desc Swiper onChange over LayoutThenAllThenLayoutThenThirdParty mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenAllThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 0, 1, 3];
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
     * @tc.name barPathLayoutThenAllThenThirdPartyThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenAllThenThirdPartyThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenAllThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 3, 2];
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
     * @tc.name roundTripLayoutThenMotionThenAllThenThirdParty
     * @tc.desc A forward and reverse tour of LayoutThenMotionThenAllThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenMotionThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 2, 0, 3];
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
     * @tc.name dragThenPathLayoutThenMotionThenThirdPartyThenMotion
     * @tc.desc A drag composed with LayoutThenMotionThenThirdPartyThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenMotionThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 3, 2];
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
     * @tc.name historyPathLayoutThenThirdPartyThenLayoutThenMotion
     * @tc.desc Selection history for LayoutThenThirdPartyThenLayoutThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenThirdPartyThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 1, 2];
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
     * @tc.name historyPathLayoutThenThirdPartyThenOtherThenThirdParty
     * @tc.desc Selection history for LayoutThenThirdPartyThenOtherThenThirdParty records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenThirdPartyThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 4, 3];
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
     * @tc.name roundTripLayoutThenOtherThenMotionThenAll
     * @tc.desc A forward and reverse tour of LayoutThenOtherThenMotionThenAll restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenOtherThenMotionThenAll', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 4, 2, 0];
      const backward: number[] = [2, 4, 1, 0];
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
     * @tc.name fontPathMotionThenAllThenLayoutThenMotion
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenAllThenLayoutThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenAllThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 1, 2];
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
     * @tc.name roundTripMotionThenAllThenThirdPartyThenLayout
     * @tc.desc A forward and reverse tour of MotionThenAllThenThirdPartyThenLayout restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenAllThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 0, 3, 1];
      const backward: number[] = [3, 0, 2, 0];
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
     * @tc.name fontPathMotionThenLayoutThenAllThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenLayoutThenAllThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenLayoutThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 0, 3];
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
     * @tc.name dragThenPathMotionThenLayoutThenThirdPartyThenMotion
     * @tc.desc A drag composed with MotionThenLayoutThenThirdPartyThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathMotionThenLayoutThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 3, 2];
      model.drag(85);
      expect(model.displacement).assertEqual(-
      85
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(2);
      expect(model.displacement).assertEqual(190 - 85);
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
     * @tc.name dragThenPathMotionThenThirdPartyThenLayoutThenThirdParty
     * @tc.desc A drag composed with MotionThenThirdPartyThenLayoutThenThirdParty preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathMotionThenThirdPartyThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 1, 3];
      model.drag(58);
      expect(model.displacement).assertEqual(-
      58
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(3);
      expect(model.displacement).assertEqual(285 - 58);
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

  });
}
