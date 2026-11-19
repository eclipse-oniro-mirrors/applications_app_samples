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
import { describe, expect, it } from '@ohos/hypium';
import {
  DEFAULT_INDEX,
  TabSelectionModel,
  TAB_COUNT,
  TAB_FIXTURES,
  TAB_LABELS,
  isIndexValid,
  pageTitleFor,
  resolveLabelIndex,
  sumSkeletonRows,
  uniqueLabels,
} from '../Shared/CustomAnimationTabFixtures';

/**
 * Deep pure-model suite for the tab selection state.
 * No Driver and no EntryAbility are used; the same index arithmetic that
 * pages/Index.ets performs for swiperIndex is exercised directly.
 */
export default function tabModelDeepTest(): void {
  describe('TabModelDeepTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_0100
    // @tc.name tabModelDeepTest001
    // @tc.desc Verify a new selection model starts on the first tab.
    it('tabModelDeepTest001', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      expect(model.currentIndex()).assertEqual(DEFAULT_INDEX);
      expect(model.currentIndex()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_0200
    // @tc.name tabModelDeepTest002
    // @tc.desc Verify the model exposes five tabs.
    it('tabModelDeepTest002', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      expect(model.count()).assertEqual(TAB_COUNT);
      expect(model.count()).assertEqual(5);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_0300
    // @tc.name tabModelDeepTest003
    // @tc.desc Verify the initial label is the All label.
    it('tabModelDeepTest003', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      expect(model.currentLabel()).assertEqual(TAB_LABELS[0]);
      expect(model.currentLabel()).assertEqual('\u5168\u90e8');
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_0400
    // @tc.name tabModelDeepTest004
    // @tc.desc Verify every production tab label is present in order.
    it('tabModelDeepTest004', 0, (): void => {
      expect(TAB_LABELS[0]).assertEqual('\u5168\u90e8');
      expect(TAB_LABELS[1]).assertEqual('UI\u5e03\u5c40');
      expect(TAB_LABELS[2]).assertEqual('\u52a8\u6548');
      expect(TAB_LABELS[3]).assertEqual('\u4e09\u65b9\u5e93');
      expect(TAB_LABELS[4]).assertEqual('\u5176\u4ed6');
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_0500
    // @tc.name tabModelDeepTest005
    // @tc.desc Verify all tab labels are unique.
    it('tabModelDeepTest005', 0, (): void => {
      expect(uniqueLabels()).assertEqual(TAB_COUNT);
      expect(TAB_LABELS.length).assertEqual(TAB_COUNT);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_0600
    // @tc.name tabModelDeepTest006
    // @tc.desc Verify label resolution returns each original index.
    it('tabModelDeepTest006', 0, (): void => {
      for (let index: number = 0; index < TAB_COUNT; index++) {
        expect(resolveLabelIndex(TAB_LABELS[index])).assertEqual(index);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_0700
    // @tc.name tabModelDeepTest007
    // @tc.desc Verify an unknown label resolves to -1.
    it('tabModelDeepTest007', 0, (): void => {
      expect(resolveLabelIndex('missing')).assertEqual(-1);
      expect(resolveLabelIndex('')).assertEqual(-1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_0800
    // @tc.name tabModelDeepTest008
    // @tc.desc Verify selecting every valid index updates the label.
    it('tabModelDeepTest008', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      for (let index: number = 0; index < TAB_COUNT; index++) {
        expect(model.select(index)).assertTrue();
        expect(model.currentIndex()).assertEqual(index);
        expect(model.currentLabel()).assertEqual(TAB_LABELS[index]);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_0900
    // @tc.name tabModelDeepTest009
    // @tc.desc Verify a negative index is rejected without changing state.
    it('tabModelDeepTest009', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      model.select(2);
      expect(model.select(-1)).assertFalse();
      expect(model.currentIndex()).assertEqual(2);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_1000
    // @tc.name tabModelDeepTest010
    // @tc.desc Verify the count boundary index is rejected.
    it('tabModelDeepTest010', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      model.select(4);
      expect(model.select(TAB_COUNT)).assertFalse();
      expect(model.select(100)).assertFalse();
      expect(model.currentIndex()).assertEqual(4);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_1100
    // @tc.name tabModelDeepTest011
    // @tc.desc Verify selecting by label works for every tab.
    it('tabModelDeepTest011', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      for (let index: number = 0; index < TAB_COUNT; index++) {
        expect(model.selectByLabel(TAB_LABELS[index])).assertTrue();
        expect(model.currentIndex()).assertEqual(index);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_1200
    // @tc.name tabModelDeepTest012
    // @tc.desc Verify an unknown label is rejected without changing state.
    it('tabModelDeepTest012', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      model.select(3);
      expect(model.selectByLabel('unknown')).assertFalse();
      expect(model.currentIndex()).assertEqual(3);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_1300
    // @tc.name tabModelDeepTest013
    // @tc.desc Verify moveNext advances one tab at a time.
    it('tabModelDeepTest013', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      for (let index: number = 1; index < TAB_COUNT; index++) {
        expect(model.moveNext()).assertTrue();
        expect(model.currentIndex()).assertEqual(index);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_1400
    // @tc.name tabModelDeepTest014
    // @tc.desc Verify moveNext stops at the last tab.
    it('tabModelDeepTest014', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      model.select(TAB_COUNT - 1);
      expect(model.moveNext()).assertFalse();
      expect(model.moveNext()).assertFalse();
      expect(model.currentIndex()).assertEqual(TAB_COUNT - 1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_1500
    // @tc.name tabModelDeepTest015
    // @tc.desc Verify movePrev walks backward to the first tab.
    it('tabModelDeepTest015', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      model.select(TAB_COUNT - 1);
      for (let index: number = TAB_COUNT - 2; index >= 0; index--) {
        expect(model.movePrev()).assertTrue();
        expect(model.currentIndex()).assertEqual(index);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_1600
    // @tc.name tabModelDeepTest016
    // @tc.desc Verify movePrev stops at the first tab.
    it('tabModelDeepTest016', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      expect(model.movePrev()).assertFalse();
      expect(model.movePrev()).assertFalse();
      expect(model.currentIndex()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_1700
    // @tc.name tabModelDeepTest017
    // @tc.desc Verify reset restores the first tab after navigation.
    it('tabModelDeepTest017', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      model.select(4);
      model.reset();
      expect(model.currentIndex()).assertEqual(0);
      expect(model.currentLabel()).assertEqual(TAB_LABELS[0]);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_1800
    // @tc.name tabModelDeepTest018
    // @tc.desc Verify the generated page title matches the model index.
    it('tabModelDeepTest018', 0, (): void => {
      for (let index: number = 0; index < TAB_COUNT; index++) {
        expect(pageTitleFor(index)).assertEqual('page-title-' + String(index));
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_1900
    // @tc.name tabModelDeepTest019
    // @tc.desc Verify fixture indices, labels and title ids are aligned.
    it('tabModelDeepTest019', 0, (): void => {
      expect(TAB_FIXTURES.length).assertEqual(TAB_COUNT);
      for (let index: number = 0; index < TAB_FIXTURES.length; index++) {
        expect(TAB_FIXTURES[index].index).assertEqual(index);
        expect(TAB_FIXTURES[index].label).assertEqual(TAB_LABELS[index]);
        expect(TAB_FIXTURES[index].titleId).assertEqual(pageTitleFor(index));
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_2000
    // @tc.name tabModelDeepTest020
    // @tc.desc Verify each page carries eight skeleton rows.
    it('tabModelDeepTest020', 0, (): void => {
      for (let index: number = 0; index < TAB_FIXTURES.length; index++) {
        expect(TAB_FIXTURES[index].skeletonRows).assertEqual(8);
      }
      expect(sumSkeletonRows()).assertEqual(TAB_COUNT * 8);
      expect(sumSkeletonRows()).assertEqual(40);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_2100
    // @tc.name tabModelDeepTest021
    // @tc.desc Verify index validation covers lower and upper boundaries.
    it('tabModelDeepTest021', 0, (): void => {
      expect(isIndexValid(-1)).assertFalse();
      expect(isIndexValid(0)).assertTrue();
      expect(isIndexValid(TAB_COUNT - 1)).assertTrue();
      expect(isIndexValid(TAB_COUNT)).assertFalse();
      expect(isIndexValid(100)).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_2200
    // @tc.name tabModelDeepTest022
    // @tc.desc Verify labelAt returns an empty string for invalid indices.
    it('tabModelDeepTest022', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      expect(model.labelAt(-1)).assertEqual('');
      expect(model.labelAt(TAB_COUNT)).assertEqual('');
      expect(model.labelAt(1)).assertEqual(TAB_LABELS[1]);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_2300
    // @tc.name tabModelDeepTest023
    // @tc.desc Verify repeated selection of the same tab is idempotent.
    it('tabModelDeepTest023', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      for (let round: number = 0; round < 50; round++) {
        expect(model.select(2)).assertTrue();
      }
      expect(model.currentIndex()).assertEqual(2);
      expect(model.currentLabel()).assertEqual(TAB_LABELS[2]);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_2400
    // @tc.name tabModelDeepTest024
    // @tc.desc Verify a full forward then backward walk returns to index 0.
    it('tabModelDeepTest024', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      while (model.moveNext()) {
        expect(model.currentIndex() > 0).assertTrue();
      }
      expect(model.currentIndex()).assertEqual(TAB_COUNT - 1);
      while (model.movePrev()) {
        expect(model.currentIndex() >= 0).assertTrue();
      }
      expect(model.currentIndex()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_2500
    // @tc.name tabModelDeepTest025
    // @tc.desc Verify alternating endpoints never drift from expected indices.
    it('tabModelDeepTest025', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      for (let round: number = 0; round < 100; round++) {
        model.select(round % 2 === 0 ? 0 : 4);
        expect(model.currentIndex()).assertEqual(round % 2 === 0 ? 0 : 4);
      }
      expect(model.currentIndex()).assertEqual(4);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_2600
    // @tc.name tabModelDeepTest026
    // @tc.desc Verify two model instances do not share selection state.
    it('tabModelDeepTest026', 0, (): void => {
      const first: TabSelectionModel = new TabSelectionModel();
      const second: TabSelectionModel = new TabSelectionModel();
      first.select(3);
      expect(second.currentIndex()).assertEqual(0);
      second.select(1);
      expect(first.currentIndex()).assertEqual(3);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_2700
    // @tc.name tabModelDeepTest027
    // @tc.desc Verify a deterministic 200-step select walk ends at a known index.
    it('tabModelDeepTest027', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      let expected: number = 0;
      for (let step: number = 1; step <= 200; step++) {
        expected = step % TAB_COUNT;
        model.select(expected);
      }
      expect(expected).assertEqual(0);
      expect(model.currentIndex()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MODEL_2800
    // @tc.name tabModelDeepTest028
    // @tc.desc Verify snapshotIndex mirrors currentIndex for every tab.
    it('tabModelDeepTest028', 0, (): void => {
      const model: TabSelectionModel = new TabSelectionModel();
      for (let index: number = 0; index < TAB_COUNT; index++) {
        model.select(index);
        expect(model.snapshotIndex()).assertEqual(index);
      }
    });
  });
}
