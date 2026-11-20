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

export default function TabThemeVariationTest(): void {
  describe('TabThemeVariationTest', () => {
    beforeAll(() => {
      logSuite('TabThemeVariationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TabThemeVariationTest', 'end');
    });

    /**
     * @tc.name themeVariationToggleParitySweep
     * @tc.desc themeVariation baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('themeVariationToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 130; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(130);
      expect(model.color).assertEqual(colorAfterToggles(130));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name clickPathLayoutThenAllThenOtherThenThirdParty
     * @tc.desc Clicking LayoutThenAllThenOtherThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenAllThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 4, 3];
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
     * @tc.name swipePathLayoutThenMotionThenThirdPartyThenAll
     * @tc.desc Swiper onChange over LayoutThenMotionThenThirdPartyThenAll mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenMotionThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 2, 3, 0];
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
     * @tc.name clickPathLayoutThenThirdPartyThenAllThenThirdParty
     * @tc.desc Clicking LayoutThenThirdPartyThenAllThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenThirdPartyThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 0, 3];
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
     * @tc.name historyPathLayoutThenThirdPartyThenMotionThenOther
     * @tc.desc Selection history for LayoutThenThirdPartyThenMotionThenOther records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenThirdPartyThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 2, 4];
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
     * @tc.name dragThenPathLayoutThenOtherThenLayoutThenAll
     * @tc.desc A drag composed with LayoutThenOtherThenLayoutThenAll preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenOtherThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 1, 0];
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
     * @tc.name fontPathMotionThenAllThenLayoutThenAll
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenAllThenLayoutThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenAllThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 1, 0];
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
     * @tc.name roundTripMotionThenAllThenThirdPartyThenAll
     * @tc.desc A forward and reverse tour of MotionThenAllThenThirdPartyThenAll restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenAllThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 0, 3, 0];
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
     * @tc.name scrollPathMotionThenLayoutThenAllThenMotion
     * @tc.desc Scroll focus offsets along MotionThenLayoutThenAllThenMotion follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathMotionThenLayoutThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 0, 2];
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
     * @tc.name historyPathMotionThenLayoutThenThirdPartyThenMotion
     * @tc.desc Selection history for MotionThenLayoutThenThirdPartyThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathMotionThenLayoutThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 3, 2];
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
     * @tc.name historyPathMotionThenThirdPartyThenLayoutThenAll
     * @tc.desc Selection history for MotionThenThirdPartyThenLayoutThenAll records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathMotionThenThirdPartyThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 1, 0];
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
     * @tc.name fontPathMotionThenThirdPartyThenOtherThenMotion
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenThirdPartyThenOtherThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenThirdPartyThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 4, 2];
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
