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
  INDICATOR_GRAY,
  INDICATOR_GRAY_ID,
  INDICATOR_YELLOW_ID,
  TabValidationModel,
  TAB_LABELS,
} from '../Shared/CustomAnimationTabFixtures';

/** Boundary inputs for every validation helper. 20 registered cases. */
export default function tabValidatorBoundaryTest(): void {
  describe('TabValidatorBoundaryTest', (): void => {
    for (let index: number = 0; index < 20; index++) {
      const caseIndex: number = index;
      it('tabValidatorBoundaryTest' + String(caseIndex), 0, (): void => {
        if (caseIndex === 0) {
          expect(TabValidationModel.isValidIndex(-2)).assertFalse();
        } else if (caseIndex === 1) {
          expect(TabValidationModel.isValidIndex(0)).assertTrue();
        } else if (caseIndex === 2) {
          expect(TabValidationModel.isValidIndex(4)).assertTrue();
        } else if (caseIndex === 3) {
          expect(TabValidationModel.isValidIndex(5)).assertFalse();
        } else if (caseIndex === 4) {
          expect(TabValidationModel.isValidLabel('')).assertFalse();
        } else if (caseIndex === 5) {
          expect(TabValidationModel.isValidLabel('unknown')).assertFalse();
        } else if (caseIndex === 6) {
          expect(TabValidationModel.isValidLabel(TAB_LABELS[0])).assertTrue();
        } else if (caseIndex === 7) {
          expect(TabValidationModel.isValidColorValue('#FFFFFF')).assertFalse();
        } else if (caseIndex === 8) {
          expect(
            TabValidationModel.isValidColorValue(INDICATOR_GRAY),
          ).assertTrue();
        } else if (caseIndex === 9) {
          expect(
            TabValidationModel.isValidColorValue(INDICATOR_YELLOW_ID),
          ).assertFalse();
        } else if (caseIndex === 10) {
          expect(
            TabValidationModel.isValidStateId(INDICATOR_GRAY_ID),
          ).assertTrue();
        } else if (caseIndex === 11) {
          expect(
            TabValidationModel.isValidStateId(INDICATOR_YELLOW_ID),
          ).assertTrue();
        } else if (caseIndex === 12) {
          expect(
            TabValidationModel.isValidStateId('indicator-red'),
          ).assertFalse();
        } else if (caseIndex === 13) {
          expect(TabValidationModel.isValidOperation(0)).assertTrue();
        } else if (caseIndex === 14) {
          expect(TabValidationModel.isValidOperation(4)).assertTrue();
        } else if (caseIndex === 15) {
          expect(TabValidationModel.isValidOperation(5)).assertFalse();
        } else if (caseIndex === 16) {
          expect(TabValidationModel.isValidRowCount(8)).assertTrue();
        } else if (caseIndex === 17) {
          expect(TabValidationModel.isValidRowCount(7)).assertFalse();
        } else if (caseIndex === 18) {
          expect(
            TabValidationModel.isValidSnapshot({
              index: 0,
              displacement: 0,
              yellow: false,
            }),
          ).assertTrue();
        } else {
          const result: ClickResult = {
            accepted: true,
            from: 0,
            to: 2,
            displacementDelta: 0,
            scrollOffset: 0,
          };
          expect(TabValidationModel.isValidClickResult(result)).assertFalse();
        }
      });
    }
  });
}
