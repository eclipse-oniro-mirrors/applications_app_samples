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

export default function TabOperationsTest(): void {
  describe('TabOperationsTest', () => {
    beforeAll(() => {
      logSuite('TabOperationsTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TabOperationsTest', 'end');
    });

    /**
     * @tc.name operationsDragEquivalenceSweep
     * @tc.desc operations baseline: every row of the drag equivalence table keeps the inverted offset.
     * @tc.type Function
     * @tc.level Level1
     */
    it('operationsDragEquivalenceSweep', 0, () => {
      const model = new TabState();
      const deltas: number[] = [-46, 47, -47, 48, -48, 90, -90, 95, -95, 190, -190, 380];
      expect(dragTotal([-46])).assertEqual(46);
      expect(dragTotal([47])).assertEqual(-47);
      expect(dragTotal([-47])).assertEqual(47);
      expect(dragTotal([48])).assertEqual(-48);
      expect(dragTotal([-48])).assertEqual(48);
      expect(dragTotal([90])).assertEqual(-90);
      expect(dragTotal([-90])).assertEqual(90);
      expect(dragTotal([95])).assertEqual(-95);
      expect(dragTotal([-95])).assertEqual(95);
      expect(dragTotal([190])).assertEqual(-190);
      expect(dragTotal([-190])).assertEqual(190);
      expect(dragTotal([380])).assertEqual(-380);
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
     * @tc.name operationsToggleParitySweep
     * @tc.desc operations baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('operationsToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 68; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(68);
      expect(model.color).assertEqual(colorAfterToggles(68));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name barPathMotionThenAllThenOther
     * @tc.desc Indicator offsets stay on the tab grid while walking MotionThenAllThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathMotionThenAllThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 4];
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
     * @tc.name roundTripMotionThenLayoutThenOther
     * @tc.desc A forward and reverse tour of MotionThenLayoutThenOther restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 1, 4];
      const backward: number[] = [1, 2, 0];
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
     * @tc.name clickPathMotionThenOtherThenAll
     * @tc.desc Clicking MotionThenOtherThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 4, 0];
      const trail: number[] = [0, 0, 0];
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
     * @tc.name clickPathThirdPartyThenAllThenMotion
     * @tc.desc Clicking ThirdPartyThenAllThenMotion updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathThirdPartyThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 0, 2];
      const trail: number[] = [90, 90, 90];
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
     * @tc.name barPathThirdPartyThenLayoutThenThirdParty
     * @tc.desc Indicator offsets stay on the tab grid while walking ThirdPartyThenLayoutThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathThirdPartyThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 1, 3];
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
     * @tc.name roundTripThirdPartyThenMotionThenOther
     * @tc.desc A forward and reverse tour of ThirdPartyThenMotionThenOther restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripThirdPartyThenMotionThenOther', 0, () => {
      const model = new TabState();
      const forward: number[] = [3, 2, 4];
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
     * @tc.name dragThenPathOtherThenAllThenLayout
     * @tc.desc A drag composed with OtherThenAllThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathOtherThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 0, 1];
      model.drag(76);
      expect(model.displacement).assertEqual(-
      76
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(1);
      expect(model.displacement).assertEqual(95 - 76);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:76'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name dragThenPathOtherThenLayoutThenOther
     * @tc.desc A drag composed with OtherThenLayoutThenOther preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathOtherThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 1, 4];
      model.drag(94);
      expect(model.displacement).assertEqual(-
      94
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(4);
      expect(model.displacement).assertEqual(380 - 94);
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
     * @tc.name roundTripOtherThenThirdPartyThenMotion
     * @tc.desc A forward and reverse tour of OtherThenThirdPartyThenMotion restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripOtherThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const forward: number[] = [4, 3, 2];
      const backward: number[] = [3, 4, 0];
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
     * @tc.name clickPathAllThenLayoutThenMotionThenLayout
     * @tc.desc Clicking AllThenLayoutThenMotionThenLayout updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenLayoutThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2, 1];
      const trail: number[] = [0, -90, -90, -90];
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
     * @tc.name swipePathAllThenLayoutThenOtherThenAll
     * @tc.desc Swiper onChange over AllThenLayoutThenOtherThenAll mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenLayoutThenOtherThenAll', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 1, 4, 0];
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
     * @tc.name roundTripAllThenMotionThenAllThenOther
     * @tc.desc A forward and reverse tour of AllThenMotionThenAllThenOther restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenMotionThenAllThenOther', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 2, 0, 4];
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
     * @tc.name historyPathAllThenMotionThenThirdPartyThenMotion
     * @tc.desc Selection history for AllThenMotionThenThirdPartyThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenMotionThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 3, 2];
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
     * @tc.name roundTripAllThenThirdPartyThenAllThenMotion
     * @tc.desc A forward and reverse tour of AllThenThirdPartyThenAllThenMotion restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenThirdPartyThenAllThenMotion', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 3, 0, 2];
      const backward: number[] = [0, 3, 0];
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
     * @tc.name historyPathAllThenThirdPartyThenMotionThenAll
     * @tc.desc Selection history for AllThenThirdPartyThenMotionThenAll records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenThirdPartyThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 2, 0];
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
     * @tc.name historyPathAllThenOtherThenAllThenLayout
     * @tc.desc Selection history for AllThenOtherThenAllThenLayout records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenOtherThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 0, 1];
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
     * @tc.name barPathAllThenOtherThenMotionThenAll
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenOtherThenMotionThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenOtherThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 2, 0];
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
     * @tc.name dragThenPathAllThenOtherThenThirdPartyThenOther
     * @tc.desc A drag composed with AllThenOtherThenThirdPartyThenOther preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenOtherThenThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 3, 4];
      model.drag(94);
      expect(model.displacement).assertEqual(-
      94
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(4);
      expect(model.displacement).assertEqual(380 - 94);
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
     * @tc.name fontPathLayoutThenAllThenThirdPartyThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenAllThenThirdPartyThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenAllThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 3, 1];
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
     * @tc.name barPathLayoutThenMotionThenAllThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenMotionThenAllThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenMotionThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 0, 2];
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
     * @tc.name barPathLayoutThenMotionThenThirdPartyThenLayout
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenMotionThenThirdPartyThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenMotionThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 3, 1];
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
     * @tc.name barPathLayoutThenThirdPartyThenAllThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenThirdPartyThenAllThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenThirdPartyThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 0, 2];
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
     * @tc.name clickPathLayoutThenThirdPartyThenMotionThenThirdParty
     * @tc.desc Clicking LayoutThenThirdPartyThenMotionThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenThirdPartyThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 2, 3];
      const trail: number[] = [-90, 90, 90, 90];
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
     * @tc.name fontPathLayoutThenOtherThenAllThenOther
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenOtherThenAllThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenOtherThenAllThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 0, 4];
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
     * @tc.name dragThenPathLayoutThenOtherThenMotionThenOther
     * @tc.desc A drag composed with LayoutThenOtherThenMotionThenOther preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenOtherThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 2, 4];
      model.drag(40);
      expect(model.displacement).assertEqual(-
      40
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(4);
      expect(model.displacement).assertEqual(380 - 40);
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
     * @tc.name fontPathMotionThenAllThenMotionThenOther
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenAllThenMotionThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenAllThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 2, 4];
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
     * @tc.name roundTripMotionThenAllThenOtherThenThirdParty
     * @tc.desc A forward and reverse tour of MotionThenAllThenOtherThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenAllThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 0, 4, 3];
      const backward: number[] = [4, 0, 2, 0];
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
     * @tc.name fontPathMotionThenLayoutThenThirdPartyThenAll
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenLayoutThenThirdPartyThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenLayoutThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 3, 0];
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
     * @tc.name clickPathMotionThenThirdPartyThenAllThenMotion
     * @tc.desc Clicking MotionThenThirdPartyThenAllThenMotion updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenThirdPartyThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 0, 2];
      const trail: number[] = [0, 90, 90, 90];
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
     * @tc.name scrollPathMotionThenThirdPartyThenMotionThenOther
     * @tc.desc Scroll focus offsets along MotionThenThirdPartyThenMotionThenOther follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathMotionThenThirdPartyThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 2, 4];
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
