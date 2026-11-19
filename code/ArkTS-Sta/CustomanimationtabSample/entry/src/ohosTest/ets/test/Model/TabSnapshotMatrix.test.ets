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
import { TabSnapshot, TabStateModel } from '../Shared/CustomAnimationTabFixtures';

/** Snapshot restore matrix: 5 indices x 4 displacements x 2 colours = 40. */
const DISPLACEMENTS: Array<number> = [0, 95, 285, -95];

export default function tabSnapshotMatrixTest(): void {
  describe('TabSnapshotMatrixTest', (): void => {
    for (let index: number = 0; index < 5; index++) {
      for (let d: number = 0; d < DISPLACEMENTS.length; d++) {
        for (let color: number = 0; color < 2; color++) {
          const indexValue: number = index;
          const displacementValue: number = DISPLACEMENTS[d];
          const yellowValue: boolean = color === 1;
          const name: string = 'tabSnapshotMatrix_' + String(index) + '_' + String(d) + '_' + String(color);
          it(name, 0, (): void => {
            const state: TabStateModel = new TabStateModel();
            expect(state.restore({
              index: indexValue,
              displacement: displacementValue,
              yellow: yellowValue
            })).assertTrue();
            expect(state.index()).assertEqual(indexValue);
            expect(state.swiper.index()).assertEqual(indexValue);
            expect(state.layout.currentDisplacement()).assertEqual(displacementValue);
            expect(state.indicator.isYellow()).assertEqual(yellowValue);
            const snapshot: TabSnapshot = TabSnapshot.from(state);
            expect(snapshot.index).assertEqual(indexValue);
            expect(snapshot.displacement).assertEqual(displacementValue);
            expect(snapshot.yellow).assertEqual(yellowValue);
            expect(state.isConsistent()).assertTrue();
          });
        }
      }
    }
  });
}
