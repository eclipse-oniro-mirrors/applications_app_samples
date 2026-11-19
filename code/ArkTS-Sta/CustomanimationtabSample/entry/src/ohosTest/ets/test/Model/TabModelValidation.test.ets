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
  ClickResult,
  OperationResult,
  INDICATOR_GRAY,
  INDICATOR_GRAY_ID,
  INDICATOR_YELLOW,
  INDICATOR_YELLOW_ID,
  TabConsistencyModel,
  TabOperationCatalog,
  TabSnapshot,
  TabSnapshotData,
  TabStateModel,
  TabValidationModel,
  TAB_LABELS,
  expectedScrollOffset,
  pageTitleFor,
} from '../Shared/CustomAnimationTabFixtures';

/**
 * Pure validation suite for model inputs, snapshots and derived ids.
 */
export default function tabModelValidationTest(): void {
  describe('TabModelValidationTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_0100
    // @tc.name tabModelValidationTest001
    // @tc.desc Verify index validation accepts only 0 to 4.
    it('tabModelValidationTest001', 0, (): void => {
      expect(TabValidationModel.isValidIndex(-1)).assertFalse();
      expect(TabValidationModel.isValidIndex(0)).assertTrue();
      expect(TabValidationModel.isValidIndex(4)).assertTrue();
      expect(TabValidationModel.isValidIndex(5)).assertFalse();
      expect(TabValidationModel.isValidIndex(100)).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_0200
    // @tc.name tabModelValidationTest002
    // @tc.desc Verify all production labels are valid and unknown labels are not.
    it('tabModelValidationTest002', 0, (): void => {
      for (let index: number = 0; index < TAB_LABELS.length; index++) {
        expect(TabValidationModel.isValidLabel(TAB_LABELS[index])).assertTrue();
      }
      expect(TabValidationModel.isValidLabel('bad')).assertFalse();
      expect(TabValidationModel.isValidLabel('')).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_0300
    // @tc.name tabModelValidationTest003
    // @tc.desc Verify color values accept only gray and yellow.
    it('tabModelValidationTest003', 0, (): void => {
      expect(TabValidationModel.isValidColorValue(INDICATOR_GRAY)).assertTrue();
      expect(
        TabValidationModel.isValidColorValue(INDICATOR_YELLOW),
      ).assertTrue();
      expect(TabValidationModel.isValidColorValue('#FFFFFF')).assertFalse();
      expect(TabValidationModel.isValidColorValue('')).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_0400
    // @tc.name tabModelValidationTest004
    // @tc.desc Verify indicator state ids are limited to the two production ids.
    it('tabModelValidationTest004', 0, (): void => {
      expect(TabValidationModel.isValidStateId(INDICATOR_GRAY_ID)).assertTrue();
      expect(
        TabValidationModel.isValidStateId(INDICATOR_YELLOW_ID),
      ).assertTrue();
      expect(TabValidationModel.isValidStateId('indicator-red')).assertFalse();
      expect(TabValidationModel.isValidStateId('')).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_0500
    // @tc.name tabModelValidationTest005
    // @tc.desc Verify operation validation covers every catalogue entry.
    it('tabModelValidationTest005', 0, (): void => {
      for (let operation: number = 0; operation < 5; operation++) {
        expect(TabValidationModel.isValidOperation(operation)).assertTrue();
      }
      expect(TabValidationModel.isValidOperation(-1)).assertFalse();
      expect(TabValidationModel.isValidOperation(5)).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_0600
    // @tc.name tabModelValidationTest006
    // @tc.desc Verify skeleton row validation requires exactly eight rows.
    it('tabModelValidationTest006', 0, (): void => {
      expect(TabValidationModel.isValidRowCount(8)).assertTrue();
      expect(TabValidationModel.isValidRowCount(7)).assertFalse();
      expect(TabValidationModel.isValidRowCount(9)).assertFalse();
      expect(TabValidationModel.isValidRowCount(0)).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_0700
    // @tc.name tabModelValidationTest007
    // @tc.desc Verify non-negative validation.
    it('tabModelValidationTest007', 0, (): void => {
      expect(TabValidationModel.isNonNegative(0)).assertTrue();
      expect(TabValidationModel.isNonNegative(1)).assertTrue();
      expect(TabValidationModel.isNonNegative(-1)).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_0800
    // @tc.name tabModelValidationTest008
    // @tc.desc Verify toggle count validation rejects negatives.
    it('tabModelValidationTest008', 0, (): void => {
      expect(TabValidationModel.isValidToggleCount(0)).assertTrue();
      expect(TabValidationModel.isValidToggleCount(100)).assertTrue();
      expect(TabValidationModel.isValidToggleCount(-1)).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_0900
    // @tc.name tabModelValidationTest009
    // @tc.desc Verify the default snapshot is valid.
    it('tabModelValidationTest009', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(TabValidationModel.isValidSnapshot(state.snapshot())).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_1000
    // @tc.name tabModelValidationTest010
    // @tc.desc Verify snapshots with invalid indices are rejected.
    it('tabModelValidationTest010', 0, (): void => {
      expect(
        TabValidationModel.isValidSnapshot({
          index: -1,
          displacement: 0,
          yellow: false,
        }),
      ).assertFalse();
      expect(
        TabValidationModel.isValidSnapshot({
          index: 5,
          displacement: 0,
          yellow: false,
        }),
      ).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_1100
    // @tc.name tabModelValidationTest011
    // @tc.desc Verify accepted click results carry the expected delta.
    it('tabModelValidationTest011', 0, (): void => {
      const result: ClickResult = {
        accepted: true,
        from: 0,
        to: 3,
        displacementDelta: 285,
        scrollOffset: 90,
      };
      expect(TabValidationModel.isValidClickResult(result)).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_1200
    // @tc.name tabModelValidationTest012
    // @tc.desc Verify rejected click results require zero delta and offset.
    it('tabModelValidationTest012', 0, (): void => {
      const rejected: ClickResult = {
        accepted: false,
        from: -1,
        to: -1,
        displacementDelta: 0,
        scrollOffset: 0,
      };
      expect(TabValidationModel.isValidClickResult(rejected)).assertTrue();
      const inconsistent: ClickResult = {
        accepted: false,
        from: -1,
        to: -1,
        displacementDelta: 95,
        scrollOffset: 0,
      };
      expect(TabValidationModel.isValidClickResult(inconsistent)).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_1300
    // @tc.name tabModelValidationTest013
    // @tc.desc Verify a mismatched click delta is detected.
    it('tabModelValidationTest013', 0, (): void => {
      const result: ClickResult = {
        accepted: true,
        from: 0,
        to: 2,
        displacementDelta: 0,
        scrollOffset: 0,
      };
      expect(TabValidationModel.isValidClickResult(result)).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_1400
    // @tc.name tabModelValidationTest014
    // @tc.desc Verify every selection snapshot remains valid.
    it('tabModelValidationTest014', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let index: number = 0; index < 5; index++) {
        state.click(index);
        expect(
          TabValidationModel.isValidSnapshot(state.snapshot()),
        ).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_1500
    // @tc.name tabModelValidationTest015
    // @tc.desc Verify every click result across all index pairs is valid.
    it('tabModelValidationTest015', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let from: number = 0; from < 5; from++) {
        for (let to: number = 0; to < 5; to++) {
          const result: ClickResult = state.layout.applyClick(from, to);
          expect(TabValidationModel.isValidClickResult(result)).assertTrue();
          state.layout.reset();
        }
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_1600
    // @tc.name tabModelValidationTest016
    // @tc.desc Verify snapshots stay valid after every swipe.
    it('tabModelValidationTest016', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 10; step++) {
        state.swipeForward();
        expect(
          TabValidationModel.isValidSnapshot(state.snapshot()),
        ).assertTrue();
      }
      for (let step: number = 0; step < 10; step++) {
        state.swipeBackward();
        expect(
          TabValidationModel.isValidSnapshot(state.snapshot()),
        ).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_1700
    // @tc.name tabModelValidationTest017
    // @tc.desc Verify repeated toggles keep the snapshot valid.
    it('tabModelValidationTest017', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 50; step++) {
        state.toggleColor();
        expect(
          TabValidationModel.isValidSnapshot(state.snapshot()),
        ).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_1800
    // @tc.name tabModelValidationTest018
    // @tc.desc Verify reset always produces the valid initial snapshot.
    it('tabModelValidationTest018', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(3);
      state.toggleColor();
      state.reset();
      const snapshot: TabSnapshotData = state.snapshot();
      expect(TabValidationModel.isValidSnapshot(snapshot)).assertTrue();
      expect(snapshot.index).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_1900
    // @tc.name tabModelValidationTest019
    // @tc.desc Verify invalid operations do not produce invalid snapshots.
    it('tabModelValidationTest019', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let operation: number = -5; operation < 0; operation++) {
        const result: OperationResult = TabOperationCatalog.apply(
          state,
          operation,
          0,
        );
        expect(result.accepted).assertFalse();
        expect(
          TabValidationModel.isValidSnapshot(result.snapshot),
        ).assertTrue();
      }
      for (let operation: number = 5; operation < 10; operation++) {
        const result: OperationResult = TabOperationCatalog.apply(
          state,
          operation,
          0,
        );
        expect(result.accepted).assertFalse();
        expect(
          TabValidationModel.isValidSnapshot(result.snapshot),
        ).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_2000
    // @tc.name tabModelValidationTest020
    // @tc.desc Verify a 100-step mixed run keeps snapshots valid.
    it('tabModelValidationTest020', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 100; step++) {
        if (step % 5 === 0) {
          state.click(step % 5);
        } else if (step % 5 === 1) {
          state.swipeForward();
        } else if (step % 5 === 2) {
          state.swipeBackward();
        } else if (step % 5 === 3) {
          state.toggleColor();
        } else {
          state.reset();
        }
        expect(
          TabValidationModel.isValidSnapshot(state.snapshot()),
        ).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_2100
    // @tc.name tabModelValidationTest021
    // @tc.desc Verify page title ids match every valid index.
    it('tabModelValidationTest021', 0, (): void => {
      for (let index: number = 0; index < 5; index++) {
        expect(pageTitleFor(index)).assertEqual('page-title-' + String(index));
        expect(TabConsistencyModel.titleMatchesIndex(index)).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_2200
    // @tc.name tabModelValidationTest022
    // @tc.desc Verify scroll offsets are consistent with the helper.
    it('tabModelValidationTest022', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let index: number = 0; index < 5; index++) {
        state.click(index);
        expect(state.scrollOffsetForCurrent()).assertEqual(
          expectedScrollOffset(index),
        );
        expect(
          TabConsistencyModel.scrollOffsetMatches(
            index,
            state.scrollOffsetForCurrent(),
          ),
        ).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_2300
    // @tc.name tabModelValidationTest023
    // @tc.desc Verify indicator ids always match the boolean state.
    it('tabModelValidationTest023', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 20; step++) {
        state.toggleColor();
        expect(
          TabConsistencyModel.indicatorMatches(
            state.indicator.isYellow(),
            state.indicator.stateId(),
          ),
        ).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_VMODEL_2400
    // @tc.name tabModelValidationTest024
    // @tc.desc Verify snapshots remain valid after restore operations.
    it('tabModelValidationTest024', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let index: number = 0; index < 5; index++) {
        const snapshot: TabSnapshot = new TabSnapshot(
          index,
          index * 95,
          index % 2 === 0,
        );
        expect(state.restore(snapshot.toData())).assertTrue();
        expect(
          TabValidationModel.isValidSnapshot(state.snapshot()),
        ).assertTrue();
      }
    });
  });
}
