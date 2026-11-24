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
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Mutation and query rules of the plain array.
 * Row batches are edited without copying before they are handed to the list, and the
 * same batch is queried for previews. The cases pin the two ends of that use:
 * the mutating calls that return what they removed and the queries that return
 * the first match or a filtered copy.
 */
export default function arrayOpsContractTest() {
  describe('ArrayOpsContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_0100
     * @tc.name PushReportsNewLength001
     * @tc.desc Verify the push call returns the length after the append
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PushReportsNewLength_001', 0, (): void => {
      Logger.info(TAG, 'PushReportsNewLength_001 begin');
      const rows: Array<string> = ['a'];
      const length: number = rows.push('b');
      expect(length).assertEqual(2);
      Logger.info(TAG, 'PushReportsNewLength_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_0200
     * @tc.name PopReturnsLastRow002
     * @tc.desc Verify the pop call returns the last element and shortens the array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PopReturnsLastRow_002', 0, (): void => {
      Logger.info(TAG, 'PopReturnsLastRow_002 begin');
      const rows: Array<string> = ['a', 'b'];
      expect(rows.pop()).assertEqual('b');
      expect(rows.length).assertEqual(1);
      Logger.info(TAG, 'PopReturnsLastRow_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_0300
     * @tc.name ShiftReturnsFirstRow003
     * @tc.desc Verify the shift call returns the first element and moves the rest down
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ShiftReturnsFirstRow_003', 0, (): void => {
      Logger.info(TAG, 'ShiftReturnsFirstRow_003 begin');
      const rows: Array<string> = ['a', 'b'];
      const first: string | undefined = rows.shift();
      expect(first).assertEqual('a');
      expect(rows[0]).assertEqual('b');
      Logger.info(TAG, 'ShiftReturnsFirstRow_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_0400
     * @tc.name UnshiftAddsHead004
     * @tc.desc Verify the unshift call stores the element at the head
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UnshiftAddsHead_004', 0, (): void => {
      Logger.info(TAG, 'UnshiftAddsHead_004 begin');
      const rows: Array<string> = ['b'];
      rows.unshift('a');
      expect(rows[0]).assertEqual('a');
      Logger.info(TAG, 'UnshiftAddsHead_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_0500
     * @tc.name SpliceReturnsRemoved005
     * @tc.desc Verify the splice call returns the removed element and shrinks the array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SpliceReturnsRemoved_005', 0, (): void => {
      Logger.info(TAG, 'SpliceReturnsRemoved_005 begin');
      const rows: Array<string> = ['a', 'b', 'c'];
      const removed: Array<string> = rows.splice(1, 1);
      expect(removed[0]).assertEqual('b');
      expect(rows.length).assertEqual(2);
      Logger.info(TAG, 'SpliceReturnsRemoved_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_0600
     * @tc.name SliceLeavesSource006
     * @tc.desc Verify a slice copy contains the range without changing the source
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SliceLeavesSource_006', 0, (): void => {
      Logger.info(TAG, 'SliceLeavesSource_006 begin');
      const rows: Array<string> = ['a', 'b', 'c'];
      const copy: Array<string> = rows.slice(1, 3);
      expect(copy.length).assertEqual(2);
      expect(rows.length).assertEqual(3);
      Logger.info(TAG, 'SliceLeavesSource_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_0700
     * @tc.name ConcatJoinsBatches007
     * @tc.desc Verify concatenation appends the second batch after the first
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ConcatJoinsBatches_007', 0, (): void => {
      Logger.info(TAG, 'ConcatJoinsBatches_007 begin');
      const first: Array<string> = ['a'];
      const second: Array<string> = ['b'];
      const joined: Array<string> = first.concat(second);
      expect(joined[1]).assertEqual('b');
      expect(joined.length).assertEqual(2);
      Logger.info(TAG, 'ConcatJoinsBatches_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_0800
     * @tc.name IndexOfFromOffset008
     * @tc.desc Verify the array search starts at the requested position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IndexOfFromOffset_008', 0, (): void => {
      Logger.info(TAG, 'IndexOfFromOffset_008 begin');
      const rows: Array<string> = ['a', 'b', 'a'];
      expect(rows.indexOf('a', 1)).assertEqual(2);
      Logger.info(TAG, 'IndexOfFromOffset_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_0900
     * @tc.name LastIndexOfDuplicate009
     * @tc.desc Verify the reverse lookup reports the later duplicate
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LastIndexOfDuplicate_009', 0, (): void => {
      Logger.info(TAG, 'LastIndexOfDuplicate_009 begin');
      const rows: Array<string> = ['a', 'b', 'a'];
      expect(rows.lastIndexOf('a')).assertEqual(2);
      Logger.info(TAG, 'LastIndexOfDuplicate_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_1000
     * @tc.name IncludesExistingValue010
     * @tc.desc Verify containment accepts a present element and rejects an absent one
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IncludesExistingValue_010', 0, (): void => {
      Logger.info(TAG, 'IncludesExistingValue_010 begin');
      const rows: Array<string> = ['a', 'b'];
      expect(rows.includes('b')).assertTrue();
      expect(rows.includes('z')).assertFalse();
      Logger.info(TAG, 'IncludesExistingValue_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_1100
     * @tc.name FindReturnsFirstMatch011
     * @tc.desc Verify the search callback stops at the first match
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FindReturnsFirstMatch_011', 0, (): void => {
      Logger.info(TAG, 'FindReturnsFirstMatch_011 begin');
      const rows: Array<number> = [3, 8, 9];
      const found: number | undefined = rows.find((value: number): boolean => value > 5);
      expect(found).assertEqual(8);
      Logger.info(TAG, 'FindReturnsFirstMatch_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_1200
     * @tc.name FilterKeepsOnlyMatches012
     * @tc.desc Verify the filter callback returns only the accepted elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FilterKeepsOnlyMatches_012', 0, (): void => {
      Logger.info(TAG, 'FilterKeepsOnlyMatches_012 begin');
      const rows: Array<number> = [1, 5, 7];
      const kept: Array<number> = rows.filter((value: number): boolean => value > 4);
      expect(kept.length).assertEqual(2);
      expect(kept[0]).assertEqual(5);
      Logger.info(TAG, 'FilterKeepsOnlyMatches_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_1300
     * @tc.name EveryAndSomeAgree013
     * @tc.desc Verify the every check is stricter than the some check
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EveryAndSomeAgree_013', 0, (): void => {
      Logger.info(TAG, 'EveryAndSomeAgree_013 begin');
      const rows: Array<number> = [1, 2, 9];
      const allPositive: boolean = rows.every((value: number): boolean => value > 0);
      const anyLarge: boolean = rows.some((value: number): boolean => value > 5);
      expect(allPositive).assertTrue();
      expect(anyLarge).assertTrue();
      Logger.info(TAG, 'EveryAndSomeAgree_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ARRAY_1400
     * @tc.name ReverseEditsInPlace014
     * @tc.desc Verify the reverse call reorders the same array instance
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ReverseEditsInPlace_014', 0, (): void => {
      Logger.info(TAG, 'ReverseEditsInPlace_014 begin');
      const rows: Array<string> = ['a', 'b', 'c'];
      const returned: Array<string> = rows.reverse();
      expect(returned).assertEqual(rows);
      expect(rows[0]).assertEqual('c');
      Logger.info(TAG, 'ReverseEditsInPlace_014 end');
    });
  });
}
