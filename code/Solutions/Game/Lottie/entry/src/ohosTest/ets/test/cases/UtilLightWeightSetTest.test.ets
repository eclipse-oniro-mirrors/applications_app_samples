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
import LightWeightSet from '@ohos.util.LightWeightSet';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.COLLECTIONS;

function makeLwSet(): LightWeightSet<string> {
  const set: LightWeightSet<string> = new LightWeightSet<string>();
  set.add('a');
  set.add('b');
  set.add('c');
  return set;
}

export default function utilLightWeightSetTest(): void {
  describe('UtilLightWeightSetTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_0100
     * @tc.name lwSetNewEmpty001
     * @tc.desc Verify a new LightWeightSet starts empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetNewEmpty_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetNewEmpty_001 begin');
      const set: LightWeightSet<string> = new LightWeightSet<string>();
      Logger.info(TAG, 'lwSetNewEmpty_001, check01=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(0);
      Logger.info(TAG, 'lwSetNewEmpty_001, check02=' + JSON.stringify(set.isEmpty()));
      expect(set.isEmpty()).assertTrue();
      Logger.info(TAG, 'lwSetNewEmpty_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_0200
     * @tc.name lwSetAdd002
     * @tc.desc Verify LightWeightSet add stores a new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetAdd_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetAdd_002 begin');
      const set: LightWeightSet<string> = new LightWeightSet<string>();
      const added: boolean = set.add('a');
      Logger.info(TAG, 'lwSetAdd_002, check01=' + JSON.stringify(added));
      expect(added).assertTrue();
      Logger.info(TAG, 'lwSetAdd_002, check02=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(1);
      Logger.info(TAG, 'lwSetAdd_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_0300
     * @tc.name lwSetAddDuplicate003
     * @tc.desc Verify LightWeightSet adding a duplicate keeps one value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetAddDuplicate_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetAddDuplicate_003 begin');
      const set: LightWeightSet<string> = new LightWeightSet<string>();
      set.add('a');
      const added: boolean = set.add('a');
      Logger.info(TAG, 'lwSetAddDuplicate_003, check01=' + JSON.stringify(added));
      expect(added).assertFalse();
      Logger.info(TAG, 'lwSetAddDuplicate_003, check02=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(1);
      Logger.info(TAG, 'lwSetAddDuplicate_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_0400
     * @tc.name lwSetHas004
     * @tc.desc Verify LightWeightSet has distinguishes present and absent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetHas_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetHas_004 begin');
      const set: LightWeightSet<string> = makeLwSet();
      Logger.info(TAG, 'lwSetHas_004, check01=' + JSON.stringify(set.has('b')));
      expect(set.has('b')).assertTrue();
      Logger.info(TAG, 'lwSetHas_004, check02=' + JSON.stringify(set.has('z')));
      expect(set.has('z')).assertFalse();
      Logger.info(TAG, 'lwSetHas_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_0500
     * @tc.name lwSetIndexOf005
     * @tc.desc Verify LightWeightSet getIndexOf returns the slot of a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetIndexOf_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetIndexOf_005 begin');
      const set: LightWeightSet<string> = makeLwSet();
      Logger.info(TAG, 'lwSetIndexOf_005, check01=' + JSON.stringify(set.getIndexOf('b') >= 0));
      expect(set.getIndexOf('b') >= 0).assertTrue();
      Logger.info(TAG, 'lwSetIndexOf_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_0600
     * @tc.name lwSetValueAt006
     * @tc.desc Verify LightWeightSet getValueAt returns the value of a slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetValueAt_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetValueAt_006 begin');
      const set: LightWeightSet<string> = makeLwSet();
      const index: number = set.getIndexOf('b');
      Logger.info(TAG, 'lwSetValueAt_006, check01=' + JSON.stringify(set.getValueAt(index)));
      expect(set.getValueAt(index)).assertEqual('b');
      Logger.info(TAG, 'lwSetValueAt_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_0700
     * @tc.name lwSetRemove007
     * @tc.desc Verify LightWeightSet remove returns and drops a stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetRemove_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetRemove_007 begin');
      const set: LightWeightSet<string> = makeLwSet();
      const removed: string = set.remove('b');
      Logger.info(TAG, 'lwSetRemove_007, check01=' + JSON.stringify(removed));
      expect(removed).assertEqual('b');
      Logger.info(TAG, 'lwSetRemove_007, check02=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(2);
      Logger.info(TAG, 'lwSetRemove_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_0800
     * @tc.name lwSetRemoveAt008
     * @tc.desc Verify LightWeightSet removeAt drops the value of a slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetRemoveAt_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetRemoveAt_008 begin');
      const set: LightWeightSet<string> = makeLwSet();
      const index: number = set.getIndexOf('b');
      const removed: boolean = set.removeAt(index);
      Logger.info(TAG, 'lwSetRemoveAt_008, check01=' + JSON.stringify(removed));
      expect(removed).assertTrue();
      Logger.info(TAG, 'lwSetRemoveAt_008, check02=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(2);
      Logger.info(TAG, 'lwSetRemoveAt_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_0900
     * @tc.name lwSetClear009
     * @tc.desc Verify LightWeightSet clear drops every value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetClear_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetClear_009 begin');
      const set: LightWeightSet<string> = makeLwSet();
      set.clear();
      Logger.info(TAG, 'lwSetClear_009, check01=' + JSON.stringify(set.length));
      expect(set.length).assertEqual(0);
      Logger.info(TAG, 'lwSetClear_009, check02=' + JSON.stringify(set.isEmpty()));
      expect(set.isEmpty()).assertTrue();
      Logger.info(TAG, 'lwSetClear_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_1000
     * @tc.name lwSetToArray010
     * @tc.desc Verify LightWeightSet toArray keeps the stored values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetToArray_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetToArray_010 begin');
      const set: LightWeightSet<string> = makeLwSet();
      const values: Array<string> = set.toArray();
      Logger.info(TAG, 'lwSetToArray_010, check01=' + JSON.stringify(values.length));
      expect(values.length).assertEqual(3);
      Logger.info(TAG, 'lwSetToArray_010, check02=' + JSON.stringify(values.indexOf('b') >= 0));
      expect(values.indexOf('b') >= 0).assertTrue();
      Logger.info(TAG, 'lwSetToArray_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_1100
     * @tc.name lwSetAddAll011
     * @tc.desc Verify LightWeightSet addAll copies every value of another set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetAddAll_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetAddAll_011 begin');
      const source: LightWeightSet<string> = makeLwSet();
      const target: LightWeightSet<string> = new LightWeightSet<string>();
      target.addAll(source);
      Logger.info(TAG, 'lwSetAddAll_011, check01=' + JSON.stringify(target.length));
      expect(target.length).assertEqual(3);
      Logger.info(TAG, 'lwSetAddAll_011, check02=' + JSON.stringify(target.has('c')));
      expect(target.has('c')).assertTrue();
      Logger.info(TAG, 'lwSetAddAll_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LWSET_1200
     * @tc.name lwSetHasAll012
     * @tc.desc Verify LightWeightSet hasAll accepts a set whose values are all present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'lwSetHasAll_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'lwSetHasAll_012 begin');
      const source: LightWeightSet<string> = makeLwSet();
      const target: LightWeightSet<string> = makeLwSet();
      Logger.info(TAG, 'lwSetHasAll_012, check01=' + JSON.stringify(target.hasAll(source)));
      expect(target.hasAll(source)).assertTrue();
      Logger.info(TAG, 'lwSetHasAll_012 end');
    });

  });
}
