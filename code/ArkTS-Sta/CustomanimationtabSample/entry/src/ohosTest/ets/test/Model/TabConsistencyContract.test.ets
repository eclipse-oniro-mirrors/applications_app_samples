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
  TabSnapshot,
  TabStateModel,
  TabOperationType,
} from '../Shared/CustomAnimationTabFixtures';

/** Contract suite for the consistency helper functions. 20 registered cases. */
export default function tabConsistencyContractTest(): void {
  describe('TabConsistencyContractTest', (): void => {
    for (let index: number = 0; index < 20; index++) {
      const caseIndex: number = index;
      it('tabConsistencyContractTest' + String(caseIndex), 0, (): void => {
        const state: TabStateModel = new TabStateModel();
        if (caseIndex === 0) {
          expect(
            TabConsistencyModel.selectionMatchesSwiper(state),
          ).assertTrue();
        } else if (caseIndex === 1) {
          state.swiper.setIndex(3);
          expect(
            TabConsistencyModel.selectionMatchesSwiper(state),
          ).assertFalse();
        } else if (caseIndex === 2) {
          expect(TabConsistencyModel.titleMatchesIndex(0)).assertTrue();
        } else if (caseIndex === 3) {
          expect(TabConsistencyModel.titleMatchesIndex(2)).assertTrue();
        } else if (caseIndex === 4) {
          expect(TabConsistencyModel.titleMatchesIndex(4)).assertTrue();
        } else if (caseIndex === 5) {
          expect(
            TabConsistencyModel.indicatorMatches(true, INDICATOR_YELLOW_ID),
          ).assertTrue();
        } else if (caseIndex === 6) {
          expect(
            TabConsistencyModel.indicatorMatches(false, INDICATOR_GRAY_ID),
          ).assertTrue();
        } else if (caseIndex === 7) {
          expect(
            TabConsistencyModel.indicatorMatches(true, INDICATOR_GRAY_ID),
          ).assertFalse();
        } else if (caseIndex === 8) {
          expect(
            TabConsistencyModel.displacementMatches(0, 2, 190),
          ).assertTrue();
        } else if (caseIndex === 9) {
          expect(
            TabConsistencyModel.displacementMatches(0, 2, 0),
          ).assertFalse();
        } else if (caseIndex === 10) {
          expect(
            TabConsistencyModel.displacementMatches(4, 0, -380),
          ).assertTrue();
        } else if (caseIndex === 11) {
          state.click(2);
          state.toggleColor();
          expect(
            TabConsistencyModel.snapshotMatches(state, TabSnapshot.from(state)),
          ).assertTrue();
        } else if (caseIndex === 12) {
          const snapshot: TabSnapshot = TabSnapshot.from(state);
          state.click(1);
          expect(
            TabConsistencyModel.snapshotMatches(state, snapshot),
          ).assertFalse();
        } else if (caseIndex === 13) {
          expect(TabConsistencyModel.scrollOffsetMatches(1, -90)).assertTrue();
        } else if (caseIndex === 14) {
          expect(TabConsistencyModel.scrollOffsetMatches(2, 0)).assertTrue();
        } else if (caseIndex === 15) {
          expect(TabConsistencyModel.scrollOffsetMatches(3, 90)).assertTrue();
        } else if (caseIndex === 16) {
          expect(TabConsistencyModel.titleMatchesIndex(1)).assertTrue();
        } else if (caseIndex === 17) {
          expect(TabConsistencyModel.scrollOffsetMatches(4, 0)).assertTrue();
        } else if (caseIndex === 18) {
          const result: OperationResult = {
            operation: TabOperationType.SELECT,
            accepted: true,
            snapshot: { index: 2, displacement: 190, yellow: false },
          };
          expect(
            TabConsistencyModel.operationResultMatches(result),
          ).assertTrue();
        } else {
          const result: OperationResult = {
            operation: TabOperationType.SELECT,
            accepted: false,
            snapshot: { index: 5, displacement: 0, yellow: false },
          };
          expect(
            TabConsistencyModel.operationResultMatches(result),
          ).assertFalse();
        }
      });
    }
  });
}
