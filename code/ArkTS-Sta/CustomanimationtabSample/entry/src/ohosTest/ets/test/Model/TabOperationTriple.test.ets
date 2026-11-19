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
  TabOperationCatalog,
  TabStateModel,
  TabOperationType
} from '../Shared/CustomAnimationTabFixtures';

interface ReferenceState {
  index: number;
  displacement: number;
  yellow: boolean;
}

function applyReference(state: ReferenceState, operation: number): void {
  if (operation === TabOperationType.SELECT) {
    state.index = 2;
    state.displacement = 190;
  } else if (operation === TabOperationType.SWIPE_NEXT) {
    if (state.index < 4) {
      state.index++;
      state.displacement += 95;
    }
  } else if (operation === TabOperationType.SWIPE_PREV) {
    if (state.index > 0) {
      state.index--;
      state.displacement -= 95;
    }
  } else if (operation === TabOperationType.TOGGLE_COLOR) {
    state.yellow = !state.yellow;
  } else {
    state.index = 0;
    state.displacement = 0;
    state.yellow = false;
  }
}

/** 5 x 5 x 5 ordered operation triples, checked against an independent reference. */
export default function tabOperationTripleTest(): void {
  describe('TabOperationTripleTest', (): void => {
    for (let first: number = 0; first < 5; first++) {
      for (let second: number = 0; second < 5; second++) {
        for (let third: number = 0; third < 5; third++) {
          const a: number = first;
          const b: number = second;
          const c: number = third;
          const name: string = 'tabOperationTriple_' + String(a) + '_' + String(b) + '_' + String(c);
          it(name, 0, (): void => {
            const reference: ReferenceState = { index: 0, displacement: 0, yellow: false };
            applyReference(reference, a);
            applyReference(reference, b);
            applyReference(reference, c);

            const state: TabStateModel = new TabStateModel();
            TabOperationCatalog.apply(state, a, 2);
            TabOperationCatalog.apply(state, b, 2);
            TabOperationCatalog.apply(state, c, 2);

            expect(state.index()).assertEqual(reference.index);
            expect(state.layout.currentDisplacement()).assertEqual(reference.displacement);
            expect(state.indicator.isYellow()).assertEqual(reference.yellow);
            expect(state.swiper.index()).assertEqual(reference.index);
            expect(state.isConsistent()).assertTrue();
          });
        }
      }
    }
  });
}
