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
  TabSnapshot,
  TabStateHistory,
} from '../Shared/CustomAnimationTabFixtures';

/** History state-machine suite for undo/redo stacks. */
export default function tabHistoryPropertyTest(): void {
  describe('TabHistoryPropertyTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_HIST_0100
    // @tc.name tabHistoryPropertyTest001
    // @tc.desc Verify an empty history has no undo or redo entries.
    it('tabHistoryPropertyTest001', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      expect(history.undoCount()).assertEqual(0);
      expect(history.redoCount()).assertEqual(0);
      expect(history.undo()).assertNull();
      expect(history.redo()).assertNull();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_HIST_0200
    // @tc.name tabHistoryPropertyTest002
    // @tc.desc Verify three pushes unwind in reverse order.
    it('tabHistoryPropertyTest002', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      history.push(new TabSnapshot(0, 0, false));
      history.push(new TabSnapshot(1, 95, false));
      history.push(new TabSnapshot(2, 190, true));
      const first: TabSnapshot | null = history.undo();
      const second: TabSnapshot | null = history.undo();
      const third: TabSnapshot | null = history.undo();
      if (first !== null && second !== null && third !== null) {
        expect(first.index).assertEqual(2);
        expect(second.index).assertEqual(1);
        expect(third.index).assertEqual(0);
      }
      expect(history.undoCount()).assertEqual(0);
      expect(history.redoCount()).assertEqual(3);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_HIST_0300
    // @tc.name tabHistoryPropertyTest003
    // @tc.desc Verify undo followed by redo returns the same snapshot.
    it('tabHistoryPropertyTest003', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      const snapshot: TabSnapshot = new TabSnapshot(3, 285, true);
      history.push(snapshot);
      const undone: TabSnapshot | null = history.undo();
      if (undone !== null) {
        expect(undone.equals(snapshot)).assertTrue();
      }
      const redone: TabSnapshot | null = history.redo();
      if (redone !== null) {
        expect(redone.equals(snapshot)).assertTrue();
      }
      expect(history.undoCount()).assertEqual(1);
      expect(history.redoCount()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_HIST_0400
    // @tc.name tabHistoryPropertyTest004
    // @tc.desc Verify a new push clears the redo stack.
    it('tabHistoryPropertyTest004', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      history.push(new TabSnapshot(1, 95, false));
      history.undo();
      expect(history.redoCount()).assertEqual(1);
      history.push(new TabSnapshot(4, 380, false));
      expect(history.redoCount()).assertEqual(0);
      expect(history.undoCount()).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_HIST_0500
    // @tc.name tabHistoryPropertyTest005
    // @tc.desc Verify clear removes both stacks.
    it('tabHistoryPropertyTest005', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      history.push(new TabSnapshot(1, 95, false));
      history.push(new TabSnapshot(2, 190, false));
      history.undo();
      history.clear();
      expect(history.undoCount()).assertEqual(0);
      expect(history.redoCount()).assertEqual(0);
      expect(history.undo()).assertNull();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_HIST_0600
    // @tc.name tabHistoryPropertyTest006
    // @tc.desc Verify 100 pushes can be fully undone.
    it('tabHistoryPropertyTest006', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      for (let step: number = 0; step < 100; step++) {
        history.push(
          new TabSnapshot(step % 5, (step % 5) * 95, step % 2 === 0),
        );
      }
      expect(history.undoCount()).assertEqual(100);
      for (let step: number = 0; step < 100; step++) {
        expect(history.undo() !== null).assertTrue();
      }
      expect(history.undoCount()).assertEqual(0);
      expect(history.redoCount()).assertEqual(100);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_HIST_0700
    // @tc.name tabHistoryPropertyTest007
    // @tc.desc Verify mixed undo and redo keep stack counts consistent.
    it('tabHistoryPropertyTest007', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      for (let step: number = 0; step < 5; step++) {
        history.push(new TabSnapshot(step, step * 95, false));
      }
      history.undo();
      history.undo();
      history.redo();
      expect(history.undoCount()).assertEqual(4);
      expect(history.redoCount()).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_HIST_0800
    // @tc.name tabHistoryPropertyTest008
    // @tc.desc Verify two histories do not share state.
    it('tabHistoryPropertyTest008', 0, (): void => {
      const first: TabStateHistory = new TabStateHistory();
      const second: TabStateHistory = new TabStateHistory();
      first.push(new TabSnapshot(1, 95, false));
      first.push(new TabSnapshot(2, 190, false));
      expect(second.undoCount()).assertEqual(0);
      second.push(new TabSnapshot(4, 380, true));
      expect(first.undoCount()).assertEqual(2);
      expect(second.undoCount()).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_HIST_0900
    // @tc.name tabHistoryPropertyTest009
    // @tc.desc Verify undo after redo returns the same snapshot again.
    it('tabHistoryPropertyTest009', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      const snapshot: TabSnapshot = new TabSnapshot(2, 190, true);
      history.push(snapshot);
      history.undo();
      history.redo();
      const again: TabSnapshot | null = history.undo();
      if (again !== null) {
        expect(again.equals(snapshot)).assertTrue();
      }
      expect(history.undoCount()).assertEqual(0);
      expect(history.redoCount()).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_HIST_1000
    // @tc.name tabHistoryPropertyTest010
    // @tc.desc Verify 50 push/undo/redo rounds keep one additional stored entry each round.
    it('tabHistoryPropertyTest010', 0, (): void => {
      const history: TabStateHistory = new TabStateHistory();
      for (let step: number = 0; step < 50; step++) {
        history.push(
          new TabSnapshot(step % 5, (step % 5) * 95, step % 2 === 0),
        );
        history.undo();
        history.redo();
        expect(history.undoCount()).assertEqual(step + 1);
        expect(history.redoCount()).assertEqual(0);
      }
    });
  });
}


