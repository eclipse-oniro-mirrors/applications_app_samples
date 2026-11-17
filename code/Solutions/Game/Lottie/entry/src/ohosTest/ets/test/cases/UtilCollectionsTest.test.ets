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


import { describe, it, expect } from '@ohos/hypium';
import ArrayList from '@ohos.util.ArrayList';
import HashMap from '@ohos.util.HashMap';
import HashSet from '@ohos.util.HashSet';
import Deque from '@ohos.util.Deque';
import Stack from '@ohos.util.Stack';
import Queue from '@ohos.util.Queue';
import LinkedList from '@ohos.util.LinkedList';
import TreeMap from '@ohos.util.TreeMap';
import TreeSet from '@ohos.util.TreeSet';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.COLLECTIONS;

function makeList(): ArrayList<string> {
  const list: ArrayList<string> = new ArrayList<string>();
  list.add('a');
  list.add('b');
  list.add('c');
  return list;
}

function makeMap(): HashMap<string, number> {
  const map: HashMap<string, number> = new HashMap<string, number>();
  map.set('a', 1);
  map.set('b', 2);
  map.set('c', 3);
  return map;
}

function makeSet(): HashSet<string> {
  const set: HashSet<string> = new HashSet<string>();
  set.add('a');
  set.add('b');
  set.add('c');
  return set;
}

function makeDeque(): Deque<string> {
  const deque: Deque<string> = new Deque<string>();
  deque.insertEnd('a');
  deque.insertEnd('b');
  deque.insertEnd('c');
  return deque;
}

function makeStack(): Stack<string> {
  const stack: Stack<string> = new Stack<string>();
  stack.push('a');
  stack.push('b');
  stack.push('c');
  return stack;
}

function makeQueue(): Queue<string> {
  const queue: Queue<string> = new Queue<string>();
  queue.add('a');
  queue.add('b');
  queue.add('c');
  return queue;
}

function makeLinkedList(): LinkedList<string> {
  const list: LinkedList<string> = new LinkedList<string>();
  list.add('a');
  list.add('b');
  list.add('c');
  return list;
}

function makeTreeMap(): TreeMap<string, number> {
  const map: TreeMap<string, number> = new TreeMap<string, number>();
  map.set('a', 1);
  map.set('b', 2);
  map.set('c', 3);
  return map;
}

function makeTreeSet(): TreeSet<string> {
  const set: TreeSet<string> = new TreeSet<string>();
  set.add('a');
  set.add('b');
  set.add('c');
  return set;
}

export default function utilCollectionsTest(): void {
  describe('UtilCollectionsTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0010
     * @tc.name arrayListNewEmpty001
     * @tc.desc Verify a new ArrayList starts empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListNewEmpty_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListNewEmpty_001 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      Logger.info(TAG, 'arrayListNewEmpty_001, check01=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(0);
      Logger.info(TAG, 'arrayListNewEmpty_001, check02=' + JSON.stringify(list.isEmpty()));
      expect(list.isEmpty()).assertTrue();
      Logger.info(TAG, 'arrayListNewEmpty_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0020
     * @tc.name arrayListAddElement002
     * @tc.desc Verify ArrayList add stores a new element and reports success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListAddElement_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListAddElement_002 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      const added: boolean = list.add('a');
      Logger.info(TAG, 'arrayListAddElement_002, check01=' + JSON.stringify(added));
      expect(added).assertTrue();
      Logger.info(TAG, 'arrayListAddElement_002, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(1);
      Logger.info(TAG, 'arrayListAddElement_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0030
     * @tc.name arrayListAddKeepsOrder003
     * @tc.desc Verify ArrayList appending three elements preserves insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListAddKeepsOrder_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListAddKeepsOrder_003 begin');
      const list: ArrayList<string> = makeList();
      const values: Array<string> = list.convertToArray();
      Logger.info(TAG, 'arrayListAddKeepsOrder_003, check01=' + JSON.stringify(values[0]));
      expect(values[0]).assertEqual('a');
      Logger.info(TAG, 'arrayListAddKeepsOrder_003, check02=' + JSON.stringify(values[1]));
      expect(values[1]).assertEqual('b');
      Logger.info(TAG, 'arrayListAddKeepsOrder_003, check03=' + JSON.stringify(values[2]));
      expect(values[2]).assertEqual('c');
      Logger.info(TAG, 'arrayListAddKeepsOrder_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0040
     * @tc.name arrayListInsertAtStart004
     * @tc.desc Verify ArrayList inserting at index zero puts the element first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListInsertAtStart_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListInsertAtStart_004 begin');
      const list: ArrayList<string> = makeList();
      list.insert('z', 0);
      const values: Array<string> = list.convertToArray();
      Logger.info(TAG, 'arrayListInsertAtStart_004, check01=' + JSON.stringify(values[0]));
      expect(values[0]).assertEqual('z');
      Logger.info(TAG, 'arrayListInsertAtStart_004, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(4);
      Logger.info(TAG, 'arrayListInsertAtStart_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0050
     * @tc.name arrayListInsertMiddle005
     * @tc.desc Verify ArrayList inserting in the middle shifts the following elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListInsertMiddle_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListInsertMiddle_005 begin');
      const list: ArrayList<string> = makeList();
      list.insert('x', 1);
      const values: Array<string> = list.convertToArray();
      Logger.info(TAG, 'arrayListInsertMiddle_005, check01=' + JSON.stringify(values[1]));
      expect(values[1]).assertEqual('x');
      Logger.info(TAG, 'arrayListInsertMiddle_005, check02=' + JSON.stringify(values[2]));
      expect(values[2]).assertEqual('b');
      Logger.info(TAG, 'arrayListInsertMiddle_005, check03=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(4);
      Logger.info(TAG, 'arrayListInsertMiddle_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0060
     * @tc.name arrayListHasExisting006
     * @tc.desc Verify ArrayList has reports an element that was appended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListHasExisting_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListHasExisting_006 begin');
      const list: ArrayList<string> = makeList();
      Logger.info(TAG, 'arrayListHasExisting_006, check01=' + JSON.stringify(list.has('b')));
      expect(list.has('b')).assertTrue();
      Logger.info(TAG, 'arrayListHasExisting_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0070
     * @tc.name arrayListHasMissing007
     * @tc.desc Verify ArrayList has reports false for an element that is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListHasMissing_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListHasMissing_007 begin');
      const list: ArrayList<string> = makeList();
      Logger.info(TAG, 'arrayListHasMissing_007, check01=' + JSON.stringify(list.has('z')));
      expect(list.has('z')).assertFalse();
      Logger.info(TAG, 'arrayListHasMissing_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0080
     * @tc.name arrayListIndexOfExisting008
     * @tc.desc Verify ArrayList getIndexOf returns the slot of an appended element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListIndexOfExisting_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListIndexOfExisting_008 begin');
      const list: ArrayList<string> = makeList();
      Logger.info(TAG, 'arrayListIndexOfExisting_008, check01=' + JSON.stringify(list.getIndexOf('b')));
      expect(list.getIndexOf('b')).assertEqual(1);
      Logger.info(TAG, 'arrayListIndexOfExisting_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0090
     * @tc.name arrayListIndexOfMissing009
     * @tc.desc Verify ArrayList getIndexOf returns minus one for an absent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListIndexOfMissing_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListIndexOfMissing_009 begin');
      const list: ArrayList<string> = makeList();
      Logger.info(TAG, 'arrayListIndexOfMissing_009, check01=' + JSON.stringify(list.getIndexOf('z')));
      expect(list.getIndexOf('z')).assertEqual(-1);
      Logger.info(TAG, 'arrayListIndexOfMissing_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0100
     * @tc.name arrayListLastIndexOfDuplicate010
     * @tc.desc Verify ArrayList getLastIndexOf returns the later slot of a duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListLastIndexOfDuplicate_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListLastIndexOfDuplicate_010 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      list.add('a');
      list.add('b');
      list.add('a');
      Logger.info(TAG, 'arrayListLastIndexOfDuplicate_010, check01=' + JSON.stringify(list.getLastIndexOf('a')));
      expect(list.getLastIndexOf('a')).assertEqual(2);
      Logger.info(TAG, 'arrayListLastIndexOfDuplicate_010, check02=' + JSON.stringify(list.getIndexOf('a')));
      expect(list.getIndexOf('a')).assertEqual(0);
      Logger.info(TAG, 'arrayListLastIndexOfDuplicate_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0110
     * @tc.name arrayListRemoveByIndex011
     * @tc.desc Verify ArrayList removeByIndex returns the removed element and shrinks the list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListRemoveByIndex_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListRemoveByIndex_011 begin');
      const list: ArrayList<string> = makeList();
      const removed: string = list.removeByIndex(1);
      Logger.info(TAG, 'arrayListRemoveByIndex_011, check01=' + JSON.stringify(removed));
      expect(removed).assertEqual('b');
      Logger.info(TAG, 'arrayListRemoveByIndex_011, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(2);
      Logger.info(TAG, 'arrayListRemoveByIndex_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0120
     * @tc.name arrayListRemoveElement012
     * @tc.desc Verify ArrayList remove by value reports success and shrinks the list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListRemoveElement_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListRemoveElement_012 begin');
      const list: ArrayList<string> = makeList();
      const removed: boolean = list.remove('b');
      Logger.info(TAG, 'arrayListRemoveElement_012, check01=' + JSON.stringify(removed));
      expect(removed).assertTrue();
      Logger.info(TAG, 'arrayListRemoveElement_012, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(2);
      Logger.info(TAG, 'arrayListRemoveElement_012, check03=' + JSON.stringify(list.has('b')));
      expect(list.has('b')).assertFalse();
      Logger.info(TAG, 'arrayListRemoveElement_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0130
     * @tc.name arrayListRemoveMissing013
     * @tc.desc Verify ArrayList removing an absent value reports false without shrinking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListRemoveMissing_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListRemoveMissing_013 begin');
      const list: ArrayList<string> = makeList();
      const removed: boolean = list.remove('z');
      Logger.info(TAG, 'arrayListRemoveMissing_013, check01=' + JSON.stringify(removed));
      expect(removed).assertFalse();
      Logger.info(TAG, 'arrayListRemoveMissing_013, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(3);
      Logger.info(TAG, 'arrayListRemoveMissing_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0140
     * @tc.name arrayListClearEmpties014
     * @tc.desc Verify ArrayList clear drops every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListClearEmpties_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListClearEmpties_014 begin');
      const list: ArrayList<string> = makeList();
      list.clear();
      Logger.info(TAG, 'arrayListClearEmpties_014, check01=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(0);
      Logger.info(TAG, 'arrayListClearEmpties_014, check02=' + JSON.stringify(list.isEmpty()));
      expect(list.isEmpty()).assertTrue();
      Logger.info(TAG, 'arrayListClearEmpties_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0150
     * @tc.name arrayListCapacityAtLeastLength015
     * @tc.desc Verify ArrayList the backing capacity is never below the element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListCapacityAtLeastLength_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListCapacityAtLeastLength_015 begin');
      const list: ArrayList<string> = makeList();
      Logger.info(TAG, 'arrayListCapacityAtLeastLength_015, check01=' + JSON.stringify(list.getCapacity() >= list.length));
      expect(list.getCapacity() >= list.length).assertTrue();
      Logger.info(TAG, 'arrayListCapacityAtLeastLength_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0160
     * @tc.name arrayListIncreaseCapacity016
     * @tc.desc Verify ArrayList increaseCapacityTo raises the backing capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListIncreaseCapacity_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListIncreaseCapacity_016 begin');
      const list: ArrayList<string> = makeList();
      const before: number = list.getCapacity();
      list.increaseCapacityTo(before + 5);
      Logger.info(TAG, 'arrayListIncreaseCapacity_016, check01=' + JSON.stringify(list.getCapacity() >= before + 5));
      expect(list.getCapacity() >= before + 5).assertTrue();
      Logger.info(TAG, 'arrayListIncreaseCapacity_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0170
     * @tc.name arrayListTrimToLength017
     * @tc.desc Verify ArrayList trimToCurrentLength reduces the capacity to the element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListTrimToLength_017', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListTrimToLength_017 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      list.add('a');
      list.trimToCurrentLength();
      Logger.info(TAG, 'arrayListTrimToLength_017, check01=' + JSON.stringify(list.getCapacity()));
      expect(list.getCapacity()).assertEqual(1);
      Logger.info(TAG, 'arrayListTrimToLength_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0180
     * @tc.name arrayListSubList018
     * @tc.desc Verify ArrayList a sub list keeps the requested range and its order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListSubList_018', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListSubList_018 begin');
      const list: ArrayList<string> = makeList();
      const sub: ArrayList<string> = list.subArrayList(0, 2);
      const values: Array<string> = sub.convertToArray();
      Logger.info(TAG, 'arrayListSubList_018, check01=' + JSON.stringify(sub.length));
      expect(sub.length).assertEqual(2);
      Logger.info(TAG, 'arrayListSubList_018, check02=' + JSON.stringify(values[0]));
      expect(values[0]).assertEqual('a');
      Logger.info(TAG, 'arrayListSubList_018, check03=' + JSON.stringify(values[1]));
      expect(values[1]).assertEqual('b');
      Logger.info(TAG, 'arrayListSubList_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0190
     * @tc.name arrayListSortAscending019
     * @tc.desc Verify ArrayList sort orders string elements ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListSortAscending_019', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListSortAscending_019 begin');
      const list: ArrayList<string> = new ArrayList<string>();
      list.add('c');
      list.add('a');
      list.add('b');
      list.sort();
      const values: Array<string> = list.convertToArray();
      Logger.info(TAG, 'arrayListSortAscending_019, check01=' + JSON.stringify(values[0]));
      expect(values[0]).assertEqual('a');
      Logger.info(TAG, 'arrayListSortAscending_019, check02=' + JSON.stringify(values[1]));
      expect(values[1]).assertEqual('b');
      Logger.info(TAG, 'arrayListSortAscending_019, check03=' + JSON.stringify(values[2]));
      expect(values[2]).assertEqual('c');
      Logger.info(TAG, 'arrayListSortAscending_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0200
     * @tc.name arrayListRemoveByRange020
     * @tc.desc Verify ArrayList removeByRange drops the half open index range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListRemoveByRange_020', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListRemoveByRange_020 begin');
      const list: ArrayList<string> = makeList();
      list.removeByRange(0, 2);
      const values: Array<string> = list.convertToArray();
      Logger.info(TAG, 'arrayListRemoveByRange_020, check01=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(1);
      Logger.info(TAG, 'arrayListRemoveByRange_020, check02=' + JSON.stringify(values[0]));
      expect(values[0]).assertEqual('c');
      Logger.info(TAG, 'arrayListRemoveByRange_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0210
     * @tc.name arrayListForEachVisitsAll021
     * @tc.desc Verify ArrayList forEach visits every element exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListForEachVisitsAll_021', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListForEachVisitsAll_021 begin');
      const list: ArrayList<string> = makeList();
      let visits: number = 0;
      list.forEach((value: string): void => {
        visits++;
      });
      Logger.info(TAG, 'arrayListForEachVisitsAll_021, check01=' + JSON.stringify(visits));
      expect(visits).assertEqual(3);
      Logger.info(TAG, 'arrayListForEachVisitsAll_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0220
     * @tc.name arrayListReplaceAllElements022
     * @tc.desc Verify ArrayList replaceAllElements rewrites every slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListReplaceAllElements_022', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListReplaceAllElements_022 begin');
      const list: ArrayList<string> = makeList();
      list.replaceAllElements((value: string): string => value.toUpperCase());
      const values: Array<string> = list.convertToArray();
      Logger.info(TAG, 'arrayListReplaceAllElements_022, check01=' + JSON.stringify(values[0]));
      expect(values[0]).assertEqual('A');
      Logger.info(TAG, 'arrayListReplaceAllElements_022, check02=' + JSON.stringify(values[2]));
      expect(values[2]).assertEqual('C');
      Logger.info(TAG, 'arrayListReplaceAllElements_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0230
     * @tc.name arrayListCloneIndependent023
     * @tc.desc Verify ArrayList a clone keeps the elements after the source is cleared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'arrayListCloneIndependent_023', 0, async (): Promise<void> => {
      Logger.info(TAG, 'arrayListCloneIndependent_023 begin');
      const list: ArrayList<string> = makeList();
      const copy: ArrayList<string> = list.clone();
      list.clear();
      Logger.info(TAG, 'arrayListCloneIndependent_023, check01=' + JSON.stringify(copy.length));
      expect(copy.length).assertEqual(3);
      Logger.info(TAG, 'arrayListCloneIndependent_023, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(0);
      Logger.info(TAG, 'arrayListCloneIndependent_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0240
     * @tc.name hashMapNewEmpty024
     * @tc.desc Verify a new HashMap starts empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapNewEmpty_024', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapNewEmpty_024 begin');
      const map: HashMap<string, number> = new HashMap<string, number>();
      Logger.info(TAG, 'hashMapNewEmpty_024, check01=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(0);
      Logger.info(TAG, 'hashMapNewEmpty_024, check02=' + JSON.stringify(map.isEmpty()));
      expect(map.isEmpty()).assertTrue();
      Logger.info(TAG, 'hashMapNewEmpty_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0250
     * @tc.name hashMapSetInserts025
     * @tc.desc Verify HashMap set stores a value under a new key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapSetInserts_025', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapSetInserts_025 begin');
      const map: HashMap<string, number> = new HashMap<string, number>();
      map.set('a', 1);
      Logger.info(TAG, 'hashMapSetInserts_025, check01=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(1);
      Logger.info(TAG, 'hashMapSetInserts_025, check02=' + JSON.stringify(map.get('a')));
      expect(map.get('a')).assertEqual(1);
      Logger.info(TAG, 'hashMapSetInserts_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0260
     * @tc.name hashMapGetExisting026
     * @tc.desc Verify HashMap get returns the value stored for an existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapGetExisting_026', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapGetExisting_026 begin');
      const map: HashMap<string, number> = makeMap();
      Logger.info(TAG, 'hashMapGetExisting_026, check01=' + JSON.stringify(map.get('b')));
      expect(map.get('b')).assertEqual(2);
      Logger.info(TAG, 'hashMapGetExisting_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0270
     * @tc.name hashMapHasKeyExisting027
     * @tc.desc Verify HashMap hasKey reports an existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapHasKeyExisting_027', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapHasKeyExisting_027 begin');
      const map: HashMap<string, number> = makeMap();
      Logger.info(TAG, 'hashMapHasKeyExisting_027, check01=' + JSON.stringify(map.hasKey('a')));
      expect(map.hasKey('a')).assertTrue();
      Logger.info(TAG, 'hashMapHasKeyExisting_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0280
     * @tc.name hashMapHasKeyMissing028
     * @tc.desc Verify HashMap hasKey reports false for an absent key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapHasKeyMissing_028', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapHasKeyMissing_028 begin');
      const map: HashMap<string, number> = makeMap();
      Logger.info(TAG, 'hashMapHasKeyMissing_028, check01=' + JSON.stringify(map.hasKey('z')));
      expect(map.hasKey('z')).assertFalse();
      Logger.info(TAG, 'hashMapHasKeyMissing_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0290
     * @tc.name hashMapHasValue029
     * @tc.desc Verify HashMap hasValue finds a stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapHasValue_029', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapHasValue_029 begin');
      const map: HashMap<string, number> = makeMap();
      Logger.info(TAG, 'hashMapHasValue_029, check01=' + JSON.stringify(map.hasValue(3)));
      expect(map.hasValue(3)).assertTrue();
      Logger.info(TAG, 'hashMapHasValue_029, check02=' + JSON.stringify(map.hasValue(9)));
      expect(map.hasValue(9)).assertFalse();
      Logger.info(TAG, 'hashMapHasValue_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0300
     * @tc.name hashMapReplaceExisting030
     * @tc.desc Verify HashMap replace updates an existing key and reports success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapReplaceExisting_030', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapReplaceExisting_030 begin');
      const map: HashMap<string, number> = makeMap();
      const replaced: boolean = map.replace('b', 20);
      Logger.info(TAG, 'hashMapReplaceExisting_030, check01=' + JSON.stringify(replaced));
      expect(replaced).assertTrue();
      Logger.info(TAG, 'hashMapReplaceExisting_030, check02=' + JSON.stringify(map.get('b')));
      expect(map.get('b')).assertEqual(20);
      Logger.info(TAG, 'hashMapReplaceExisting_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0310
     * @tc.name hashMapReplaceMissing031
     * @tc.desc Verify HashMap replace reports false for an absent key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapReplaceMissing_031', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapReplaceMissing_031 begin');
      const map: HashMap<string, number> = makeMap();
      const replaced: boolean = map.replace('z', 9);
      Logger.info(TAG, 'hashMapReplaceMissing_031, check01=' + JSON.stringify(replaced));
      expect(replaced).assertFalse();
      Logger.info(TAG, 'hashMapReplaceMissing_031, check02=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(3);
      Logger.info(TAG, 'hashMapReplaceMissing_031 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0320
     * @tc.name hashMapRemoveExisting032
     * @tc.desc Verify HashMap remove returns the old value and shrinks the map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapRemoveExisting_032', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapRemoveExisting_032 begin');
      const map: HashMap<string, number> = makeMap();
      const removed: number = map.remove('a');
      Logger.info(TAG, 'hashMapRemoveExisting_032, check01=' + JSON.stringify(removed));
      expect(removed).assertEqual(1);
      Logger.info(TAG, 'hashMapRemoveExisting_032, check02=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(2);
      Logger.info(TAG, 'hashMapRemoveExisting_032, check03=' + JSON.stringify(map.hasKey('a')));
      expect(map.hasKey('a')).assertFalse();
      Logger.info(TAG, 'hashMapRemoveExisting_032 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0330
     * @tc.name hashMapClearEmpties033
     * @tc.desc Verify HashMap clear drops every entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapClearEmpties_033', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapClearEmpties_033 begin');
      const map: HashMap<string, number> = makeMap();
      map.clear();
      Logger.info(TAG, 'hashMapClearEmpties_033, check01=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(0);
      Logger.info(TAG, 'hashMapClearEmpties_033, check02=' + JSON.stringify(map.isEmpty()));
      expect(map.isEmpty()).assertTrue();
      Logger.info(TAG, 'hashMapClearEmpties_033 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0340
     * @tc.name hashMapSetAllCopies034
     * @tc.desc Verify HashMap setAll copies every entry of another map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapSetAllCopies_034', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapSetAllCopies_034 begin');
      const source: HashMap<string, number> = makeMap();
      const target: HashMap<string, number> = new HashMap<string, number>();
      target.setAll(source);
      Logger.info(TAG, 'hashMapSetAllCopies_034, check01=' + JSON.stringify(target.length));
      expect(target.length).assertEqual(3);
      Logger.info(TAG, 'hashMapSetAllCopies_034, check02=' + JSON.stringify(target.get('c')));
      expect(target.get('c')).assertEqual(3);
      Logger.info(TAG, 'hashMapSetAllCopies_034 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0350
     * @tc.name hashMapForEachVisitsAll035
     * @tc.desc Verify HashMap forEach visits every entry exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashMapForEachVisitsAll_035', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashMapForEachVisitsAll_035 begin');
      const map: HashMap<string, number> = makeMap();
      let visits: number = 0;
      map.forEach((value: number): void => {
        visits++;
      });
      Logger.info(TAG, 'hashMapForEachVisitsAll_035, check01=' + JSON.stringify(visits));
      expect(visits).assertEqual(3);
      Logger.info(TAG, 'hashMapForEachVisitsAll_035 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0360
     * @tc.name hashSetNewEmpty036
     * @tc.desc Verify a new HashSet starts empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashSetNewEmpty_036', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashSetNewEmpty_036 begin');
      const set: HashSet<string> = new HashSet<string>();
      Logger.info(TAG, 'hashSetNewEmpty_036, check01=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(0);
      Logger.info(TAG, 'hashSetNewEmpty_036, check02=' + JSON.stringify(set.isEmpty()));
      expect(set.isEmpty()).assertTrue();
      Logger.info(TAG, 'hashSetNewEmpty_036 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0370
     * @tc.name hashSetAddNew037
     * @tc.desc Verify HashSet add stores a new value and reports success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashSetAddNew_037', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashSetAddNew_037 begin');
      const set: HashSet<string> = new HashSet<string>();
      const added: boolean = set.add('a');
      Logger.info(TAG, 'hashSetAddNew_037, check01=' + JSON.stringify(added));
      expect(added).assertTrue();
      Logger.info(TAG, 'hashSetAddNew_037, check02=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(1);
      Logger.info(TAG, 'hashSetAddNew_037 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0380
     * @tc.name hashSetAddDuplicate038
     * @tc.desc Verify HashSet adding the same value twice keeps a single entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashSetAddDuplicate_038', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashSetAddDuplicate_038 begin');
      const set: HashSet<string> = new HashSet<string>();
      set.add('a');
      set.add('a');
      Logger.info(TAG, 'hashSetAddDuplicate_038, check01=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(1);
      Logger.info(TAG, 'hashSetAddDuplicate_038, check02=' + JSON.stringify(set.has('a')));
      expect(set.has('a')).assertTrue();
      Logger.info(TAG, 'hashSetAddDuplicate_038 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0390
     * @tc.name hashSetHasExisting039
     * @tc.desc Verify HashSet has reports a stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashSetHasExisting_039', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashSetHasExisting_039 begin');
      const set: HashSet<string> = makeSet();
      Logger.info(TAG, 'hashSetHasExisting_039, check01=' + JSON.stringify(set.has('b')));
      expect(set.has('b')).assertTrue();
      Logger.info(TAG, 'hashSetHasExisting_039 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0400
     * @tc.name hashSetHasMissing040
     * @tc.desc Verify HashSet has reports false for an absent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashSetHasMissing_040', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashSetHasMissing_040 begin');
      const set: HashSet<string> = makeSet();
      Logger.info(TAG, 'hashSetHasMissing_040, check01=' + JSON.stringify(set.has('z')));
      expect(set.has('z')).assertFalse();
      Logger.info(TAG, 'hashSetHasMissing_040 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0410
     * @tc.name hashSetRemoveExisting041
     * @tc.desc Verify HashSet remove reports success and drops the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashSetRemoveExisting_041', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashSetRemoveExisting_041 begin');
      const set: HashSet<string> = makeSet();
      const removed: boolean = set.remove('a');
      Logger.info(TAG, 'hashSetRemoveExisting_041, check01=' + JSON.stringify(removed));
      expect(removed).assertTrue();
      Logger.info(TAG, 'hashSetRemoveExisting_041, check02=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(2);
      Logger.info(TAG, 'hashSetRemoveExisting_041 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0420
     * @tc.name hashSetRemoveMissing042
     * @tc.desc Verify HashSet remove reports false for an absent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashSetRemoveMissing_042', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashSetRemoveMissing_042 begin');
      const set: HashSet<string> = makeSet();
      const removed: boolean = set.remove('z');
      Logger.info(TAG, 'hashSetRemoveMissing_042, check01=' + JSON.stringify(removed));
      expect(removed).assertFalse();
      Logger.info(TAG, 'hashSetRemoveMissing_042, check02=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(3);
      Logger.info(TAG, 'hashSetRemoveMissing_042 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0430
     * @tc.name hashSetClearEmpties043
     * @tc.desc Verify HashSet clear drops every value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashSetClearEmpties_043', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashSetClearEmpties_043 begin');
      const set: HashSet<string> = makeSet();
      set.clear();
      Logger.info(TAG, 'hashSetClearEmpties_043, check01=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(0);
      Logger.info(TAG, 'hashSetClearEmpties_043, check02=' + JSON.stringify(set.isEmpty()));
      expect(set.isEmpty()).assertTrue();
      Logger.info(TAG, 'hashSetClearEmpties_043 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0440
     * @tc.name hashSetForEachVisitsAll044
     * @tc.desc Verify HashSet forEach visits every value exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'hashSetForEachVisitsAll_044', 0, async (): Promise<void> => {
      Logger.info(TAG, 'hashSetForEachVisitsAll_044 begin');
      const set: HashSet<string> = makeSet();
      let visits: number = 0;
      set.forEach((value: string): void => {
        visits++;
      });
      Logger.info(TAG, 'hashSetForEachVisitsAll_044, check01=' + JSON.stringify(visits));
      expect(visits).assertEqual(3);
      Logger.info(TAG, 'hashSetForEachVisitsAll_044 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0450
     * @tc.name dequeInsertFrontOrder045
     * @tc.desc Verify Deque insertFront puts the newest element at the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'dequeInsertFrontOrder_045', 0, async (): Promise<void> => {
      Logger.info(TAG, 'dequeInsertFrontOrder_045 begin');
      const deque: Deque<string> = new Deque<string>();
      deque.insertFront('a');
      deque.insertFront('b');
      Logger.info(TAG, 'dequeInsertFrontOrder_045, check01=' + JSON.stringify(deque.getFirst()));
      expect(deque.getFirst()).assertEqual('b');
      Logger.info(TAG, 'dequeInsertFrontOrder_045, check02=' + JSON.stringify(deque.length));
      expect(deque.length).assertEqual(2);
      Logger.info(TAG, 'dequeInsertFrontOrder_045 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0460
     * @tc.name dequeInsertEndOrder046
     * @tc.desc Verify Deque insertEnd puts the newest element at the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'dequeInsertEndOrder_046', 0, async (): Promise<void> => {
      Logger.info(TAG, 'dequeInsertEndOrder_046 begin');
      const deque: Deque<string> = new Deque<string>();
      deque.insertEnd('a');
      deque.insertEnd('b');
      Logger.info(TAG, 'dequeInsertEndOrder_046, check01=' + JSON.stringify(deque.getLast()));
      expect(deque.getLast()).assertEqual('b');
      Logger.info(TAG, 'dequeInsertEndOrder_046, check02=' + JSON.stringify(deque.length));
      expect(deque.length).assertEqual(2);
      Logger.info(TAG, 'dequeInsertEndOrder_046 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0470
     * @tc.name dequeGetFirst047
     * @tc.desc Verify Deque getFirst returns the head without removing it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'dequeGetFirst_047', 0, async (): Promise<void> => {
      Logger.info(TAG, 'dequeGetFirst_047 begin');
      const deque: Deque<string> = makeDeque();
      Logger.info(TAG, 'dequeGetFirst_047, check01=' + JSON.stringify(deque.getFirst()));
      expect(deque.getFirst()).assertEqual('a');
      Logger.info(TAG, 'dequeGetFirst_047, check02=' + JSON.stringify(deque.length));
      expect(deque.length).assertEqual(3);
      Logger.info(TAG, 'dequeGetFirst_047 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0480
     * @tc.name dequeGetLast048
     * @tc.desc Verify Deque getLast returns the tail without removing it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'dequeGetLast_048', 0, async (): Promise<void> => {
      Logger.info(TAG, 'dequeGetLast_048 begin');
      const deque: Deque<string> = makeDeque();
      Logger.info(TAG, 'dequeGetLast_048, check01=' + JSON.stringify(deque.getLast()));
      expect(deque.getLast()).assertEqual('c');
      Logger.info(TAG, 'dequeGetLast_048, check02=' + JSON.stringify(deque.length));
      expect(deque.length).assertEqual(3);
      Logger.info(TAG, 'dequeGetLast_048 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0490
     * @tc.name dequePopFirst049
     * @tc.desc Verify Deque popFirst removes and returns the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'dequePopFirst_049', 0, async (): Promise<void> => {
      Logger.info(TAG, 'dequePopFirst_049 begin');
      const deque: Deque<string> = makeDeque();
      const value: string = deque.popFirst();
      Logger.info(TAG, 'dequePopFirst_049, check01=' + JSON.stringify(value));
      expect(value).assertEqual('a');
      Logger.info(TAG, 'dequePopFirst_049, check02=' + JSON.stringify(deque.getFirst()));
      expect(deque.getFirst()).assertEqual('b');
      Logger.info(TAG, 'dequePopFirst_049, check03=' + JSON.stringify(deque.length));
      expect(deque.length).assertEqual(2);
      Logger.info(TAG, 'dequePopFirst_049 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0500
     * @tc.name dequePopLast050
     * @tc.desc Verify Deque popLast removes and returns the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'dequePopLast_050', 0, async (): Promise<void> => {
      Logger.info(TAG, 'dequePopLast_050 begin');
      const deque: Deque<string> = makeDeque();
      const value: string = deque.popLast();
      Logger.info(TAG, 'dequePopLast_050, check01=' + JSON.stringify(value));
      expect(value).assertEqual('c');
      Logger.info(TAG, 'dequePopLast_050, check02=' + JSON.stringify(deque.getLast()));
      expect(deque.getLast()).assertEqual('b');
      Logger.info(TAG, 'dequePopLast_050, check03=' + JSON.stringify(deque.length));
      expect(deque.length).assertEqual(2);
      Logger.info(TAG, 'dequePopLast_050 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0510
     * @tc.name dequeHasElement051
     * @tc.desc Verify Deque has distinguishes present and absent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'dequeHasElement_051', 0, async (): Promise<void> => {
      Logger.info(TAG, 'dequeHasElement_051 begin');
      const deque: Deque<string> = makeDeque();
      Logger.info(TAG, 'dequeHasElement_051, check01=' + JSON.stringify(deque.has('b')));
      expect(deque.has('b')).assertTrue();
      Logger.info(TAG, 'dequeHasElement_051, check02=' + JSON.stringify(deque.has('z')));
      expect(deque.has('z')).assertFalse();
      Logger.info(TAG, 'dequeHasElement_051 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0520
     * @tc.name dequeForEachVisitsAll052
     * @tc.desc Verify Deque forEach visits every element exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'dequeForEachVisitsAll_052', 0, async (): Promise<void> => {
      Logger.info(TAG, 'dequeForEachVisitsAll_052 begin');
      const deque: Deque<string> = makeDeque();
      let visits: number = 0;
      deque.forEach((value: string): void => {
        visits++;
      });
      Logger.info(TAG, 'dequeForEachVisitsAll_052, check01=' + JSON.stringify(visits));
      expect(visits).assertEqual(3);
      Logger.info(TAG, 'dequeForEachVisitsAll_052 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0530
     * @tc.name stackNewEmpty053
     * @tc.desc Verify a new Stack starts empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stackNewEmpty_053', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stackNewEmpty_053 begin');
      const stack: Stack<string> = new Stack<string>();
      Logger.info(TAG, 'stackNewEmpty_053, check01=' + JSON.stringify(stack.length));
      expect(stack.length).assertEqual(0);
      Logger.info(TAG, 'stackNewEmpty_053, check02=' + JSON.stringify(stack.isEmpty()));
      expect(stack.isEmpty()).assertTrue();
      Logger.info(TAG, 'stackNewEmpty_053 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0540
     * @tc.name stackPushReturnsItem054
     * @tc.desc Verify Stack push stores and returns the pushed item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stackPushReturnsItem_054', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stackPushReturnsItem_054 begin');
      const stack: Stack<string> = new Stack<string>();
      const pushed: string = stack.push('a');
      Logger.info(TAG, 'stackPushReturnsItem_054, check01=' + JSON.stringify(pushed));
      expect(pushed).assertEqual('a');
      Logger.info(TAG, 'stackPushReturnsItem_054, check02=' + JSON.stringify(stack.length));
      expect(stack.length).assertEqual(1);
      Logger.info(TAG, 'stackPushReturnsItem_054 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0550
     * @tc.name stackPeekTop055
     * @tc.desc Verify Stack peek returns the top without removing it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stackPeekTop_055', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stackPeekTop_055 begin');
      const stack: Stack<string> = makeStack();
      Logger.info(TAG, 'stackPeekTop_055, check01=' + JSON.stringify(stack.peek()));
      expect(stack.peek()).assertEqual('c');
      Logger.info(TAG, 'stackPeekTop_055, check02=' + JSON.stringify(stack.length));
      expect(stack.length).assertEqual(3);
      Logger.info(TAG, 'stackPeekTop_055 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0560
     * @tc.name stackPopTop056
     * @tc.desc Verify Stack pop removes and returns the top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stackPopTop_056', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stackPopTop_056 begin');
      const stack: Stack<string> = makeStack();
      const value: string = stack.pop();
      Logger.info(TAG, 'stackPopTop_056, check01=' + JSON.stringify(value));
      expect(value).assertEqual('c');
      Logger.info(TAG, 'stackPopTop_056, check02=' + JSON.stringify(stack.peek()));
      expect(stack.peek()).assertEqual('b');
      Logger.info(TAG, 'stackPopTop_056, check03=' + JSON.stringify(stack.length));
      expect(stack.length).assertEqual(2);
      Logger.info(TAG, 'stackPopTop_056 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0570
     * @tc.name stackPopEmpties057
     * @tc.desc Verify Stack pop empties the stack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stackPopEmpties_057', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stackPopEmpties_057 begin');
      const stack: Stack<string> = makeStack();
      stack.pop();
      stack.pop();
      stack.pop();
      Logger.info(TAG, 'stackPopEmpties_057, check01=' + JSON.stringify(stack.length));
      expect(stack.length).assertEqual(0);
      Logger.info(TAG, 'stackPopEmpties_057, check02=' + JSON.stringify(stack.isEmpty()));
      expect(stack.isEmpty()).assertTrue();
      Logger.info(TAG, 'stackPopEmpties_057 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0580
     * @tc.name stackForEachVisitsAll058
     * @tc.desc Verify Stack forEach visits every element exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stackForEachVisitsAll_058', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stackForEachVisitsAll_058 begin');
      const stack: Stack<string> = makeStack();
      let visits: number = 0;
      stack.forEach((value: string): void => {
        visits++;
      });
      Logger.info(TAG, 'stackForEachVisitsAll_058, check01=' + JSON.stringify(visits));
      expect(visits).assertEqual(3);
      Logger.info(TAG, 'stackForEachVisitsAll_058 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0590
     * @tc.name queueNewEmpty059
     * @tc.desc Verify a new Queue starts empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'queueNewEmpty_059', 0, async (): Promise<void> => {
      Logger.info(TAG, 'queueNewEmpty_059 begin');
      const queue: Queue<string> = new Queue<string>();
      Logger.info(TAG, 'queueNewEmpty_059, check01=' + JSON.stringify(queue.length));
      expect(queue.length).assertEqual(0);
      Logger.info(TAG, 'queueNewEmpty_059, check02=' + JSON.stringify(queue.length === 0));
      expect(queue.length === 0).assertTrue();
      Logger.info(TAG, 'queueNewEmpty_059 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0600
     * @tc.name queueAddElement060
     * @tc.desc Verify Queue add appends an element and reports success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'queueAddElement_060', 0, async (): Promise<void> => {
      Logger.info(TAG, 'queueAddElement_060 begin');
      const queue: Queue<string> = new Queue<string>();
      const added: boolean = queue.add('a');
      Logger.info(TAG, 'queueAddElement_060, check01=' + JSON.stringify(added));
      expect(added).assertTrue();
      Logger.info(TAG, 'queueAddElement_060, check02=' + JSON.stringify(queue.length));
      expect(queue.length).assertEqual(1);
      Logger.info(TAG, 'queueAddElement_060 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0610
     * @tc.name queueGetFirst061
     * @tc.desc Verify Queue getFirst returns the head without removing it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'queueGetFirst_061', 0, async (): Promise<void> => {
      Logger.info(TAG, 'queueGetFirst_061 begin');
      const queue: Queue<string> = makeQueue();
      Logger.info(TAG, 'queueGetFirst_061, check01=' + JSON.stringify(queue.getFirst()));
      expect(queue.getFirst()).assertEqual('a');
      Logger.info(TAG, 'queueGetFirst_061, check02=' + JSON.stringify(queue.length));
      expect(queue.length).assertEqual(3);
      Logger.info(TAG, 'queueGetFirst_061 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0620
     * @tc.name queuePopFirst062
     * @tc.desc Verify Queue pop removes and returns the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'queuePopFirst_062', 0, async (): Promise<void> => {
      Logger.info(TAG, 'queuePopFirst_062 begin');
      const queue: Queue<string> = makeQueue();
      const value: string = queue.pop();
      Logger.info(TAG, 'queuePopFirst_062, check01=' + JSON.stringify(value));
      expect(value).assertEqual('a');
      Logger.info(TAG, 'queuePopFirst_062, check02=' + JSON.stringify(queue.getFirst()));
      expect(queue.getFirst()).assertEqual('b');
      Logger.info(TAG, 'queuePopFirst_062, check03=' + JSON.stringify(queue.length));
      expect(queue.length).assertEqual(2);
      Logger.info(TAG, 'queuePopFirst_062 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0630
     * @tc.name queueForEachVisitsAll063
     * @tc.desc Verify Queue forEach visits every element exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'queueForEachVisitsAll_063', 0, async (): Promise<void> => {
      Logger.info(TAG, 'queueForEachVisitsAll_063 begin');
      const queue: Queue<string> = makeQueue();
      let visits: number = 0;
      queue.forEach((value: string): void => {
        visits++;
      });
      Logger.info(TAG, 'queueForEachVisitsAll_063, check01=' + JSON.stringify(visits));
      expect(visits).assertEqual(3);
      Logger.info(TAG, 'queueForEachVisitsAll_063 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0640
     * @tc.name linkedListNewEmpty064
     * @tc.desc Verify a new LinkedList starts empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListNewEmpty_064', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListNewEmpty_064 begin');
      const list: LinkedList<string> = new LinkedList<string>();
      Logger.info(TAG, 'linkedListNewEmpty_064, check01=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(0);
      Logger.info(TAG, 'linkedListNewEmpty_064, check02=' + JSON.stringify(list.length === 0));
      expect(list.length === 0).assertTrue();
      Logger.info(TAG, 'linkedListNewEmpty_064 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0650
     * @tc.name linkedListAddAppends065
     * @tc.desc Verify LinkedList add appends to the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListAddAppends_065', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListAddAppends_065 begin');
      const list: LinkedList<string> = new LinkedList<string>();
      list.add('a');
      list.add('b');
      Logger.info(TAG, 'linkedListAddAppends_065, check01=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(2);
      Logger.info(TAG, 'linkedListAddAppends_065, check02=' + JSON.stringify(list.getLast()));
      expect(list.getLast()).assertEqual('b');
      Logger.info(TAG, 'linkedListAddAppends_065 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0660
     * @tc.name linkedListAddFirst066
     * @tc.desc Verify LinkedList addFirst puts the element at the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListAddFirst_066', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListAddFirst_066 begin');
      const list: LinkedList<string> = makeLinkedList();
      list.addFirst('z');
      Logger.info(TAG, 'linkedListAddFirst_066, check01=' + JSON.stringify(list.getFirst()));
      expect(list.getFirst()).assertEqual('z');
      Logger.info(TAG, 'linkedListAddFirst_066, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(4);
      Logger.info(TAG, 'linkedListAddFirst_066 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0670
     * @tc.name linkedListGetByIndex067
     * @tc.desc Verify LinkedList get returns the element at a valid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListGetByIndex_067', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListGetByIndex_067 begin');
      const list: LinkedList<string> = makeLinkedList();
      Logger.info(TAG, 'linkedListGetByIndex_067, check01=' + JSON.stringify(list.get(1)));
      expect(list.get(1)).assertEqual('b');
      Logger.info(TAG, 'linkedListGetByIndex_067 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0680
     * @tc.name linkedListInsertAt068
     * @tc.desc Verify LinkedList insert puts an element at the requested index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListInsertAt_068', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListInsertAt_068 begin');
      const list: LinkedList<string> = makeLinkedList();
      list.insert(1, 'x');
      Logger.info(TAG, 'linkedListInsertAt_068, check01=' + JSON.stringify(list.get(1)));
      expect(list.get(1)).assertEqual('x');
      Logger.info(TAG, 'linkedListInsertAt_068, check02=' + JSON.stringify(list.get(2)));
      expect(list.get(2)).assertEqual('b');
      Logger.info(TAG, 'linkedListInsertAt_068, check03=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(4);
      Logger.info(TAG, 'linkedListInsertAt_068 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0690
     * @tc.name linkedListSetReplacesSlot069
     * @tc.desc Verify LinkedList set overwrites the element at a slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListSetReplacesSlot_069', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListSetReplacesSlot_069 begin');
      const list: LinkedList<string> = makeLinkedList();
      list.set(1, 'x');
      Logger.info(TAG, 'linkedListSetReplacesSlot_069, check01=' + JSON.stringify(list.get(1)));
      expect(list.get(1)).assertEqual('x');
      Logger.info(TAG, 'linkedListSetReplacesSlot_069, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(3);
      Logger.info(TAG, 'linkedListSetReplacesSlot_069 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0700
     * @tc.name linkedListGetFirst070
     * @tc.desc Verify LinkedList getFirst returns the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListGetFirst_070', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListGetFirst_070 begin');
      const list: LinkedList<string> = makeLinkedList();
      Logger.info(TAG, 'linkedListGetFirst_070, check01=' + JSON.stringify(list.getFirst()));
      expect(list.getFirst()).assertEqual('a');
      Logger.info(TAG, 'linkedListGetFirst_070 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0710
     * @tc.name linkedListGetLast071
     * @tc.desc Verify LinkedList getLast returns the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListGetLast_071', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListGetLast_071 begin');
      const list: LinkedList<string> = makeLinkedList();
      Logger.info(TAG, 'linkedListGetLast_071, check01=' + JSON.stringify(list.getLast()));
      expect(list.getLast()).assertEqual('c');
      Logger.info(TAG, 'linkedListGetLast_071 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0720
     * @tc.name linkedListIndexOf072
     * @tc.desc Verify LinkedList getIndexOf returns the first slot of a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListIndexOf_072', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListIndexOf_072 begin');
      const list: LinkedList<string> = makeLinkedList();
      Logger.info(TAG, 'linkedListIndexOf_072, check01=' + JSON.stringify(list.getIndexOf('b')));
      expect(list.getIndexOf('b')).assertEqual(1);
      Logger.info(TAG, 'linkedListIndexOf_072, check02=' + JSON.stringify(list.getIndexOf('z')));
      expect(list.getIndexOf('z')).assertEqual(-1);
      Logger.info(TAG, 'linkedListIndexOf_072 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0730
     * @tc.name linkedListLastIndexOfDuplicate073
     * @tc.desc Verify LinkedList getLastIndexOf returns the later slot of a duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListLastIndexOfDuplicate_073', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListLastIndexOfDuplicate_073 begin');
      const list: LinkedList<string> = new LinkedList<string>();
      list.add('a');
      list.add('b');
      list.add('a');
      Logger.info(TAG, 'linkedListLastIndexOfDuplicate_073, check01=' + JSON.stringify(list.getLastIndexOf('a')));
      expect(list.getLastIndexOf('a')).assertEqual(2);
      Logger.info(TAG, 'linkedListLastIndexOfDuplicate_073, check02=' + JSON.stringify(list.getIndexOf('a')));
      expect(list.getIndexOf('a')).assertEqual(0);
      Logger.info(TAG, 'linkedListLastIndexOfDuplicate_073 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0740
     * @tc.name linkedListRemoveByIndex074
     * @tc.desc Verify LinkedList removeByIndex returns the removed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListRemoveByIndex_074', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListRemoveByIndex_074 begin');
      const list: LinkedList<string> = makeLinkedList();
      const removed: string = list.removeByIndex(1);
      Logger.info(TAG, 'linkedListRemoveByIndex_074, check01=' + JSON.stringify(removed));
      expect(removed).assertEqual('b');
      Logger.info(TAG, 'linkedListRemoveByIndex_074, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(2);
      Logger.info(TAG, 'linkedListRemoveByIndex_074 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0750
     * @tc.name linkedListRemoveElement075
     * @tc.desc Verify LinkedList remove by value reports success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListRemoveElement_075', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListRemoveElement_075 begin');
      const list: LinkedList<string> = makeLinkedList();
      const removed: boolean = list.remove('b');
      Logger.info(TAG, 'linkedListRemoveElement_075, check01=' + JSON.stringify(removed));
      expect(removed).assertTrue();
      Logger.info(TAG, 'linkedListRemoveElement_075, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(2);
      Logger.info(TAG, 'linkedListRemoveElement_075 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0760
     * @tc.name linkedListRemoveFirst076
     * @tc.desc Verify LinkedList removeFirst returns and drops the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListRemoveFirst_076', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListRemoveFirst_076 begin');
      const list: LinkedList<string> = makeLinkedList();
      const removed: string = list.removeFirst();
      Logger.info(TAG, 'linkedListRemoveFirst_076, check01=' + JSON.stringify(removed));
      expect(removed).assertEqual('a');
      Logger.info(TAG, 'linkedListRemoveFirst_076, check02=' + JSON.stringify(list.getFirst()));
      expect(list.getFirst()).assertEqual('b');
      Logger.info(TAG, 'linkedListRemoveFirst_076 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0770
     * @tc.name linkedListRemoveLast077
     * @tc.desc Verify LinkedList removeLast returns and drops the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListRemoveLast_077', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListRemoveLast_077 begin');
      const list: LinkedList<string> = makeLinkedList();
      const removed: string = list.removeLast();
      Logger.info(TAG, 'linkedListRemoveLast_077, check01=' + JSON.stringify(removed));
      expect(removed).assertEqual('c');
      Logger.info(TAG, 'linkedListRemoveLast_077, check02=' + JSON.stringify(list.getLast()));
      expect(list.getLast()).assertEqual('b');
      Logger.info(TAG, 'linkedListRemoveLast_077 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0780
     * @tc.name linkedListRemoveFirstFound078
     * @tc.desc Verify LinkedList removeFirstFound drops the first matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListRemoveFirstFound_078', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListRemoveFirstFound_078 begin');
      const list: LinkedList<string> = new LinkedList<string>();
      list.add('a');
      list.add('b');
      list.add('a');
      const removed: boolean = list.removeFirstFound('a');
      Logger.info(TAG, 'linkedListRemoveFirstFound_078, check01=' + JSON.stringify(removed));
      expect(removed).assertTrue();
      Logger.info(TAG, 'linkedListRemoveFirstFound_078, check02=' + JSON.stringify(list.getLastIndexOf('a')));
      expect(list.getLastIndexOf('a')).assertEqual(1);
      Logger.info(TAG, 'linkedListRemoveFirstFound_078, check03=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(2);
      Logger.info(TAG, 'linkedListRemoveFirstFound_078 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0790
     * @tc.name linkedListRemoveLastFound079
     * @tc.desc Verify LinkedList removeLastFound drops the last matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListRemoveLastFound_079', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListRemoveLastFound_079 begin');
      const list: LinkedList<string> = new LinkedList<string>();
      list.add('a');
      list.add('b');
      list.add('a');
      const removed: boolean = list.removeLastFound('a');
      Logger.info(TAG, 'linkedListRemoveLastFound_079, check01=' + JSON.stringify(removed));
      expect(removed).assertTrue();
      Logger.info(TAG, 'linkedListRemoveLastFound_079, check02=' + JSON.stringify(list.getLastIndexOf('a')));
      expect(list.getLastIndexOf('a')).assertEqual(0);
      Logger.info(TAG, 'linkedListRemoveLastFound_079, check03=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(2);
      Logger.info(TAG, 'linkedListRemoveLastFound_079 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0800
     * @tc.name linkedListClearEmpties080
     * @tc.desc Verify LinkedList clear drops every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListClearEmpties_080', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListClearEmpties_080 begin');
      const list: LinkedList<string> = makeLinkedList();
      list.clear();
      Logger.info(TAG, 'linkedListClearEmpties_080, check01=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(0);
      Logger.info(TAG, 'linkedListClearEmpties_080, check02=' + JSON.stringify(list.length === 0));
      expect(list.length === 0).assertTrue();
      Logger.info(TAG, 'linkedListClearEmpties_080 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0810
     * @tc.name linkedListConvertToArray081
     * @tc.desc Verify LinkedList convertToArray keeps list order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'linkedListConvertToArray_081', 0, async (): Promise<void> => {
      Logger.info(TAG, 'linkedListConvertToArray_081 begin');
      const list: LinkedList<string> = makeLinkedList();
      const values: Array<string> = list.convertToArray();
      Logger.info(TAG, 'linkedListConvertToArray_081, check01=' + JSON.stringify(values.length));
      expect(values.length).assertEqual(3);
      Logger.info(TAG, 'linkedListConvertToArray_081, check02=' + JSON.stringify(values[0]));
      expect(values[0]).assertEqual('a');
      Logger.info(TAG, 'linkedListConvertToArray_081, check03=' + JSON.stringify(values[2]));
      expect(values[2]).assertEqual('c');
      Logger.info(TAG, 'linkedListConvertToArray_081 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0820
     * @tc.name treeMapSetGet082
     * @tc.desc Verify TreeMap set and get exchange a value under an ordered key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeMapSetGet_082', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeMapSetGet_082 begin');
      const map: TreeMap<string, number> = new TreeMap<string, number>();
      map.set('a', 1);
      Logger.info(TAG, 'treeMapSetGet_082, check01=' + JSON.stringify(map.get('a')));
      expect(map.get('a')).assertEqual(1);
      Logger.info(TAG, 'treeMapSetGet_082, check02=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(1);
      Logger.info(TAG, 'treeMapSetGet_082 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0830
     * @tc.name treeMapFirstKey083
     * @tc.desc Verify TreeMap getFirstKey returns the smallest key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeMapFirstKey_083', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeMapFirstKey_083 begin');
      const map: TreeMap<string, number> = makeTreeMap();
      Logger.info(TAG, 'treeMapFirstKey_083, check01=' + JSON.stringify(map.getFirstKey()));
      expect(map.getFirstKey()).assertEqual('a');
      Logger.info(TAG, 'treeMapFirstKey_083 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0840
     * @tc.name treeMapLastKey084
     * @tc.desc Verify TreeMap getLastKey returns the largest key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeMapLastKey_084', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeMapLastKey_084 begin');
      const map: TreeMap<string, number> = makeTreeMap();
      Logger.info(TAG, 'treeMapLastKey_084, check01=' + JSON.stringify(map.getLastKey()));
      expect(map.getLastKey()).assertEqual('c');
      Logger.info(TAG, 'treeMapLastKey_084 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0850
     * @tc.name treeMapLowerKey085
     * @tc.desc Verify TreeMap getLowerKey returns the key just below the probe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeMapLowerKey_085', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeMapLowerKey_085 begin');
      const map: TreeMap<string, number> = makeTreeMap();
      Logger.info(TAG, 'treeMapLowerKey_085, check01=' + JSON.stringify(map.getLowerKey('b')));
      expect(map.getLowerKey('b')).assertEqual('a');
      Logger.info(TAG, 'treeMapLowerKey_085 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0860
     * @tc.name treeMapHigherKey086
     * @tc.desc Verify TreeMap getHigherKey returns the key just above the probe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeMapHigherKey_086', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeMapHigherKey_086 begin');
      const map: TreeMap<string, number> = makeTreeMap();
      Logger.info(TAG, 'treeMapHigherKey_086, check01=' + JSON.stringify(map.getHigherKey('b')));
      expect(map.getHigherKey('b')).assertEqual('c');
      Logger.info(TAG, 'treeMapHigherKey_086 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0870
     * @tc.name treeMapHasKeyMissing087
     * @tc.desc Verify TreeMap hasKey reports false for an absent key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeMapHasKeyMissing_087', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeMapHasKeyMissing_087 begin');
      const map: TreeMap<string, number> = makeTreeMap();
      Logger.info(TAG, 'treeMapHasKeyMissing_087, check01=' + JSON.stringify(map.hasKey('z')));
      expect(map.hasKey('z')).assertFalse();
      Logger.info(TAG, 'treeMapHasKeyMissing_087 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0880
     * @tc.name treeMapReplaceExisting088
     * @tc.desc Verify TreeMap replace updates an existing key and reports success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeMapReplaceExisting_088', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeMapReplaceExisting_088 begin');
      const map: TreeMap<string, number> = makeTreeMap();
      const replaced: boolean = map.replace('b', 20);
      Logger.info(TAG, 'treeMapReplaceExisting_088, check01=' + JSON.stringify(replaced));
      expect(replaced).assertTrue();
      Logger.info(TAG, 'treeMapReplaceExisting_088, check02=' + JSON.stringify(map.get('b')));
      expect(map.get('b')).assertEqual(20);
      Logger.info(TAG, 'treeMapReplaceExisting_088 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0890
     * @tc.name treeMapRemoveExisting089
     * @tc.desc Verify TreeMap remove returns the old value and shrinks the map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeMapRemoveExisting_089', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeMapRemoveExisting_089 begin');
      const map: TreeMap<string, number> = makeTreeMap();
      const removed: number = map.remove('b');
      Logger.info(TAG, 'treeMapRemoveExisting_089, check01=' + JSON.stringify(removed));
      expect(removed).assertEqual(2);
      Logger.info(TAG, 'treeMapRemoveExisting_089, check02=' + JSON.stringify(map.hasKey('b')));
      expect(map.hasKey('b')).assertFalse();
      Logger.info(TAG, 'treeMapRemoveExisting_089, check03=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(2);
      Logger.info(TAG, 'treeMapRemoveExisting_089 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0900
     * @tc.name treeMapClearEmpties090
     * @tc.desc Verify TreeMap clear drops every entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeMapClearEmpties_090', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeMapClearEmpties_090 begin');
      const map: TreeMap<string, number> = makeTreeMap();
      map.clear();
      Logger.info(TAG, 'treeMapClearEmpties_090, check01=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(0);
      Logger.info(TAG, 'treeMapClearEmpties_090, check02=' + JSON.stringify(map.isEmpty()));
      expect(map.isEmpty()).assertTrue();
      Logger.info(TAG, 'treeMapClearEmpties_090 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0910
     * @tc.name treeSetAddNew091
     * @tc.desc Verify TreeSet add stores a new ordered value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeSetAddNew_091', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeSetAddNew_091 begin');
      const set: TreeSet<string> = new TreeSet<string>();
      const added: boolean = set.add('b');
      Logger.info(TAG, 'treeSetAddNew_091, check01=' + JSON.stringify(added));
      expect(added).assertTrue();
      Logger.info(TAG, 'treeSetAddNew_091, check02=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(1);
      Logger.info(TAG, 'treeSetAddNew_091 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0920
     * @tc.name treeSetAddDuplicate092
     * @tc.desc Verify TreeSet adding a duplicate keeps one value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeSetAddDuplicate_092', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeSetAddDuplicate_092 begin');
      const set: TreeSet<string> = new TreeSet<string>();
      set.add('a');
      set.add('a');
      Logger.info(TAG, 'treeSetAddDuplicate_092, check01=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(1);
      Logger.info(TAG, 'treeSetAddDuplicate_092, check02=' + JSON.stringify(set.has('a')));
      expect(set.has('a')).assertTrue();
      Logger.info(TAG, 'treeSetAddDuplicate_092 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0930
     * @tc.name treeSetFirstValue093
     * @tc.desc Verify TreeSet getFirstValue returns the smallest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeSetFirstValue_093', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeSetFirstValue_093 begin');
      const set: TreeSet<string> = makeTreeSet();
      Logger.info(TAG, 'treeSetFirstValue_093, check01=' + JSON.stringify(set.getFirstValue()));
      expect(set.getFirstValue()).assertEqual('a');
      Logger.info(TAG, 'treeSetFirstValue_093 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0940
     * @tc.name treeSetLastValue094
     * @tc.desc Verify TreeSet getLastValue returns the largest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeSetLastValue_094', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeSetLastValue_094 begin');
      const set: TreeSet<string> = makeTreeSet();
      Logger.info(TAG, 'treeSetLastValue_094, check01=' + JSON.stringify(set.getLastValue()));
      expect(set.getLastValue()).assertEqual('c');
      Logger.info(TAG, 'treeSetLastValue_094 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0950
     * @tc.name treeSetLowerValue095
     * @tc.desc Verify TreeSet getLowerValue returns the value just below the probe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeSetLowerValue_095', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeSetLowerValue_095 begin');
      const set: TreeSet<string> = makeTreeSet();
      Logger.info(TAG, 'treeSetLowerValue_095, check01=' + JSON.stringify(set.getLowerValue('b')));
      expect(set.getLowerValue('b')).assertEqual('a');
      Logger.info(TAG, 'treeSetLowerValue_095 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0960
     * @tc.name treeSetHigherValue096
     * @tc.desc Verify TreeSet getHigherValue returns the value just above the probe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeSetHigherValue_096', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeSetHigherValue_096 begin');
      const set: TreeSet<string> = makeTreeSet();
      Logger.info(TAG, 'treeSetHigherValue_096, check01=' + JSON.stringify(set.getHigherValue('b')));
      expect(set.getHigherValue('b')).assertEqual('c');
      Logger.info(TAG, 'treeSetHigherValue_096 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0970
     * @tc.name treeSetRemoveExisting097
     * @tc.desc Verify TreeSet remove reports success and drops the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeSetRemoveExisting_097', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeSetRemoveExisting_097 begin');
      const set: TreeSet<string> = makeTreeSet();
      const removed: boolean = set.remove('b');
      Logger.info(TAG, 'treeSetRemoveExisting_097, check01=' + JSON.stringify(removed));
      expect(removed).assertTrue();
      Logger.info(TAG, 'treeSetRemoveExisting_097, check02=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(2);
      Logger.info(TAG, 'treeSetRemoveExisting_097, check03=' + JSON.stringify(set.has('b')));
      expect(set.has('b')).assertFalse();
      Logger.info(TAG, 'treeSetRemoveExisting_097 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0980
     * @tc.name treeSetPopFirst098
     * @tc.desc Verify TreeSet popFirst returns and drops the smallest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeSetPopFirst_098', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeSetPopFirst_098 begin');
      const set: TreeSet<string> = makeTreeSet();
      const value: string = set.popFirst();
      Logger.info(TAG, 'treeSetPopFirst_098, check01=' + JSON.stringify(value));
      expect(value).assertEqual('a');
      Logger.info(TAG, 'treeSetPopFirst_098, check02=' + JSON.stringify(set.getFirstValue()));
      expect(set.getFirstValue()).assertEqual('b');
      Logger.info(TAG, 'treeSetPopFirst_098 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_0990
     * @tc.name treeSetPopLast099
     * @tc.desc Verify TreeSet popLast returns and drops the largest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeSetPopLast_099', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeSetPopLast_099 begin');
      const set: TreeSet<string> = makeTreeSet();
      const value: string = set.popLast();
      Logger.info(TAG, 'treeSetPopLast_099, check01=' + JSON.stringify(value));
      expect(value).assertEqual('c');
      Logger.info(TAG, 'treeSetPopLast_099, check02=' + JSON.stringify(set.getLastValue()));
      expect(set.getLastValue()).assertEqual('b');
      Logger.info(TAG, 'treeSetPopLast_099 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_COLLECTIONS_1000
     * @tc.name treeSetClearEmpties100
     * @tc.desc Verify TreeSet clear drops every value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'treeSetClearEmpties_100', 0, async (): Promise<void> => {
      Logger.info(TAG, 'treeSetClearEmpties_100 begin');
      const set: TreeSet<string> = makeTreeSet();
      set.clear();
      Logger.info(TAG, 'treeSetClearEmpties_100, check01=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(0);
      Logger.info(TAG, 'treeSetClearEmpties_100, check02=' + JSON.stringify(set.isEmpty()));
      expect(set.isEmpty()).assertTrue();
      Logger.info(TAG, 'treeSetClearEmpties_100 end');
    });

  });
}
