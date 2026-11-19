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
import { TabSnapshot } from '../Shared/CustomAnimationTabFixtures';

/** Direct contract suite for TabSnapshot formatting, diff and equality. */
export default function tabSnapshotContractTest(): void {
  describe('TabSnapshotContractTest', (): void => {
    for (let index: number = 0; index < 15; index++) {
      const caseIndex: number = index;
      it('tabSnapshotContractTest' + String(caseIndex), 0, (): void => {
        if (caseIndex === 0) {
          const snapshot: TabSnapshot = new TabSnapshot(0, 0, false);
          expect(snapshot.toString()).assertEqual(
            'TabSnapshot{index: 0, displacement: 0, yellow: false}',
          );
        } else if (caseIndex === 1) {
          const snapshot: TabSnapshot = new TabSnapshot(2, 190, true);
          expect(snapshot.toString()).assertEqual(
            'TabSnapshot{index: 2, displacement: 190, yellow: true}',
          );
        } else if (caseIndex === 2) {
          const snapshot: TabSnapshot = new TabSnapshot(4, 380, false);
          expect(snapshot.toString()).assertEqual(
            'TabSnapshot{index: 4, displacement: 380, yellow: false}',
          );
        } else if (caseIndex === 3) {
          const snapshot: TabSnapshot = new TabSnapshot(1, 95, true);
          expect(snapshot.toString()).assertEqual(
            'TabSnapshot{index: 1, displacement: 95, yellow: true}',
          );
        } else if (caseIndex === 4) {
          const snapshot: TabSnapshot = new TabSnapshot(3, 285, false);
          expect(snapshot.toString()).assertEqual(
            'TabSnapshot{index: 3, displacement: 285, yellow: false}',
          );
        } else if (caseIndex === 5) {
          const first: TabSnapshot = new TabSnapshot(0, 0, false);
          const second: TabSnapshot = new TabSnapshot(1, 0, false);
          expect(first.diff(second).count).assertEqual(1);
          expect(first.diff(second).fields[0]).assertEqual('index');
        } else if (caseIndex === 6) {
          const first: TabSnapshot = new TabSnapshot(0, 0, false);
          const second: TabSnapshot = new TabSnapshot(0, 95, false);
          expect(first.diff(second).count).assertEqual(1);
          expect(first.diff(second).fields[0]).assertEqual('displacement');
        } else if (caseIndex === 7) {
          const first: TabSnapshot = new TabSnapshot(0, 0, false);
          const second: TabSnapshot = new TabSnapshot(0, 0, true);
          expect(first.diff(second).count).assertEqual(1);
          expect(first.diff(second).fields[0]).assertEqual('yellow');
        } else if (caseIndex === 8) {
          const first: TabSnapshot = new TabSnapshot(0, 0, false);
          const second: TabSnapshot = new TabSnapshot(1, 95, false);
          expect(first.diff(second).count).assertEqual(2);
        } else if (caseIndex === 9) {
          const first: TabSnapshot = new TabSnapshot(0, 0, false);
          const second: TabSnapshot = new TabSnapshot(4, 380, true);
          expect(first.diff(second).count).assertEqual(3);
        } else if (caseIndex === 10) {
          const first: TabSnapshot = new TabSnapshot(2, 190, true);
          const second: TabSnapshot = new TabSnapshot(2, 190, true);
          expect(first.diff(second).count).assertEqual(0);
        } else if (caseIndex === 11) {
          const snapshot: TabSnapshot = new TabSnapshot(3, 285, true);
          expect(snapshot.equals(snapshot)).assertTrue();
        } else if (caseIndex === 12) {
          const first: TabSnapshot = new TabSnapshot(3, 285, true);
          const second: TabSnapshot = new TabSnapshot(3, 285, false);
          expect(first.equals(second)).assertFalse();
        } else if (caseIndex === 13) {
          const snapshot: TabSnapshot = new TabSnapshot(4, 380, false);
          expect(snapshot.toData().index).assertEqual(4);
        } else {
          const snapshot: TabSnapshot = new TabSnapshot(4, 380, true);
          expect(snapshot.toData().displacement).assertEqual(380);
          expect(snapshot.toData().yellow).assertTrue();
        }
      });
    }
  });
}
