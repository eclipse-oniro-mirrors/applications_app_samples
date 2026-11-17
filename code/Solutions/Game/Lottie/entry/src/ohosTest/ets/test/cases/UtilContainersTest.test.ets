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
import List from '@ohos.util.List';
import Vector from '@ohos.util.Vector';
import LightWeightMap from '@ohos.util.LightWeightMap';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.COLLECTIONS;

function makeList(): List<string> {
  const list: List<string> = new List<string>();
  list.add('a');
  list.add('b');
  list.add('c');
  return list;
}

function makeVector(): Vector<string> {
  const vector: Vector<string> = new Vector<string>();
  vector.add('a');
  vector.add('b');
  vector.add('c');
  return vector;
}

function makeLwMap(): LightWeightMap<string, number> {
  const map: LightWeightMap<string, number> = new LightWeightMap<string, number>();
  map.set('a', 1);
  map.set('b', 2);
  map.set('c', 3);
  return map;
}

export default function utilContainersTest(): void {
  describe('UtilContainersTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_0100
     * @tc.name listNewEmpty001
     * @tc.desc Verify a new List starts empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listNewEmpty_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listNewEmpty_001 begin');
      const list: List<string> = new List<string>();
      Logger.info(TAG, 'listNewEmpty_001, check01=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(0);
      Logger.info(TAG, 'listNewEmpty_001, check02=' + JSON.stringify(list.isEmpty()));
      expect(list.isEmpty()).assertTrue();
      Logger.info(TAG, 'listNewEmpty_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_0200
     * @tc.name listAddElement002
     * @tc.desc Verify List add appends a new element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listAddElement_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listAddElement_002 begin');
      const list: List<string> = new List<string>();
      const added: boolean = list.add('a');
      Logger.info(TAG, 'listAddElement_002, check01=' + JSON.stringify(added));
      expect(added).assertTrue();
      Logger.info(TAG, 'listAddElement_002, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(1);
      Logger.info(TAG, 'listAddElement_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_0300
     * @tc.name listGetByIndex003
     * @tc.desc Verify List get returns the element at a valid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listGetByIndex_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listGetByIndex_003 begin');
      const list: List<string> = makeList();
      Logger.info(TAG, 'listGetByIndex_003, check01=' + JSON.stringify(list.get(1)));
      expect(list.get(1)).assertEqual('b');
      Logger.info(TAG, 'listGetByIndex_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_0400
     * @tc.name listInsertAt004
     * @tc.desc Verify List insert puts an element at the requested index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listInsertAt_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listInsertAt_004 begin');
      const list: List<string> = makeList();
      list.insert('x', 1);
      Logger.info(TAG, 'listInsertAt_004, check01=' + JSON.stringify(list.get(1)));
      expect(list.get(1)).assertEqual('x');
      Logger.info(TAG, 'listInsertAt_004, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(4);
      Logger.info(TAG, 'listInsertAt_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_0500
     * @tc.name listSetReplacesSlot005
     * @tc.desc Verify List set overwrites the element at a slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listSetReplacesSlot_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listSetReplacesSlot_005 begin');
      const list: List<string> = makeList();
      list.set(1, 'x');
      Logger.info(TAG, 'listSetReplacesSlot_005, check01=' + JSON.stringify(list.get(1)));
      expect(list.get(1)).assertEqual('x');
      Logger.info(TAG, 'listSetReplacesSlot_005, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(3);
      Logger.info(TAG, 'listSetReplacesSlot_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_0600
     * @tc.name listHasElement006
     * @tc.desc Verify List has distinguishes present and absent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listHasElement_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listHasElement_006 begin');
      const list: List<string> = makeList();
      Logger.info(TAG, 'listHasElement_006, check01=' + JSON.stringify(list.has('b')));
      expect(list.has('b')).assertTrue();
      Logger.info(TAG, 'listHasElement_006, check02=' + JSON.stringify(list.has('z')));
      expect(list.has('z')).assertFalse();
      Logger.info(TAG, 'listHasElement_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_0700
     * @tc.name listIndexOf007
     * @tc.desc Verify List getIndexOf returns the first slot of a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listIndexOf_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listIndexOf_007 begin');
      const list: List<string> = makeList();
      Logger.info(TAG, 'listIndexOf_007, check01=' + JSON.stringify(list.getIndexOf('b')));
      expect(list.getIndexOf('b')).assertEqual(1);
      Logger.info(TAG, 'listIndexOf_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_0800
     * @tc.name listLastIndexOf008
     * @tc.desc Verify List getLastIndexOf returns the later slot of a duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listLastIndexOf_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listLastIndexOf_008 begin');
      const list: List<string> = new List<string>();
      list.add('a');
      list.add('b');
      list.add('a');
      Logger.info(TAG, 'listLastIndexOf_008, check01=' + JSON.stringify(list.getLastIndexOf('a')));
      expect(list.getLastIndexOf('a')).assertEqual(2);
      Logger.info(TAG, 'listLastIndexOf_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_0900
     * @tc.name listRemoveByIndex009
     * @tc.desc Verify List removeByIndex returns the removed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listRemoveByIndex_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listRemoveByIndex_009 begin');
      const list: List<string> = makeList();
      const removed: string = list.removeByIndex(1);
      Logger.info(TAG, 'listRemoveByIndex_009, check01=' + JSON.stringify(removed));
      expect(removed).assertEqual('b');
      Logger.info(TAG, 'listRemoveByIndex_009, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(2);
      Logger.info(TAG, 'listRemoveByIndex_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_1000
     * @tc.name listRemoveElement010
     * @tc.desc Verify List remove by value reports success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listRemoveElement_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listRemoveElement_010 begin');
      const list: List<string> = makeList();
      const removed: boolean = list.remove('b');
      Logger.info(TAG, 'listRemoveElement_010, check01=' + JSON.stringify(removed));
      expect(removed).assertTrue();
      Logger.info(TAG, 'listRemoveElement_010, check02=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(2);
      Logger.info(TAG, 'listRemoveElement_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_1100
     * @tc.name listGetFirst011
     * @tc.desc Verify List getFirst returns the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listGetFirst_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listGetFirst_011 begin');
      const list: List<string> = makeList();
      Logger.info(TAG, 'listGetFirst_011, check01=' + JSON.stringify(list.getFirst()));
      expect(list.getFirst()).assertEqual('a');
      Logger.info(TAG, 'listGetFirst_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_1200
     * @tc.name listGetLast012
     * @tc.desc Verify List getLast returns the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listGetLast_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listGetLast_012 begin');
      const list: List<string> = makeList();
      Logger.info(TAG, 'listGetLast_012, check01=' + JSON.stringify(list.getLast()));
      expect(list.getLast()).assertEqual('c');
      Logger.info(TAG, 'listGetLast_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_1300
     * @tc.name listClearEmpties013
     * @tc.desc Verify List clear drops every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listClearEmpties_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listClearEmpties_013 begin');
      const list: List<string> = makeList();
      list.clear();
      Logger.info(TAG, 'listClearEmpties_013, check01=' + JSON.stringify(list.length));
      expect(list.length).assertEqual(0);
      Logger.info(TAG, 'listClearEmpties_013, check02=' + JSON.stringify(list.isEmpty()));
      expect(list.isEmpty()).assertTrue();
      Logger.info(TAG, 'listClearEmpties_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_1400
     * @tc.name listConvertToArray014
     * @tc.desc Verify List convertToArray keeps list order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listConvertToArray_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listConvertToArray_014 begin');
      const list: List<string> = makeList();
      const values: Array<string> = list.convertToArray();
      Logger.info(TAG, 'listConvertToArray_014, check01=' + JSON.stringify(values.length));
      expect(values.length).assertEqual(3);
      Logger.info(TAG, 'listConvertToArray_014, check02=' + JSON.stringify(values[0]));
      expect(values[0]).assertEqual('a');
      Logger.info(TAG, 'listConvertToArray_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_1500
     * @tc.name listSubList015
     * @tc.desc Verify getSubList keeps the requested range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listSubList_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listSubList_015 begin');
      const list: List<string> = makeList();
      const sub: List<string> = list.getSubList(0, 2);
      Logger.info(TAG, 'listSubList_015, check01=' + JSON.stringify(sub.length));
      expect(sub.length).assertEqual(2);
      Logger.info(TAG, 'listSubList_015, check02=' + JSON.stringify(sub.get(1)));
      expect(sub.get(1)).assertEqual('b');
      Logger.info(TAG, 'listSubList_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_1600
     * @tc.name listForEachVisitsAll016
     * @tc.desc Verify List forEach visits every element exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listForEachVisitsAll_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listForEachVisitsAll_016 begin');
      const list: List<string> = makeList();
      let visits: number = 0;
      list.forEach((value: string): void => {
        visits++;
      });
      Logger.info(TAG, 'listForEachVisitsAll_016, check01=' + JSON.stringify(visits));
      expect(visits).assertEqual(3);
      Logger.info(TAG, 'listForEachVisitsAll_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_1700
     * @tc.name vectorNewEmpty017
     * @tc.desc Verify a new Vector starts empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorNewEmpty_017', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorNewEmpty_017 begin');
      const vector: Vector<string> = new Vector<string>();
      Logger.info(TAG, 'vectorNewEmpty_017, check01=' + JSON.stringify(vector.length));
      expect(vector.length).assertEqual(0);
      Logger.info(TAG, 'vectorNewEmpty_017, check02=' + JSON.stringify(vector.isEmpty()));
      expect(vector.isEmpty()).assertTrue();
      Logger.info(TAG, 'vectorNewEmpty_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_1800
     * @tc.name vectorAddElement018
     * @tc.desc Verify Vector add appends a new element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorAddElement_018', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorAddElement_018 begin');
      const vector: Vector<string> = new Vector<string>();
      const added: boolean = vector.add('a');
      Logger.info(TAG, 'vectorAddElement_018, check01=' + JSON.stringify(added));
      expect(added).assertTrue();
      Logger.info(TAG, 'vectorAddElement_018, check02=' + JSON.stringify(vector.length));
      expect(vector.length).assertEqual(1);
      Logger.info(TAG, 'vectorAddElement_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_1900
     * @tc.name vectorGetByIndex019
     * @tc.desc Verify Vector get returns the element at a valid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorGetByIndex_019', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorGetByIndex_019 begin');
      const vector: Vector<string> = makeVector();
      Logger.info(TAG, 'vectorGetByIndex_019, check01=' + JSON.stringify(vector.get(1)));
      expect(vector.get(1)).assertEqual('b');
      Logger.info(TAG, 'vectorGetByIndex_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_2000
     * @tc.name vectorInsertAt020
     * @tc.desc Verify Vector insert puts an element at the requested index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorInsertAt_020', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorInsertAt_020 begin');
      const vector: Vector<string> = makeVector();
      vector.insert('x', 1);
      Logger.info(TAG, 'vectorInsertAt_020, check01=' + JSON.stringify(vector.get(1)));
      expect(vector.get(1)).assertEqual('x');
      Logger.info(TAG, 'vectorInsertAt_020, check02=' + JSON.stringify(vector.length));
      expect(vector.length).assertEqual(4);
      Logger.info(TAG, 'vectorInsertAt_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_2100
     * @tc.name vectorSetReplacesSlot021
     * @tc.desc Verify Vector set overwrites the element at a slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorSetReplacesSlot_021', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorSetReplacesSlot_021 begin');
      const vector: Vector<string> = makeVector();
      vector.set(1, 'x');
      Logger.info(TAG, 'vectorSetReplacesSlot_021, check01=' + JSON.stringify(vector.get(1)));
      expect(vector.get(1)).assertEqual('x');
      Logger.info(TAG, 'vectorSetReplacesSlot_021, check02=' + JSON.stringify(vector.length));
      expect(vector.length).assertEqual(3);
      Logger.info(TAG, 'vectorSetReplacesSlot_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_2200
     * @tc.name vectorRemoveByIndex022
     * @tc.desc Verify Vector removeByIndex returns the removed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorRemoveByIndex_022', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorRemoveByIndex_022 begin');
      const vector: Vector<string> = makeVector();
      const removed: string = vector.removeByIndex(1);
      Logger.info(TAG, 'vectorRemoveByIndex_022, check01=' + JSON.stringify(removed));
      expect(removed).assertEqual('b');
      Logger.info(TAG, 'vectorRemoveByIndex_022, check02=' + JSON.stringify(vector.length));
      expect(vector.length).assertEqual(2);
      Logger.info(TAG, 'vectorRemoveByIndex_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_2300
     * @tc.name vectorRemoveElement023
     * @tc.desc Verify Vector remove by value reports success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorRemoveElement_023', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorRemoveElement_023 begin');
      const vector: Vector<string> = makeVector();
      const removed: boolean = vector.remove('b');
      Logger.info(TAG, 'vectorRemoveElement_023, check01=' + JSON.stringify(removed));
      expect(removed).assertTrue();
      Logger.info(TAG, 'vectorRemoveElement_023, check02=' + JSON.stringify(vector.length));
      expect(vector.length).assertEqual(2);
      Logger.info(TAG, 'vectorRemoveElement_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_2400
     * @tc.name vectorGetFirst024
     * @tc.desc Verify Vector getFirstElement returns the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorGetFirst_024', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorGetFirst_024 begin');
      const vector: Vector<string> = makeVector();
      Logger.info(TAG, 'vectorGetFirst_024, check01=' + JSON.stringify(vector.getFirstElement()));
      expect(vector.getFirstElement()).assertEqual('a');
      Logger.info(TAG, 'vectorGetFirst_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_2500
     * @tc.name vectorGetLast025
     * @tc.desc Verify Vector getLastElement returns the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorGetLast_025', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorGetLast_025 begin');
      const vector: Vector<string> = makeVector();
      Logger.info(TAG, 'vectorGetLast_025, check01=' + JSON.stringify(vector.getLastElement()));
      expect(vector.getLastElement()).assertEqual('c');
      Logger.info(TAG, 'vectorGetLast_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_2600
     * @tc.name vectorHasElement026
     * @tc.desc Verify Vector has distinguishes present and absent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorHasElement_026', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorHasElement_026 begin');
      const vector: Vector<string> = makeVector();
      Logger.info(TAG, 'vectorHasElement_026, check01=' + JSON.stringify(vector.has('b')));
      expect(vector.has('b')).assertTrue();
      Logger.info(TAG, 'vectorHasElement_026, check02=' + JSON.stringify(vector.has('z')));
      expect(vector.has('z')).assertFalse();
      Logger.info(TAG, 'vectorHasElement_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_2700
     * @tc.name vectorIndexOf027
     * @tc.desc Verify Vector getIndexOf returns the first slot of a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorIndexOf_027', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorIndexOf_027 begin');
      const vector: Vector<string> = makeVector();
      Logger.info(TAG, 'vectorIndexOf_027, check01=' + JSON.stringify(vector.getIndexOf('b')));
      expect(vector.getIndexOf('b')).assertEqual(1);
      Logger.info(TAG, 'vectorIndexOf_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_2800
     * @tc.name vectorClearEmpties028
     * @tc.desc Verify Vector clear drops every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorClearEmpties_028', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorClearEmpties_028 begin');
      const vector: Vector<string> = makeVector();
      vector.clear();
      Logger.info(TAG, 'vectorClearEmpties_028, check01=' + JSON.stringify(vector.length));
      expect(vector.length).assertEqual(0);
      Logger.info(TAG, 'vectorClearEmpties_028, check02=' + JSON.stringify(vector.isEmpty()));
      expect(vector.isEmpty()).assertTrue();
      Logger.info(TAG, 'vectorClearEmpties_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_2900
     * @tc.name vectorConvertToArray029
     * @tc.desc Verify Vector convertToArray keeps vector order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorConvertToArray_029', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorConvertToArray_029 begin');
      const vector: Vector<string> = makeVector();
      const values: Array<string> = vector.convertToArray();
      Logger.info(TAG, 'vectorConvertToArray_029, check01=' + JSON.stringify(values.length));
      expect(values.length).assertEqual(3);
      Logger.info(TAG, 'vectorConvertToArray_029, check02=' + JSON.stringify(values[2]));
      expect(values[2]).assertEqual('c');
      Logger.info(TAG, 'vectorConvertToArray_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_3000
     * @tc.name vectorCapacity030
     * @tc.desc Verify Vector the backing capacity is never below the element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorCapacity_030', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorCapacity_030 begin');
      const vector: Vector<string> = makeVector();
      Logger.info(TAG, 'vectorCapacity_030, check01=' + JSON.stringify(vector.getCapacity() >= vector.length));
      expect(vector.getCapacity() >= vector.length).assertTrue();
      Logger.info(TAG, 'vectorCapacity_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_3100
     * @tc.name vectorRemoveByRange031
     * @tc.desc Verify Vector removeByRange drops the half open index range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'vectorRemoveByRange_031', 0, async (): Promise<void> => {
      Logger.info(TAG, 'vectorRemoveByRange_031 begin');
      const vector: Vector<string> = makeVector();
      vector.removeByRange(0, 2);
      Logger.info(TAG, 'vectorRemoveByRange_031, check01=' + JSON.stringify(vector.length));
      expect(vector.length).assertEqual(1);
      Logger.info(TAG, 'vectorRemoveByRange_031, check02=' + JSON.stringify(vector.get(0)));
      expect(vector.get(0)).assertEqual('c');
      Logger.info(TAG, 'vectorRemoveByRange_031 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_3200
     * @tc.name lwMapNewEmpty032
     * @tc.desc Verify a new LightWeightMap starts empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapNewEmpty_032', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapNewEmpty_032 begin');
      const map: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      Logger.info(TAG, 'lwMapNewEmpty_032, check01=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(0);
      Logger.info(TAG, 'lwMapNewEmpty_032, check02=' + JSON.stringify(map.isEmpty()));
      expect(map.isEmpty()).assertTrue();
      Logger.info(TAG, 'lwMapNewEmpty_032 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_3300
     * @tc.name lwMapSetGet033
     * @tc.desc Verify LightWeightMap set stores a value under a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapSetGet_033', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapSetGet_033 begin');
      const map: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      map.set('a', 1);
      Logger.info(TAG, 'lwMapSetGet_033, check01=' + JSON.stringify(map.get('a')));
      expect(map.get('a')).assertEqual(1);
      Logger.info(TAG, 'lwMapSetGet_033 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_3400
     * @tc.name lwMapHasKey034
     * @tc.desc Verify LightWeightMap hasKey distinguishes present and absent keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapHasKey_034', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapHasKey_034 begin');
      const map: LightWeightMap<string, number> = makeLwMap();
      Logger.info(TAG, 'lwMapHasKey_034, check01=' + JSON.stringify(map.hasKey('b')));
      expect(map.hasKey('b')).assertTrue();
      Logger.info(TAG, 'lwMapHasKey_034, check02=' + JSON.stringify(map.hasKey('z')));
      expect(map.hasKey('z')).assertFalse();
      Logger.info(TAG, 'lwMapHasKey_034 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_3500
     * @tc.name lwMapHasValue035
     * @tc.desc Verify LightWeightMap hasValue distinguishes present and absent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapHasValue_035', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapHasValue_035 begin');
      const map: LightWeightMap<string, number> = makeLwMap();
      Logger.info(TAG, 'lwMapHasValue_035, check01=' + JSON.stringify(map.hasValue(2)));
      expect(map.hasValue(2)).assertTrue();
      Logger.info(TAG, 'lwMapHasValue_035, check02=' + JSON.stringify(map.hasValue(9)));
      expect(map.hasValue(9)).assertFalse();
      Logger.info(TAG, 'lwMapHasValue_035 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_3600
     * @tc.name lwMapIndexOfKey036
     * @tc.desc Verify LightWeightMap getIndexOfKey returns the slot of a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapIndexOfKey_036', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapIndexOfKey_036 begin');
      const map: LightWeightMap<string, number> = makeLwMap();
      Logger.info(TAG, 'lwMapIndexOfKey_036, check01=' + JSON.stringify(map.getIndexOfKey('b') >= 0));
      expect(map.getIndexOfKey('b') >= 0).assertTrue();
      Logger.info(TAG, 'lwMapIndexOfKey_036 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_3700
     * @tc.name lwMapGetKeyAt037
     * @tc.desc Verify LightWeightMap getKeyAt returns the key of a slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapGetKeyAt_037', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapGetKeyAt_037 begin');
      const map: LightWeightMap<string, number> = makeLwMap();
      const index: number = map.getIndexOfKey('b');
      Logger.info(TAG, 'lwMapGetKeyAt_037, check01=' + JSON.stringify(map.getKeyAt(index)));
      expect(map.getKeyAt(index)).assertEqual('b');
      Logger.info(TAG, 'lwMapGetKeyAt_037 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_3800
     * @tc.name lwMapGetValueAt038
     * @tc.desc Verify LightWeightMap getValueAt returns the value of a slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapGetValueAt_038', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapGetValueAt_038 begin');
      const map: LightWeightMap<string, number> = makeLwMap();
      const index: number = map.getIndexOfKey('b');
      Logger.info(TAG, 'lwMapGetValueAt_038, check01=' + JSON.stringify(map.getValueAt(index)));
      expect(map.getValueAt(index)).assertEqual(2);
      Logger.info(TAG, 'lwMapGetValueAt_038 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_3900
     * @tc.name lwMapSetValueAt039
     * @tc.desc Verify LightWeightMap setValueAt overwrites the value at a slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapSetValueAt_039', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapSetValueAt_039 begin');
      const map: LightWeightMap<string, number> = makeLwMap();
      const index: number = map.getIndexOfKey('b');
      const changed: boolean = map.setValueAt(index, 20);
      Logger.info(TAG, 'lwMapSetValueAt_039, check01=' + JSON.stringify(changed));
      expect(changed).assertTrue();
      Logger.info(TAG, 'lwMapSetValueAt_039, check02=' + JSON.stringify(map.get('b')));
      expect(map.get('b')).assertEqual(20);
      Logger.info(TAG, 'lwMapSetValueAt_039 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_4000
     * @tc.name lwMapRemove040
     * @tc.desc Verify LightWeightMap remove returns the old value and shrinks the map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapRemove_040', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapRemove_040 begin');
      const map: LightWeightMap<string, number> = makeLwMap();
      const removed: number = map.remove('b');
      Logger.info(TAG, 'lwMapRemove_040, check01=' + JSON.stringify(removed));
      expect(removed).assertEqual(2);
      Logger.info(TAG, 'lwMapRemove_040, check02=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(2);
      Logger.info(TAG, 'lwMapRemove_040 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_4100
     * @tc.name lwMapClearEmpties041
     * @tc.desc Verify LightWeightMap clear drops every entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapClearEmpties_041', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapClearEmpties_041 begin');
      const map: LightWeightMap<string, number> = makeLwMap();
      map.clear();
      Logger.info(TAG, 'lwMapClearEmpties_041, check01=' + JSON.stringify(map.length));
      expect(map.length).assertEqual(0);
      Logger.info(TAG, 'lwMapClearEmpties_041, check02=' + JSON.stringify(map.isEmpty()));
      expect(map.isEmpty()).assertTrue();
      Logger.info(TAG, 'lwMapClearEmpties_041 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_4200
     * @tc.name lwMapSetAll042
     * @tc.desc Verify LightWeightMap setAll copies every entry of another map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapSetAll_042', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapSetAll_042 begin');
      const source: LightWeightMap<string, number> = makeLwMap();
      const target: LightWeightMap<string, number> = new LightWeightMap<string, number>();
      target.setAll(source);
      Logger.info(TAG, 'lwMapSetAll_042, check01=' + JSON.stringify(target.length));
      expect(target.length).assertEqual(3);
      Logger.info(TAG, 'lwMapSetAll_042, check02=' + JSON.stringify(target.hasKey('c')));
      expect(target.hasKey('c')).assertTrue();
      Logger.info(TAG, 'lwMapSetAll_042 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_CONTAINERS_4300
     * @tc.name lwMapHasAll043
     * @tc.desc Verify LightWeightMap hasAll accepts a map whose entries are all present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwMapHasAll_043', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwMapHasAll_043 begin');
      const source: LightWeightMap<string, number> = makeLwMap();
      const target: LightWeightMap<string, number> = makeLwMap();
      Logger.info(TAG, 'lwMapHasAll_043, check01=' + JSON.stringify(target.hasAll(source)));
      expect(target.hasAll(source)).assertTrue();
      Logger.info(TAG, 'lwMapHasAll_043 end');
    });

  });
}
