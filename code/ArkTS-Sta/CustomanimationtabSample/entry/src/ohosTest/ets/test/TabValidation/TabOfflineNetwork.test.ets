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

export default function TabOfflineNetworkTest(): void {
  describe('TabOfflineNetworkTest', () => {
    beforeAll(() => {
      logSuite('TabOfflineNetworkTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TabOfflineNetworkTest', 'end');
    });

    /**
     * @tc.name offlineNetworkToggleParitySweep
     * @tc.desc offlineNetwork baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('offlineNetworkToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 84; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(84);
      expect(model.color).assertEqual(colorAfterToggles(84));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name roundTripAllThenLayoutThenAll
     * @tc.desc A forward and reverse tour of AllThenLayoutThenAll restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 1, 0];
      const backward: number[] = [1, 0];
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
     * @tc.name swipePathAllThenLayoutThenOther
     * @tc.desc Swiper onChange over AllThenLayoutThenOther mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 1, 4];
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
     * @tc.name fontPathAllThenMotionThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking AllThenMotionThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 3];
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
     * @tc.name scrollPathAllThenThirdPartyThenLayout
     * @tc.desc Scroll focus offsets along AllThenThirdPartyThenLayout follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathAllThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 1];
      const expected: number[] = [0, 90, -90];
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
     * @tc.name barPathAllThenOtherThenAll
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenOtherThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 0];
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
     * @tc.name dragThenPathAllThenOtherThenThirdParty
     * @tc.desc A drag composed with AllThenOtherThenThirdParty preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 3];
      model.drag(112);
      expect(model.displacement).assertEqual(-
      112
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(3);
      expect(model.displacement).assertEqual(285 - 112);
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
     * @tc.name historyPathLayoutThenMotionThenAll
     * @tc.desc Selection history for LayoutThenMotionThenAll records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 0];
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
     * @tc.name scrollPathLayoutThenThirdPartyThenAll
     * @tc.desc Scroll focus offsets along LayoutThenThirdPartyThenAll follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 0];
      const expected: number[] = [-90, 90, 90];
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
     * @tc.name roundTripLayoutThenThirdPartyThenOther
     * @tc.desc A forward and reverse tour of LayoutThenThirdPartyThenOther restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 3, 4];
      const backward: number[] = [3, 1, 0];
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
     * @tc.name fontPathLayoutThenOtherThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenOtherThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 3];
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
     * @tc.name clickPathMotionThenAllThenOther
     * @tc.desc Clicking MotionThenAllThenOther updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenAllThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 4];
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
     * @tc.name clickPathMotionThenThirdPartyThenAll
     * @tc.desc Clicking MotionThenThirdPartyThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 0];
      const trail: number[] = [0, 90, 90];
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
     * @tc.name dragThenPathMotionThenOtherThenAll
     * @tc.desc A drag composed with MotionThenOtherThenAll preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathMotionThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 4, 0];
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
     * @tc.name scrollPathThirdPartyThenAllThenOther
     * @tc.desc Scroll focus offsets along ThirdPartyThenAllThenOther follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathThirdPartyThenAllThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 0, 4];
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
     * @tc.name fontPathThirdPartyThenMotionThenAll
     * @tc.desc Font emphasis tracks the active tab while walking ThirdPartyThenMotionThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathThirdPartyThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 2, 0];
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
     * @tc.name historyPathThirdPartyThenOtherThenLayout
     * @tc.desc Selection history for ThirdPartyThenOtherThenLayout records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathThirdPartyThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 4, 1];
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
     * @tc.name swipePathOtherThenAllThenOther
     * @tc.desc Swiper onChange over OtherThenAllThenOther mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathOtherThenAllThenOther', 0, () => {
      const model = new TabState();
      const swipes: number[] = [4, 0, 4];
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
     * @tc.name scrollPathOtherThenMotionThenLayout
     * @tc.desc Scroll focus offsets along OtherThenMotionThenLayout follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathOtherThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 2, 1];
      const expected: number[] = [0, 0, -90];
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
     * @tc.name dragThenPathOtherThenThirdPartyThenMotion
     * @tc.desc A drag composed with OtherThenThirdPartyThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathOtherThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [4, 3, 2];
      model.drag(112);
      expect(model.displacement).assertEqual(-
      112
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(2);
      expect(model.displacement).assertEqual(190 - 112);
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
     * @tc.name clickPathAllThenLayoutThenMotionThenOther
     * @tc.desc Clicking AllThenLayoutThenMotionThenOther updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenLayoutThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2, 4];
      const trail: number[] = [0, -90, -90, -90];
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
     * @tc.name swipePathAllThenLayoutThenOtherThenMotion
     * @tc.desc Swiper onChange over AllThenLayoutThenOtherThenMotion mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenLayoutThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 1, 4, 2];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(2);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(-90);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name dragThenPathAllThenMotionThenLayoutThenMotion
     * @tc.desc A drag composed with AllThenMotionThenLayoutThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenMotionThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 1, 2];
      model.drag(67);
      expect(model.displacement).assertEqual(-
      67
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(2);
      expect(model.displacement).assertEqual(190 - 67);
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
     * @tc.name fontPathAllThenMotionThenOtherThenMotion
     * @tc.desc Font emphasis tracks the active tab while walking AllThenMotionThenOtherThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenMotionThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 4, 2];
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
     * @tc.name swipePathAllThenThirdPartyThenLayoutThenMotion
     * @tc.desc Swiper onChange over AllThenThirdPartyThenLayoutThenMotion mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenThirdPartyThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 3, 1, 2];
      for (let i = 0; i < swipes.length; i++) {
        model.onChange(swipes[i]);
        expect(model.index).assertEqual(swipes[i]);
        expect(model.displacement).assertEqual(oracleDisplacement(swipes.slice(0, i + 1)));
      }
      expect(model.index).assertEqual(2);
      expect(model.changes).assertEqual(swipes.length);
      expect(model.selects).assertEqual(0);
      expect(model.scrollX).assertEqual(-90);
      expect(displacementInvariant(model)).assertTrue();
      expect(model.history[0].indexOf(
      'change:'
      )).assertEqual(0);
    });

    /**
     * @tc.name fontPathAllThenThirdPartyThenOtherThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking AllThenThirdPartyThenOtherThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenThirdPartyThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 4, 1];
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
     * @tc.name fontPathAllThenOtherThenLayoutThenAll
     * @tc.desc Font emphasis tracks the active tab while walking AllThenOtherThenLayoutThenAll.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenOtherThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 1, 0];
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
     * @tc.name roundTripAllThenOtherThenMotionThenOther
     * @tc.desc A forward and reverse tour of AllThenOtherThenMotionThenOther restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenOtherThenMotionThenOther', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 4, 2, 4];
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
     * @tc.name scrollPathLayoutThenAllThenLayoutThenOther
     * @tc.desc Scroll focus offsets along LayoutThenAllThenLayoutThenOther follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenAllThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 1, 4];
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
     * @tc.name dragThenPathLayoutThenAllThenThirdPartyThenMotion
     * @tc.desc A drag composed with LayoutThenAllThenThirdPartyThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenAllThenThirdPartyThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 3, 2];
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
     * @tc.name barPathLayoutThenMotionThenLayoutThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenMotionThenLayoutThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenMotionThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 1, 2];
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
     * @tc.name fontPathLayoutThenMotionThenOtherThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenMotionThenOtherThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenMotionThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 4, 1];
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
     * @tc.name fontPathLayoutThenThirdPartyThenLayoutThenMotion
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenThirdPartyThenLayoutThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenThirdPartyThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 1, 2];
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
     * @tc.name clickPathLayoutThenThirdPartyThenOtherThenMotion
     * @tc.desc Clicking LayoutThenThirdPartyThenOtherThenMotion updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenThirdPartyThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 4, 2];
      const trail: number[] = [-90, 90, 90, 90];
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
     * @tc.name barPathLayoutThenOtherThenLayoutThenOther
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenOtherThenLayoutThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenOtherThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 1, 4];
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
     * @tc.name scrollPathMotionThenAllThenLayoutThenAll
     * @tc.desc Scroll focus offsets along MotionThenAllThenLayoutThenAll follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathMotionThenAllThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 1, 0];
      const expected: number[] = [0, 0, -90, -90];
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
     * @tc.name clickPathMotionThenAllThenThirdPartyThenLayout
     * @tc.desc Clicking MotionThenAllThenThirdPartyThenLayout updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenAllThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 3, 1];
      const trail: number[] = [0, 0, 90, -90];
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
     * @tc.name roundTripMotionThenLayoutThenAllThenThirdParty
     * @tc.desc A forward and reverse tour of MotionThenLayoutThenAllThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripMotionThenLayoutThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [2, 1, 0, 3];
      const backward: number[] = [0, 1, 2, 0];
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
     * @tc.name fontPathMotionThenLayoutThenThirdPartyThenOther
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenLayoutThenThirdPartyThenOther.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenLayoutThenThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 3, 4];
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
     * @tc.name swipePathMotionThenThirdPartyThenLayoutThenAll
     * @tc.desc Swiper onChange over MotionThenThirdPartyThenLayoutThenAll mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathMotionThenThirdPartyThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const swipes: number[] = [2, 3, 1, 0];
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
     * @tc.name dragThenPathMotionThenThirdPartyThenOtherThenMotion
     * @tc.desc A drag composed with MotionThenThirdPartyThenOtherThenMotion preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathMotionThenThirdPartyThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 4, 2];
      model.drag(67);
      expect(model.displacement).assertEqual(-
      67
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(2);
      expect(model.displacement).assertEqual(190 - 67);
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

  });
}
