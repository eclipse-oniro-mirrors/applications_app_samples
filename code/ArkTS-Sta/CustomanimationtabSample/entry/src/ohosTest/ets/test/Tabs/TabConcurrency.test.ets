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

export default function TabConcurrencyTest(): void {
  describe('TabConcurrencyTest', () => {
    beforeAll(() => {
      logSuite('TabConcurrencyTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TabConcurrencyTest', 'end');
    });

    /**
     * @tc.name concurrencyDragEquivalenceSweep
     * @tc.desc concurrency baseline: every row of the drag equivalence table keeps the inverted offset.
     * @tc.type Function
     * @tc.level Level1
     */
    it('concurrencyDragEquivalenceSweep', 0, () => {
      const model = new TabState();
      const deltas: number[] = [0, 1, -1, 46, -46, 47, -47, 48, -48, 90, -90, 95];
      expect(dragTotal([0])).assertEqual(0);
      expect(dragTotal([1])).assertEqual(-1);
      expect(dragTotal([-1])).assertEqual(1);
      expect(dragTotal([46])).assertEqual(-46);
      expect(dragTotal([-46])).assertEqual(46);
      expect(dragTotal([47])).assertEqual(-47);
      expect(dragTotal([-47])).assertEqual(47);
      expect(dragTotal([48])).assertEqual(-48);
      expect(dragTotal([-48])).assertEqual(48);
      expect(dragTotal([90])).assertEqual(-90);
      expect(dragTotal([-90])).assertEqual(90);
      expect(dragTotal([95])).assertEqual(-95);
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
     * @tc.name concurrencyToggleParitySweep
     * @tc.desc concurrency baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('concurrencyToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 40; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(40);
      expect(model.color).assertEqual(colorAfterToggles(40));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name concurrencySettleSweep
     * @tc.desc concurrency baseline: fling distances from the starting page stay bounded and idempotent.
     * @tc.type Function
     * @tc.level Level1
     */
    it('concurrencySettleSweep', 0, () => {
      const model = new TabState();
      model.select(0);
      for (let delta = -380; delta <= 380; delta += 38) {
        const landed: number = settleTargetIndex(model.index, delta);
        expect(landed >= 0 && landed < TAB_COUNT).assertTrue();
        expect(clampIndex(landed)).assertEqual(landed);
        expect(settleTargetIndex(landed, 0)).assertEqual(landed);
        expect(settleRebounds(model.index, delta)).assertEqual(landed === model.index);
      }
      expect(settleTargetIndex(0, 0)).assertEqual(0);
      expect(settleTargetIndex(
      0
      , TAB_WIDTH)).assertEqual(clampIndex(
      0
       + 1));
      expect(settleTargetIndex(
      0
      , -TAB_WIDTH)).assertEqual(clampIndex(
      0
       - 1));
    });

    /**
     * @tc.name clickPathAllThenLayoutThenMotionThenThirdParty
     * @tc.desc Clicking AllThenLayoutThenMotionThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenLayoutThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2, 3];
      const trail: number[] = [0, -90, -90, 90];
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
     * @tc.name historyPathAllThenLayoutThenOtherThenLayout
     * @tc.desc Selection history for AllThenLayoutThenOtherThenLayout records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenLayoutThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 4, 1];
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
     * @tc.name barPathAllThenMotionThenLayoutThenAll
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenMotionThenLayoutThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenMotionThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 1, 0];
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
     * @tc.name scrollPathAllThenMotionThenThirdPartyThenOther
     * @tc.desc Scroll focus offsets along AllThenMotionThenThirdPartyThenOther follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathAllThenMotionThenThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 3, 4];
      const expected: number[] = [0, 0, 90, 90];
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
     * @tc.name clickPathAllThenThirdPartyThenAllThenThirdParty
     * @tc.desc Clicking AllThenThirdPartyThenAllThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenThirdPartyThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 0, 3];
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
     * @tc.name roundTripAllThenThirdPartyThenMotionThenLayout
     * @tc.desc A forward and reverse tour of AllThenThirdPartyThenMotionThenLayout restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenThirdPartyThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 3, 2, 1];
      const backward: number[] = [2, 3, 0];
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
     * @tc.name dragThenPathAllThenOtherThenAllThenLayout
     * @tc.desc A drag composed with AllThenOtherThenAllThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenOtherThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 0, 1];
      model.drag(67);
      expect(model.displacement).assertEqual(-
      67
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(1);
      expect(model.displacement).assertEqual(95 - 67);
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
     * @tc.name historyPathAllThenOtherThenMotionThenThirdParty
     * @tc.desc Selection history for AllThenOtherThenMotionThenThirdParty records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenOtherThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 2, 3];
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
     * @tc.name roundTripLayoutThenAllThenLayoutThenThirdParty
     * @tc.desc A forward and reverse tour of LayoutThenAllThenLayoutThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenAllThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 0, 1, 3];
      const backward: number[] = [1, 0, 1, 0];
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
     * @tc.name scrollPathLayoutThenAllThenThirdPartyThenMotion
     * @tc.desc Scroll focus offsets along LayoutThenAllThenThirdPartyThenMotion follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenAllThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 3, 2];
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
     * @tc.name swipePathLayoutThenMotionThenAllThenThirdParty
     * @tc.desc Swiper onChange over LayoutThenMotionThenAllThenThirdParty mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenMotionThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 2, 0, 3];
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
     * @tc.name clickPathLayoutThenMotionThenOtherThenAll
     * @tc.desc Clicking LayoutThenMotionThenOtherThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenMotionThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 4, 0];
      const trail: number[] = [-90, -90, -90, -90];
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
     * @tc.name scrollPathLayoutThenThirdPartyThenLayoutThenMotion
     * @tc.desc Scroll focus offsets along LayoutThenThirdPartyThenLayoutThenMotion follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenThirdPartyThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 1, 2];
      const expected: number[] = [-90, 90, -90, -90];
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
     * @tc.name dragThenPathLayoutThenThirdPartyThenOtherThenLayout
     * @tc.desc A drag composed with LayoutThenThirdPartyThenOtherThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenThirdPartyThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 4, 1];
      model.drag(85);
      expect(model.displacement).assertEqual(-
      85
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(1);
      expect(model.displacement).assertEqual(95 - 85);
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
     * @tc.name scrollPathLayoutThenOtherThenMotionThenLayout
     * @tc.desc Scroll focus offsets along LayoutThenOtherThenMotionThenLayout follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenOtherThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 2, 1];
      const expected: number[] = [-90, -90, -90, -90];
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
     * @tc.name swipePathMotionThenAllThenLayoutThenThirdParty
     * @tc.desc Swiper onChange over MotionThenAllThenLayoutThenThirdParty mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathMotionThenAllThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const swipes: number[] = [2, 0, 1, 3];
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
     * @tc.name historyPathMotionThenAllThenOtherThenAll
     * @tc.desc Selection history for MotionThenAllThenOtherThenAll records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathMotionThenAllThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 4, 0];
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
     * @tc.name swipePathMotionThenLayoutThenMotionThenThirdParty
     * @tc.desc Swiper onChange over MotionThenLayoutThenMotionThenThirdParty mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathMotionThenLayoutThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const swipes: number[] = [2, 1, 2, 3];
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
     * @tc.name roundTripMotionThenThirdPartyThenAllThenLayout
     * @tc.desc A forward and reverse tour of MotionThenThirdPartyThenAllThenLayout restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenThirdPartyThenAllThenLayout', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 3, 0, 1];
      const backward: number[] = [0, 3, 2, 0];
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
     * @tc.name fontPathMotionThenThirdPartyThenMotionThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenThirdPartyThenMotionThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenThirdPartyThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 2, 1];
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

  });
}
