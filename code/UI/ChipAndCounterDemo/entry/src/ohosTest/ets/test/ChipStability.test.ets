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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TagStore, TagItem } from '../../../main/ets/model/ChipModels';

function storeOf(n: number): TagStore {
  const store: TagStore = new TagStore();
  for (let i = 1; i <= n; i++) {
    store.add(`tag${i}`);
  }
  return store;
}

/**
 * 标签仓库规模与流程稳定性维度
 *
 * 与既有逐方法矩阵互补：关注批量规模、批量状态切换的计数一致性、
 * 禁用/激活/删除组合流程、快照隔离与宽松性能上界，全部调用真实 TagStore。
 */
export default function chipStabilityTest() {
  describe('chipStabilityTest', () => {
    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_0100
     * @tc.name bulkAddThousandWithinBudget
     * @tc.desc Verify one thousand adds stay sequential and finish within a loose time budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('bulkAddThousandWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = Date.now();
      const store: TagStore = storeOf(1000);
      const elapsed: number = Date.now() - start;
      const all: TagItem[] = store.getAll();
      expect(store.count()).assertEqual(1000);
      expect(all[0].id).assertEqual(1);
      expect(all[999].id).assertEqual(1000);
      let sequential: boolean = true;
      for (let i = 0; i < all.length; i++) {
        if (all[i].id !== i + 1) {
          sequential = false;
          break;
        }
      }
      expect(sequential).assertTrue();
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_0200
     * @tc.name removeAllLeavesEmptyStore
     * @tc.desc Verify removing every tag one by one empties the store and resets activated count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('removeAllLeavesEmptyStore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: TagStore = storeOf(100);
      let removed: number = 0;
      for (let id = 1; id <= 100; id++) {
        if (store.remove(id)) {
          removed++;
        }
      }
      expect(removed).assertEqual(100);
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
      expect(store.getAll().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_0300
     * @tc.name toggleAllTwiceRestoresActivatedCount
     * @tc.desc Verify toggling every tag twice restores the original activated count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('toggleAllTwiceRestoresActivatedCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: TagStore = storeOf(20);
      for (let id = 1; id <= 20; id++) {
        store.toggleActivated(id);
      }
      const peak: number = store.activatedCount();
      expect(peak).assertEqual(20);
      for (let id = 1; id <= 20; id++) {
        store.toggleActivated(id);
      }
      expect(store.activatedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_0400
     * @tc.name setEnabledBulkDoesNotChangeActivated
     * @tc.desc Verify bulk enable changes never alter the activated state or its count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('setEnabledBulkDoesNotChangeActivated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: TagStore = storeOf(10);
      store.toggleActivated(1);
      store.toggleActivated(2);
      const before: number = store.activatedCount();
      for (let id = 1; id <= 10; id++) {
        store.setEnabled(id, false);
      }
      expect(store.activatedCount()).assertEqual(before);
      for (let id = 1; id <= 10; id++) {
        store.setEnabled(id, true);
      }
      expect(store.activatedCount()).assertEqual(before);
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_0500
     * @tc.name disableToggleRemoveFlowKeepsOthers
     * @tc.desc Verify a disable-toggle-remove flow on one tag leaves the other tags untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('disableToggleRemoveFlowKeepsOthers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: TagStore = storeOf(5);
      store.setEnabled(3, false);
      const toggled: boolean | null = store.toggleActivated(3);
      expect(toggled).assertEqual(true);
      expect(store.remove(3)).assertTrue();
      expect(store.count()).assertEqual(4);
      expect(store.findById(3) === null).assertTrue();
      expect(store.findById(1) !== null).assertTrue();
      expect(store.findById(5) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_0600
     * @tc.name largeTextRoundTrip
     * @tc.desc Verify a four-thousand-character tag text is stored and returned verbatim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('largeTextRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: TagStore = new TagStore();
      const text: string = 't'.repeat(4096);
      const added: TagItem = store.add(text);
      const found: TagItem | null = store.findById(added.id);
      expect(found !== null).assertTrue();
      expect(found!.text.length).assertEqual(4096);
      expect(found!.text).assertEqual(text);
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_0700
     * @tc.name snapshotIsolatedFromLaterAdd
     * @tc.desc Verify a getAll snapshot is unaffected by a later add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('snapshotIsolatedFromLaterAdd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: TagStore = storeOf(3);
      const snapshot: TagItem[] = store.getAll();
      store.add('later');
      expect(snapshot.length).assertEqual(3);
      expect(snapshot[2].id).assertEqual(3);
      expect(store.count()).assertEqual(4);
      expect(store.getAll().length).assertEqual(4);
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_0800
     * @tc.name missingIdOperationsLeaveStore
     * @tc.desc Verify remove, toggle and setEnabled on missing ids never change the population
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('missingIdOperationsLeaveStore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: TagStore = storeOf(10);
      expect(store.remove(-1)).assertFalse();
      expect(store.remove(0)).assertFalse();
      expect(store.remove(999)).assertFalse();
      expect(store.toggleActivated(-1) === null).assertTrue();
      expect(store.toggleActivated(999) === null).assertTrue();
      expect(store.setEnabled(999, false)).assertFalse();
      expect(store.count()).assertEqual(10);
      expect(store.activatedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_0900
     * @tc.name activatedCountStaysWithinBounds
     * @tc.desc Verify the activated count never exceeds the population across mixed operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('activatedCountStaysWithinBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: TagStore = storeOf(30);
      for (let id = 1; id <= 30; id++) {
        store.toggleActivated(id);
      }
      store.remove(1);
      store.remove(2);
      expect(store.activatedCount() >= 0).assertTrue();
      expect(store.activatedCount() <= store.count()).assertTrue();
      const all: TagItem[] = store.getAll();
      let counted: number = 0;
      for (const t of all) {
        if (t.activated) {
          counted++;
        }
      }
      expect(counted).assertEqual(store.activatedCount());
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_1000
     * @tc.name removeMiddleThenAddKeepsOrderAndIds
     * @tc.desc Verify removing a middle tag keeps the remaining order and the next id is not reused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('removeMiddleThenAddKeepsOrderAndIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: TagStore = storeOf(5);
      expect(store.remove(3)).assertTrue();
      const remaining: TagItem[] = store.getAll();
      expect(remaining.length).assertEqual(4);
      expect(remaining[0].id).assertEqual(1);
      expect(remaining[1].id).assertEqual(2);
      expect(remaining[2].id).assertEqual(4);
      expect(remaining[3].id).assertEqual(5);
      const added: TagItem = store.add('six');
      expect(added.id).assertEqual(6);
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_1100
     * @tc.name clearThenBulkAddKeepsIdsMonotonic
     * @tc.desc Verify clearing then adding fifty tags continues the id sequence instead of resetting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('clearThenBulkAddKeepsIdsMonotonic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: TagStore = storeOf(5);
      store.clear();
      expect(store.count()).assertEqual(0);
      for (let i = 0; i < 50; i++) {
        store.add(`again${i}`);
      }
      const all: TagItem[] = store.getAll();
      expect(all.length).assertEqual(50);
      expect(all[0].id).assertEqual(6);
      expect(all[49].id).assertEqual(55);
    });

    /**
     * @tc.number SUB_CHIP_AND_COUNTER_DEMO_STABILITY_1200
     * @tc.name repeatedToggleIsStable
     * @tc.desc Verify repeated toggles in pairs keep returning the original state for every tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('repeatedToggleIsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: TagStore = storeOf(10);
      for (let round = 0; round < 10; round++) {
        for (let id = 1; id <= 10; id++) {
          const first: boolean | null = store.toggleActivated(id);
          const second: boolean | null = store.toggleActivated(id);
          expect(first).assertEqual(true);
          expect(second).assertEqual(false);
        }
      }
      expect(store.activatedCount()).assertEqual(0);
    });
  });
}
