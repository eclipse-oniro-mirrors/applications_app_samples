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

export default function TabErrorRecoveryTest(): void {
  describe('TabErrorRecoveryTest', () => {
    beforeAll(() => {
      logSuite('TabErrorRecoveryTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TabErrorRecoveryTest', 'end');
    });

    /**
     * @tc.name errorRecoveryDragEquivalenceSweep
     * @tc.desc errorRecovery baseline: every row of the drag equivalence table keeps the inverted offset.
     * @tc.type Function
     * @tc.level Level2
     */
    it('errorRecoveryDragEquivalenceSweep', 0, () => {
      const model = new TabState();
      const deltas: number[] = [90, -90, 95, -95, 190, -190, 380, -380, 476, -476, 0, 1];
      expect(dragTotal([90])).assertEqual(-90);
      expect(dragTotal([-90])).assertEqual(90);
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
     * @tc.name errorRecoveryToggleParitySweep
     * @tc.desc errorRecovery baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level2
     */
    it('errorRecoveryToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 46; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(46);
      expect(model.color).assertEqual(colorAfterToggles(46));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name errorRecoverySettleSweep
     * @tc.desc errorRecovery baseline: fling distances from the starting page stay bounded and idempotent.
     * @tc.type Function
     * @tc.level Level2
     */
    it('errorRecoverySettleSweep', 0, () => {
      const model = new TabState();
      model.select(3);
      for (let delta = -380; delta <= 380; delta += 38) {
        const landed: number = settleTargetIndex(model.index, delta);
        expect(landed >= 0 && landed < TAB_COUNT).assertTrue();
        expect(clampIndex(landed)).assertEqual(landed);
        expect(settleTargetIndex(landed, 0)).assertEqual(landed);
        expect(settleRebounds(model.index, delta)).assertEqual(landed === model.index);
      }
      expect(settleTargetIndex(3, 0)).assertEqual(3);
      expect(settleTargetIndex(
      3
      , TAB_WIDTH)).assertEqual(clampIndex(
      3
       + 1));
      expect(settleTargetIndex(
      3
      , -TAB_WIDTH)).assertEqual(clampIndex(
      3
       - 1));
    });

    /**
     * @tc.name historyPathAllThenLayoutThenMotionThenAll
     * @tc.desc Selection history for AllThenLayoutThenMotionThenAll records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenLayoutThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2, 0];
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
     * @tc.name historyPathAllThenLayoutThenThirdPartyThenOther
     * @tc.desc Selection history for AllThenLayoutThenThirdPartyThenOther records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenLayoutThenThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 3, 4];
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
     * @tc.name roundTripAllThenMotionThenAllThenThirdParty
     * @tc.desc A forward and reverse tour of AllThenMotionThenAllThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenMotionThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 2, 0, 3];
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
     * @tc.name historyPathAllThenMotionThenThirdPartyThenLayout
     * @tc.desc Selection history for AllThenMotionThenThirdPartyThenLayout records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenMotionThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 3, 1];
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
     * @tc.name barPathAllThenThirdPartyThenAllThenLayout
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenThirdPartyThenAllThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenThirdPartyThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 0, 1];
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
     * @tc.name scrollPathAllThenThirdPartyThenLayoutThenOther
     * @tc.desc Scroll focus offsets along AllThenThirdPartyThenLayoutThenOther follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathAllThenThirdPartyThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 1, 4];
      const expected: number[] = [0, 90, -90, -90];
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
     * @tc.name barPathAllThenThirdPartyThenOtherThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenThirdPartyThenOtherThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenThirdPartyThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 4, 2];
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
     * @tc.name barPathAllThenOtherThenLayoutThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenOtherThenLayoutThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenOtherThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 1, 2];
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
     * @tc.name dragThenPathAllThenOtherThenThirdPartyThenAll
     * @tc.desc A drag composed with AllThenOtherThenThirdPartyThenAll preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenOtherThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 3, 0];
      model.drag(40);
      expect(model.displacement).assertEqual(-
      40
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0 - 40);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:40'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name fontPathLayoutThenAllThenMotionThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenAllThenMotionThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenAllThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 2, 3];
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
     * @tc.name historyPathLayoutThenAllThenOtherThenMotion
     * @tc.desc Selection history for LayoutThenAllThenOtherThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenAllThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 4, 2];
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
     * @tc.name roundTripLayoutThenMotionThenLayoutThenOther
     * @tc.desc A forward and reverse tour of LayoutThenMotionThenLayoutThenOther restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenMotionThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 2, 1, 4];
      const backward: number[] = [1, 2, 1, 0];
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
     * @tc.name barPathLayoutThenMotionThenOtherThenThirdParty
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenMotionThenOtherThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenMotionThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 4, 3];
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
     * @tc.name barPathLayoutThenThirdPartyThenLayoutThenOther
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenThirdPartyThenLayoutThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenThirdPartyThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 1, 4];
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
     * @tc.name swipePathLayoutThenOtherThenAllThenLayout
     * @tc.desc Swiper onChange over LayoutThenOtherThenAllThenLayout mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenOtherThenAllThenLayout', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 4, 0, 1];
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
     * @tc.name swipePathLayoutThenOtherThenMotionThenThirdParty
     * @tc.desc Swiper onChange over LayoutThenOtherThenMotionThenThirdParty mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenOtherThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 4, 2, 3];
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
     * @tc.name scrollPathMotionThenAllThenMotionThenAll
     * @tc.desc Scroll focus offsets along MotionThenAllThenMotionThenAll follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathMotionThenAllThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 2, 0];
      const expected: number[] = [0, 0, 0, 0];
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
     * @tc.name clickPathMotionThenAllThenOtherThenLayout
     * @tc.desc Clicking MotionThenAllThenOtherThenLayout updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenAllThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 4, 1];
      const trail: number[] = [0, 0, 0, -90];
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
     * @tc.name dragThenPathMotionThenLayoutThenMotionThenThirdParty
     * @tc.desc A drag composed with MotionThenLayoutThenMotionThenThirdParty preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathMotionThenLayoutThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 2, 3];
      model.drag(40);
      expect(model.displacement).assertEqual(-
      40
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(3);
      expect(model.displacement).assertEqual(285 - 40);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:40'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name dragThenPathMotionThenThirdPartyThenAllThenThirdParty
     * @tc.desc A drag composed with MotionThenThirdPartyThenAllThenThirdParty preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathMotionThenThirdPartyThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 0, 3];
      model.drag(94);
      expect(model.displacement).assertEqual(-
      94
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(3);
      expect(model.displacement).assertEqual(285 - 94);
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
     * @tc.name roundTripMotionThenThirdPartyThenOtherThenMotion
     * @tc.desc A forward and reverse tour of MotionThenThirdPartyThenOtherThenMotion restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenThirdPartyThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 3, 4, 2];
      const backward: number[] = [4, 3, 2, 0];
      for (let i = 0; i < forward.length; i++) { model.select(forward[i]); }
      for (let i = 0; i < backward.length; i++) { model.select(backward[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
      expect(model.selects).assertEqual(forward.length + backward.length);
      expect(model.scrollX).assertEqual(oracleScrollFinal(forward.concat(backward)));
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history.length).assertEqual(forward.length + backward.length);
    });

  });
}
