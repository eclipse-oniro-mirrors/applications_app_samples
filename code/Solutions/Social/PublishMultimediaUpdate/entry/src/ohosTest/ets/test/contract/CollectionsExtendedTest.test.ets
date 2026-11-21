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
import TreeMap from '@ohos.util.TreeMap';
import LightWeightMap from '@ohos.util.LightWeightMap';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Editing operations of the ordered and keyed containers.
 * A feed keeps rows in a list while a lookup keeps owner metadata; both are
 * edited after they are built. The cases pin the insert, remove, range copy,
 * neighbour lookup and bulk copy calls that the earlier suites do not touch.
 */
export default function collectionsExtendedTest() {
  describe('CollectionsExtendedTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_0100
     * @tc.name ArrayListInsertAtPosition001
     * @tc.desc Verify an inserted element lands at the requested position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListInsertAtPosition_001', 0, (): void => {
      Logger.info(TAG, 'ArrayListInsertAtPosition_001 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      list.add('a');
      list.add('c');
      list.insert('b', 1);
      expect(list.convertToArray()[1]).assertEqual('b');
      Logger.info(TAG, 'ArrayListInsertAtPosition_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_0200
     * @tc.name ArrayListRemoveByIndexReturns002
     * @tc.desc Verify removing by index returns the removed element and shrinks the list
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListRemoveByIndexReturns_002', 0, (): void => {
      Logger.info(TAG, 'ArrayListRemoveByIndexReturns_002 begin');
      const list: ArrayList<number> = new ArrayList<number>();
      list.add(1);
      list.add(2);
      list.add(3);
      expect(list.removeByIndex(1)).assertEqual(2);
      expect(list.length).assertEqual(2);
      Logger.info(TAG, 'ArrayListRemoveByIndexReturns_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_0300
     * @tc.name ArrayListSubListLeavesSource003
     * @tc.desc Verify a range copy contains the range without changing the source
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListSubListLeavesSource_003', 0, (): void => {
      Logger.info(TAG, 'ArrayListSubListLeavesSource_003 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      list.add('a');
      list.add('b');
      list.add('c');
      const range: ArrayList<string> = list.subArrayList(0, 2);
      expect(range.length).assertEqual(2);
      expect(list.length).assertEqual(3);
      Logger.info(TAG, 'ArrayListSubListLeavesSource_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_0400
     * @tc.name ArrayListLastIndexOfDuplicate004
     * @tc.desc Verify the reverse index lookup finds the later duplicate
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListLastIndexOfDuplicate_004', 0, (): void => {
      Logger.info(TAG, 'ArrayListLastIndexOfDuplicate_004 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      list.add('x');
      list.add('y');
      list.add('x');
      expect(list.getLastIndexOf('x')).assertEqual(2);
      Logger.info(TAG, 'ArrayListLastIndexOfDuplicate_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_0500
     * @tc.name ArrayListSortOrdersNumbers005
     * @tc.desc Verify the comparator decides the order of numeric elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayListSortOrdersNumbers_005', 0, (): void => {
      Logger.info(TAG, 'ArrayListSortOrdersNumbers_005 begin');
      const list: ArrayList<number> = new ArrayList<number>();
      list.add(3);
      list.add(1);
      list.add(2);
      list.sort((first: number, second: number): number => first - second);
      expect(list.convertToArray()[0]).assertEqual(1);
      Logger.info(TAG, 'ArrayListSortOrdersNumbers_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_0600
     * @tc.name TreeMapLowerKeyBelowInput006
     * @tc.desc Verify the lower neighbour is the greatest key below the input
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TreeMapLowerKeyBelowInput_006', 0, (): void => {
      Logger.info(TAG, 'TreeMapLowerKeyBelowInput_006 begin');
      const map: TreeMap<number, string> = new TreeMap<number, string>();
      map.set(10, 'ten');
      map.set(20, 'twenty');
      map.set(30, 'thirty');
      expect(map.getLowerKey(25)).assertEqual(20);
      Logger.info(TAG, 'TreeMapLowerKeyBelowInput_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_0700
     * @tc.name TreeMapHigherKeyAboveInput007
     * @tc.desc Verify the higher neighbour is the smallest key above the input
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TreeMapHigherKeyAboveInput_007', 0, (): void => {
      Logger.info(TAG, 'TreeMapHigherKeyAboveInput_007 begin');
      const map: TreeMap<number, string> = new TreeMap<number, string>();
      map.set(10, 'ten');
      map.set(20, 'twenty');
      map.set(30, 'thirty');
      expect(map.getHigherKey(25)).assertEqual(30);
      Logger.info(TAG, 'TreeMapHigherKeyAboveInput_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_0800
     * @tc.name TreeMapValuePresence008
     * @tc.desc Verify value lookup distinguishes a stored value from an absent one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TreeMapValuePresence_008', 0, (): void => {
      Logger.info(TAG, 'TreeMapValuePresence_008 begin');
      const map: TreeMap<string, string> = new TreeMap<string, string>();
      map.set('post', 'body');
      expect(map.hasValue('body')).assertTrue();
      expect(map.hasValue('caption')).assertFalse();
      Logger.info(TAG, 'TreeMapValuePresence_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_0900
     * @tc.name LightMapEntriesWalk009
     * @tc.desc Verify the entry iterator visits every stored pair
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LightMapEntriesWalk_009', 0, (): void => {
      Logger.info(TAG, 'LightMapEntriesWalk_009 begin');
      const map: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      let visited: number = 0;
      for (const entry of map.entries()) {
        if (entry[0].length !== 0) {
          visited += 1;
        }
      }
      expect(visited).assertEqual(2);
      Logger.info(TAG, 'LightMapEntriesWalk_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_1000
     * @tc.name LightMapSetAllCopiesPairs010
     * @tc.desc Verify copying all pairs from another map grows this map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LightMapSetAllCopiesPairs_010', 0, (): void => {
      Logger.info(TAG, 'LightMapSetAllCopiesPairs_010 begin');
      const source: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      source.set('one', 1);
      source.set('two', 2);
      const target: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      target.setAll(source);
      expect(target.length).assertEqual(2);
      Logger.info(TAG, 'LightMapSetAllCopiesPairs_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_1100
     * @tc.name LightMapKeyAtPosition011
     * @tc.desc Verify the key at a position is the key stored there
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LightMapKeyAtPosition_011', 0, (): void => {
      Logger.info(TAG, 'LightMapKeyAtPosition_011 begin');
      const map: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      map.set('first', 10);
      map.set('second', 20);
      expect(map.getKeyAt(0)).assertEqual('first');
      Logger.info(TAG, 'LightMapKeyAtPosition_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_1200
     * @tc.name LightMapHasAllPairs012
     * @tc.desc Verify a full containment check accepts a covered map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LightMapHasAllPairs_012', 0, (): void => {
      Logger.info(TAG, 'LightMapHasAllPairs_012 begin');
      const full: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      full.set('a', 1);
      full.set('b', 2);
      const part: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      part.set('a', 1);
      expect(full.hasAll(part)).assertTrue();
      Logger.info(TAG, 'LightMapHasAllPairs_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_1300
     * @tc.name LightMapCapacityChangeKeepsPairs013
     * @tc.desc Verify growing the capacity does not drop stored pairs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LightMapCapacityChangeKeepsPairs_013', 0, (): void => {
      Logger.info(TAG, 'LightMapCapacityChangeKeepsPairs_013 begin');
      const map: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      map.increaseCapacityTo(32);
      expect(map.length).assertEqual(2);
      Logger.info(TAG, 'LightMapCapacityChangeKeepsPairs_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_COLLX_1400
     * @tc.name TreeMapFirstKeyAfterRemoval014
     * @tc.desc Verify removing the smallest key promotes the next key
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TreeMapFirstKeyAfterRemoval_014', 0, (): void => {
      Logger.info(TAG, 'TreeMapFirstKeyAfterRemoval_014 begin');
      const map: TreeMap<number, string> = new TreeMap<number, string>();
      map.set(1, 'one');
      map.set(2, 'two');
      map.remove(1);
      expect(map.getFirstKey()).assertEqual(2);
      Logger.info(TAG, 'TreeMapFirstKeyAfterRemoval_014 end');
    });
  });
}
