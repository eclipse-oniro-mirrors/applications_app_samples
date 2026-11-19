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
  TabLayoutModel,
} from '../Shared/CustomAnimationTabFixtures';

/** Direct contract suite for TabLayoutModel. 15 registered cases. */
export default function tabLayoutScrollContractTest(): void {
  describe('TabLayoutScrollContractTest', (): void => {
    for (let index: number = 0; index < 15; index++) {
      const caseIndex: number = index;
      it('tabLayoutScrollContractTest' + String(caseIndex), 0, (): void => {
        const layout: TabLayoutModel = new TabLayoutModel();
        if (caseIndex === 0) {
          expect(layout.currentDisplacement()).assertEqual(0);
        } else if (caseIndex === 1) {
          expect(layout.scrollEventCount()).assertEqual(0);
        } else if (caseIndex === 2) {
          expect(layout.onScroll(0)).assertEqual(0);
          expect(layout.scrollEventCount()).assertEqual(1);
        } else if (caseIndex === 3) {
          expect(layout.onScroll(90)).assertEqual(-90);
        } else if (caseIndex === 4) {
          expect(layout.onScroll(-90)).assertEqual(90);
        } else if (caseIndex === 5) {
          layout.onScroll(10);
          layout.onScroll(20);
          expect(layout.scrollEventCount()).assertEqual(2);
          expect(layout.currentDisplacement()).assertEqual(-30);
        } else if (caseIndex === 6) {
          layout.onScroll(30);
          layout.reset();
          expect(layout.currentDisplacement()).assertEqual(0);
        } else if (caseIndex === 7) {
          layout.onScroll(30);
          layout.reset();
          expect(layout.scrollEventCount()).assertEqual(0);
        } else if (caseIndex === 8) {
          const result: ClickResult = layout.applyClick(0, 2);
          expect(result.accepted).assertTrue();
          expect(result.displacementDelta).assertEqual(190);
        } else if (caseIndex === 9) {
          const result: ClickResult = layout.applyClick(-1, 2);
          expect(result.accepted).assertFalse();
          expect(layout.currentDisplacement()).assertEqual(0);
        } else if (caseIndex === 10) {
          expect(layout.applyClick(1, 3).scrollOffset).assertEqual(90);
        } else if (caseIndex === 11) {
          expect(layout.applyClick(0, 1).scrollOffset).assertEqual(-90);
        } else if (caseIndex === 12) {
          expect(layout.expectedLeftFor(0)).assertEqual(0);
        } else if (caseIndex === 13) {
          expect(layout.expectedLeftFor(4)).assertEqual(380);
        } else {
          for (let step: number = 0; step < 1000; step++) {
            layout.onScroll(0);
          }
          expect(layout.scrollEventCount()).assertEqual(1000);
        }
      });
    }
  });
}
