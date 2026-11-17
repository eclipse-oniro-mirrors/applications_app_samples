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
 

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ContactStore, ContactItem } from '../../../main/ets/model/ListModels';

/** 构建含 4 人的全新仓库（张三/李四/王五/赵六，在线 1、3） */
function freshContacts(): ContactStore {
  const s: ContactStore = new ContactStore();
  s.add('张三', '13800000001', '研发部', true);
  s.add('李四', '13800000002', '产品部', false);
  s.add('王五', '13800000003', '研发部', true);
  s.add('赵六', '13800000004', '测试部', false);
  return s;
}

export default function contactStoreMatrixTest() {
  describe('contactStoreMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_0100
     * @tc.name idsSequentialFromOne001
     * @tc.desc Verify contact ids start at 1 and increase by one per add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('idsSequentialFromOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      const all: ContactItem[] = store.getAll();
      expect(all[0].id).assertEqual(1);
      expect(all[1].id).assertEqual(2);
      expect(all[2].id).assertEqual(3);
      expect(all[3].id).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_0200
     * @tc.name addEmptyNameAllowed002
     * @tc.desc Verify a contact with an empty name is stored and reachable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addEmptyNameAllowed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      const c: ContactItem = store.add('', '13900000001', '临时');
      expect(store.count()).assertEqual(5);
      expect(c.name).assertEqual('');
      expect(store.findById(c.id) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_0300
     * @tc.name addUnicodeName003
     * @tc.desc Verify Chinese and Emoji names are stored verbatim and searchable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addUnicodeName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      const c: ContactItem = store.add('小明🙂', '13900000002', '国际部');
      expect(c.name).assertEqual('小明🙂');
      expect(store.search('国际').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_0400
     * @tc.name addDefaultOffline004
     * @tc.desc Verify online defaults to false and an explicit true is honored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addDefaultOffline004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      const offline: ContactItem = store.add('钱七', '13900000003', '运营部');
      expect(offline.online).assertFalse();
      const online: ContactItem = store.add('孙八', '13900000004', '运营部', true);
      expect(online.online).assertTrue();
      expect(store.onlineCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_0500
     * @tc.name addPreservesFields005
     * @tc.desc Verify name, phone and department are stored as provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addPreservesFields005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      const c: ContactItem = store.add('周九', '13700001234', '法务部');
      expect(c.name).assertEqual('周九');
      expect(c.phone).assertEqual('13700001234');
      expect(c.dept).assertEqual('法务部');
      expect(c.id).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_0600
     * @tc.name removeMiddleKeepsOrder006
     * @tc.desc Verify removing the middle contact keeps the order of the others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeMiddleKeepsOrder006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.remove(2)).assertTrue();
      const names: string[] = store.getAll().map((c: ContactItem): string => c.name);
      expect(names.join('-')).assertEqual('张三-王五-赵六');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_0700
     * @tc.name removeLastByIdSucceeds007
     * @tc.desc Verify removing the last contact by id succeeds and hides it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeLastByIdSucceeds007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.remove(4)).assertTrue();
      expect(store.count()).assertEqual(3);
      expect(store.findById(4) === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_0800
     * @tc.name removeTwiceSecondReturnsFalse008
     * @tc.desc Verify removing the same id twice returns true then false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeTwiceSecondReturnsFalse008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.remove(2)).assertTrue();
      expect(store.remove(2)).assertFalse();
      expect(store.count()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_0900
     * @tc.name removeNegativeAndZeroFalse009
     * @tc.desc Verify negative and zero ids never match and removal returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeNegativeAndZeroFalse009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.remove(-1)).assertFalse();
      expect(store.remove(0)).assertFalse();
      expect(store.count()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_1000
     * @tc.name toggleOnlineMultipleIndependent010
     * @tc.desc Verify toggling several contacts keeps each state independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toggleOnlineMultipleIndependent010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.onlineCount()).assertEqual(2);
      expect(store.toggleOnline(2)).assertTrue();
      expect(store.toggleOnline(4)).assertTrue();
      expect(store.onlineCount()).assertEqual(4);
      const first: ContactItem | null = store.findById(1);
      expect(first !== null && first.online).assertTrue();
      store.toggleOnline(1);
      expect(store.onlineCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_1100
     * @tc.name toggleOnlineTwiceRestores011
     * @tc.desc Verify toggling the same contact twice restores its online state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toggleOnlineTwiceRestores011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.toggleOnline(2)).assertTrue();
      expect(store.onlineCount()).assertEqual(3);
      expect(store.toggleOnline(2)).assertFalse();
      expect(store.onlineCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_1200
     * @tc.name toggleOnlineNegativeNull012
     * @tc.desc Verify toggling a negative id returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toggleOnlineNegativeNull012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.toggleOnline(-5) === null).assertTrue();
      expect(store.onlineCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_1300
     * @tc.name toggleOnlineFractionalNull013
     * @tc.desc Verify a fractional id that matches no contact returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toggleOnlineFractionalNull013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.toggleOnline(2.5) === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_1400
     * @tc.name searchCaseInsensitive014
     * @tc.desc Verify search is case-insensitive for English names and departments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('searchCaseInsensitive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      store.add('Tom', '13900000005', 'RD');
      expect(store.search('tom').length).assertEqual(1);
      expect(store.search('TOM').length).assertEqual(1);
      expect(store.search('rd').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_1500
     * @tc.name searchChinesePartial015
     * @tc.desc Verify partial Chinese keywords match both name and department
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('searchChinesePartial015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.search('三').length).assertEqual(1);
      expect(store.search('研发').length).assertEqual(2);
      expect(store.search('测试').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_1600
     * @tc.name searchEmptyReturnsAll016
     * @tc.desc Verify an empty keyword returns every contact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('searchEmptyReturnsAll016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.search('').length).assertEqual(store.count());
      expect(store.search('').length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_1700
     * @tc.name searchNoMatch017
     * @tc.desc Verify an unmatched keyword returns an empty list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('searchNoMatch017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.search('不存在的人').length).assertEqual(0);
      expect(store.search('zzz').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_1800
     * @tc.name searchMatchesNameOrDept018
     * @tc.desc Verify a keyword shared by every department returns all contacts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('searchMatchesNameOrDept018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      // 四个部门名都含“部”，按部门匹配应命中全部
      expect(store.search('部').length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_1900
     * @tc.name getAllLengthMatchesCount019
     * @tc.desc Verify the getAll snapshot length always matches count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('getAllLengthMatchesCount019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.getAll().length).assertEqual(store.count());
      store.remove(3);
      expect(store.getAll().length).assertEqual(store.count());
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_2000
     * @tc.name findByIdSharesReferenceWithGetAll020
     * @tc.desc Verify getAll returns shallow copies sharing the same contact objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('findByIdSharesReferenceWithGetAll020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      const snapshot: ContactItem[] = store.getAll();
      expect(store.findById(1) === snapshot[0]).assertTrue();
      store.toggleOnline(1);
      expect(snapshot[0].online).assertFalse();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_2100
     * @tc.name clearThenAddContinuesIdSequence021
     * @tc.desc Verify clear keeps the id counter so new contacts continue the sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clearThenAddContinuesIdSequence021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      store.clear();
      const c: ContactItem = store.add('重新开始', '13900000006', '综合部');
      expect(c.id).assertEqual(5);
      expect(store.count()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_2200
     * @tc.name clearTwiceStaysEmpty022
     * @tc.desc Verify clearing an empty store is a no-op and stays empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clearTwiceStaysEmpty022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      store.clear();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.getAll().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_2300
     * @tc.name onlineCountZeroAfterClear023
     * @tc.desc Verify clear resets the online count after toggles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('onlineCountZeroAfterClear023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      store.toggleOnline(2);
      store.toggleOnline(4);
      expect(store.onlineCount()).assertEqual(4);
      store.clear();
      expect(store.onlineCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_2400
     * @tc.name removeAllLeavesEmptyStore024
     * @tc.desc Verify removing every contact one by one leaves an empty store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('removeAllLeavesEmptyStore024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.remove(1)).assertTrue();
      expect(store.remove(2)).assertTrue();
      expect(store.remove(3)).assertTrue();
      expect(store.remove(4)).assertTrue();
      expect(store.count()).assertEqual(0);
      expect(store.onlineCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_2500
     * @tc.name addRemoveCycleKeepsOrder025
     * @tc.desc Verify an add-remove cycle keeps the count and order consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addRemoveCycleKeepsOrder025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      const c: ContactItem = store.add('钱七', '13900000007', '运营部');
      expect(store.count()).assertEqual(5);
      expect(store.remove(c.id)).assertTrue();
      expect(store.count()).assertEqual(4);
      const names: string[] = store.getAll().map((item: ContactItem): string => item.name);
      expect(names.join('-')).assertEqual('张三-李四-王五-赵六');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_2600
     * @tc.name searchAfterRemove026
     * @tc.desc Verify search results drop the removed contact immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('searchAfterRemove026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.search('研发部').length).assertEqual(2);
      store.remove(3);
      expect(store.search('研发部').length).assertEqual(1);
      expect(store.search('王五').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_2700
     * @tc.name findByIdAfterClearNull027
     * @tc.desc Verify every id lookup returns null after clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('findByIdAfterClearNull027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      store.clear();
      expect(store.findById(1) === null).assertTrue();
      expect(store.findById(4) === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_2800
     * @tc.name onlineAddedContactCounted028
     * @tc.desc Verify a contact added as online is included in onlineCount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('onlineAddedContactCounted028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.onlineCount()).assertEqual(2);
      const c: ContactItem = store.add('孙八', '13900000008', '客服部', true);
      expect(store.onlineCount()).assertEqual(3);
      expect(store.toggleOnline(c.id)).assertFalse();
      expect(store.onlineCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_2900
     * @tc.name fractionalIdRejectedEverywhere029
     * @tc.desc Verify a fractional id matches nothing for findById, remove and toggleOnline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fractionalIdRejectedEverywhere029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      expect(store.findById(2.5) === null).assertTrue();
      expect(store.remove(2.5)).assertFalse();
      expect(store.toggleOnline(2.5) === null).assertTrue();
      expect(store.count()).assertEqual(4);
      expect(store.onlineCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_3000
     * @tc.name addFiftyIdsAndCounts030
     * @tc.desc Verify fifty sequential adds keep ids consecutive and counts exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('addFiftyIdsAndCounts030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      for (let i = 1; i <= 50; i++) {
        store.add(`批量${i}`, `139${i}`, '压测部');
      }
      expect(store.count()).assertEqual(54);
      const all: ContactItem[] = store.getAll();
      expect(all.length).assertEqual(54);
      expect(all[53].id).assertEqual(54);
      expect(all[53].name).assertEqual('批量50');
      expect(store.onlineCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_CONTACTSTOREMATRIX_3100
     * @tc.name whitespaceNameAndSpacesKeyword031
     * @tc.desc Verify a whitespace-only name is stored and a spaces-only keyword matches it alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('whitespaceNameAndSpacesKeyword031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const store: ContactStore = freshContacts();
      // 原始数据不含空白字符，空白关键字不应命中
      expect(store.search('   ').length).assertEqual(0);
      const c: ContactItem = store.add('   ', '13900000010', '综合部');
      expect(c.name).assertEqual('   ');
      expect(store.findById(c.id) !== null).assertTrue();
      // 空白关键字按字面匹配纯空白姓名
      expect(store.search('   ').length).assertEqual(1);
      expect(store.count()).assertEqual(5);
    });
  });
}
