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

export default function TabContentScalingTest(): void {
  describe('TabContentScalingTest', () => {
    beforeAll(() => {
      logSuite('TabContentScalingTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TabContentScalingTest', 'end');
    });

    /**
     * @tc.name contentScalingToggleParitySweep
     * @tc.desc contentScaling baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('contentScalingToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 114; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(114);
      expect(model.color).assertEqual(colorAfterToggles(114));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name clickPathLayoutThenAllThenOtherThenLayout
     * @tc.desc Clicking LayoutThenAllThenOtherThenLayout updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenAllThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 4, 1];
      const trail: number[] = [-90, -90, -90, -90];
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
     * @tc.name clickPathLayoutThenMotionThenLayoutThenThirdParty
     * @tc.desc Clicking LayoutThenMotionThenLayoutThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenMotionThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 1, 3];
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
     * @tc.name swipePathLayoutThenMotionThenOtherThenThirdParty
     * @tc.desc Swiper onChange over LayoutThenMotionThenOtherThenThirdParty mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenMotionThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 2, 4, 3];
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
     * @tc.name historyPathLayoutThenThirdPartyThenMotionThenLayout
     * @tc.desc Selection history for LayoutThenThirdPartyThenMotionThenLayout records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenThirdPartyThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 2, 1];
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
     * @tc.name roundTripLayoutThenOtherThenAllThenThirdParty
     * @tc.desc A forward and reverse tour of LayoutThenOtherThenAllThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenOtherThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 4, 0, 3];
      const backward: number[] = [0, 4, 1, 0];
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
     * @tc.name scrollPathLayoutThenOtherThenMotionThenOther
     * @tc.desc Scroll focus offsets along LayoutThenOtherThenMotionThenOther follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenOtherThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 2, 4];
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
     * @tc.name clickPathMotionThenAllThenMotionThenAll
     * @tc.desc Clicking MotionThenAllThenMotionThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenAllThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 2, 0];
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
     * @tc.name barPathMotionThenAllThenOtherThenLayout
     * @tc.desc Indicator offsets stay on the tab grid while walking MotionThenAllThenOtherThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathMotionThenAllThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 4, 1];
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
     * @tc.name historyPathMotionThenLayoutThenMotionThenThirdParty
     * @tc.desc Selection history for MotionThenLayoutThenMotionThenThirdParty records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathMotionThenLayoutThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 2, 3];
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
     * @tc.name barPathMotionThenThirdPartyThenAllThenLayout
     * @tc.desc Indicator offsets stay on the tab grid while walking MotionThenThirdPartyThenAllThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathMotionThenThirdPartyThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 0, 1];
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
     * @tc.name scrollPathMotionThenThirdPartyThenMotionThenLayout
     * @tc.desc Scroll focus offsets along MotionThenThirdPartyThenMotionThenLayout follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathMotionThenThirdPartyThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 2, 1];
      const expected: number[] = [0, 90, 90, -90];
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

  });
}
