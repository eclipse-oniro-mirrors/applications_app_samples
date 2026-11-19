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
  INDICATOR_GRAY_ID,
  INDICATOR_YELLOW_ID,
  TabConsistencyModel,
  TabDirection,
  TabSnapshot,
  TabSnapshotData,
  TabStateHistory,
  TabStateModel,
  TAB_LABELS,
  TAB_WIDTH,
  expectedScrollOffset,
  isIndexValid,
} from '../Shared/CustomAnimationTabFixtures';

/**
 * Pure model suite for the aggregate tab state: swiperIndex, indicator color,
 * background displacement and the derived snapshot/history helpers.
 */
export default function tabStateManagementTest(): void {
  describe('TabStateManagementTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_0100
    // @tc.name tabStateManagementTest001
    // @tc.desc Verify the aggregate model starts on tab 0.
    it('tabStateManagementTest001', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(state.index()).assertEqual(0);
      expect(state.label()).assertEqual(TAB_LABELS[0]);
      expect(state.swiper.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_0200
    // @tc.name tabStateManagementTest002
    // @tc.desc Verify the indicator starts gray and the bar starts at zero.
    it('tabStateManagementTest002', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(state.indicator.isGray()).assertTrue();
      expect(state.indicator.isYellow()).assertFalse();
      expect(state.indicator.stateId()).assertEqual(INDICATOR_GRAY_ID);
      expect(state.layout.currentDisplacement()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_0300
    // @tc.name tabStateManagementTest003
    // @tc.desc Verify click updates the selected index and label.
    it('tabStateManagementTest003', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(state.click(2)).assertTrue();
      expect(state.index()).assertEqual(2);
      expect(state.label()).assertEqual(TAB_LABELS[2]);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_0400
    // @tc.name tabStateManagementTest004
    // @tc.desc Verify click keeps the swiper index in sync with selection.
    it('tabStateManagementTest004', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(3);
      expect(state.swiper.index()).assertEqual(3);
      expect(TabConsistencyModel.selectionMatchesSwiper(state)).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_0500
    // @tc.name tabStateManagementTest005
    // @tc.desc Verify click applies the production displacement delta.
    it('tabStateManagementTest005', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(2);
      expect(state.layout.currentDisplacement()).assertEqual(2 * TAB_WIDTH);
      expect(state.layout.currentDisplacement()).assertEqual(190);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_0600
    // @tc.name tabStateManagementTest006
    // @tc.desc Verify click to tab 1 requests the -90 horizontal scroll.
    it('tabStateManagementTest006', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(1);
      expect(state.scrollOffsetForCurrent()).assertEqual(-90);
      expect(state.scrollOffsetForCurrent()).assertEqual(
        expectedScrollOffset(1),
      );
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_0700
    // @tc.name tabStateManagementTest007
    // @tc.desc Verify click to tab 3 requests the +90 horizontal scroll.
    it('tabStateManagementTest007', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(3);
      expect(state.scrollOffsetForCurrent()).assertEqual(90);
      expect(state.scrollOffsetForCurrent()).assertEqual(
        expectedScrollOffset(3),
      );
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_0800
    // @tc.name tabStateManagementTest008
    // @tc.desc Verify click to tabs 0, 2 and 4 requests no scroll.
    it('tabStateManagementTest008', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(2);
      expect(state.scrollOffsetForCurrent()).assertEqual(0);
      state.click(4);
      expect(state.scrollOffsetForCurrent()).assertEqual(0);
      state.click(0);
      expect(state.scrollOffsetForCurrent()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_0900
    // @tc.name tabStateManagementTest009
    // @tc.desc Verify a negative click index is rejected and state is preserved.
    it('tabStateManagementTest009', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(2);
      const before: TabSnapshot = TabSnapshot.from(state);
      expect(state.click(-1)).assertFalse();
      const after: TabSnapshotData = state.snapshot();
      expect(after.index).assertEqual(before.index);
      expect(after.displacement).assertEqual(before.displacement);
      expect(after.yellow).assertEqual(before.yellow);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_1000
    // @tc.name tabStateManagementTest010
    // @tc.desc Verify an out-of-range click index is rejected.
    it('tabStateManagementTest010', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(1);
      const displacement: number = state.layout.currentDisplacement();
      expect(state.click(5)).assertFalse();
      expect(state.click(99)).assertFalse();
      expect(state.index()).assertEqual(1);
      expect(state.layout.currentDisplacement()).assertEqual(displacement);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_1100
    // @tc.name tabStateManagementTest011
    // @tc.desc Verify forward swipe advances page, tab and displacement.
    it('tabStateManagementTest011', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(state.swipeForward()).assertTrue();
      expect(state.index()).assertEqual(1);
      expect(state.swiper.index()).assertEqual(1);
      expect(state.layout.currentDisplacement()).assertEqual(TAB_WIDTH);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_1200
    // @tc.name tabStateManagementTest012
    // @tc.desc Verify forward swipes stop at the last page.
    it('tabStateManagementTest012', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      while (state.swipeForward()) {
        expect(state.index() <= 4).assertTrue();
      }
      expect(state.index()).assertEqual(4);
      expect(state.layout.currentDisplacement()).assertEqual(4 * TAB_WIDTH);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_1300
    // @tc.name tabStateManagementTest013
    // @tc.desc Verify backward swipe moves from the last page to the previous one.
    it('tabStateManagementTest013', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(4);
      expect(state.swipeBackward()).assertTrue();
      expect(state.index()).assertEqual(3);
      expect(state.swiper.index()).assertEqual(3);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_1400
    // @tc.name tabStateManagementTest014
    // @tc.desc Verify backward swipes stop at the first page.
    it('tabStateManagementTest014', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      while (state.swipeBackward()) {
        expect(state.index() >= 0).assertTrue();
      }
      expect(state.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_1500
    // @tc.name tabStateManagementTest015
    // @tc.desc Verify the direction helper matches explicit swipe calls.
    it('tabStateManagementTest015', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(state.swipe(TabDirection.FORWARD)).assertTrue();
      expect(state.index()).assertEqual(1);
      expect(state.swipe(TabDirection.BACKWARD)).assertTrue();
      expect(state.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_1600
    // @tc.name tabStateManagementTest016
    // @tc.desc Verify one toggle switches the indicator to yellow.
    it('tabStateManagementTest016', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(state.toggleColor()).assertEqual(INDICATOR_YELLOW_ID);
      expect(state.indicator.isYellow()).assertTrue();
      expect(state.indicator.stateName()).assertEqual('yellow');
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_1700
    // @tc.name tabStateManagementTest017
    // @tc.desc Verify two toggles restore the gray indicator.
    it('tabStateManagementTest017', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.toggleColor();
      expect(state.toggleColor()).assertEqual(INDICATOR_GRAY_ID);
      expect(state.indicator.isGray()).assertTrue();
      expect(state.indicator.toggles()).assertEqual(2);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_1800
    // @tc.name tabStateManagementTest018
    // @tc.desc Verify color toggles do not change the selected page.
    it('tabStateManagementTest018', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(3);
      state.toggleColor();
      expect(state.index()).assertEqual(3);
      state.toggleColor();
      expect(state.index()).assertEqual(3);
      expect(state.swiper.index()).assertEqual(3);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_1900
    // @tc.name tabStateManagementTest019
    // @tc.desc Verify the default snapshot matches production initial values.
    it('tabStateManagementTest019', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const snapshot: TabSnapshot = TabSnapshot.from(state);
      expect(snapshot.index).assertEqual(0);
      expect(snapshot.displacement).assertEqual(0);
      expect(snapshot.yellow).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_2000
    // @tc.name tabStateManagementTest020
    // @tc.desc Verify the snapshot reflects click and toggle changes.
    it('tabStateManagementTest020', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(2);
      state.toggleColor();
      const snapshot: TabSnapshot = TabSnapshot.from(state);
      expect(snapshot.index).assertEqual(2);
      expect(snapshot.displacement).assertEqual(190);
      expect(snapshot.yellow).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_2100
    // @tc.name tabStateManagementTest021
    // @tc.desc Verify restore rebuilds index, color and displacement.
    it('tabStateManagementTest021', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(3);
      state.toggleColor();
      const snapshot: TabSnapshot = TabSnapshot.from(state);
      const restored: TabStateModel = new TabStateModel();
      expect(restored.restore(snapshot.toData())).assertTrue();
      expect(restored.index()).assertEqual(3);
      expect(restored.indicator.isYellow()).assertTrue();
      expect(restored.layout.currentDisplacement()).assertEqual(285);
      expect(
        TabConsistencyModel.snapshotMatches(restored, snapshot),
      ).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_2200
    // @tc.name tabStateManagementTest022
    // @tc.desc Verify restore rejects an invalid snapshot index.
    it('tabStateManagementTest022', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(
        state.restore({ index: -1, displacement: 0, yellow: false }),
      ).assertFalse();
      expect(
        state.restore({ index: 5, displacement: 0, yellow: false }),
      ).assertFalse();
      expect(state.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_2300
    // @tc.name tabStateManagementTest023
    // @tc.desc Verify reset restores every aggregate field.
    it('tabStateManagementTest023', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(4);
      state.toggleColor();
      state.reset();
      expect(state.index()).assertEqual(0);
      expect(state.swiper.index()).assertEqual(0);
      expect(state.indicator.isGray()).assertTrue();
      expect(state.indicator.toggles()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_2400
    // @tc.name tabStateManagementTest024
    // @tc.desc Verify selection and swiper stay consistent for every click.
    it('tabStateManagementTest024', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let index: number = 0; index < 5; index++) {
        state.click(index);
        expect(state.isConsistent()).assertTrue();
        expect(TabConsistencyModel.selectionMatchesSwiper(state)).assertTrue();
        expect(state.swiper.index()).assertEqual(index);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_2500
    // @tc.name tabStateManagementTest025
    // @tc.desc Verify undo and redo walk the snapshot history.
    it('tabStateManagementTest025', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      const state: TabStateModel = new TabStateModel();
      history.push(TabSnapshot.from(state));
      state.click(2);
      history.push(TabSnapshot.from(state));
      state.toggleColor();
      history.push(TabSnapshot.from(state));
      expect(history.undoCount()).assertEqual(3);
      const firstUndo: TabSnapshot | null = history.undo();
      if (firstUndo !== null) {
        expect(firstUndo.index).assertEqual(2);
        expect(firstUndo.yellow).assertTrue();
      }
      const secondUndo: TabSnapshot | null = history.undo();
      if (secondUndo !== null) {
        expect(secondUndo.index).assertEqual(2);
        expect(secondUndo.yellow).assertFalse();
      }
      expect(history.redoCount()).assertEqual(2);
      const redone: TabSnapshot | null = history.redo();
      if (redone !== null) {
        expect(redone.index).assertEqual(2);
        expect(redone.yellow).assertFalse();
      }
      expect(history.undoCount()).assertEqual(2);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_2600
    // @tc.name tabStateManagementTest026
    // @tc.desc Verify clearing history removes both stacks.
    it('tabStateManagementTest026', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      const state: TabStateModel = new TabStateModel();
      history.push(TabSnapshot.from(state));
      history.undo();
      expect(history.redoCount()).assertEqual(1);
      history.clear();
      expect(history.undoCount()).assertEqual(0);
      expect(history.redoCount()).assertEqual(0);
      expect(history.undo()).assertNull();
      expect(history.redo()).assertNull();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_2700
    // @tc.name tabStateManagementTest027
    // @tc.desc Verify snapshot diffs report exactly the changed fields.
    it('tabStateManagementTest027', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const before: TabSnapshot = TabSnapshot.from(state);
      state.click(1);
      const afterIndex: TabSnapshot = TabSnapshot.from(state);
      expect(before.diff(afterIndex).count).assertEqual(2);
      expect(before.diff(afterIndex).fields[0]).assertEqual('index');
      expect(before.diff(afterIndex).fields[1]).assertEqual('displacement');
      state.toggleColor();
      const afterColor: TabSnapshot = TabSnapshot.from(state);
      expect(afterIndex.diff(afterColor).count).assertEqual(1);
      expect(afterIndex.diff(afterColor).fields[0]).assertEqual('yellow');
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_2800
    // @tc.name tabStateManagementTest028
    // @tc.desc Verify sequential clicks accumulate the 380 displacement.
    it('tabStateManagementTest028', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let index: number = 1; index < 5; index++) {
        state.click(index);
      }
      expect(state.layout.currentDisplacement()).assertEqual(4 * TAB_WIDTH);
      expect(state.layout.currentDisplacement()).assertEqual(380);
      expect(state.index()).assertEqual(4);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_2900
    // @tc.name tabStateManagementTest029
    // @tc.desc Verify a swipe tour accumulates the same displacement as clicks.
    it('tabStateManagementTest029', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let index: number = 1; index < 5; index++) {
        state.swipeForward();
      }
      expect(state.layout.currentDisplacement()).assertEqual(380);
      expect(state.index()).assertEqual(4);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_STATE_3000
    // @tc.name tabStateManagementTest030
    // @tc.desc Verify restore keeps yellow and index independent.
    it('tabStateManagementTest030', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(
        state.restore({ index: 4, displacement: 380, yellow: true }),
      ).assertTrue();
      expect(state.index()).assertEqual(4);
      expect(state.indicator.isYellow()).assertTrue();
      expect(state.layout.currentDisplacement()).assertEqual(380);
      expect(isIndexValid(state.index())).assertTrue();
    });
  });
}
