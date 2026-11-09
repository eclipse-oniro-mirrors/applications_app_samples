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
import { ObjectUtils } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;

/**
 * Local mirror of the metadata record consumed by ObjectUtils.
 * The HAR does not re-export the original interface, so the cases rely on the
 * identical structural shape built through this named local type.
 */
interface MetadataPair {
  key: string;
  value: string;
}

/** Placeholder rendered by toStringSafe and renderPairs for missing values. */
const UNKNOWN_TEXT: string = '[unknown]';
/** Separator rendered by renderPairs between two key value pairs. */
const PAIR_SEPARATOR: string = ', ';
/** Prefix rendered by renderPairs between the key and its value. */
const PAIR_PREFIX: string = ': ';

/**
 * Builds one metadata pair with explicit typing.
 * @param pairKey Key text of the pair.
 * @param pairValue Value text of the pair.
 * @returns The typed pair.
 */
function makePair(pairKey: string, pairValue: string): MetadataPair {
  const pair: MetadataPair = { key: pairKey, value: pairValue };
  return pair;
}

/**
 * Builds one record of the given length with deterministic content.
 * @param count Number of pairs inside the record.
 * @returns The typed record.
 */
function makeRecord(count: number): MetadataPair[] {
  const record: MetadataPair[] = [];
  for (let index: number = 0; index < count; index++) {
    record.push(makePair('key' + String(index), 'value' + String(index)));
  }
  return record;
}

/**
 * Registers the matrix cases of every ObjectUtils helper of the shared
 * library. All methods under test are pure static helpers without any
 * platform dependency, so no ability context is required.
 */
export default function objectUtilsMatrixTest() {
  describe('ObjectUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_0100
     * @tc.name      testObjMat0001
     * @tc.desc      Verify isNullish flags undefined and null as the only
     *               missing states accepted by the helper.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.isNullish(undefined)).assertTrue();
      expect(ObjectUtils.isNullish(null)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_0200
     * @tc.name      testObjMat0002
     * @tc.desc      Verify isNullish keeps a typed pair record, a string list
     *               and a date instance outside the missing states.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const pair: MetadataPair = makePair('k', 'v');
      expect(ObjectUtils.isNullish(pair)).assertFalse();
      const list: string[] = ['a'];
      expect(ObjectUtils.isNullish(list)).assertFalse();
      const stamp: Date = new Date(0);
      expect(ObjectUtils.isNullish(stamp)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_0300
     * @tc.name      testObjMat0003
     * @tc.desc      Verify keys extracts the keys of a populated record in
     *               the original record order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] = [makePair('alpha', '1'), makePair('beta', '2')];
      const keyList: string[] = ObjectUtils.keys(record);
      expect(keyList.length).assertEqual(2);
      expect(keyList[0]).assertEqual('alpha');
      expect(keyList[1]).assertEqual('beta');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_0400
     * @tc.name      testObjMat0004
     * @tc.desc      Verify keys degrades a missing record and an empty record
     *               to an empty key list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.keys(undefined).length).assertEqual(0);
      expect(ObjectUtils.keys(null).length).assertEqual(0);
      const empty: MetadataPair[] = [];
      expect(ObjectUtils.keys(empty).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_0500
     * @tc.name      testObjMat0005
     * @tc.desc      Verify size counts the entries of a populated record and
     *               reports zero for a missing record.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.size(makeRecord(3))).assertEqual(3);
      expect(ObjectUtils.size(makeRecord(1))).assertEqual(1);
      expect(ObjectUtils.size(undefined)).assertEqual(0);
      expect(ObjectUtils.size(null)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_0600
     * @tc.name      testObjMat0006
     * @tc.desc      Verify size and keys agree for every record length of a
     *               generated record matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let count: number = 1; count <= 5; count++) {
        const record: MetadataPair[] = makeRecord(count);
        expect(ObjectUtils.size(record)).assertEqual(count);
        expect(ObjectUtils.keys(record).length).assertEqual(count);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_0700
     * @tc.name      testObjMat0007
     * @tc.desc      Verify hasKey finds the first occurrence of an existing
     *               key inside a populated record.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] =
        [makePair('alpha', '1'), makePair('beta', '2'), makePair('gamma', '3')];
      expect(ObjectUtils.hasKey(record, 'alpha')).assertTrue();
      expect(ObjectUtils.hasKey(record, 'beta')).assertTrue();
      expect(ObjectUtils.hasKey(record, 'gamma')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_0800
     * @tc.name      testObjMat0008
     * @tc.desc      Verify hasKey rejects an absent key and degrades a
     *               missing record to a negative answer.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] = [makePair('alpha', '1')];
      expect(ObjectUtils.hasKey(record, 'beta')).assertFalse();
      expect(ObjectUtils.hasKey(record, '')).assertFalse();
      expect(ObjectUtils.hasKey(undefined, 'alpha')).assertFalse();
      expect(ObjectUtils.hasKey(null, 'alpha')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_0900
     * @tc.name      testObjMat0009
     * @tc.desc      Verify hasKey stays positive when the same key appears
     *               twice inside one record.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] =
        [makePair('dup', 'first'), makePair('dup', 'second'), makePair('solo', '3')];
      expect(ObjectUtils.hasKey(record, 'dup')).assertTrue();
      expect(ObjectUtils.hasKey(record, 'solo')).assertTrue();
      expect(ObjectUtils.keys(record).length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_1000
     * @tc.name      testObjMat0010
     * @tc.desc      Verify isEmptyObject treats a missing record and an empty
     *               record as empty and a populated record as not empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.isEmptyObject(undefined)).assertTrue();
      expect(ObjectUtils.isEmptyObject(null)).assertTrue();
      const empty: MetadataPair[] = [];
      expect(ObjectUtils.isEmptyObject(empty)).assertTrue();
      expect(ObjectUtils.isEmptyObject(makeRecord(1))).assertFalse();
      expect(ObjectUtils.isEmptyObject(makeRecord(4))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_1100
     * @tc.name      testObjMat0011
     * @tc.desc      Verify jsonEquals reports true for two records carrying
     *               identical pairs in the same order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: MetadataPair[] =
        [makePair('alpha', '1'), makePair('beta', '2')];
      const right: MetadataPair[] =
        [makePair('alpha', '1'), makePair('beta', '2')];
      expect(ObjectUtils.jsonEquals(left, right)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_1200
     * @tc.name      testObjMat0012
     * @tc.desc      Verify jsonEquals reports false for records of different
     *               lengths even when the shared prefix matches.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const short: MetadataPair[] = [makePair('alpha', '1')];
      const longer: MetadataPair[] =
        [makePair('alpha', '1'), makePair('beta', '2')];
      expect(ObjectUtils.jsonEquals(short, longer)).assertFalse();
      expect(ObjectUtils.jsonEquals(longer, short)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_1300
     * @tc.name      testObjMat0013
     * @tc.desc      Verify jsonEquals reports false when a key differs while
     *               every value stays identical.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: MetadataPair[] = [makePair('alpha', '1')];
      const right: MetadataPair[] = [makePair('alphax', '1')];
      expect(ObjectUtils.jsonEquals(left, right)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_1400
     * @tc.name      testObjMat0014
     * @tc.desc      Verify jsonEquals reports false when a value differs
     *               while every key stays identical.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: MetadataPair[] = [makePair('alpha', '1')];
      const right: MetadataPair[] = [makePair('alpha', '2')];
      expect(ObjectUtils.jsonEquals(left, right)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_1500
     * @tc.name      testObjMat0015
     * @tc.desc      Verify jsonEquals is order sensitive and reports false
     *               for the same pairs in a different order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: MetadataPair[] =
        [makePair('alpha', '1'), makePair('beta', '2')];
      const swapped: MetadataPair[] =
        [makePair('beta', '2'), makePair('alpha', '1')];
      expect(ObjectUtils.jsonEquals(left, swapped)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_1600
     * @tc.name      testObjMat0016
     * @tc.desc      Verify jsonEquals treats two missing records as equal
     *               regardless of the exact missing form of each side.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.jsonEquals(undefined, undefined)).assertTrue();
      expect(ObjectUtils.jsonEquals(null, null)).assertTrue();
      expect(ObjectUtils.jsonEquals(undefined, null)).assertTrue();
      const empty: MetadataPair[] = [];
      expect(ObjectUtils.jsonEquals(undefined, empty)).assertTrue();
      expect(ObjectUtils.jsonEquals(empty, null)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_1700
     * @tc.name      testObjMat0017
     * @tc.desc      Verify jsonEquals reports false when exactly one side is
     *               missing but the other side is populated.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] = makeRecord(1);
      expect(ObjectUtils.jsonEquals(record, undefined)).assertFalse();
      expect(ObjectUtils.jsonEquals(null, record)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_1800
     * @tc.name      testObjMat0018
     * @tc.desc      Verify jsonEquals reports true when both sides reference
     *               the very same record instance.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] = makeRecord(3);
      expect(ObjectUtils.jsonEquals(record, record)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_1900
     * @tc.name      testObjMat0019
     * @tc.desc      Verify toStringSafe hands a string value back unchanged
     *               including an empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.toStringSafe('text')).assertEqual('text');
      expect(ObjectUtils.toStringSafe('')).assertEqual('');
      expect(ObjectUtils.toStringSafe(' spaced ')).assertEqual(' spaced ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_2000
     * @tc.name      testObjMat0020
     * @tc.desc      Verify toStringSafe renders numbers through the decimal
     *               form including zero and negative fractions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.toStringSafe(0)).assertEqual('0');
      expect(ObjectUtils.toStringSafe(42)).assertEqual('42');
      expect(ObjectUtils.toStringSafe(-3.5)).assertEqual('-3.5');
      expect(ObjectUtils.toStringSafe(1.25)).assertEqual('1.25');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_2100
     * @tc.name      testObjMat0021
     * @tc.desc      Verify toStringSafe renders booleans through the
     *               lowercase literal form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.toStringSafe(true)).assertEqual('true');
      expect(ObjectUtils.toStringSafe(false)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_2200
     * @tc.name      testObjMat0022
     * @tc.desc      Verify toStringSafe degrades missing values to the
     *               unknown placeholder for undefined and null.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.toStringSafe(undefined)).assertEqual(UNKNOWN_TEXT);
      expect(ObjectUtils.toStringSafe(null)).assertEqual(UNKNOWN_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_2300
     * @tc.name      testObjMat0023
     * @tc.desc      Verify toStringSafe keeps the sentinel numbers NaN and
     *               infinity inside the decimal text form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjMat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjMat0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.toStringSafe(Number.NaN)).assertEqual('NaN');
      expect(ObjectUtils.toStringSafe(Number.POSITIVE_INFINITY))
        .assertEqual('Infinity');
      expect(ObjectUtils.toStringSafe(Number.NEGATIVE_INFINITY))
        .assertEqual('-Infinity');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_2400
     * @tc.name      testObjMat0024
     * @tc.desc      Verify defaultIfNullish hands the preferred value back
     *               unchanged when it is defined.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.defaultIfNullish('kept', 'fallback'))
        .assertEqual('kept');
      expect(ObjectUtils.defaultIfNullish('', 'fallback')).assertEqual('');
      expect(ObjectUtils.defaultIfNullish(' ', 'fallback')).assertEqual(' ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_2500
     * @tc.name      testObjMat0025
     * @tc.desc      Verify defaultIfNullish replaces undefined and null with
     *               the fallback text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.defaultIfNullish(undefined, 'fallback'))
        .assertEqual('fallback');
      expect(ObjectUtils.defaultIfNullish(null, 'fallback'))
        .assertEqual('fallback');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_2600
     * @tc.name      testObjMat0026
     * @tc.desc      Verify defaultIfNullish accepts an empty fallback and
     *               degrades a missing value to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.defaultIfNullish(undefined, '')).assertEqual('');
      expect(ObjectUtils.defaultIfNullish(null, '')).assertEqual('');
      expect(ObjectUtils.defaultIfNullish('value', '')).assertEqual('value');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_2700
     * @tc.name      testObjMat0027
     * @tc.desc      Verify renderPairs renders one pair as key, prefix and
     *               value joined into a single readable line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] = [makePair('alpha', '1')];
      expect(ObjectUtils.renderPairs(record))
        .assertEqual('alpha' + PAIR_PREFIX + '1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_2800
     * @tc.name      testObjMat0028
     * @tc.desc      Verify renderPairs joins several pairs with the comma
     *               separator while preserving the record order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] =
        [makePair('alpha', '1'), makePair('beta', '2'), makePair('gamma', '3')];
      expect(ObjectUtils.renderPairs(record)).assertEqual('alpha' + PAIR_PREFIX +
        '1' + PAIR_SEPARATOR + 'beta' + PAIR_PREFIX + '2' + PAIR_SEPARATOR +
        'gamma' + PAIR_PREFIX + '3');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_2900
     * @tc.name      testObjMat0029
     * @tc.desc      Verify renderPairs degrades a missing record and an empty
     *               record to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjMat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjMat0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.renderPairs(undefined)).assertEqual('');
      expect(ObjectUtils.renderPairs(null)).assertEqual('');
      const empty: MetadataPair[] = [];
      expect(ObjectUtils.renderPairs(empty)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_3000
     * @tc.name      testObjMat0030
     * @tc.desc      Verify renderPairs renders numeric and boolean values
     *               through the same safe text conversion as toStringSafe.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const numeric: MetadataPair[] = [makePair('count', '12')];
      expect(ObjectUtils.renderPairs(numeric))
        .assertEqual('count' + PAIR_PREFIX + '12');
      const flagged: MetadataPair[] = [makePair('enabled', 'true')];
      expect(ObjectUtils.renderPairs(flagged))
        .assertEqual('enabled' + PAIR_PREFIX + 'true');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_3100
     * @tc.name      testObjMat0031
     * @tc.desc      Verify renderPairs keeps long values and special
     *               characters inside the rendered line unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const longValue: string = 'a'.repeat(40);
      const record: MetadataPair[] = [makePair('long', longValue)];
      expect(ObjectUtils.renderPairs(record))
        .assertEqual('long' + PAIR_PREFIX + longValue);
      const special: MetadataPair[] = [makePair('sym', 'a-b_c.d/e')];
      expect(ObjectUtils.renderPairs(special))
        .assertEqual('sym' + PAIR_PREFIX + 'a-b_c.d/e');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_3200
     * @tc.name      testObjMat0032
     * @tc.desc      Verify keys, size and hasKey cooperate on a generated
     *               ten entry record without contradictions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] = makeRecord(10);
      expect(ObjectUtils.size(record)).assertEqual(10);
      const keyList: string[] = ObjectUtils.keys(record);
      expect(keyList.length).assertEqual(10);
      for (let index: number = 0; index < keyList.length; index++) {
        expect(ObjectUtils.hasKey(record, keyList[index])).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_3300
     * @tc.name      testObjMat0033
     * @tc.desc      Verify jsonEquals compares two generated records of the
     *               same content positively and a shifted copy negatively.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: MetadataPair[] = makeRecord(4);
      const right: MetadataPair[] = makeRecord(4);
      expect(ObjectUtils.jsonEquals(left, right)).assertTrue();
      const shifted: MetadataPair[] = makeRecord(4);
      shifted[3] = makePair('key3', 'changed');
      expect(ObjectUtils.jsonEquals(left, shifted)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_3400
     * @tc.name      testObjMat0034
     * @tc.desc      Verify toStringSafe renders the largest safe integer
     *               without losing a digit inside the text form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjMat0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjMat0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.toStringSafe(Number.MAX_SAFE_INTEGER))
        .assertEqual('9007199254740991');
      expect(ObjectUtils.toStringSafe(Number.MIN_SAFE_INTEGER))
        .assertEqual('-9007199254740991');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_3500
     * @tc.name      testObjMat0035
     * @tc.desc      Verify isEmptyObject and size agree for a matrix of
     *               record lengths from zero to three.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.isEmptyObject(makeRecord(0))).assertTrue();
      for (let count: number = 1; count <= 3; count++) {
        expect(ObjectUtils.isEmptyObject(makeRecord(count))).assertFalse();
        expect(ObjectUtils.size(makeRecord(count))).assertEqual(count);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_3600
     * @tc.name      testObjMat0036
     * @tc.desc      Verify isNullish and defaultIfNullish cooperate so only
     *               a nullish value picks up the fallback text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjMat0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjMat0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ObjectUtils.isNullish(undefined)).assertTrue();
      expect(ObjectUtils.defaultIfNullish(undefined, 'safe'))
        .assertEqual('safe');
      expect(ObjectUtils.isNullish(null)).assertTrue();
      expect(ObjectUtils.defaultIfNullish(null, 'safe')).assertEqual('safe');
      expect(ObjectUtils.isNullish('value')).assertFalse();
      expect(ObjectUtils.defaultIfNullish('value', 'safe'))
        .assertEqual('value');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_3700
     * @tc.name      testObjMat0037
     * @tc.desc      Verify renderPairs of a generated six entry record
     *               contains every key exactly once inside the line.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjMat0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjMat0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] = makeRecord(6);
      const rendered: string = ObjectUtils.renderPairs(record);
      expect(rendered.length > 0).assertTrue();
      for (let index: number = 0; index < record.length; index++) {
        const token: string = record[index].key + PAIR_PREFIX + record[index].value;
        expect(rendered.indexOf(token) >= 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_OBJMAT_3800
     * @tc.name      testObjMat0038
     * @tc.desc      Verify keys of a record built from makePair keeps the
     *               same order as the pair construction sequence.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjMat0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjMat0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const record: MetadataPair[] =
        [makePair('z', '1'), makePair('m', '2'), makePair('a', '3')];
      const keyList: string[] = ObjectUtils.keys(record);
      expect(keyList[0]).assertEqual('z');
      expect(keyList[1]).assertEqual('m');
      expect(keyList[2]).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
