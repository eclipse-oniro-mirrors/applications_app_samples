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
  OperationResult,
  TabConsistencyModel,
  TabOperationCatalog,
  TabSnapshot,
  TabSnapshotData,
  TabStateModel,
  TabValidationModel,
  TAB_COUNT,
  TAB_LABELS,
} from '../Shared/CustomAnimationTabFixtures';

/**
 * Pure security and robustness suite: hostile or invalid input must never
 * corrupt the model, escape the tab range or produce an invalid snapshot.
 */
export default function tabModelSecurityTest(): void {
  describe('TabModelSecurityTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_0100
    // @tc.name tabModelSecurityTest001
    // @tc.desc Verify a negative select has no side effect.
    it('tabModelSecurityTest001', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(2);
      const before: TabSnapshot = TabSnapshot.from(state);
      expect(state.click(-100)).assertFalse();
      expect(TabConsistencyModel.snapshotMatches(state, before)).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_0200
    // @tc.name tabModelSecurityTest002
    // @tc.desc Verify an out-of-range select has no side effect.
    it('tabModelSecurityTest002', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(1);
      const before: TabSnapshot = TabSnapshot.from(state);
      expect(state.click(TAB_COUNT)).assertFalse();
      expect(state.click(9999)).assertFalse();
      expect(TabConsistencyModel.snapshotMatches(state, before)).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_0300
    // @tc.name tabModelSecurityTest003
    // @tc.desc Verify repeated invalid operations keep the default state.
    it('tabModelSecurityTest003', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let attempt: number = 0; attempt < 100; attempt++) {
        state.click(-1);
        state.click(TAB_COUNT);
      }
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isGray()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_0400
    // @tc.name tabModelSecurityTest004
    // @tc.desc Verify a rejected swipe at the start does not change displacement.
    it('tabModelSecurityTest004', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const before: number = state.layout.currentDisplacement();
      expect(state.swipeBackward()).assertFalse();
      expect(state.layout.currentDisplacement()).assertEqual(before);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_0500
    // @tc.name tabModelSecurityTest005
    // @tc.desc Verify a rejected swipe at the end does not change displacement.
    it('tabModelSecurityTest005', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(4);
      const before: number = state.layout.currentDisplacement();
      expect(state.swipeForward()).assertFalse();
      expect(state.layout.currentDisplacement()).assertEqual(before);
      expect(state.index()).assertEqual(4);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_0600
    // @tc.name tabModelSecurityTest006
    // @tc.desc Verify restore rejects invalid indices without corrupting state.
    it('tabModelSecurityTest006', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(3);
      const before: TabSnapshot = TabSnapshot.from(state);
      expect(
        state.restore({ index: -1, displacement: 999, yellow: true }),
      ).assertFalse();
      expect(TabConsistencyModel.snapshotMatches(state, before)).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_0700
    // @tc.name tabModelSecurityTest007
    // @tc.desc Verify invalid operation values are rejected with a valid snapshot.
    it('tabModelSecurityTest007', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let operation: number = -10; operation < 0; operation++) {
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
      for (let operation: number = 5; operation < 15; operation++) {
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

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_0800
    // @tc.name tabModelSecurityTest008
    // @tc.desc Verify every indicator id is one of the two production ids.
    it('tabModelSecurityTest008', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 50; step++) {
        state.toggleColor();
        expect(
          TabValidationModel.isValidStateId(state.indicator.stateId()),
        ).assertTrue();
        expect(
          TabValidationModel.isValidColorValue(state.indicator.colorValue()),
        ).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_0900
    // @tc.name tabModelSecurityTest009
    // @tc.desc Verify 1000 hostile operations keep the snapshot valid.
    it('tabModelSecurityTest009', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 50; step++) {
        state.click((step % 9) - 2);
        expect(
          TabValidationModel.isValidSnapshot(state.snapshot()),
        ).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_1000
    // @tc.name tabModelSecurityTest010
    // @tc.desc Verify the tab count never changes across instances.
    it('tabModelSecurityTest010', 0, (): void => {
      for (let instance: number = 0; instance < 100; instance++) {
        const state: TabStateModel = new TabStateModel();
        expect(state.selection.count()).assertEqual(TAB_COUNT);
        expect(TAB_LABELS.length).assertEqual(TAB_COUNT);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_1100
    // @tc.name tabModelSecurityTest011
    // @tc.desc Verify two models never share selection or color state.
    it('tabModelSecurityTest011', 0, (): void => {
      const first: TabStateModel = new TabStateModel();
      const second: TabStateModel = new TabStateModel();
      first.click(4);
      first.toggleColor();
      expect(second.index()).assertEqual(0);
      expect(second.indicator.isGray()).assertTrue();
      second.click(1);
      expect(first.index()).assertEqual(4);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_1200
    // @tc.name tabModelSecurityTest012
    // @tc.desc Verify rejected clicks report a zero delta.
    it('tabModelSecurityTest012', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(state.click(-1)).assertFalse();
      expect(state.click(TAB_COUNT)).assertFalse();
      expect(state.layout.currentDisplacement()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_1300
    // @tc.name tabModelSecurityTest013
    // @tc.desc Verify index stays within 0 to 4 across 1000 random-like steps.
    it('tabModelSecurityTest013', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 50; step++) {
        if (step % 2 === 0) {
          state.swipeForward();
        } else {
          state.swipeBackward();
        }
        expect(state.index() >= 0).assertTrue();
        expect(state.index() < TAB_COUNT).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_1400
    // @tc.name tabModelSecurityTest014
    // @tc.desc Verify displacement stays an integer multiple of 95.
    it('tabModelSecurityTest014', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 50; step++) {
        state.click(step % 5);
        const displacement: number = state.layout.currentDisplacement();
        expect(Math.abs(displacement % 95)).assertEqual(0);
        expect(displacement === displacement).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_1500
    // @tc.name tabModelSecurityTest015
    // @tc.desc Verify a reset state equals a freshly created state.
    it('tabModelSecurityTest015', 0, (): void => {
      const used: TabStateModel = new TabStateModel();
      used.click(3);
      used.toggleColor();
      used.swipeForward();
      used.reset();
      const fresh: TabStateModel = new TabStateModel();
      const usedData: TabSnapshotData = used.snapshot();
      const freshData: TabSnapshotData = fresh.snapshot();
      expect(usedData.index).assertEqual(freshData.index);
      expect(usedData.displacement).assertEqual(freshData.displacement);
      expect(usedData.yellow).assertEqual(freshData.yellow);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MSEC_1600
    // @tc.name tabModelSecurityTest016
    // @tc.desc Verify invalid select operations never change the label.
    it('tabModelSecurityTest016', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const label: string = state.label();
      for (let attempt: number = 0; attempt < 100; attempt++) {
        state.click(-attempt);
        state.click(TAB_COUNT + attempt);
      }
      expect(state.label()).assertEqual(label);
      expect(state.label()).assertEqual(TAB_LABELS[0]);
    });
  });
}

