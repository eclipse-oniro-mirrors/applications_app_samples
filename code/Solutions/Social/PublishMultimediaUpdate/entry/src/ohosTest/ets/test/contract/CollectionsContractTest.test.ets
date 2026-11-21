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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import ArrayList from '@ohos.util.ArrayList';
import Deque from '@ohos.util.Deque';
import Stack from '@ohos.util.Stack';
import Queue from '@ohos.util.Queue';
import LightWeightMap from '@ohos.util.LightWeightMap';
import TreeMap from '@ohos.util.TreeMap';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Ordered and keyed containers from the ArkTS standard library.
 * A feed can be kept in a sequence while a lookup table keeps row identities,
 * so the ordering, uniqueness and removal rules of each container matter.
 * Every case uses its own instance, so the checks never depend on order.
 */
export default function collectionsContractTest() {
  describe('CollectionsContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_0100
     * @tc.name ArrayListKeepsInsertOrder001
     * @tc.desc Verify appended elements keep their insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListKeepsInsertOrder_001', 0, (): void => {
      Logger.info(TAG, 'ArrayListKeepsInsertOrder_001 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      list.add('a');
      list.add('b');
      list.add('c');
      const snapshot: Array<string> = list.convertToArray();
      expect(snapshot[2]).assertEqual('c');
      Logger.info(TAG, 'ArrayListKeepsInsertOrder_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_0200
     * @tc.name ArrayListLengthCountsAdds002
     * @tc.desc Verify the length grows with every accepted element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListLengthCountsAdds_002', 0, (): void => {
      Logger.info(TAG, 'ArrayListLengthCountsAdds_002 begin');
      const list: ArrayList<number> = new ArrayList<number>();
      list.add(1);
      list.add(2);
      list.add(3);
      expect(list.length).assertEqual(3);
      Logger.info(TAG, 'ArrayListLengthCountsAdds_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_0300
     * @tc.name ArrayListIndexOfReportsPosition003
     * @tc.desc Verify the index lookup returns the stored position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListIndexOfReportsPosition_003', 0, (): void => {
      Logger.info(TAG, 'ArrayListIndexOfReportsPosition_003 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      list.add('apple');
      list.add('banana');
      expect(list.getIndexOf('banana')).assertEqual(1);
      Logger.info(TAG, 'ArrayListIndexOfReportsPosition_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_0400
     * @tc.name ArrayListContainsAdds004
     * @tc.desc Verify a stored element is reported as present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListContainsAdds_004', 0, (): void => {
      Logger.info(TAG, 'ArrayListContainsAdds_004 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      list.add('alpha');
      expect(list.has('alpha')).assertTrue();
      expect(list.has('omega')).assertFalse();
      Logger.info(TAG, 'ArrayListContainsAdds_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_0500
     * @tc.name ArrayListRemoveShrinks005
     * @tc.desc Verify a removed element disappears from the lookup
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListRemoveShrinks_005', 0, (): void => {
      Logger.info(TAG, 'ArrayListRemoveShrinks_005 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      list.add('a');
      list.add('b');
      list.add('c');
      const removed: boolean = list.remove('b');
      expect(removed).assertTrue();
      expect(list.getIndexOf('b')).assertEqual(-1);
      Logger.info(TAG, 'ArrayListRemoveShrinks_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_0600
     * @tc.name ArrayListClearEmpties006
     * @tc.desc Verify clearing leaves an empty sequence behind
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListClearEmpties_006', 0, (): void => {
      Logger.info(TAG, 'ArrayListClearEmpties_006 begin');
      const list: ArrayList<number> = new ArrayList<number>();
      list.add(7);
      list.clear();
      expect(list.isEmpty()).assertTrue();
      Logger.info(TAG, 'ArrayListClearEmpties_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_0700
     * @tc.name DequeFrontInsertBecomesHead007
     * @tc.desc Verify a front insertion becomes the new first element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DequeFrontInsertBecomesHead_007', 0, (): void => {
      Logger.info(TAG, 'DequeFrontInsertBecomesHead_007 begin');
      const deque: Deque<number> = new Deque<number>();
      deque.insertFront(1);
      deque.insertFront(2);
      expect(deque.getFirst()).assertEqual(2);
      Logger.info(TAG, 'DequeFrontInsertBecomesHead_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_0800
     * @tc.name DequeBackPopReturnsLast008
     * @tc.desc Verify popping the back returns the most recent tail
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DequeBackPopReturnsLast_008', 0, (): void => {
      Logger.info(TAG, 'DequeBackPopReturnsLast_008 begin');
      const deque: Deque<string> = new Deque<string>();
      deque.insertEnd('first');
      deque.insertEnd('second');
      expect(deque.popLast()).assertEqual('second');
      Logger.info(TAG, 'DequeBackPopReturnsLast_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_0900
     * @tc.name DequeFrontPopAdvancesHead009
     * @tc.desc Verify popping the front advances the head to the next element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DequeFrontPopAdvancesHead_009', 0, (): void => {
      Logger.info(TAG, 'DequeFrontPopAdvancesHead_009 begin');
      const deque: Deque<number> = new Deque<number>();
      deque.insertEnd(4);
      deque.insertEnd(5);
      expect(deque.popFirst()).assertEqual(4);
      expect(deque.getFirst()).assertEqual(5);
      Logger.info(TAG, 'DequeFrontPopAdvancesHead_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_1000
     * @tc.name StackPopReturnsLastPushed010
     * @tc.desc Verify the stack hands back the most recent push first
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StackPopReturnsLastPushed_010', 0, (): void => {
      Logger.info(TAG, 'StackPopReturnsLastPushed_010 begin');
      const stack: Stack<number> = new Stack<number>();
      stack.push(1);
      stack.push(2);
      expect(stack.pop()).assertEqual(2);
      Logger.info(TAG, 'StackPopReturnsLastPushed_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_1100
     * @tc.name StackPeekKeepsSize011
     * @tc.desc Verify peeking reads the top without removing it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StackPeekKeepsSize_011', 0, (): void => {
      Logger.info(TAG, 'StackPeekKeepsSize_011 begin');
      const stack: Stack<string> = new Stack<string>();
      stack.push('only');
      expect(stack.peek()).assertEqual('only');
      expect(stack.length).assertEqual(1);
      Logger.info(TAG, 'StackPeekKeepsSize_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_1200
     * @tc.name QueuePopsOldestFirst012
     * @tc.desc Verify the queue releases the earliest element first
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'QueuePopsOldestFirst_012', 0, (): void => {
      Logger.info(TAG, 'QueuePopsOldestFirst_012 begin');
      const queue: Queue<string> = new Queue<string>();
      queue.add('oldest');
      queue.add('newest');
      expect(queue.pop()).assertEqual('oldest');
      Logger.info(TAG, 'QueuePopsOldestFirst_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_1300
     * @tc.name QueueFirstReadKeepsSize013
     * @tc.desc Verify reading the queue head does not consume the element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'QueueFirstReadKeepsSize_013', 0, (): void => {
      Logger.info(TAG, 'QueueFirstReadKeepsSize_013 begin');
      const queue: Queue<number> = new Queue<number>();
      queue.add(10);
      expect(queue.getFirst()).assertEqual(10);
      expect(queue.length).assertEqual(1);
      Logger.info(TAG, 'QueueFirstReadKeepsSize_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_1400
     * @tc.name LightMapStoresKeyValue014
     * @tc.desc Verify a stored value can be read back by its key
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LightMapStoresKeyValue_014', 0, (): void => {
      Logger.info(TAG, 'LightMapStoresKeyValue_014 begin');
      const map: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      map.set('likes', 7);
      expect(map.get('likes')).assertEqual(7);
      Logger.info(TAG, 'LightMapStoresKeyValue_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_1500
     * @tc.name LightMapKeyPresence015
     * @tc.desc Verify key presence distinguishes a stored key from an absent one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LightMapKeyPresence_015', 0, (): void => {
      Logger.info(TAG, 'LightMapKeyPresence_015 begin');
      const map: LightWeightMap<string, string> = new LightWeightMap<string, string>();
      map.set('zoologist', 'avatar_one');
      expect(map.hasKey('zoologist')).assertTrue();
      expect(map.hasKey('chef')).assertFalse();
      Logger.info(TAG, 'LightMapKeyPresence_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_1600
     * @tc.name LightMapRemoveDropsKey016
     * @tc.desc Verify removal makes the key unreachable again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LightMapRemoveDropsKey_016', 0, (): void => {
      Logger.info(TAG, 'LightMapRemoveDropsKey_016 begin');
      const map: LightWeightMap<number, number> = new LightWeightMap<number, number>();
      map.set(1, 100);
      map.remove(1);
      expect(map.hasKey(1)).assertFalse();
      Logger.info(TAG, 'LightMapRemoveDropsKey_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_1700
     * @tc.name LightMapKeysIteration017
     * @tc.desc Verify the key iterator visits every stored key once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LightMapKeysIteration_017', 0, (): void => {
      Logger.info(TAG, 'LightMapKeysIteration_017 begin');
      const map: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      let visited: number = 0;
      for (const key of map.keys()) {
        if (key.length !== 0) {
          visited += 1;
        }
      }
      expect(visited).assertEqual(2);
      Logger.info(TAG, 'LightMapKeysIteration_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_1800
     * @tc.name TreeMapKeysAscending018
     * @tc.desc Verify the tree visits numeric keys from small to large
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TreeMapKeysAscending_018', 0, (): void => {
      Logger.info(TAG, 'TreeMapKeysAscending_018 begin');
      const map: TreeMap<number, string> = new TreeMap<number, string>();
      map.set(3, 'third');
      map.set(1, 'first');
      map.set(2, 'second');
      const order: Array<number> = [];
      for (const key of map.keys()) {
        order.push(key);
      }
      expect(order[0]).assertEqual(1);
      expect(order[2]).assertEqual(3);
      Logger.info(TAG, 'TreeMapKeysAscending_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_1900
     * @tc.name TreeMapFirstAndLastRange019
     * @tc.desc Verify the smallest and largest stored keys are exposed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TreeMapFirstAndLastRange_019', 0, (): void => {
      Logger.info(TAG, 'TreeMapFirstAndLastRange_019 begin');
      const map: TreeMap<number, number> = new TreeMap<number, number>();
      map.set(5, 50);
      map.set(2, 20);
      map.set(9, 90);
      expect(map.getFirstKey()).assertEqual(2);
      expect(map.getLastKey()).assertEqual(9);
      Logger.info(TAG, 'TreeMapFirstAndLastRange_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLL_2000
     * @tc.name TreeMapRemoveDropsValue020
     * @tc.desc Verify a removed tree key no longer yields a value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TreeMapRemoveDropsValue_020', 0, (): void => {
      Logger.info(TAG, 'TreeMapRemoveDropsValue_020 begin');
      const map: TreeMap<string, string> = new TreeMap<string, string>();
      map.set('post', 'body');
      map.remove('post');
      expect(map.hasKey('post')).assertFalse();
      Logger.info(TAG, 'TreeMapRemoveDropsValue_020 end');
    });
  });
}
