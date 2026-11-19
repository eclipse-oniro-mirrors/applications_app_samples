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
  OperationResult,
  TabConsistencyModel,
  TabOperationCatalog,
  TabOperationStatistics,
  TabOperationType,
  TabSnapshotData,
  TabStateModel,
  TabWorkflowRunner,
} from '../Shared/CustomAnimationTabFixtures';

/**
 * Pure model suite for the operation catalogue and deterministic workflows.
 */
export default function tabOperationCatalogTest(): void {
  describe('TabOperationCatalogTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_0100
    // @tc.name tabOperationCatalogTest001
    // @tc.desc Verify the catalogue defines five operations.
    it('tabOperationCatalogTest001', 0, (): void => {
      expect(TabOperationCatalog.NAMES.length).assertEqual(5);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_0200
    // @tc.name tabOperationCatalogTest002
    // @tc.desc Verify operation names map to their numeric values.
    it('tabOperationCatalogTest002', 0, (): void => {
      expect(TabOperationCatalog.nameOf(TabOperationType.SELECT)).assertEqual(
        'select',
      );
      expect(
        TabOperationCatalog.nameOf(TabOperationType.SWIPE_NEXT),
      ).assertEqual('swipeNext');
      expect(
        TabOperationCatalog.nameOf(TabOperationType.SWIPE_PREV),
      ).assertEqual('swipePrev');
      expect(
        TabOperationCatalog.nameOf(TabOperationType.TOGGLE_COLOR),
      ).assertEqual('toggleColor');
      expect(TabOperationCatalog.nameOf(TabOperationType.RESET)).assertEqual(
        'reset',
      );
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_0300
    // @tc.name tabOperationCatalogTest003
    // @tc.desc Verify unknown operation values return the unknown name.
    it('tabOperationCatalogTest003', 0, (): void => {
      expect(TabOperationCatalog.nameOf(-1)).assertEqual('unknown');
      expect(TabOperationCatalog.nameOf(5)).assertEqual('unknown');
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_0400
    // @tc.name tabOperationCatalogTest004
    // @tc.desc Verify every defined operation value is valid.
    it('tabOperationCatalogTest004', 0, (): void => {
      for (let operation: number = 0; operation < 5; operation++) {
        expect(TabOperationCatalog.isValid(operation)).assertTrue();
      }
      expect(TabOperationCatalog.isValid(-1)).assertFalse();
      expect(TabOperationCatalog.isValid(5)).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_0500
    // @tc.name tabOperationCatalogTest005
    // @tc.desc Verify the select operation applies a valid index.
    it('tabOperationCatalogTest005', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const result: OperationResult = TabOperationCatalog.apply(
        state,
        TabOperationType.SELECT,
        3,
      );
      expect(result.accepted).assertTrue();
      expect(result.snapshot.index).assertEqual(3);
      expect(TabConsistencyModel.operationResultMatches(result)).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_0600
    // @tc.name tabOperationCatalogTest006
    // @tc.desc Verify an invalid select argument is rejected.
    it('tabOperationCatalogTest006', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const result: OperationResult = TabOperationCatalog.apply(
        state,
        TabOperationType.SELECT,
        9,
      );
      expect(result.accepted).assertFalse();
      expect(result.snapshot.index).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_0700
    // @tc.name tabOperationCatalogTest007
    // @tc.desc Verify swipeNext advances one page.
    it('tabOperationCatalogTest007', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const result: OperationResult = TabOperationCatalog.apply(
        state,
        TabOperationType.SWIPE_NEXT,
        0,
      );
      expect(result.accepted).assertTrue();
      expect(result.snapshot.index).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_0800
    // @tc.name tabOperationCatalogTest008
    // @tc.desc Verify swipeNext is rejected at the last page.
    it('tabOperationCatalogTest008', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(4);
      const result: OperationResult = TabOperationCatalog.apply(
        state,
        TabOperationType.SWIPE_NEXT,
        0,
      );
      expect(result.accepted).assertFalse();
      expect(result.snapshot.index).assertEqual(4);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_0900
    // @tc.name tabOperationCatalogTest009
    // @tc.desc Verify swipePrev is rejected at the first page.
    it('tabOperationCatalogTest009', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const result: OperationResult = TabOperationCatalog.apply(
        state,
        TabOperationType.SWIPE_PREV,
        0,
      );
      expect(result.accepted).assertFalse();
      expect(result.snapshot.index).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_1000
    // @tc.name tabOperationCatalogTest010
    // @tc.desc Verify swipePrev moves backward from a middle page.
    it('tabOperationCatalogTest010', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(2);
      const result: OperationResult = TabOperationCatalog.apply(
        state,
        TabOperationType.SWIPE_PREV,
        0,
      );
      expect(result.accepted).assertTrue();
      expect(result.snapshot.index).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_1100
    // @tc.name tabOperationCatalogTest011
    // @tc.desc Verify toggleColor flips the indicator state.
    it('tabOperationCatalogTest011', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const result: OperationResult = TabOperationCatalog.apply(
        state,
        TabOperationType.TOGGLE_COLOR,
        0,
      );
      expect(result.accepted).assertTrue();
      expect(result.snapshot.yellow).assertTrue();
      expect(state.indicator.stateId()).assertEqual(INDICATOR_YELLOW_ID);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_1200
    // @tc.name tabOperationCatalogTest012
    // @tc.desc Verify two toggles return to gray.
    it('tabOperationCatalogTest012', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, TabOperationType.TOGGLE_COLOR, 0);
      const result: OperationResult = TabOperationCatalog.apply(
        state,
        TabOperationType.TOGGLE_COLOR,
        0,
      );
      expect(result.snapshot.yellow).assertFalse();
      expect(state.indicator.stateId()).assertEqual(INDICATOR_GRAY_ID);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_1300
    // @tc.name tabOperationCatalogTest013
    // @tc.desc Verify reset restores the initial aggregate state.
    it('tabOperationCatalogTest013', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(4);
      state.toggleColor();
      const result: OperationResult = TabOperationCatalog.apply(
        state,
        TabOperationType.RESET,
        0,
      );
      expect(result.accepted).assertTrue();
      expect(result.snapshot.index).assertEqual(0);
      expect(result.snapshot.displacement).assertEqual(0);
      expect(result.snapshot.yellow).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_1400
    // @tc.name tabOperationCatalogTest014
    // @tc.desc Verify a select then swipeNext sequence ends on index 3.
    it('tabOperationCatalogTest014', 0, (): void => {
      const operations: Array<number> = [
        TabOperationType.SELECT,
        TabOperationType.SWIPE_NEXT,
      ];
      const argumentsList: Array<number> = [2, 0];
      expect(
        TabWorkflowRunner.finalIndex(operations, argumentsList),
      ).assertEqual(3);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_1500
    // @tc.name tabOperationCatalogTest015
    // @tc.desc Verify a rejected operation does not break later operations.
    it('tabOperationCatalogTest015', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(4);
      const operations: Array<number> = [
        TabOperationType.SWIPE_NEXT,
        TabOperationType.SWIPE_PREV,
      ];
      const argumentsList: Array<number> = [0, 0];
      const accepted: number = TabOperationCatalog.applySequence(
        state,
        operations,
        argumentsList,
      );
      expect(accepted).assertEqual(1);
      expect(state.index()).assertEqual(3);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_1600
    // @tc.name tabOperationCatalogTest016
    // @tc.desc Verify applySequence counts accepted operations.
    it('tabOperationCatalogTest016', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const operations: Array<number> = [
        TabOperationType.SELECT,
        TabOperationType.SELECT,
        TabOperationType.TOGGLE_COLOR,
        TabOperationType.RESET,
      ];
      const argumentsList: Array<number> = [1, 3, 0, 0];
      expect(
        TabOperationCatalog.applySequence(state, operations, argumentsList),
      ).assertEqual(4);
      expect(state.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_1700
    // @tc.name tabOperationCatalogTest017
    // @tc.desc Verify the workflow runner is deterministic across repeats.
    it('tabOperationCatalogTest017', 0, (): void => {
      const operations: Array<number> = [
        TabOperationType.SELECT,
        TabOperationType.SWIPE_NEXT,
        TabOperationType.TOGGLE_COLOR,
      ];
      const argumentsList: Array<number> = [1, 0, 0];
      for (let round: number = 0; round < 20; round++) {
        const snapshot: TabSnapshotData = TabWorkflowRunner.run(
          operations,
          argumentsList,
        );
        expect(snapshot.index).assertEqual(2);
        expect(snapshot.yellow).assertTrue();
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_1800
    // @tc.name tabOperationCatalogTest018
    // @tc.desc Verify statistics record per-operation counts.
    it('tabOperationCatalogTest018', 0, (): void => {
      const statistics: TabOperationStatistics = new TabOperationStatistics();
      statistics.record(TabOperationType.SELECT, true);
      statistics.record(TabOperationType.SELECT, true);
      statistics.record(TabOperationType.TOGGLE_COLOR, true);
      expect(statistics.countFor(TabOperationType.SELECT)).assertEqual(2);
      expect(statistics.countFor(TabOperationType.TOGGLE_COLOR)).assertEqual(1);
      expect(statistics.total()).assertEqual(3);
      expect(statistics.accepted()).assertEqual(3);
      expect(statistics.rejected()).assertEqual(0);
      expect(statistics.distinctOperations()).assertEqual(2);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_1900
    // @tc.name tabOperationCatalogTest019
    // @tc.desc Verify statistics track rejected operations.
    it('tabOperationCatalogTest019', 0, (): void => {
      const statistics: TabOperationStatistics = new TabOperationStatistics();
      statistics.record(TabOperationType.SWIPE_NEXT, false);
      statistics.record(TabOperationType.SWIPE_NEXT, false);
      expect(statistics.rejected()).assertEqual(2);
      expect(statistics.accepted()).assertEqual(0);
      expect(statistics.countFor(TabOperationType.SWIPE_NEXT)).assertEqual(2);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_2000
    // @tc.name tabOperationCatalogTest020
    // @tc.desc Verify unknown operations are not counted per type.
    it('tabOperationCatalogTest020', 0, (): void => {
      const statistics: TabOperationStatistics = new TabOperationStatistics();
      statistics.record(9, false);
      expect(statistics.countFor(9)).assertEqual(0);
      expect(statistics.total()).assertEqual(1);
      expect(statistics.rejected()).assertEqual(1);
      expect(statistics.distinctOperations()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_2100
    // @tc.name tabOperationCatalogTest021
    // @tc.desc Verify statistics reset clears counts and results.
    it('tabOperationCatalogTest021', 0, (): void => {
      const statistics: TabOperationStatistics = new TabOperationStatistics();
      statistics.record(TabOperationType.SELECT, true);
      statistics.reset();
      expect(statistics.total()).assertEqual(0);
      expect(statistics.accepted()).assertEqual(0);
      expect(statistics.rejected()).assertEqual(0);
      expect(statistics.distinctOperations()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_2200
    // @tc.name tabOperationCatalogTest022
    // @tc.desc Verify a ten-step all-forward workflow ends at the last page.
    it('tabOperationCatalogTest022', 0, (): void => {
      const operations: Array<number> = new Array<number>();
      const argumentsList: Array<number> = new Array<number>();
      for (let step: number = 0; step < 10; step++) {
        operations.push(TabOperationType.SWIPE_NEXT);
        argumentsList.push(0);
      }
      expect(
        TabWorkflowRunner.finalIndex(operations, argumentsList),
      ).assertEqual(4);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_2300
    // @tc.name tabOperationCatalogTest023
    // @tc.desc Verify a select four then reset workflow returns to index 0.
    it('tabOperationCatalogTest023', 0, (): void => {
      const operations: Array<number> = [
        TabOperationType.SELECT,
        TabOperationType.RESET,
      ];
      const argumentsList: Array<number> = [4, 0];
      const snapshot: TabSnapshotData = TabWorkflowRunner.run(
        operations,
        argumentsList,
      );
      expect(snapshot.index).assertEqual(0);
      expect(snapshot.displacement).assertEqual(0);
      expect(snapshot.yellow).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_CATALOG_2400
    // @tc.name tabOperationCatalogTest024
    // @tc.desc Verify every catalogue name is non-empty and unique.
    it('tabOperationCatalogTest024', 0, (): void => {
      const names: Array<string> = TabOperationCatalog.NAMES;
      for (let i: number = 0; i < names.length; i++) {
        expect(names[i].length > 0).assertTrue();
        for (let j: number = i + 1; j < names.length; j++) {
          expect(names[i] !== names[j]).assertTrue();
        }
      }
    });
  });
}
