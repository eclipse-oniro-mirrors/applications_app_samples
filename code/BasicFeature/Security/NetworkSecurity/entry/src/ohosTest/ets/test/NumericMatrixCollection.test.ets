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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CollectionUtils } from 'library';

// Log domain reserved for the numeric matrix collection suite.
const DOMAIN: number = 0xF811;

// Registers the numeric matrix test suite covering every CollectionUtils interface.
export default function numericMatrixCollectionTest() {
  // Define the suite that exercises isEmpty, isNotEmpty, unique, chunk, flatten,
  // containsAll, removeDuplicates and groupBy across a numeric dimension matrix.
  describe('NumericMatrixCollectionSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_0100
     * @tc.name      testNumCollect0001
     * @tc.desc      Verify isEmpty treats undefined, empty, single-element and multi-element arrays consistently.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing array behaves exactly like an empty one.
      const missingList: number[] | undefined = undefined;
      expect(CollectionUtils.isEmpty<number>(missingList)).assertTrue();
      // An array without elements still counts as empty.
      const blankList: number[] = [];
      expect(CollectionUtils.isEmpty(blankList)).assertTrue();
      // One element is already enough to make the array non-empty.
      const singleItem: number[] = [9];
      expect(CollectionUtils.isEmpty(singleItem)).assertFalse();
      // Several elements stay non-empty as well.
      const manyItems: number[] = [9, 8, 7];
      expect(CollectionUtils.isEmpty(manyItems)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_0200
     * @tc.name      testNumCollect0002
     * @tc.desc      Verify isEmpty keeps the empty versus non-empty verdict stable for string arrays of growing size.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Strings follow exactly the same emptiness rule as numbers.
      const blankWords: string[] = [];
      expect(CollectionUtils.isEmpty(blankWords)).assertTrue();
      // A single label flips the verdict immediately.
      const oneWord: string[] = ['alpha'];
      expect(CollectionUtils.isEmpty(oneWord)).assertFalse();
      // A two-word array stays non-empty.
      const twoWords: string[] = ['alpha', 'beta'];
      expect(CollectionUtils.isEmpty(twoWords)).assertFalse();
      // A longer word list remains non-empty as well.
      const fourWords: string[] = ['alpha', 'beta', 'gamma', 'delta'];
      expect(CollectionUtils.isEmpty(fourWords)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_0300
     * @tc.name      testNumCollect0003
     * @tc.desc      Verify isEmpty reports false for boolean arrays and object-shaped arrays holding elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Boolean flags count as real elements too.
      const flags: boolean[] = [true, false];
      expect(CollectionUtils.isEmpty(flags)).assertFalse();
      // A single boolean still prevents emptiness.
      const singleFlag: boolean[] = [false];
      expect(CollectionUtils.isEmpty(singleFlag)).assertFalse();
      // Numeric records built from mixed values stay non-empty.
      const readings: number[] = [0, -1, 2.5, 100];
      expect(CollectionUtils.isEmpty(readings)).assertFalse();
      // The empty boolean array remains empty for contrast.
      const blankFlags: boolean[] = [];
      expect(CollectionUtils.isEmpty(blankFlags)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_0400
     * @tc.name      testNumCollect0004
     * @tc.desc      Verify isEmpty stays false for a large array whose length reaches the hundreds and reacts to truncation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a 300-element sequence to prove size does not affect the verdict.
      const largeList: number[] = [];
      for (let index = 0; index < 300; index++) {
        largeList.push(index);
      }
      expect(largeList.length).assertEqual(300);
      expect(CollectionUtils.isEmpty(largeList)).assertFalse();
      // Truncating the array back to zero length restores the empty verdict.
      largeList.length = 0;
      expect(CollectionUtils.isEmpty(largeList)).assertTrue();
      // Adding exactly one element flips the verdict again.
      largeList.push(1);
      expect(CollectionUtils.isEmpty(largeList)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_0500
     * @tc.name      testNumCollect0005
     * @tc.desc      Verify isEmpty ignores element values such as zero, NaN and negative numbers and only looks at length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero is a real element, so the array is not empty.
      const zeroList: number[] = [0];
      expect(CollectionUtils.isEmpty(zeroList)).assertFalse();
      // NaN and negative values also count as real elements.
      const specialList: number[] = [NaN, -0.5, -100];
      expect(CollectionUtils.isEmpty(specialList)).assertFalse();
      // Infinity is another regular numeric element.
      const infiniteList: number[] = [Infinity];
      expect(CollectionUtils.isEmpty(infiniteList)).assertFalse();
      // A one-element array of the smallest possible content stays non-empty.
      const tinyList: number[] = [0.000001];
      expect(CollectionUtils.isEmpty(tinyList)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_0600
     * @tc.name      testNumCollect0006
     * @tc.desc      Verify isNotEmpty reports false for undefined and empty arrays exactly mirroring isEmpty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing array can never be non-empty.
      const missingList: string[] | undefined = undefined;
      expect(CollectionUtils.isNotEmpty<string>(missingList)).assertFalse();
      // The empty array is also reported as empty.
      const blankList: string[] = [];
      expect(CollectionUtils.isNotEmpty(blankList)).assertFalse();
      // Both helpers agree on the missing case.
      expect(CollectionUtils.isEmpty<string>(missingList)).assertTrue();
      expect(CollectionUtils.isEmpty(blankList)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_0700
     * @tc.name      testNumCollect0007
     * @tc.desc      Verify isNotEmpty reports true once the array holds one or several elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single element already satisfies the non-empty contract.
      const singleItem: number[] = [42];
      expect(CollectionUtils.isNotEmpty(singleItem)).assertTrue();
      // A pair of elements keeps the verdict positive.
      const pairItems: number[] = [42, 43];
      expect(CollectionUtils.isNotEmpty(pairItems)).assertTrue();
      // A longer sequence stays positive as well.
      const manyItems: number[] = [1, 2, 3, 4, 5];
      expect(CollectionUtils.isNotEmpty(manyItems)).assertTrue();
      // Repeated identical elements are still real elements.
      const repeatedItems: number[] = [7, 7, 7];
      expect(CollectionUtils.isNotEmpty(repeatedItems)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_0800
     * @tc.name      testNumCollect0008
     * @tc.desc      Verify isNotEmpty always returns the exact boolean inverse of isEmpty across array states.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Walk a growing sequence and confirm strict complement behaviour.
      const growing: number[] = [];
      expect(CollectionUtils.isNotEmpty(growing) === CollectionUtils.isEmpty(growing)).assertFalse();
      growing.push(10);
      expect(CollectionUtils.isNotEmpty(growing) === CollectionUtils.isEmpty(growing)).assertFalse();
      growing.push(20);
      growing.push(30);
      expect(CollectionUtils.isNotEmpty(growing) === CollectionUtils.isEmpty(growing)).assertFalse();
      // Non-empty and empty verdicts never coincide at any length.
      expect(CollectionUtils.isNotEmpty(growing)).assertTrue();
      expect(CollectionUtils.isEmpty(growing)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_0900
     * @tc.name      testNumCollect0009
     * @tc.desc      Verify isNotEmpty handles boolean arrays and string arrays of different lengths correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Boolean state lists are non-empty as soon as they hold one flag.
      const oneFlag: boolean[] = [true];
      expect(CollectionUtils.isNotEmpty(oneFlag)).assertTrue();
      // Multiple flags keep the verdict positive.
      const threeFlags: boolean[] = [true, false, true];
      expect(CollectionUtils.isNotEmpty(threeFlags)).assertTrue();
      // Word lists behave the same way across sizes.
      const blankWords: string[] = [];
      expect(CollectionUtils.isNotEmpty(blankWords)).assertFalse();
      const twoWords: string[] = ['tls', 'dns'];
      expect(CollectionUtils.isNotEmpty(twoWords)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_1000
     * @tc.name      testNumCollect0010
     * @tc.desc      Verify isNotEmpty stays true for a large array and flips only after the array is emptied.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Fill a 500-element array to stress the length counter.
      const longList: number[] = [];
      for (let index = 0; index < 500; index++) {
        longList.push(index * 2);
      }
      expect(CollectionUtils.isNotEmpty(longList)).assertTrue();
      expect(CollectionUtils.isEmpty(longList)).assertFalse();
      // Shrink to exactly one element; the verdict must stay positive.
      longList.length = 1;
      expect(CollectionUtils.isNotEmpty(longList)).assertTrue();
      // Emptying the array finally flips the verdict.
      longList.length = 0;
      expect(CollectionUtils.isNotEmpty(longList)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_1100
     * @tc.name      testNumCollect0011
     * @tc.desc      Verify unique returns an empty array for undefined input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing array deduplicates into an empty result.
      const cleared: number[] = CollectionUtils.unique<number>(undefined);
      expect(cleared.length).assertEqual(0);
      expect(CollectionUtils.isEmpty(cleared)).assertTrue();
      expect(CollectionUtils.isNotEmpty(cleared)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_1200
     * @tc.name      testNumCollect0012
     * @tc.desc      Verify unique returns an empty array for an empty input without adding elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Nothing in, nothing out.
      const blankList: number[] = [];
      const cleared: number[] = CollectionUtils.unique(blankList);
      expect(cleared.length).assertEqual(0);
      expect(CollectionUtils.isEmpty(cleared)).assertTrue();
      // The input array itself stays untouched.
      expect(blankList.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_1300
     * @tc.name      testNumCollect0013
     * @tc.desc      Verify unique keeps a single element array unchanged in content and length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A lone element survives deduplication unchanged.
      const singleItem: string[] = ['gateway'];
      const kept: string[] = CollectionUtils.unique(singleItem);
      expect(kept.length).assertEqual(1);
      expect(kept[0]).assertEqual('gateway');
      // The result array is a fresh copy, not the input reference.
      expect(kept !== singleItem).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_1400
     * @tc.name      testNumCollect0014
     * @tc.desc      Verify unique removes repeated numbers while preserving first-seen order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Repeats appear scattered across the sequence.
      const raw: number[] = [3, 1, 3, 2, 1, 3];
      const distinct: number[] = CollectionUtils.unique(raw);
      // Only the first occurrence of each value survives, in order.
      expect(distinct.length).assertEqual(3);
      expect(distinct[0]).assertEqual(3);
      expect(distinct[1]).assertEqual(1);
      expect(distinct[2]).assertEqual(2);
      // The raw input array stays untouched at six elements.
      expect(raw.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_1500
     * @tc.name      testNumCollect0015
     * @tc.desc      Verify unique keeps a duplicate-free array identical in length, order and content.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every element appears exactly once, so nothing is dropped.
      const raw: number[] = [5, 4, 3, 2, 1];
      const distinct: number[] = CollectionUtils.unique(raw);
      expect(distinct.length).assertEqual(5);
      expect(distinct[0]).assertEqual(5);
      expect(distinct[4]).assertEqual(1);
      // Order is preserved exactly as given.
      expect(distinct[1]).assertEqual(4);
      expect(distinct[3]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_1600
     * @tc.name      testNumCollect0016
     * @tc.desc      Verify unique collapses an array where every element is identical into one entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Nine copies of the same label collapse to a single entry.
      const raw: string[] = ['same', 'same', 'same', 'same', 'same', 'same', 'same', 'same', 'same'];
      const distinct: string[] = CollectionUtils.unique(raw);
      expect(distinct.length).assertEqual(1);
      expect(distinct[0]).assertEqual('same');
      // The collapsed array is still recognized as non-empty.
      expect(CollectionUtils.isNotEmpty(distinct)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_1700
     * @tc.name      testNumCollect0017
     * @tc.desc      Verify unique deduplicates strings case-sensitively so similar labels with different case survive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Matching relies on strict equality, so casing matters.
      const raw: string[] = ['TLS', 'tls', 'TLS', 'Dns', 'dns'];
      const distinct: string[] = CollectionUtils.unique(raw);
      // All five differently-cased spellings survive.
      expect(distinct.length).assertEqual(4);
      expect(distinct[0]).assertEqual('TLS');
      expect(distinct[1]).assertEqual('tls');
      expect(distinct[2]).assertEqual('Dns');
      expect(distinct[3]).assertEqual('dns');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_1800
     * @tc.name      testNumCollect0018
     * @tc.desc      Verify unique handles zero and negative numbers and keeps the first occurrence of each value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero and negatives repeat across the raw list.
      const raw: number[] = [0, -1, 0, -1, 0, 5, -1];
      const distinct: number[] = CollectionUtils.unique(raw);
      // First appearances are 0, -1 and 5 in that order.
      expect(distinct.length).assertEqual(3);
      expect(distinct[0]).assertEqual(0);
      expect(distinct[1]).assertEqual(-1);
      expect(distinct[2]).assertEqual(5);
      // The deduplicated list is recognized as non-empty.
      expect(CollectionUtils.isNotEmpty(distinct)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_1900
     * @tc.name      testNumCollect0019
     * @tc.desc      Verify chunk on undefined input yields no chunks regardless of the requested size.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing array cannot be sliced into anything.
      const chunks: number[][] = CollectionUtils.chunk<number>(undefined, 3);
      expect(chunks.length).assertEqual(0);
      expect(CollectionUtils.isEmpty(chunks)).assertTrue();
      // A different size does not change the missing-input outcome.
      const otherChunks: number[][] = CollectionUtils.chunk<number>(undefined, 99);
      expect(otherChunks.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_2000
     * @tc.name      testNumCollect0020
     * @tc.desc      Verify chunk on an empty array produces zero chunks even with a positive size.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Nothing to slice, so the chunk list stays empty.
      const blankList: number[] = [];
      const chunks: number[][] = CollectionUtils.chunk(blankList, 4);
      expect(chunks.length).assertEqual(0);
      expect(CollectionUtils.isEmpty(chunks)).assertTrue();
      // A size of one also yields nothing for empty input.
      const tinyChunks: number[][] = CollectionUtils.chunk(blankList, 1);
      expect(tinyChunks.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_2100
     * @tc.name      testNumCollect0021
     * @tc.desc      Verify chunk splits an array whose length divides evenly into equal consecutive chunks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Six elements split by two produce three equal chunks.
      const readings: number[] = [1, 2, 3, 4, 5, 6];
      const chunks: number[][] = CollectionUtils.chunk(readings, 2);
      expect(chunks.length).assertEqual(3);
      expect(chunks[0].length).assertEqual(2);
      expect(chunks[1].length).assertEqual(2);
      expect(chunks[2].length).assertEqual(2);
      // Chunk contents follow the input order without gaps.
      expect(chunks[0][0]).assertEqual(1);
      expect(chunks[1][0]).assertEqual(3);
      expect(chunks[2][1]).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_2200
     * @tc.name      testNumCollect0022
     * @tc.desc      Verify chunk keeps the trailing short chunk when the length does not divide evenly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seven elements split by three give chunks of three, three and one.
      const readings: number[] = [10, 11, 12, 13, 14, 15, 16];
      const chunks: number[][] = CollectionUtils.chunk(readings, 3);
      expect(chunks.length).assertEqual(3);
      expect(chunks[0].length).assertEqual(3);
      expect(chunks[1].length).assertEqual(3);
      // The last chunk carries the single remainder element.
      expect(chunks[2].length).assertEqual(1);
      expect(chunks[2][0]).assertEqual(16);
      // Boundaries align exactly with the stride.
      expect(chunks[0][2]).assertEqual(12);
      expect(chunks[1][2]).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_2300
     * @tc.name      testNumCollect0023
     * @tc.desc      Verify chunk treats a zero size as one so every element becomes its own chunk.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A zero size is guarded up to one element per chunk.
      const readings: number[] = [7, 8, 9];
      const chunks: number[][] = CollectionUtils.chunk(readings, 0);
      expect(chunks.length).assertEqual(3);
      expect(chunks[0].length).assertEqual(1);
      expect(chunks[1].length).assertEqual(1);
      expect(chunks[2].length).assertEqual(1);
      // Each single-element chunk keeps the original value.
      expect(chunks[0][0]).assertEqual(7);
      expect(chunks[1][0]).assertEqual(8);
      expect(chunks[2][0]).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_2400
     * @tc.name      testNumCollect0024
     * @tc.desc      Verify chunk clamps negative sizes up to one and splits accordingly without hanging.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A negative size behaves the same as one.
      const readings: number[] = [21, 22, 23, 24];
      const chunks: number[][] = CollectionUtils.chunk(readings, -5);
      expect(chunks.length).assertEqual(4);
      expect(chunks[0].length).assertEqual(1);
      expect(chunks[3].length).assertEqual(1);
      // Values survive the clamped split unchanged.
      expect(chunks[0][0]).assertEqual(21);
      expect(chunks[3][0]).assertEqual(24);
      // A deeply negative size still terminates with the same result.
      const deepChunks: number[][] = CollectionUtils.chunk(readings, -100);
      expect(deepChunks.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_2500
     * @tc.name      testNumCollect0025
     * @tc.desc      Verify chunk yields exactly one chunk holding the whole array when size exceeds the length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two elements cannot fill a chunk size of ten, so one chunk is enough.
      const readings: number[] = [31, 32];
      const chunks: number[][] = CollectionUtils.chunk(readings, 10);
      expect(chunks.length).assertEqual(1);
      expect(chunks[0].length).assertEqual(2);
      expect(chunks[0][0]).assertEqual(31);
      expect(chunks[0][1]).assertEqual(32);
      // The single chunk is a copy, not the original array reference.
      expect(chunks[0] !== readings).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_2600
     * @tc.name      testNumCollect0026
     * @tc.desc      Verify chunk with size equal to the length produces one full-length chunk.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Four elements with size four produce exactly one complete chunk.
      const readings: number[] = [41, 42, 43, 44];
      const chunks: number[][] = CollectionUtils.chunk(readings, 4);
      expect(chunks.length).assertEqual(1);
      expect(chunks[0].length).assertEqual(4);
      expect(chunks[0][0]).assertEqual(41);
      expect(chunks[0][3]).assertEqual(44);
      // A size one larger than the length behaves the same way.
      const largerChunks: number[][] = CollectionUtils.chunk(readings, 5);
      expect(largerChunks.length).assertEqual(1);
      expect(largerChunks[0].length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_2700
     * @tc.name      testNumCollect0027
     * @tc.desc      Verify chunk with size one isolates every element into its own single-slot chunk.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five elements with size one produce five single-slot chunks.
      const readings: number[] = [51, 52, 53, 54, 55];
      const chunks: number[][] = CollectionUtils.chunk(readings, 1);
      expect(chunks.length).assertEqual(5);
      expect(chunks[0].length).assertEqual(1);
      expect(chunks[4].length).assertEqual(1);
      // Every chunk carries exactly its own element in order.
      expect(chunks[0][0]).assertEqual(51);
      expect(chunks[2][0]).assertEqual(53);
      expect(chunks[4][0]).assertEqual(55);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_2800
     * @tc.name      testNumCollect0028
     * @tc.desc      Verify flatten on undefined input returns an empty array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing array of arrays flattens to nothing.
      const flat: number[] = CollectionUtils.flatten<number>(undefined);
      expect(flat.length).assertEqual(0);
      expect(CollectionUtils.isEmpty(flat)).assertTrue();
      expect(CollectionUtils.isNotEmpty(flat)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_2900
     * @tc.name      testNumCollect0029
     * @tc.desc      Verify flatten on an empty outer array returns an empty array without touching the input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // No rows at all means a flat but empty result.
      const blankRows: number[][] = [];
      const flat: number[] = CollectionUtils.flatten(blankRows);
      expect(flat.length).assertEqual(0);
      expect(CollectionUtils.isEmpty(flat)).assertTrue();
      // The input list of rows stays empty and unchanged.
      expect(blankRows.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_3000
     * @tc.name      testNumCollect0030
     * @tc.desc      Verify flatten drops rows that are themselves empty and yields nothing for all-empty input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three rows, all empty, contribute nothing to the flat output.
      const blankRows: number[][] = [[], [], []];
      const flat: number[] = CollectionUtils.flatten(blankRows);
      expect(flat.length).assertEqual(0);
      expect(CollectionUtils.isEmpty(flat)).assertTrue();
      // The empty rows remain in place inside the input.
      expect(blankRows.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_3100
     * @tc.name      testNumCollect0031
     * @tc.desc      Verify flatten joins equal-length inner arrays in order into one array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two rows of two elements each flatten into one ordered array.
      const rows: number[][] = [[1, 2], [3, 4]];
      const flat: number[] = CollectionUtils.flatten(rows);
      expect(flat.length).assertEqual(4);
      expect(flat[0]).assertEqual(1);
      expect(flat[1]).assertEqual(2);
      expect(flat[2]).assertEqual(3);
      expect(flat[3]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_3200
     * @tc.name      testNumCollect0032
     * @tc.desc      Verify flatten handles uneven rows including a single-element row and an empty row.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Uneven rows include one-element, three-element and empty rows.
      const rows: number[][] = [[61], [62, 63, 64], [], [65]];
      const flat: number[] = CollectionUtils.flatten(rows);
      // Every non-empty row still contributes all of its elements.
      expect(flat.length).assertEqual(5);
      expect(flat[0]).assertEqual(61);
      expect(flat[1]).assertEqual(62);
      expect(flat[3]).assertEqual(64);
      expect(flat[4]).assertEqual(65);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_3300
     * @tc.name      testNumCollect0033
     * @tc.desc      Verify flatten unwraps a single inner array into an equal copy with matching content.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One wrapped row flattens into a copy of its content.
      const wrapped: number[][] = [[71, 72, 73]];
      const flat: number[] = CollectionUtils.flatten(wrapped);
      expect(flat.length).assertEqual(3);
      expect(flat[0]).assertEqual(71);
      expect(flat[1]).assertEqual(72);
      expect(flat[2]).assertEqual(73);
      // The flat result is a new array, not the inner array itself.
      expect(flat !== wrapped[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_3400
     * @tc.name      testNumCollect0034
     * @tc.desc      Verify containsAll always reports false when the source array is undefined.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing source can never satisfy any containment request.
      const candidates: number[] = [1, 2];
      expect(CollectionUtils.containsAll<number>(undefined, candidates)).assertFalse();
      // Even a single required element fails against a missing source.
      expect(CollectionUtils.containsAll<number>(undefined, [1])).assertFalse();
      // The verdict stays false for an empty candidate list too.
      expect(CollectionUtils.containsAll<number>(undefined, [])).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_3500
     * @tc.name      testNumCollect0035
     * @tc.desc      Verify containsAll reports false when the candidate array is undefined even for an empty request.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing candidates leave nothing verifiable, so the call fails.
      const pool: string[] = ['tcp', 'udp'];
      expect(CollectionUtils.containsAll(pool, undefined)).assertFalse();
      // The rule holds no matter how large the source pool is.
      const biggerPool: string[] = ['tcp', 'udp', 'quic', 'tls'];
      expect(CollectionUtils.containsAll(biggerPool, undefined)).assertFalse();
      // Real candidates against the same pool confirm the positive path.
      expect(CollectionUtils.containsAll(biggerPool, ['udp'])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_3600
     * @tc.name      testNumCollect0036
     * @tc.desc      Verify containsAll reports false when both source and candidates are undefined.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both sides missing is the weakest containment case.
      expect(CollectionUtils.containsAll<number>(undefined, undefined)).assertFalse();
      // The result is still a plain boolean, not an exception.
      const verdict: boolean = CollectionUtils.containsAll<number>(undefined, undefined);
      expect(verdict).assertFalse();
      expect(CollectionUtils.isEmpty([])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_3700
     * @tc.name      testNumCollect0037
     * @tc.desc      Verify containsAll accepts several candidates all present in the source in any order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The pool holds five transports in a fixed order.
      const pool: string[] = ['tls', 'dns', 'https', 'quic', 'dtls'];
      // All three candidates exist somewhere in the pool.
      expect(CollectionUtils.containsAll(pool, ['tls', 'dns', 'https'])).assertTrue();
      // Candidate order differs from the pool order without any effect.
      expect(CollectionUtils.containsAll(pool, ['https', 'tls'])).assertTrue();
      // The trailing elements of the pool also resolve.
      expect(CollectionUtils.containsAll(pool, ['quic', 'dtls'])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_3800
     * @tc.name      testNumCollect0038
     * @tc.desc      Verify containsAll rejects a partially covered candidate list even when most entries match.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One missing candidate fails the entire request.
      const pool: number[] = [100, 200, 300];
      expect(CollectionUtils.containsAll(pool, [100, 999])).assertFalse();
      // A single absent candidate fails just as fast.
      expect(CollectionUtils.containsAll(pool, [999])).assertFalse();
      // Each candidate alone is fine, proving the failure is about coverage.
      expect(CollectionUtils.containsAll(pool, [100])).assertTrue();
      expect(CollectionUtils.containsAll(pool, [200])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_3900
     * @tc.name      testNumCollect0039
     * @tc.desc      Verify containsAll treats an empty candidate list as satisfied by any defined source.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Requiring nothing is satisfied by any real source.
      const pool: string[] = ['a', 'b'];
      expect(CollectionUtils.containsAll(pool, [])).assertTrue();
      // The same holds for a single-element source.
      const tinyPool: string[] = ['only'];
      expect(CollectionUtils.containsAll(tinyPool, [])).assertTrue();
      // With no requirements, even unrelated pools resolve.
      expect(CollectionUtils.containsAll(tinyPool, [])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_4000
     * @tc.name      testNumCollect0040
     * @tc.desc      Verify containsAll resolves a single candidate against pools of different sizes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A one-element pool matches its only element.
      const tinyPool: number[] = [7];
      expect(CollectionUtils.containsAll(tinyPool, [7])).assertTrue();
      // The same element is missing from a different single-element pool.
      const otherPool: number[] = [8];
      expect(CollectionUtils.containsAll(otherPool, [7])).assertFalse();
      // A larger pool resolves the element among others.
      const widePool: number[] = [1, 2, 7, 9];
      expect(CollectionUtils.containsAll(widePool, [7])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_4100
     * @tc.name      testNumCollect0041
     * @tc.desc      Verify containsAll accepts duplicated candidates as long as each value exists once in the source.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The pool itself carries one duplicate entry on purpose.
      const pool: string[] = ['tls', 'dns', 'tls'];
      // A candidate listed twice still resolves when present once.
      expect(CollectionUtils.containsAll(pool, ['tls', 'tls'])).assertTrue();
      // Mixed duplicated and unique candidates resolve together.
      expect(CollectionUtils.containsAll(pool, ['dns', 'dns', 'tls'])).assertTrue();
      // A repeated absent candidate still fails.
      expect(CollectionUtils.containsAll(pool, ['quic', 'quic'])).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_4200
     * @tc.name      testNumCollect0042
     * @tc.desc      Verify removeDuplicates returns an empty array for undefined numeric input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing numeric array cleans up to nothing.
      const cleaned: number[] = CollectionUtils.removeDuplicates(undefined);
      expect(cleaned.length).assertEqual(0);
      expect(CollectionUtils.isEmpty(cleaned)).assertTrue();
      expect(CollectionUtils.isNotEmpty(cleaned)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_4300
     * @tc.name      testNumCollect0043
     * @tc.desc      Verify removeDuplicates returns an empty array for an empty numeric input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Nothing to clean in an empty numeric array.
      const blankRange: number[] = [];
      const cleaned: number[] = CollectionUtils.removeDuplicates(blankRange);
      expect(cleaned.length).assertEqual(0);
      expect(CollectionUtils.isEmpty(cleaned)).assertTrue();
      // The input stays an empty array as well.
      expect(blankRange.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_4400
     * @tc.name      testNumCollect0044
     * @tc.desc      Verify removeDuplicates keeps a single-element numeric array exactly as it was.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A lone port number survives the cleanup unchanged.
      const singleRange: number[] = [8080];
      const cleaned: number[] = CollectionUtils.removeDuplicates(singleRange);
      expect(cleaned.length).assertEqual(1);
      expect(cleaned[0]).assertEqual(8080);
      // The result is a fresh array rather than the input reference.
      expect(cleaned !== singleRange).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_4500
     * @tc.name      testNumCollect0045
     * @tc.desc      Verify removeDuplicates keeps the first-seen order across scattered duplicate numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Duplicates appear scattered through the numeric range.
      const raw: number[] = [443, 80, 443, 8080, 80, 443];
      const cleaned: number[] = CollectionUtils.removeDuplicates(raw);
      // First appearances are 443, 80 and 8080 in that order.
      expect(cleaned.length).assertEqual(3);
      expect(cleaned[0]).assertEqual(443);
      expect(cleaned[1]).assertEqual(80);
      expect(cleaned[2]).assertEqual(8080);
      // The raw input stays untouched with all six entries.
      expect(raw.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_4600
     * @tc.name      testNumCollect0046
     * @tc.desc      Verify removeDuplicates leaves a duplicate-free numeric array unchanged in length and order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every number appears once, so the cleanup changes nothing.
      const raw: number[] = [-2, -1, 0, 1, 2, 3];
      const cleaned: number[] = CollectionUtils.removeDuplicates(raw);
      expect(cleaned.length).assertEqual(6);
      expect(cleaned[0]).assertEqual(-2);
      expect(cleaned[3]).assertEqual(1);
      expect(cleaned[5]).assertEqual(3);
      // The cleaned array is still recognized as non-empty.
      expect(CollectionUtils.isNotEmpty(cleaned)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_4700
     * @tc.name      testNumCollect0047
     * @tc.desc      Verify removeDuplicates collapses an all-identical numeric array into a single value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Eight copies of the same port collapse to one entry.
      const raw: number[] = [53, 53, 53, 53, 53, 53, 53, 53];
      const cleaned: number[] = CollectionUtils.removeDuplicates(raw);
      expect(cleaned.length).assertEqual(1);
      expect(cleaned[0]).assertEqual(53);
      // The collapsed array keeps the non-empty verdict.
      expect(CollectionUtils.isNotEmpty(cleaned)).assertTrue();
      // Zero values collapse the same way.
      const zeros: number[] = [0, 0, 0];
      const zeroCleaned: number[] = CollectionUtils.removeDuplicates(zeros);
      expect(zeroCleaned.length).assertEqual(1);
      expect(zeroCleaned[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_4800
     * @tc.name      testNumCollect0048
     * @tc.desc      Verify groupBy returns an empty map for undefined input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing array groups into an empty map.
      const groups: Map<string, number[]> =
        CollectionUtils.groupBy<number>(undefined, (item: number): string => 'bucket');
      expect(groups.size).assertEqual(0);
      // No key was ever inserted into the empty grouping.
      expect(groups.get('bucket') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_4900
     * @tc.name      testNumCollect0049
     * @tc.desc      Verify groupBy returns an empty map for an empty input array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty array produces no group keys at all.
      const blankList: string[] = [];
      const groups: Map<string, string[]> =
        CollectionUtils.groupBy(blankList, (word: string): string => word.substring(0, 1));
      expect(groups.size).assertEqual(0);
      // The map behaves exactly like a freshly created empty map.
      const freshMap: Map<string, string[]> = new Map<string, string[]>();
      expect(groups.size === freshMap.size).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_5000
     * @tc.name      testNumCollect0050
     * @tc.desc      Verify groupBy places every element of a single-group input into one ordered bucket.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // All codes share the same prefix, so they land in one bucket.
      const codes: string[] = ['A-1', 'A-2', 'A-3'];
      const byPrefix: Map<string, string[]> =
        CollectionUtils.groupBy(codes, (code: string): string => code.substring(0, 1));
      expect(byPrefix.size).assertEqual(1);
      const bucket: string[] | undefined = byPrefix.get('A');
      expect(bucket === undefined).assertFalse();
      if (bucket !== undefined) {
        expect(bucket.length).assertEqual(3);
        expect(bucket[0]).assertEqual('A-1');
        expect(bucket[2]).assertEqual('A-3');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_5100
     * @tc.name      testNumCollect0051
     * @tc.desc      Verify groupBy splits numbers into even and odd buckets by a computed key.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCollect0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCollect0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five numbers split into two parity buckets.
      const readings: number[] = [2, 3, 4, 5, 6];
      const byParity: Map<string, number[]> =
        CollectionUtils.groupBy(readings, (value: number): string => (value % 2 === 0 ? 'even' : 'odd'));
      expect(byParity.size).assertEqual(2);
      const evens: number[] | undefined = byParity.get('even');
      expect(evens === undefined).assertFalse();
      if (evens !== undefined) {
        expect(evens.length).assertEqual(3);
        expect(evens[0]).assertEqual(2);
        expect(evens[2]).assertEqual(6);
      }
      const odds: number[] | undefined = byParity.get('odd');
      expect(odds === undefined).assertFalse();
      if (odds !== undefined) {
        expect(odds.length).assertEqual(2);
        expect(odds[0]).assertEqual(3);
        expect(odds[1]).assertEqual(5);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_5200
     * @tc.name      testNumCollect0052
     * @tc.desc      Verify groupBy builds one bucket per distinct numeric key with no cross-group mixing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Scores map to grade buckets by threshold.
      const scores: number[] = [95, 75, 55, 85, 65];
      const byGrade: Map<string, number[]> =
        CollectionUtils.groupBy(scores, (score: number): string => (score >= 80 ? 'high' : (score >= 60 ? 'mid' : 'low')));
      // Three distinct grade buckets exist.
      expect(byGrade.size).assertEqual(3);
      const high: number[] | undefined = byGrade.get('high');
      expect(high === undefined).assertFalse();
      if (high !== undefined) {
        expect(high.length).assertEqual(2);
        expect(high[0]).assertEqual(95);
        expect(high[1]).assertEqual(85);
      }
      const low: number[] | undefined = byGrade.get('low');
      expect(low === undefined).assertFalse();
      if (low !== undefined) {
        expect(low.length).assertEqual(1);
        expect(low[0]).assertEqual(55);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_5300
     * @tc.name      testNumCollect0053
     * @tc.desc      Verify groupBy preserves arrival order inside every bucket across interleaved groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Channel names alternate so each bucket collects interleaved items.
      const events: string[] = ['tcp-1', 'udp-1', 'tcp-2', 'udp-2', 'tcp-3'];
      const byChannel: Map<string, string[]> =
        CollectionUtils.groupBy(events, (event: string): string => event.substring(0, 3));
      expect(byChannel.size).assertEqual(2);
      const tcpBucket: string[] | undefined = byChannel.get('tcp');
      expect(tcpBucket === undefined).assertFalse();
      if (tcpBucket !== undefined) {
        expect(tcpBucket.length).assertEqual(3);
        expect(tcpBucket[0]).assertEqual('tcp-1');
        expect(tcpBucket[2]).assertEqual('tcp-3');
      }
      const udpBucket: string[] | undefined = byChannel.get('udp');
      expect(udpBucket === undefined).assertFalse();
      if (udpBucket !== undefined) {
        expect(udpBucket.length).assertEqual(2);
        expect(udpBucket[1]).assertEqual('udp-2');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_5400
     * @tc.name      testNumCollect0054
     * @tc.desc      Verify groupBy leaves never-produced keys absent from the resulting map.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Only two of three potential zones ever appear in the input.
      const zones: string[] = ['zoneA', 'zoneB', 'zoneA'];
      const byZone: Map<string, string[]> =
        CollectionUtils.groupBy(zones, (zone: string): string => zone);
      expect(byZone.size).assertEqual(2);
      // The never-produced key stays absent.
      expect(byZone.get('zoneC') === undefined).assertTrue();
      // Produced keys resolve to their buckets.
      const zoneABucket: string[] | undefined = byZone.get('zoneA');
      expect(zoneABucket === undefined).assertFalse();
      if (zoneABucket !== undefined) {
        expect(zoneABucket.length).assertEqual(2);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_5500
     * @tc.name      testNumCollect0055
     * @tc.desc      Verify chunk applied to a deduplicated array produces bounded chunks of distinct values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Deduplicate first, then slice the distinct values into chunks.
      const raw: number[] = [5, 5, 6, 6, 7, 7, 8];
      const distinct: number[] = CollectionUtils.unique(raw);
      expect(distinct.length).assertEqual(4);
      const chunks: number[][] = CollectionUtils.chunk(distinct, 2);
      expect(chunks.length).assertEqual(2);
      expect(chunks[0].length).assertEqual(2);
      expect(chunks[1].length).assertEqual(2);
      // Chunks carry the deduplicated values in order.
      expect(chunks[0][0]).assertEqual(5);
      expect(chunks[1][0]).assertEqual(7);
      expect(chunks[1][1]).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_5600
     * @tc.name      testNumCollect0056
     * @tc.desc      Verify flatten reverses a chunk split exactly, restoring length and element order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chunk nine elements by three, then flatten the chunks back.
      const raw: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      const chunks: number[][] = CollectionUtils.chunk(raw, 3);
      expect(chunks.length).assertEqual(3);
      const restored: number[] = CollectionUtils.flatten(chunks);
      expect(restored.length).assertEqual(9);
      expect(restored[0]).assertEqual(1);
      expect(restored[4]).assertEqual(5);
      expect(restored[8]).assertEqual(9);
      // The restored array mirrors the original element for element.
      expect(restored[1]).assertEqual(2);
      expect(restored[6]).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_5700
     * @tc.name      testNumCollect0057
     * @tc.desc      Verify unique after flatten removes duplicates introduced by overlapping rows.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Overlapping rows flatten into a sequence carrying repeats.
      const rows: number[][] = [[1, 2], [2, 3], [3, 4]];
      const flat: number[] = CollectionUtils.flatten(rows);
      expect(flat.length).assertEqual(6);
      // Deduplication keeps the first appearance of every value.
      const distinct: number[] = CollectionUtils.unique(flat);
      expect(distinct.length).assertEqual(4);
      expect(distinct[0]).assertEqual(1);
      expect(distinct[3]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_5800
     * @tc.name      testNumCollect0058
     * @tc.desc      Verify containsAll succeeds against a cleaned duplicate-free numeric range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Clean a noisy range before checking containment.
      const raw: number[] = [10, 20, 10, 30, 20];
      const cleaned: number[] = CollectionUtils.removeDuplicates(raw);
      expect(cleaned.length).assertEqual(3);
      // The cleaned range contains all of its own values.
      expect(CollectionUtils.containsAll(cleaned, [10, 20, 30])).assertTrue();
      // A value outside the cleaned range still fails.
      expect(CollectionUtils.containsAll(cleaned, [10, 40])).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_5900
     * @tc.name      testNumCollect0059
     * @tc.desc      Verify isNotEmpty agrees with the length of a deduplicated result array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fully duplicated array still deduplicates to one entry.
      const raw: number[] = [9, 9, 9];
      const distinct: number[] = CollectionUtils.unique(raw);
      expect(distinct.length).assertEqual(1);
      expect(CollectionUtils.isNotEmpty(distinct)).assertTrue();
      expect(CollectionUtils.isEmpty(distinct)).assertFalse();
      // An empty source stays empty after deduplication.
      const blank: number[] = [];
      const blankDistinct: number[] = CollectionUtils.unique(blank);
      expect(CollectionUtils.isNotEmpty(blankDistinct)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_6000
     * @tc.name      testNumCollect0060
     * @tc.desc      Verify flatten restores the original array after a clamped zero-size chunk split.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero-size chunking isolates every element, flatten restores the order.
      const raw: number[] = [4, 5, 6];
      const chunks: number[][] = CollectionUtils.chunk(raw, 0);
      expect(chunks.length).assertEqual(3);
      const restored: number[] = CollectionUtils.flatten(chunks);
      expect(restored.length).assertEqual(3);
      expect(restored[0]).assertEqual(4);
      expect(restored[2]).assertEqual(6);
      // The restored order matches the original exactly.
      expect(restored[1]).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_6100
     * @tc.name      testNumCollect0061
     * @tc.desc      Verify containsAll fails for an empty source with any non-empty candidate list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty source cannot satisfy any real requirement.
      const blankSource: string[] = [];
      expect(CollectionUtils.containsAll(blankSource, ['anything'])).assertFalse();
      // The empty source still satisfies an empty requirement list.
      expect(CollectionUtils.containsAll(blankSource, [])).assertTrue();
      // Multiple requirements against the empty source fail as well.
      expect(CollectionUtils.containsAll(blankSource, ['a', 'b'])).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_6200
     * @tc.name      testNumCollect0062
     * @tc.desc      Verify unique on an empty array keeps the empty verdict while returning a fresh array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Deduplicating an empty array yields another empty array.
      const blank: string[] = [];
      const distinct: string[] = CollectionUtils.unique(blank);
      expect(distinct.length).assertEqual(0);
      expect(CollectionUtils.isEmpty(distinct)).assertTrue();
      // The fresh result array is not the same reference as the input.
      expect(distinct !== blank).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_6300
     * @tc.name      testNumCollect0063
     * @tc.desc      Verify flatten restores all grouped elements from a groupBy result map.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Group six values by parity, then collect every bucket into rows.
      const readings: number[] = [2, 3, 4, 5, 6, 7];
      const byParity: Map<string, number[]> =
        CollectionUtils.groupBy(readings, (value: number): string => (value % 2 === 0 ? 'even' : 'odd'));
      expect(byParity.size).assertEqual(2);
      // Pull each bucket into a row list and flatten it back together.
      const evens: number[] | undefined = byParity.get('even');
      const odds: number[] | undefined = byParity.get('odd');
      expect(evens === undefined).assertFalse();
      expect(odds === undefined).assertFalse();
      if (evens !== undefined && odds !== undefined) {
        const rows: number[][] = [evens, odds];
        const restored: number[] = CollectionUtils.flatten(rows);
        expect(restored.length).assertEqual(6);
        expect(restored[0]).assertEqual(2);
        expect(restored[5]).assertEqual(7);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_6400
     * @tc.name      testNumCollect0064
     * @tc.desc      Verify containsAll checks membership against a deduplicated chunk-joined source.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Deduplicate, chunk and flatten again to rebuild a clean source.
      const raw: number[] = [100, 200, 100, 300];
      const cleaned: number[] = CollectionUtils.removeDuplicates(raw);
      expect(cleaned.length).assertEqual(3);
      const chunks: number[][] = CollectionUtils.chunk(cleaned, 2);
      expect(chunks.length).assertEqual(2);
      const rebuilt: number[] = CollectionUtils.flatten(chunks);
      expect(rebuilt.length).assertEqual(3);
      // The rebuilt source still contains every cleaned value.
      expect(CollectionUtils.containsAll(rebuilt, [100, 200, 300])).assertTrue();
      expect(CollectionUtils.containsAll(rebuilt, [400])).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_6500
     * @tc.name      testNumCollect0065
     * @tc.desc      Verify chunk of a single-element array across multiple sizes always yields one chunk.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A one-element array chunks into one chunk for any positive size.
      const solo: number[] = [77];
      expect(CollectionUtils.chunk(solo, 1).length).assertEqual(1);
      expect(CollectionUtils.chunk(solo, 2).length).assertEqual(1);
      expect(CollectionUtils.chunk(solo, 50).length).assertEqual(1);
      // Even the clamped zero and negative sizes produce one chunk.
      expect(CollectionUtils.chunk(solo, 0).length).assertEqual(1);
      expect(CollectionUtils.chunk(solo, -3).length).assertEqual(1);
      // The single chunk always carries the lone element.
      const kept: number[][] = CollectionUtils.chunk(solo, 9);
      expect(kept[0][0]).assertEqual(77);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_6600
     * @tc.name      testNumCollect0066
     * @tc.desc      Verify groupBy with a constant key builds one bucket holding every element in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every value maps to the same constant key.
      const readings: number[] = [11, 22, 33, 44];
      const byConstant: Map<string, number[]> =
        CollectionUtils.groupBy(readings, (value: number): string => 'all');
      expect(byConstant.size).assertEqual(1);
      const bucket: number[] | undefined = byConstant.get('all');
      expect(bucket === undefined).assertFalse();
      if (bucket !== undefined) {
        expect(bucket.length).assertEqual(4);
        expect(bucket[0]).assertEqual(11);
        expect(bucket[3]).assertEqual(44);
      }
      // Other keys never appear in a constant grouping.
      expect(byConstant.get('none') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_6700
     * @tc.name      testNumCollect0067
     * @tc.desc      Verify emptiness helpers agree with the chunk result length across several sizes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chunking a four-element list by two yields two non-empty chunks.
      const readings: number[] = [12, 13, 14, 15];
      const chunks: number[][] = CollectionUtils.chunk(readings, 2);
      expect(chunks.length).assertEqual(2);
      expect(CollectionUtils.isNotEmpty(chunks)).assertTrue();
      expect(CollectionUtils.isEmpty(chunks)).assertFalse();
      // Every chunk itself is a non-empty numeric array.
      expect(CollectionUtils.isNotEmpty(chunks[0])).assertTrue();
      expect(CollectionUtils.isNotEmpty(chunks[1])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_6800
     * @tc.name      testNumCollect0068
     * @tc.desc      Verify unique after flatten skips rows of repeated values and keeps a stable order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Rows deliberately repeat values across and inside rows.
      const rows: number[][] = [[0, 0], [1], [0, 1, 2], []];
      const flat: number[] = CollectionUtils.flatten(rows);
      expect(flat.length).assertEqual(6);
      // First appearances are 0, 1 and 2 in that order.
      const distinct: number[] = CollectionUtils.unique(flat);
      expect(distinct.length).assertEqual(3);
      expect(distinct[0]).assertEqual(0);
      expect(distinct[1]).assertEqual(1);
      expect(distinct[2]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_COLLECT_6900
     * @tc.name      testNumCollect0069
     * @tc.desc      Verify the combined matrix of undefined sources, empty candidates and clamped chunk sizes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCollect0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCollect0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Containment with a missing source stays false for any candidate shape.
      expect(CollectionUtils.containsAll<string>(undefined, ['x'])).assertFalse();
      expect(CollectionUtils.containsAll<string>(undefined, [])).assertFalse();
      // A defined source with defined empty candidates always resolves.
      const pool: string[] = ['x', 'y'];
      expect(CollectionUtils.containsAll(pool, [])).assertTrue();
      // Clamped chunk sizes never change the total element count.
      const rebuiltFromZero: string[] = CollectionUtils.flatten(CollectionUtils.chunk(pool, 0));
      expect(rebuiltFromZero.length).assertEqual(2);
      expect(rebuiltFromZero[1]).assertEqual('y');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
