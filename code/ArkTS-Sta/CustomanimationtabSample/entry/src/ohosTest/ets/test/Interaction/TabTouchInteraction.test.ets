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

export default function TabTouchInteractionTest(): void {
  describe('TabTouchInteractionTest', () => {
    beforeAll(() => {
      logSuite('TabTouchInteractionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TabTouchInteractionTest', 'end');
    });

    /**
     * @tc.name touchInteractionToggleParitySweep
     * @tc.desc touchInteraction baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('touchInteractionToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 132; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(132);
      expect(model.color).assertEqual(colorAfterToggles(132));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name roundTripOtherThenLayout
     * @tc.desc A forward and reverse tour of OtherThenLayout restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripOtherThenLayout', 0, () => {
      const model = new TabState();
      const forward: number[] = [4, 1];
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
     * @tc.name barPathOtherThenThirdParty
     * @tc.desc Indicator offsets stay on the tab grid while walking OtherThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 3];
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
     * @tc.name dragThenPathAllThenLayoutThenMotion
     * @tc.desc A drag composed with AllThenLayoutThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2];
      model.drag(76);
      expect(model.displacement).assertEqual(-
      76
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(2);
      expect(model.displacement).assertEqual(190 - 76);
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
     * @tc.name clickPathAllThenMotionThenLayout
     * @tc.desc Clicking AllThenMotionThenLayout updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 1];
      const trail: number[] = [0, 0, -90];
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
     * @tc.name roundTripAllThenThirdPartyThenAll
     * @tc.desc A forward and reverse tour of AllThenThirdPartyThenAll restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 3, 0];
      const backward: number[] = [3, 0];
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
     * @tc.name clickPathAllThenOtherThenAll
     * @tc.desc Clicking AllThenOtherThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 0];
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
     * @tc.name barPathAllThenOtherThenThirdParty
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenOtherThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 3];
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
     * @tc.name swipePathLayoutThenAllThenOther
     * @tc.desc Swiper onChange over LayoutThenAllThenOther mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenAllThenOther', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 0, 4];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(4);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(-90);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name dragThenPathLayoutThenMotionThenThirdParty
     * @tc.desc A drag composed with LayoutThenMotionThenThirdParty preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 3];
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
     * @tc.name fontPathLayoutThenThirdPartyThenOther
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenThirdPartyThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 4];
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
     * @tc.name clickPathLayoutThenOtherThenThirdParty
     * @tc.desc Clicking LayoutThenOtherThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 3];
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
     * @tc.name roundTripMotionThenAllThenOther
     * @tc.desc A forward and reverse tour of MotionThenAllThenOther restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenAllThenOther', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 0, 4];
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
     * @tc.name dragThenPathMotionThenLayoutThenOther
     * @tc.desc A drag composed with MotionThenLayoutThenOther preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathMotionThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 4];
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
     * @tc.name barPathMotionThenOtherThenLayout
     * @tc.desc Indicator offsets stay on the tab grid while walking MotionThenOtherThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathMotionThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 4, 1];
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
     * @tc.name scrollPathThirdPartyThenAllThenThirdParty
     * @tc.desc Scroll focus offsets along ThirdPartyThenAllThenThirdParty follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathThirdPartyThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 0, 3];
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
     * @tc.name scrollPathThirdPartyThenLayoutThenOther
     * @tc.desc Scroll focus offsets along ThirdPartyThenLayoutThenOther follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathThirdPartyThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 1, 4];
      const expected: number[] = [90, -90, -90];
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
     * @tc.name fontPathThirdPartyThenOtherThenAll
     * @tc.desc Font emphasis tracks the active tab while walking ThirdPartyThenOtherThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathThirdPartyThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 4, 0];
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
     * @tc.name barPathOtherThenAllThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking OtherThenAllThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathOtherThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 0, 2];
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
     * @tc.name dragThenPathOtherThenLayoutThenThirdParty
     * @tc.desc A drag composed with OtherThenLayoutThenThirdParty preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathOtherThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 1, 3];
      model.drag(103);
      expect(model.displacement).assertEqual(-
      103
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(3);
      expect(model.displacement).assertEqual(285 - 103);
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
     * @tc.name dragThenPathOtherThenThirdPartyThenLayout
     * @tc.desc A drag composed with OtherThenThirdPartyThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathOtherThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 3, 1];
      model.drag(40);
      expect(model.displacement).assertEqual(-
      40
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(1);
      expect(model.displacement).assertEqual(95 - 40);
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
     * @tc.name dragThenPathAllThenLayoutThenMotionThenLayout
     * @tc.desc A drag composed with AllThenLayoutThenMotionThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenLayoutThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2, 1];
      model.drag(49);
      expect(model.displacement).assertEqual(-
      49
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(1);
      expect(model.displacement).assertEqual(95 - 49);
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
     * @tc.name historyPathAllThenLayoutThenOtherThenMotion
     * @tc.desc Selection history for AllThenLayoutThenOtherThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenLayoutThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 4, 2];
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
     * @tc.name roundTripAllThenMotionThenLayoutThenMotion
     * @tc.desc A forward and reverse tour of AllThenMotionThenLayoutThenMotion restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenMotionThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 2, 1, 2];
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
     * @tc.name historyPathAllThenMotionThenOtherThenAll
     * @tc.desc Selection history for AllThenMotionThenOtherThenAll records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenMotionThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 4, 0];
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
     * @tc.name dragThenPathAllThenThirdPartyThenAllThenOther
     * @tc.desc A drag composed with AllThenThirdPartyThenAllThenOther preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenThirdPartyThenAllThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 0, 4];
      model.drag(103);
      expect(model.displacement).assertEqual(-
      103
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(4);
      expect(model.displacement).assertEqual(380 - 103);
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
     * @tc.name dragThenPathAllThenThirdPartyThenOtherThenAll
     * @tc.desc A drag composed with AllThenThirdPartyThenOtherThenAll preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenThirdPartyThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 4, 0];
      model.drag(103);
      expect(model.displacement).assertEqual(-
      103
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0 - 103);
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
     * @tc.name fontPathAllThenOtherThenLayoutThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking AllThenOtherThenLayoutThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenOtherThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 1, 3];
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
     * @tc.name dragThenPathAllThenOtherThenThirdPartyThenLayout
     * @tc.desc A drag composed with AllThenOtherThenThirdPartyThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenOtherThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 3, 1];
      model.drag(112);
      expect(model.displacement).assertEqual(-
      112
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(1);
      expect(model.displacement).assertEqual(95 - 112);
      expect(model.drags).assertEqual(1);
      expect(model.selects).assertEqual(path.length);
      expect(model.history.length).assertEqual(path.length + 1);
      expect(model.history[0]).assertEqual(
      'drag:112'
      );
      expect(model.history[1].indexOf(
      'select:'
      )).assertEqual(0);
    });

    /**
     * @tc.name barPathLayoutThenAllThenMotionThenOther
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenAllThenMotionThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenAllThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 2, 4];
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
     * @tc.name roundTripLayoutThenAllThenOtherThenThirdParty
     * @tc.desc A forward and reverse tour of LayoutThenAllThenOtherThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenAllThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 0, 4, 3];
      const backward: number[] = [4, 0, 1, 0];
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
     * @tc.name fontPathLayoutThenMotionThenLayoutThenOther
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenMotionThenLayoutThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenMotionThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 1, 4];
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
     * @tc.name scrollPathLayoutThenMotionThenOtherThenThirdParty
     * @tc.desc Scroll focus offsets along LayoutThenMotionThenOtherThenThirdParty follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenMotionThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 4, 3];
      const expected: number[] = [-90, -90, -90, 90];
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
     * @tc.name swipePathLayoutThenThirdPartyThenMotionThenAll
     * @tc.desc Swiper onChange over LayoutThenThirdPartyThenMotionThenAll mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenThirdPartyThenMotionThenAll', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 3, 2, 0];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(0);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(90);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name clickPathLayoutThenOtherThenAllThenThirdParty
     * @tc.desc Clicking LayoutThenOtherThenAllThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenOtherThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 0, 3];
      const trail: number[] = [-90, -90, -90, 90];
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
     * @tc.name barPathLayoutThenOtherThenMotionThenOther
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenOtherThenMotionThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenOtherThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 2, 4];
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
     * @tc.name swipePathMotionThenAllThenMotionThenAll
     * @tc.desc Swiper onChange over MotionThenAllThenMotionThenAll mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathMotionThenAllThenMotionThenAll', 0, () => {
      const model = new TabState();
      const swipes: number[] = [2, 0, 2, 0];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(0);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(0);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name historyPathMotionThenAllThenOtherThenMotion
     * @tc.desc Selection history for MotionThenAllThenOtherThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathMotionThenAllThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 4, 2];
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
     * @tc.name swipePathMotionThenLayoutThenThirdPartyThenAll
     * @tc.desc Swiper onChange over MotionThenLayoutThenThirdPartyThenAll mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathMotionThenLayoutThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const swipes: number[] = [2, 1, 3, 0];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(0);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(90);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name roundTripMotionThenThirdPartyThenAllThenThirdParty
     * @tc.desc A forward and reverse tour of MotionThenThirdPartyThenAllThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenThirdPartyThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 3, 0, 3];
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
     * @tc.name historyPathMotionThenThirdPartyThenMotionThenOther
     * @tc.desc Selection history for MotionThenThirdPartyThenMotionThenOther records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathMotionThenThirdPartyThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 2, 4];
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

  });
}
