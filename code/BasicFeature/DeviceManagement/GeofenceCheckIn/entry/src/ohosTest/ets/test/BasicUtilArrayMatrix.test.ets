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


import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BasicUtil } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_BASICARR]';

interface DedupCase {
  input: string;
  expected: string;
}

const DEDUP_CASES: DedupCase[] = [
  { input: 'a,b,a', expected: 'a,b' },
  { input: 'a,a,a', expected: 'a' },
  { input: 'a,b,c', expected: 'a,b,c' },
  { input: 'c,b,a,c', expected: 'c,b,a' },
  { input: 'a,b,a,b,a', expected: 'a,b' },
  { input: ',a', expected: ',a' },
  { input: 'a,,a', expected: 'a,' },
  { input: 'x,y,z,y,x', expected: 'x,y,z' },
  { input: '1,2,1,3', expected: '1,2,3' },
  { input: ',', expected: '' },
  { input: 'a,b,c,d,e,a', expected: 'a,b,c,d,e' },
  { input: 'z,z,y,y,x,x', expected: 'z,y,x' },
  { input: 'aa,a,aa', expected: 'aa,a' },
  { input: 'a,A,a', expected: 'a,A' },
  { input: '中,文,中', expected: '中,文' },
  { input: 'x,y,x,y,z', expected: 'x,y,z' },
];

interface JoinCase {
  input: string;
  separator: string;
  expected: string;
}

const JOIN_CASES: JoinCase[] = [
  { input: 'a,b,c', separator: '-', expected: 'a-b-c' },
  { input: 'a,,b', separator: '-', expected: 'a-b' },
  { input: ',,,', separator: '-', expected: '' },
  { input: 'a', separator: '-', expected: 'a' },
  { input: 'a,b', separator: '', expected: 'ab' },
  { input: 'a,b,c', separator: ', ', expected: 'a, b, c' },
  { input: ',a,', separator: '|', expected: 'a' },
  { input: 'x,y,z', separator: '/', expected: 'x/y/z' },
  { input: '中,文', separator: '-', expected: '中-文' },
  { input: ', ', separator: '-', expected: ' ' },
  { input: 'a,b,c,d', separator: '+', expected: 'a+b+c+d' },
  { input: 'a,,,b', separator: '-', expected: 'a-b' },
];

interface FlagCase {
  input: boolean;
  expected: number;
}

const FLAG_CASES: FlagCase[] = [
  { input: true, expected: 1 },
  { input: false, expected: 0 },
];

export default function basicUtilArrayMatrixTest() {
  describe('BasicUtilArrayMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilArrayMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'BasicUtilArrayMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICARR_0100
     * @tc.name      testRemoveDuplicates0001
     * @tc.desc      Verify removeDuplicates keeps first appearance order over comma encoded inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRemoveDuplicates0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRemoveDuplicates0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < DEDUP_CASES.length; i++) {
        const row: DedupCase = DEDUP_CASES[i];
        const values: string[] = row.input.split(',');
        const actual: string[] = BasicUtil.removeDuplicates(values);
        expect(actual.join(',')).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(DEDUP_CASES.length);
      expect(DEDUP_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dedup rows checked: ' + checked);
      expect(BasicUtil.removeDuplicates([]).length).assertEqual(0);
      expect(BasicUtil.removeDuplicates(['a', 'a']).length).assertEqual(1);
      expect(BasicUtil.removeDuplicates(['a', 'b'])[1]).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICARR_0200
     * @tc.name      testRemoveDuplicatesIdempotent0002
     * @tc.desc      Verify deduplicating an already unique list returns the same order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRemoveDuplicatesIdempotent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRemoveDuplicatesIdempotent0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['a', 'b', 'c', 'd', 'e', 'f'];
      const once: string[] = BasicUtil.removeDuplicates(source);
      const twice: string[] = BasicUtil.removeDuplicates(once);
      expect(once.length).assertEqual(6);
      expect(twice.length).assertEqual(6);
      for (let i = 0; i < once.length; i++) {
        expect(twice[i]).assertEqual(once[i]);
      }
      expect(source.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICARR_0300
     * @tc.name      testSafeJoin0003
     * @tc.desc      Verify safeJoin drops empty entries and uses the requested separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSafeJoin0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSafeJoin0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < JOIN_CASES.length; i++) {
        const row: JoinCase = JOIN_CASES[i];
        const values: string[] = row.input.split(',');
        expect(BasicUtil.safeJoin(values, row.separator)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(JOIN_CASES.length);
      expect(JOIN_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'join rows checked: ' + checked);
      expect(BasicUtil.safeJoin([], '-')).assertEqual('');
      expect(BasicUtil.safeJoin(['a'], '-')).assertEqual('a');
      expect(BasicUtil.safeJoin(['', ''], '-')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICARR_0400
     * @tc.name      testSafeJoinSeparators0004
     * @tc.desc      Verify safeJoin supports common separators without changing entry order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSafeJoinSeparators0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSafeJoinSeparators0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const separators: string[] = ['-', '_', '/', '|', ',', ';', ':', ' ', '+'];
      for (let i = 0; i < separators.length; i++) {
        const separator: string = separators[i];
        expect(BasicUtil.safeJoin(['a', 'b', 'c'], separator)).assertEqual('a' + separator + 'b' + separator + 'c');
      }
      expect(separators.length).assertEqual(9);
      expect(BasicUtil.safeJoin(['a', 'b'], '')).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICARR_0500
     * @tc.name      testBooleanToFlag0005
     * @tc.desc      Verify booleanToFlag maps booleans onto the one and zero convention.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBooleanToFlag0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBooleanToFlag0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < FLAG_CASES.length; i++) {
        const row: FlagCase = FLAG_CASES[i];
        expect(BasicUtil.booleanToFlag(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(FLAG_CASES.length);
      expect(FLAG_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'flag rows checked: ' + checked);
      expect(BasicUtil.booleanToFlag(true) + BasicUtil.booleanToFlag(false)).assertEqual(1);
      expect(BasicUtil.booleanToFlag(true) * 2).assertEqual(2);
      expect(BasicUtil.booleanToFlag(false) === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICARR_0600
     * @tc.name      testArrayOrderPreservation0006
     * @tc.desc      Verify deduplication never reorders entries and never mutates the input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayOrderPreservation0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayOrderPreservation0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string[] = ['z', 'a', 'z', 'b', 'a', 'c', 'b'];
      const actual: string[] = BasicUtil.removeDuplicates(source);
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('z');
      expect(actual[1]).assertEqual('a');
      expect(actual[2]).assertEqual('b');
      expect(actual[3]).assertEqual('c');
      expect(source.length).assertEqual(7);
      expect(source[0]).assertEqual('z');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICARR_0700
     * @tc.name      testArrayMixedContent0007
     * @tc.desc      Verify deduplication and joining handle mixed digits, letters and unicode entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMixedContent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMixedContent0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const mixed: string[] = ['1', 'a', '中', '1', '文', 'a'];
      const actual: string[] = BasicUtil.removeDuplicates(mixed);
      expect(actual.length).assertEqual(4);
      expect(actual[0]).assertEqual('1');
      expect(actual[1]).assertEqual('a');
      expect(actual[2]).assertEqual('中');
      expect(actual[3]).assertEqual('文');
      expect(BasicUtil.safeJoin(actual, '-')).assertEqual('1-a-中-文');
      expect(BasicUtil.safeJoin(mixed, '|')).assertEqual('1|a|中|1|文|a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_BASICARR_0800
     * @tc.name      testArrayLargeInput0008
     * @tc.desc      Verify deduplication and joining stay correct for a large generated list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayLargeInput0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayLargeInput0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const large: string[] = [];
      for (let i = 0; i < 120; i++) {
        large.push((i % 7).toString());
      }
      const actual: string[] = BasicUtil.removeDuplicates(large);
      expect(actual.length).assertEqual(7);
      expect(actual[0]).assertEqual('0');
      expect(actual[6]).assertEqual('6');
      expect(BasicUtil.safeJoin(actual, ',')).assertEqual('0,1,2,3,4,5,6');
      expect(large.length).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
