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
  IndicatorModel
} from '../Shared/CustomAnimationTabFixtures';

/** Toggle parity table for counts 1..15. */
export default function tabIndicatorParityTest(): void {
  describe('TabIndicatorParityTest', (): void => {
    for (let count: number = 1; count <= 15; count++) {
      const toggleCount: number = count;
      const name: string = 'tabIndicatorParity_' + String(count);
      it(name, 0, (): void => {
        const model: IndicatorModel = new IndicatorModel();
        for (let step: number = 0; step < toggleCount; step++) {
          model.toggle();
        }
        const odd: boolean = toggleCount % 2 === 1;
        expect(model.isYellow()).assertEqual(odd);
        expect(model.toggles()).assertEqual(toggleCount);
        if (odd) {
          expect(model.stateId()).assertEqual(INDICATOR_YELLOW_ID);
          expect(model.colorValue()).assertEqual(INDICATOR_YELLOW);
        } else {
          expect(model.stateId()).assertEqual(INDICATOR_GRAY_ID);
          expect(model.colorValue()).assertEqual(INDICATOR_GRAY);
        }
      });
    }
  });
}
