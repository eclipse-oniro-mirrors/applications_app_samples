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
  INDICATOR_GRAY,
  INDICATOR_GRAY_ID,
  INDICATOR_YELLOW,
  INDICATOR_YELLOW_ID,
  IndicatorModel,
} from '../Shared/CustomAnimationTabFixtures';

/** Direct contract suite for IndicatorModel. 15 registered cases. */
export default function tabIndicatorContractTest(): void {
  describe('TabIndicatorContractTest', (): void => {
    for (let index: number = 0; index < 15; index++) {
      const caseIndex: number = index;
      it('tabIndicatorContractTest' + String(caseIndex), 0, (): void => {
        const model: IndicatorModel = new IndicatorModel();
        if (caseIndex === 0) {
          expect(model.isGray()).assertTrue();
        } else if (caseIndex === 1) {
          expect(model.stateId()).assertEqual(INDICATOR_GRAY_ID);
        } else if (caseIndex === 2) {
          expect(model.colorValue()).assertEqual(INDICATOR_GRAY);
        } else if (caseIndex === 3) {
          expect(model.stateName()).assertEqual('gray');
        } else if (caseIndex === 4) {
          model.toggle();
          expect(model.isYellow()).assertTrue();
        } else if (caseIndex === 5) {
          model.toggle();
          expect(model.stateId()).assertEqual(INDICATOR_YELLOW_ID);
        } else if (caseIndex === 6) {
          model.toggle();
          expect(model.colorValue()).assertEqual(INDICATOR_YELLOW);
        } else if (caseIndex === 7) {
          model.toggle();
          expect(model.stateName()).assertEqual('yellow');
        } else if (caseIndex === 8) {
          model.toggle();
          model.toggle();
          expect(model.isGray()).assertTrue();
        } else if (caseIndex === 9) {
          model.toggle();
          model.toggle();
          expect(model.toggles()).assertEqual(2);
        } else if (caseIndex === 10) {
          model.setYellow(true);
          expect(model.isYellow()).assertTrue();
        } else if (caseIndex === 11) {
          model.setYellow(false);
          expect(model.isGray()).assertTrue();
        } else if (caseIndex === 12) {
          model.setYellow(true);
          model.reset();
          expect(model.isGray()).assertTrue();
          expect(model.toggles()).assertEqual(0);
        } else if (caseIndex === 13) {
          for (let step: number = 0; step < 100; step++) {
            model.toggle();
          }
          expect(model.isGray()).assertTrue();
        } else {
          for (let step: number = 0; step < 101; step++) {
            model.toggle();
          }
          expect(model.isYellow()).assertTrue();
        }
      });
    }
  });
}
