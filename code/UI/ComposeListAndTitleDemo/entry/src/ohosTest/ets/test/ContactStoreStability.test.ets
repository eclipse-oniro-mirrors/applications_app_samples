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
import { ContactStore, ContactItem } from '../../../main/ets/model/ListModels';

function storeOf(n: number): ContactStore {
  const store: ContactStore = new ContactStore();
  for (let i = 1; i <= n; i++) {
    store.add(`u${i}`, `p${i}`, i % 3 === 0 ? 'deptA' : 'deptB', i % 2 === 0);
  }
  return store;
}

/**
 * 联系人仓库稳定性与规模维度
 *
 * 与既有的逐方法矩阵互补：这里关注批量规模、循环操作的不变量、性能上界与
 * 大面积删除/搜索后的一致性，全部直接调用真实 ContactStore。
 */
export default function contactStoreStabilityTest() {
  describe('contactStoreStabilityTest', () => {
    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_0100
     * @tc.name bulkAddHundredSequentialIds
     * @tc.desc Verify one hundred sequential adds produce ids 1..100 and the expected online count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('bulkAddHundredSequentialIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = storeOf(100);
      const all: ContactItem[] = store.getAll();
      expect(store.count()).assertEqual(100);
      expect(all.length).assertEqual(100);
      let sequential: boolean = true;
      for (let i = 0; i < all.length; i++) {
        if (all[i].id !== i + 1) {
          sequential = false;
          break;
        }
      }
      expect(sequential).assertTrue();
      expect(store.onlineCount()).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_0200
     * @tc.name bulkAddThousandWithinBudget
     * @tc.desc Verify one thousand adds stay sequential, unique and complete within a loose time budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('bulkAddThousandWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = Date.now();
      const store: ContactStore = storeOf(1000);
      const elapsed: number = Date.now() - start;
      const all: ContactItem[] = store.getAll();
      expect(store.count()).assertEqual(1000);
      expect(all[0].id).assertEqual(1);
      expect(all[999].id).assertEqual(1000);
      let unique: boolean = true;
      for (let i = 0; i < all.length; i++) {
        if (all[i].id !== i + 1) {
          unique = false;
          break;
        }
      }
      expect(unique).assertTrue();
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_0300
     * @tc.name removeAllLeavesEmptyStore
     * @tc.desc Verify removing every id one by one empties the store and its counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('removeAllLeavesEmptyStore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = storeOf(100);
      let removed: number = 0;
      for (let id = 1; id <= 100; id++) {
        if (store.remove(id)) {
          removed++;
        }
      }
      expect(removed).assertEqual(100);
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
      expect(store.getAll().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_0400
     * @tc.name toggleEachTwiceRestoresState
     * @tc.desc Verify toggling every contact twice restores the original online count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('toggleEachTwiceRestoresState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = storeOf(20);
      const before: number = store.onlineCount();
      for (let id = 1; id <= 20; id++) {
        store.toggleOnline(id);
        store.toggleOnline(id);
      }
      expect(store.onlineCount()).assertEqual(before);
      expect(store.count()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_0500
     * @tc.name onlineCountStaysWithinBounds
     * @tc.desc Verify the online count never exceeds the population after toggling every entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('onlineCountStaysWithinBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: ContactStore = storeOf(50);
      for (let id = 1; id <= 50; id++) {
        store.toggleOnline(id);
      }
      expect(store.onlineCount() >= 0).assertTrue();
      expect(store.onlineCount() <= store.count()).assertTrue();
      const all: ContactItem[] = store.getAll();
      let counted: number = 0;
      for (const c of all) {
        if (c.online) {
          counted++;
        }
      }
      expect(counted).assertEqual(store.onlineCount());
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_0600
     * @tc.name searchResultsMatchKeywordInvariant
     * @tc.desc Verify every search hit truly contains the lower-cased keyword in name or department
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('searchResultsMatchKeywordInvariant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = storeOf(100);
      const keywords: string[] = ['u1', 'u99', 'depta', 'DEPTb', 'u5', 'u100'];
      for (const keyword of keywords) {
        const hit: ContactItem[] = store.search(keyword);
        const lower: string = keyword.toLowerCase();
        expect(hit.length <= store.count()).assertTrue();
        for (const c of hit) {
          const matches: boolean = c.name.toLowerCase().includes(lower) || c.dept.toLowerCase().includes(lower);
          expect(matches).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_0700
     * @tc.name emptySearchReturnsWholePopulation
     * @tc.desc Verify an empty keyword returns the same number of entries as the store count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('emptySearchReturnsWholePopulation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = storeOf(100);
      const all: ContactItem[] = store.search('');
      expect(all.length).assertEqual(store.count());
      expect(all.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_0800
     * @tc.name removeMissingIdsKeepPopulation
     * @tc.desc Verify negative, zero and out-of-range ids fail to remove and leave the store intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('removeMissingIdsKeepPopulation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const store: ContactStore = storeOf(10);
      expect(store.remove(-1)).assertFalse();
      expect(store.remove(0)).assertFalse();
      expect(store.remove(999)).assertFalse();
      expect(store.count()).assertEqual(10);
      expect(store.getAll().length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_0900
     * @tc.name largeFieldValuesRoundTrip
     * @tc.desc Verify four-thousand-character fields are stored verbatim and remain searchable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('largeFieldValuesRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: ContactStore = new ContactStore();
      const longName: string = 'n'.repeat(4096);
      const longPhone: string = '1'.repeat(4096);
      const longDept: string = 'd'.repeat(4096);
      const added: ContactItem = store.add(longName, longPhone, longDept, true);
      const found: ContactItem | null = store.findById(added.id);
      expect(found !== null).assertTrue();
      expect(found!.name.length).assertEqual(4096);
      expect(found!.phone.length).assertEqual(4096);
      expect(found!.dept.length).assertEqual(4096);
      expect(store.search('nnn').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_1000
     * @tc.name repeatedSearchIsStable
     * @tc.desc Verify fifty identical searches always return the same hit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('repeatedSearchIsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: ContactStore = storeOf(100);
      const first: number = store.search('u1').length;
      for (let i = 0; i < 50; i++) {
        expect(store.search('u1').length).assertEqual(first);
      }
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACT_STABILITY_1100
     * @tc.name idNotReusedAfterRemove
     * @tc.desc Verify a new contact after a mid-removal continues the id sequence instead of reusing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('idNotReusedAfterRemove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const store: ContactStore = storeOf(5);
      expect(store.remove(3)).assertTrue();
      const added: ContactItem = store.add('x', 'y', 'z');
      expect(added.id).assertEqual(6);
      expect(store.count()).assertEqual(5);
      expect(store.findById(3) === null).assertTrue();
    });
  });
}
