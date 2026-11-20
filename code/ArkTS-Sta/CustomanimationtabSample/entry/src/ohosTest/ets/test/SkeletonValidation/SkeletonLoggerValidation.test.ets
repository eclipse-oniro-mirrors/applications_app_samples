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

export default function SkeletonLoggerValidationTest(): void {
  describe('SkeletonLoggerValidationTest', () => {
    beforeAll(() => {
      logSuite('SkeletonLoggerValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SkeletonLoggerValidationTest', 'end');
    });

    /**
     * @tc.name skeletonLoggerValidationToggleParitySweep
     * @tc.desc skeletonLoggerValidation baseline: colour parity is checked after each toggle of the configured cycle.
     * @tc.type Function
     * @tc.level Level1
     */
    it('skeletonLoggerValidationToggleParitySweep', 0, () => {
      const model = new TabState();
      expect(model.color).assertEqual(DEFAULT_COLOR);
      for (let i = 0; i <= 104; i++) {
        if (i > 0) { model.toggleColor(); }
        expect(model.color).assertEqual(colorAfterToggles(i));
        expect(model.toggles).assertEqual(i);
        expect(model.color === TOGGLE_COLOR).assertEqual(i % 2 === 1);
      }
      expect(model.toggles).assertEqual(104);
      expect(model.color).assertEqual(colorAfterToggles(104));
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0);
    });

    /**
     * @tc.name historyPathAllThenLayoutThenOther
     * @tc.desc Selection history for AllThenLayoutThenOther records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 4];
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
     * @tc.name roundTripAllThenMotionThenThirdParty
     * @tc.desc A forward and reverse tour of AllThenMotionThenThirdParty restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 2, 3];
      const backward: number[] = [2, 0];
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
     * @tc.name dragThenPathAllThenThirdPartyThenLayout
     * @tc.desc A drag composed with AllThenThirdPartyThenLayout preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenThirdPartyThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 1];
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
     * @tc.name clickPathAllThenOtherThenMotion
     * @tc.desc Clicking AllThenOtherThenMotion updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenOtherThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 2];
      const trail: number[] = [0, 0, 0];
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
     * @tc.name barPathLayoutThenAllThenMotion
     * @tc.desc Indicator offsets stay on the tab grid while walking LayoutThenAllThenMotion.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathLayoutThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 2];
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
     * @tc.name swipePathLayoutThenMotionThenLayout
     * @tc.desc Swiper onChange over LayoutThenMotionThenLayout mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathLayoutThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const swipes: number[] = [1, 2, 1];
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
     * @tc.name dragThenPathLayoutThenThirdPartyThenAll
     * @tc.desc A drag composed with LayoutThenThirdPartyThenAll preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 0];
      model.drag(112);
      expect(model.displacement).assertEqual(-
      112
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0 - 112);
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
     * @tc.name fontPathLayoutThenOtherThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenOtherThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenOtherThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 1];
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
     * @tc.name swipePathMotionThenAllThenMotion
     * @tc.desc Swiper onChange over MotionThenAllThenMotion mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathMotionThenAllThenMotion', 0, () => {
      const model = new TabState();
      const swipes: number[] = [2, 0, 2];
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
     * @tc.name clickPathMotionThenLayoutThenThirdParty
     * @tc.desc Clicking MotionThenLayoutThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenLayoutThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 3];
      const trail: number[] = [0, -90, 90];
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
     * @tc.name swipePathMotionThenThirdPartyThenOther
     * @tc.desc Swiper onChange over MotionThenThirdPartyThenOther mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathMotionThenThirdPartyThenOther', 0, () => {
      const model = new TabState();
      const swipes: number[] = [2, 3, 4];
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
     * @tc.name fontPathThirdPartyThenAllThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking ThirdPartyThenAllThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathThirdPartyThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 0, 1];
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
     * @tc.name scrollPathThirdPartyThenLayoutThenMotion
     * @tc.desc Scroll focus offsets along ThirdPartyThenLayoutThenMotion follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathThirdPartyThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 1, 2];
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
     * @tc.name fontPathThirdPartyThenMotionThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking ThirdPartyThenMotionThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathThirdPartyThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 2, 3];
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
     * @tc.name fontPathThirdPartyThenOtherThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking ThirdPartyThenOtherThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathThirdPartyThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [3, 4, 3];
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
     * @tc.name roundTripOtherThenLayoutThenAll
     * @tc.desc A forward and reverse tour of OtherThenLayoutThenAll restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripOtherThenLayoutThenAll', 0, () => {
      const model = new TabState();
      const forward: number[] = [4, 1, 0];
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
     * @tc.name swipePathOtherThenMotionThenThirdParty
     * @tc.desc Swiper onChange over OtherThenMotionThenThirdParty mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathOtherThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const swipes: number[] = [4, 2, 3];
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
     * @tc.name barPathAllThenLayoutThenAllThenLayout
     * @tc.desc Indicator offsets stay on the tab grid while walking AllThenLayoutThenAllThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('barPathAllThenLayoutThenAllThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 0, 1];
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
     * @tc.name fontPathAllThenLayoutThenMotionThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking AllThenLayoutThenMotionThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathAllThenLayoutThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 2, 3];
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
     * @tc.name dragThenPathAllThenLayoutThenOtherThenAll
     * @tc.desc A drag composed with AllThenLayoutThenOtherThenAll preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathAllThenLayoutThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 1, 4, 0];
      model.drag(67);
      expect(model.displacement).assertEqual(-
      67
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0 - 67);
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
     * @tc.name historyPathAllThenMotionThenLayoutThenMotion
     * @tc.desc Selection history for AllThenMotionThenLayoutThenMotion records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenMotionThenLayoutThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 2, 1, 2];
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
     * @tc.name roundTripAllThenMotionThenOtherThenAll
     * @tc.desc A forward and reverse tour of AllThenMotionThenOtherThenAll restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripAllThenMotionThenOtherThenAll', 0, () => {
      const model = new TabState();
      const forward: number[] = [0, 2, 4, 0];
      const backward: number[] = [4, 2, 0];
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
     * @tc.name historyPathAllThenThirdPartyThenAllThenOther
     * @tc.desc Selection history for AllThenThirdPartyThenAllThenOther records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathAllThenThirdPartyThenAllThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 0, 4];
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
     * @tc.name clickPathAllThenThirdPartyThenMotionThenOther
     * @tc.desc Clicking AllThenThirdPartyThenMotionThenOther updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenThirdPartyThenMotionThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 3, 2, 4];
      const trail: number[] = [0, 90, 90, 90];
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
     * @tc.name swipePathAllThenOtherThenAllThenOther
     * @tc.desc Swiper onChange over AllThenOtherThenAllThenOther mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathAllThenOtherThenAllThenOther', 0, () => {
      const model = new TabState();
      const swipes: number[] = [0, 4, 0, 4];
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
     * @tc.name clickPathAllThenOtherThenThirdPartyThenAll
     * @tc.desc Clicking AllThenOtherThenThirdPartyThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathAllThenOtherThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [0, 4, 3, 0];
      const trail: number[] = [0, 0, 90, 90];
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
     * @tc.name historyPathLayoutThenAllThenMotionThenAll
     * @tc.desc Selection history for LayoutThenAllThenMotionThenAll records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenAllThenMotionThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 2, 0];
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
     * @tc.name dragThenPathLayoutThenAllThenOtherThenAll
     * @tc.desc A drag composed with LayoutThenAllThenOtherThenAll preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathLayoutThenAllThenOtherThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 0, 4, 0];
      model.drag(58);
      expect(model.displacement).assertEqual(-
      58
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(0);
      expect(model.displacement).assertEqual(0 - 58);
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
     * @tc.name clickPathLayoutThenMotionThenThirdPartyThenAll
     * @tc.desc Clicking LayoutThenMotionThenThirdPartyThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathLayoutThenMotionThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 2, 3, 0];
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
     * @tc.name scrollPathLayoutThenThirdPartyThenAllThenMotion
     * @tc.desc Scroll focus offsets along LayoutThenThirdPartyThenAllThenMotion follow the left and right anchor rule.
     * @tc.type Function
     * @tc.level Level1
     */
    it('scrollPathLayoutThenThirdPartyThenAllThenMotion', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 0, 2];
      const expected: number[] = [-90, 90, 90, 90];
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
     * @tc.name fontPathLayoutThenThirdPartyThenMotionThenLayout
     * @tc.desc Font emphasis tracks the active tab while walking LayoutThenThirdPartyThenMotionThenLayout.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathLayoutThenThirdPartyThenMotionThenLayout', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 3, 2, 1];
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
     * @tc.name roundTripLayoutThenOtherThenAllThenMotion
     * @tc.desc A forward and reverse tour of LayoutThenOtherThenAllThenMotion restores the starting tab.
     * @tc.type Function
     * @tc.level Level1
     */
    it('roundTripLayoutThenOtherThenAllThenMotion', 0, () => {
      const model = new TabState();
      const forward: number[] = [1, 4, 0, 2];
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
     * @tc.name historyPathLayoutThenOtherThenMotionThenThirdParty
     * @tc.desc Selection history for LayoutThenOtherThenMotionThenThirdParty records every hop in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('historyPathLayoutThenOtherThenMotionThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [1, 4, 2, 3];
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
     * @tc.name dragThenPathMotionThenAllThenLayoutThenOther
     * @tc.desc A drag composed with MotionThenAllThenLayoutThenOther preserves both offsets in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('dragThenPathMotionThenAllThenLayoutThenOther', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 1, 4];
      model.drag(49);
      expect(model.displacement).assertEqual(-
      49
      );
      for (let i = 0; i < path.length; i++) { model.select(path[i]); }
      expect(model.index).assertEqual(4);
      expect(model.displacement).assertEqual(380 - 49);
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
     * @tc.name fontPathMotionThenAllThenOtherThenThirdParty
     * @tc.desc Font emphasis tracks the active tab while walking MotionThenAllThenOtherThenThirdParty.
     * @tc.type Function
     * @tc.level Level1
     */
    it('fontPathMotionThenAllThenOtherThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 0, 4, 3];
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
     * @tc.name clickPathMotionThenLayoutThenThirdPartyThenAll
     * @tc.desc Clicking MotionThenLayoutThenThirdPartyThenAll updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenLayoutThenThirdPartyThenAll', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 1, 3, 0];
      const trail: number[] = [0, -90, 90, 90];
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
     * @tc.name clickPathMotionThenThirdPartyThenAllThenThirdParty
     * @tc.desc Clicking MotionThenThirdPartyThenAllThenThirdParty updates index and displacement at every hop.
     * @tc.type Function
     * @tc.level Level0
     */
    it('clickPathMotionThenThirdPartyThenAllThenThirdParty', 0, () => {
      const model = new TabState();
      const path: number[] = [2, 3, 0, 3];
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
     * @tc.name swipePathMotionThenThirdPartyThenOtherThenAll
     * @tc.desc Swiper onChange over MotionThenThirdPartyThenOtherThenAll mirrors the click state transfer.
     * @tc.type Function
     * @tc.level Level0
     */
    it('swipePathMotionThenThirdPartyThenOtherThenAll', 0, () => {
      const model = new TabState();
      const swipes: number[] = [2, 3, 4, 0];
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

  });
}
