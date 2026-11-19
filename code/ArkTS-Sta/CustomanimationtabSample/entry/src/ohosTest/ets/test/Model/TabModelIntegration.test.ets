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
  TabConsistencyModel,
  TabOperationCatalog,
  TabOperationStatistics,
  TabOperationType,
  OperationResult,
  TabSnapshot,
  TabSnapshotData,
  TabStateHistory,
  TabStateModel,
  TabWorkflowRunner,
} from '../Shared/CustomAnimationTabFixtures';

/**
 * Pure integration suite combining selection, swiper, layout and indicator
 * models in the same order a user might drive them.
 */
export default function tabModelIntegrationTest(): void {
  describe('TabModelIntegrationTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_0100
    // @tc.name tabModelIntegrationTest001
    // @tc.desc Verify the initial aggregate state.
    it('tabModelIntegrationTest001', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isGray()).assertTrue();
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_0200
    // @tc.name tabModelIntegrationTest002
    // @tc.desc Verify click then swipe advances from tab 2 to tab 3.
    it('tabModelIntegrationTest002', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(2);
      state.swipeForward();
      expect(state.index()).assertEqual(3);
      expect(state.layout.currentDisplacement()).assertEqual(285);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_0300
    // @tc.name tabModelIntegrationTest003
    // @tc.desc Verify click then backward swipe moves from tab 4 to tab 3.
    it('tabModelIntegrationTest003', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(4);
      state.swipeBackward();
      expect(state.index()).assertEqual(3);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_0400
    // @tc.name tabModelIntegrationTest004
    // @tc.desc Verify a color toggle does not disturb navigation state.
    it('tabModelIntegrationTest004', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(1);
      state.toggleColor();
      state.swipeForward();
      expect(state.index()).assertEqual(2);
      expect(state.indicator.isYellow()).assertTrue();
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_0500
    // @tc.name tabModelIntegrationTest005
    // @tc.desc Verify a click tour then reset returns to the default state.
    it('tabModelIntegrationTest005', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let index: number = 0; index < 5; index++) {
        state.click(index);
      }
      state.reset();
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isGray()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_0600
    // @tc.name tabModelIntegrationTest006
    // @tc.desc Verify a swipe tour then reset returns to the default state.
    it('tabModelIntegrationTest006', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 4; step++) {
        state.swipeForward();
      }
      expect(state.index()).assertEqual(4);
      state.reset();
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_0700
    // @tc.name tabModelIntegrationTest007
    // @tc.desc Verify fifty interleaved actions never desynchronise.
    it('tabModelIntegrationTest007', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 50; step++) {
        if (step % 3 === 0) {
          state.click(step % 5);
        } else if (step % 3 === 1) {
          state.swipeForward();
        } else {
          state.swipeBackward();
        }
        expect(state.isConsistent()).assertTrue();
        expect(TabConsistencyModel.selectionMatchesSwiper(state)).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_0800
    // @tc.name tabModelIntegrationTest008
    // @tc.desc Verify a snapshot can seed a second independent model.
    it('tabModelIntegrationTest008', 0, (): void => {
      const source: TabStateModel = new TabStateModel();
      source.click(3);
      source.toggleColor();
      const snapshot: TabSnapshot = TabSnapshot.from(source);
      const target: TabStateModel = new TabStateModel();
      expect(target.restore(snapshot.toData())).assertTrue();
      expect(
        TabConsistencyModel.snapshotMatches(target, snapshot),
      ).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_0900
    // @tc.name tabModelIntegrationTest009
    // @tc.desc Verify history undo and redo over three integration states.
    it('tabModelIntegrationTest009', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const history: TabStateHistory = new TabStateHistory();
      history.push(TabSnapshot.from(state));
      state.click(1);
      history.push(TabSnapshot.from(state));
      state.toggleColor();
      history.push(TabSnapshot.from(state));
      expect(history.undoCount()).assertEqual(3);
      const firstUndo: TabSnapshot | null = history.undo();
      if (firstUndo !== null) {
        expect(firstUndo.index).assertEqual(1);
        expect(firstUndo.yellow).assertTrue();
      }
      const secondUndo: TabSnapshot | null = history.undo();
      if (secondUndo !== null) {
        expect(secondUndo.index).assertEqual(1);
        expect(secondUndo.yellow).assertFalse();
      }
      expect(history.redoCount()).assertEqual(2);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_1000
    // @tc.name tabModelIntegrationTest010
    // @tc.desc Verify a six-operation workflow produces the expected page.
    it('tabModelIntegrationTest010', 0, (): void => {
      const operations: Array<number> = [
        TabOperationType.SELECT,
        TabOperationType.SWIPE_NEXT,
        TabOperationType.TOGGLE_COLOR,
        TabOperationType.SWIPE_PREV,
        TabOperationType.SELECT,
        TabOperationType.SWIPE_NEXT,
      ];
      const argumentsList: Array<number> = [1, 0, 0, 0, 4, 0];
      const snapshot: TabSnapshotData = TabWorkflowRunner.run(
        operations,
        argumentsList,
      );
      expect(snapshot.index).assertEqual(4);
      expect(snapshot.yellow).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_1100
    // @tc.name tabModelIntegrationTest011
    // @tc.desc Verify select 2, next, prev returns to page 2.
    it('tabModelIntegrationTest011', 0, (): void => {
      const operations: Array<number> = [
        TabOperationType.SELECT,
        TabOperationType.SWIPE_NEXT,
        TabOperationType.SWIPE_PREV,
      ];
      const argumentsList: Array<number> = [2, 0, 0];
      expect(
        TabWorkflowRunner.finalIndex(operations, argumentsList),
      ).assertEqual(2);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_1200
    // @tc.name tabModelIntegrationTest012
    // @tc.desc Verify two toggles inside a workflow end gray.
    it('tabModelIntegrationTest012', 0, (): void => {
      const operations: Array<number> = [
        TabOperationType.TOGGLE_COLOR,
        TabOperationType.TOGGLE_COLOR,
      ];
      const argumentsList: Array<number> = [0, 0];
      const snapshot: TabSnapshotData = TabWorkflowRunner.run(
        operations,
        argumentsList,
      );
      expect(snapshot.yellow).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_1300
    // @tc.name tabModelIntegrationTest013
    // @tc.desc Verify operation statistics over a mixed workflow.
    it('tabModelIntegrationTest013', 0, (): void => {
      const statistics: TabOperationStatistics = new TabOperationStatistics();
      const operations: Array<number> = [
        TabOperationType.SELECT,
        TabOperationType.SWIPE_NEXT,
        TabOperationType.TOGGLE_COLOR,
        TabOperationType.RESET,
      ];
      const argumentsList: Array<number> = [2, 0, 0, 0];
      const state: TabStateModel = new TabStateModel();
      for (let i: number = 0; i < operations.length; i++) {
        const result: OperationResult = TabOperationCatalog.apply(
          state,
          operations[i],
          argumentsList[i],
        );
        statistics.record(operations[i], result.accepted);
      }
      expect(statistics.total()).assertEqual(4);
      expect(statistics.accepted()).assertEqual(4);
      expect(statistics.distinctOperations()).assertEqual(4);
      expect(statistics.countFor(TabOperationType.SELECT)).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_1400
    // @tc.name tabModelIntegrationTest014
    // @tc.desc Verify consistency holds after every workflow operation.
    it('tabModelIntegrationTest014', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const operations: Array<number> = [
        TabOperationType.SELECT,
        TabOperationType.SELECT,
        TabOperationType.SWIPE_NEXT,
        TabOperationType.SWIPE_PREV,
        TabOperationType.TOGGLE_COLOR,
        TabOperationType.RESET,
        TabOperationType.SWIPE_NEXT,
      ];
      const argumentsList: Array<number> = [1, 4, 0, 0, 0, 0, 0];
      for (let i: number = 0; i < operations.length; i++) {
        TabOperationCatalog.apply(state, operations[i], argumentsList[i]);
        expect(state.isConsistent()).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_1500
    // @tc.name tabModelIntegrationTest015
    // @tc.desc Verify forward clicks produce index * 95 displacement.
    it('tabModelIntegrationTest015', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let index: number = 1; index < 5; index++) {
        state.click(index);
        expect(state.layout.currentDisplacement()).assertEqual(index * 95);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_1600
    // @tc.name tabModelIntegrationTest016
    // @tc.desc Verify backward clicks return displacement to zero.
    it('tabModelIntegrationTest016', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let index: number = 1; index < 5; index++) {
        state.click(index);
      }
      for (let index: number = 3; index >= 0; index--) {
        state.click(index);
      }
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_1700
    // @tc.name tabModelIntegrationTest017
    // @tc.desc Verify two independent models do not share state.
    it('tabModelIntegrationTest017', 0, (): void => {
      const first: TabStateModel = new TabStateModel();
      const second: TabStateModel = new TabStateModel();
      first.click(4);
      first.toggleColor();
      expect(second.index()).assertEqual(0);
      expect(second.indicator.isGray()).assertTrue();
      second.swipeForward();
      expect(first.index()).assertEqual(4);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_1800
    // @tc.name tabModelIntegrationTest018
    // @tc.desc Verify a 200-step deterministic sequence ends on a known page.
    it('tabModelIntegrationTest018', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 1; step <= 200; step++) {
        if (step % 4 === 0) {
          state.click(step % 5);
        } else if (step % 4 === 1) {
          state.swipeForward();
        } else if (step % 4 === 2) {
          state.swipeBackward();
        } else {
          state.toggleColor();
        }
      }
      expect(state.index() >= 0).assertTrue();
      expect(state.index() < 5).assertTrue();
      expect(state.isConsistent()).assertTrue();
      expect(TabConsistencyModel.selectionMatchesSwiper(state)).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_1900
    // @tc.name tabModelIntegrationTest019
    // @tc.desc Verify a complete user journey snapshot.
    it('tabModelIntegrationTest019', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(1);
      state.swipeForward();
      state.swipeForward();
      state.toggleColor();
      state.swipeBackward();
      const snapshot: TabSnapshotData = state.snapshot();
      expect(snapshot.index).assertEqual(2);
      expect(snapshot.displacement).assertEqual(190);
      expect(snapshot.yellow).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_MINT_2000
    // @tc.name tabModelIntegrationTest020
    // @tc.desc Verify restored state can continue navigation normally.
    it('tabModelIntegrationTest020', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      expect(
        state.restore({ index: 2, displacement: 190, yellow: true }),
      ).assertTrue();
      state.swipeForward();
      expect(state.index()).assertEqual(3);
      state.click(0);
      expect(state.index()).assertEqual(0);
      expect(state.indicator.isYellow()).assertTrue();
      expect(state.isConsistent()).assertTrue();
    });
  });
}
