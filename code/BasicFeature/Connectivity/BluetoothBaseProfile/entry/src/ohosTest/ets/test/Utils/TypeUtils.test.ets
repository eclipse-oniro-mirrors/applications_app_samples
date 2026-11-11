/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { TypeUtils } from 'library';

/**
 * Test suite for TypeUtils.
 * @since 26.0.0
 */
export default function typeUtilsTest(): void {
  describe('TypeUtilsTest', () => {
    // ==================== 类型判定（6 条） ====================

    /*
     * @tc.number: SUB_TYPE_UTILS_0100
     * @tc.name: testTypeUtils0001
     * @tc.desc: Recognise string values and reject other primitives.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0001', 0, () => {
      expect(TypeUtils.isString('Headset')).assertTrue();
      expect(TypeUtils.isString('')).assertTrue();
      expect(TypeUtils.isString(12)).assertFalse();
      expect(TypeUtils.isString(null)).assertFalse();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_0200
     * @tc.name: testTypeUtils0002
     * @tc.desc: Reject text and NaN while accepting every finite number.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0002', 0, () => {
      expect(TypeUtils.isNumber(0)).assertTrue();
      expect(TypeUtils.isNumber(-1.5)).assertTrue();
      expect(TypeUtils.isNumber('1')).assertFalse();
      expect(TypeUtils.isNumber(Number.NaN)).assertFalse();
      expect(TypeUtils.isNumber(Number.POSITIVE_INFINITY)).assertTrue();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_0300
     * @tc.name: testTypeUtils0003
     * @tc.desc: Distinguish real booleans from their textual counterparts.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0003', 0, () => {
      expect(TypeUtils.isBoolean(true)).assertTrue();
      expect(TypeUtils.isBoolean(false)).assertTrue();
      expect(TypeUtils.isBoolean('true')).assertFalse();
      expect(TypeUtils.isBoolean(0)).assertFalse();
      expect(TypeUtils.isBoolean(null)).assertFalse();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_0400
     * @tc.name: testTypeUtils0004
     * @tc.desc: Identify arrays including the empty array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0004', 0, () => {
      const names: string[] = ['A2dp', 'Hfp'];
      const empty: number[] = [];
      expect(TypeUtils.isArray(names)).assertTrue();
      expect(TypeUtils.isArray(empty)).assertTrue();
      expect(TypeUtils.isArray('A2dp')).assertFalse();
      expect(TypeUtils.isArray(null)).assertFalse();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_0500
     * @tc.name: testTypeUtils0005
     * @tc.desc: Exclude null and arrays from the object classification.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTypeUtils0005', 0, () => {
      const record: Record<string, number> = { 'rssi': -60 };
      const list: number[] = [1];
      expect(TypeUtils.isObject(record)).assertTrue();
      expect(TypeUtils.isObject(list)).assertFalse();
      expect(TypeUtils.isObject(null)).assertFalse();
      expect(TypeUtils.isObject('text')).assertFalse();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_0600
     * @tc.name: testTypeUtils0006
     * @tc.desc: Detect callable values and treat null as non callable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTypeUtils0006', 0, () => {
      const handler: () => void = (): void => {};
      expect(TypeUtils.isFunction(handler)).assertTrue();
      expect(TypeUtils.isFunction('handler')).assertFalse();
      expect(TypeUtils.isFunction(null)).assertFalse();
      expect(TypeUtils.isFunction(undefined)).assertFalse();
    });

    // ==================== 空值判定（3 条） ====================

    /*
     * @tc.number: SUB_TYPE_UTILS_0700
     * @tc.name: testTypeUtils0007
     * @tc.desc: Flag only null and undefined as absent references.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0007', 0, () => {
      expect(TypeUtils.isNullOrUndefined(null)).assertTrue();
      expect(TypeUtils.isNullOrUndefined(undefined)).assertTrue();
      expect(TypeUtils.isNullOrUndefined(0)).assertFalse();
      expect(TypeUtils.isNullOrUndefined('')).assertFalse();
      expect(TypeUtils.isNullOrUndefined(false)).assertFalse();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_0800
     * @tc.name: testTypeUtils0008
     * @tc.desc: Treat empty text as empty but keep zero as content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0008', 0, () => {
      expect(TypeUtils.isEmpty('')).assertTrue();
      expect(TypeUtils.isEmpty('a')).assertFalse();
      expect(TypeUtils.isEmpty(0)).assertFalse();
      expect(TypeUtils.isEmpty(false)).assertFalse();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_0900
     * @tc.name: testTypeUtils0009
     * @tc.desc: Report emptiness for empty collections and filled ones otherwise.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTypeUtils0009', 0, () => {
      const emptyList: number[] = [];
      const filledList: number[] = [0];
      const emptyRecord: Record<string, number> = {};
      const filledRecord: Record<string, number> = { 'count': 0 };
      expect(TypeUtils.isEmpty(emptyList)).assertTrue();
      expect(TypeUtils.isEmpty(filledList)).assertFalse();
      expect(TypeUtils.isEmpty(emptyRecord)).assertTrue();
      expect(TypeUtils.isEmpty(filledRecord)).assertFalse();
      expect(TypeUtils.isEmpty(null)).assertTrue();
    });

    // ==================== 数值与布尔转换（4 条） ====================

    /*
     * @tc.number: SUB_TYPE_UTILS_1000
     * @tc.name: testTypeUtils0010
     * @tc.desc: Convert numeric text including decimals and surrounding spaces.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0010', 0, () => {
      expect(TypeUtils.toNumber('42')).assertEqual(42);
      expect(TypeUtils.toNumber('12.5')).assertEqual(12.5);
      expect(TypeUtils.toNumber('  8  ')).assertEqual(8);
      expect(TypeUtils.toNumber('-3')).assertEqual(-3);
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_1100
     * @tc.name: testTypeUtils0011
     * @tc.desc: Fall back to the requested default for unparsable text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTypeUtils0011', 0, () => {
      expect(TypeUtils.toNumber('abc')).assertEqual(0);
      expect(TypeUtils.toNumber('abc', -1)).assertEqual(-1);
      expect(TypeUtils.toNumber('', 7)).assertEqual(0);
      expect(TypeUtils.toNumber('0x10')).assertEqual(16);
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_1200
     * @tc.name: testTypeUtils0012
     * @tc.desc: Accept true, one and yes in any letter case as positive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0012', 0, () => {
      expect(TypeUtils.toBoolean('true')).assertTrue();
      expect(TypeUtils.toBoolean('TRUE')).assertTrue();
      expect(TypeUtils.toBoolean('1')).assertTrue();
      expect(TypeUtils.toBoolean('Yes')).assertTrue();
      expect(TypeUtils.toBoolean(true)).assertTrue();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_1300
     * @tc.name: testTypeUtils0013
     * @tc.desc: Reject other text, zero and non scalar values as negative.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTypeUtils0013', 0, () => {
      expect(TypeUtils.toBoolean('false')).assertFalse();
      expect(TypeUtils.toBoolean('0')).assertFalse();
      expect(TypeUtils.toBoolean('no')).assertFalse();
      expect(TypeUtils.toBoolean(0)).assertFalse();
      expect(TypeUtils.toBoolean(-1)).assertTrue();
      expect(TypeUtils.toBoolean(null)).assertFalse();
    });

    // ==================== 字符串转换（2 条） ====================

    /*
     * @tc.number: SUB_TYPE_UTILS_1400
     * @tc.name: testTypeUtils0014
     * @tc.desc: Pass strings through and stringify scalars without changes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0014', 0, () => {
      expect(TypeUtils.toString('Headset')).assertEqual('Headset');
      expect(TypeUtils.toString(12)).assertEqual('12');
      expect(TypeUtils.toString(true)).assertEqual('true');
      expect(TypeUtils.toString('')).assertEqual('');
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_1500
     * @tc.name: testTypeUtils0015
     * @tc.desc: Substitute the default when the value is absent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTypeUtils0015', 0, () => {
      expect(TypeUtils.toString(null, 'n/a')).assertEqual('n/a');
      expect(TypeUtils.toString(undefined, 'n/a')).assertEqual('n/a');
      expect(TypeUtils.toString(null)).assertEqual('');
      expect(TypeUtils.toString(undefined, '')).assertEqual('');
    });

    // ==================== 深拷贝（3 条） ====================

    /*
     * @tc.number: SUB_TYPE_UTILS_1600
     * @tc.name: testTypeUtils0016
     * @tc.desc: Return scalar and null inputs from the clone untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0016', 0, () => {
      const missing: Record<string, number> | null = null;
      expect(TypeUtils.deepClone<number>(5)).assertEqual(5);
      expect(TypeUtils.deepClone<string>('x')).assertEqual('x');
      expect(TypeUtils.deepClone<boolean>(false)).assertFalse();
      expect(TypeUtils.deepClone<Record<string, number> | null>(missing)).assertNull();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_1700
     * @tc.name: testTypeUtils0017
     * @tc.desc: Detach the cloned record from later writes to the original.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0017', 0, () => {
      const source: Record<string, number> = { 'count': 2, 'total': 8 };
      const copy: Record<string, number> = TypeUtils.deepClone<Record<string, number>>(source);
      expect(copy.count).assertEqual(2);
      expect(copy.total).assertEqual(8);
      copy.count = 9;
      expect(source.count).assertEqual(2);
      expect(copy !== source).assertTrue();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_1800
     * @tc.name: testTypeUtils0018
     * @tc.desc: Copy nested arrays into independent inner containers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTypeUtils0018', 0, () => {
      const rows: number[][] = [[1, 2], [3]];
      const copy: number[][] = TypeUtils.deepClone<number[][]>(rows);
      expect(copy.length).assertEqual(2);
      expect(copy[0][1]).assertEqual(2);
      copy[0][0] = 100;
      expect(rows[0][0]).assertEqual(1);
      expect(TypeUtils.deepEquals(rows, copy)).assertFalse();
    });

    // ==================== 深度相等（4 条） ====================

    /*
     * @tc.number: SUB_TYPE_UTILS_1900
     * @tc.name: testTypeUtils0019
     * @tc.desc: Compare primitives by identity and reject type mismatches.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0019', 0, () => {
      expect(TypeUtils.deepEquals(1, 1)).assertTrue();
      expect(TypeUtils.deepEquals('a', 'a')).assertTrue();
      expect(TypeUtils.deepEquals(1, '1')).assertFalse();
      expect(TypeUtils.deepEquals(Number.NaN, Number.NaN)).assertFalse();
      expect(TypeUtils.deepEquals(undefined, undefined)).assertTrue();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_2000
     * @tc.name: testTypeUtils0020
     * @tc.desc: Match objects that carry identical keys and values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0020', 0, () => {
      const left: Record<string, number> = { 'rssi': -60, 'battery': 80 };
      const right: Record<string, number> = { 'rssi': -60, 'battery': 80 };
      expect(TypeUtils.deepEquals(left, right)).assertTrue();
      expect(TypeUtils.deepEquals(left, left)).assertTrue();
      right.battery = 70;
      expect(TypeUtils.deepEquals(left, right)).assertFalse();
      expect(TypeUtils.deepEquals(left, null)).assertFalse();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_2100
     * @tc.name: testTypeUtils0021
     * @tc.desc: Reject records that differ only by an extra key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTypeUtils0021', 0, () => {
      const two: Record<string, number> = { 'a': 1, 'b': 2 };
      const three: Record<string, number> = { 'a': 1, 'b': 2, 'c': 3 };
      const none: Record<string, number> = {};
      const other: Record<string, number> = {};
      expect(TypeUtils.deepEquals(two, three)).assertFalse();
      expect(TypeUtils.deepEquals(none, two)).assertFalse();
      expect(TypeUtils.deepEquals(none, other)).assertTrue();
      expect(TypeUtils.deepEquals(three, undefined)).assertFalse();
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_2200
     * @tc.name: testTypeUtils0022
     * @tc.desc: Walk nested arrays and objects while comparing values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTypeUtils0022', 0, () => {
      const rows: number[][] = [[1, 2], [3]];
      const sameRows: number[][] = [[1, 2], [3]];
      const otherRows: number[][] = [[1, 2], [4]];
      const longer: number[] = [1, 2, 3];
      const shorter: number[] = [1, 2];
      expect(TypeUtils.deepEquals(rows, sameRows)).assertTrue();
      expect(TypeUtils.deepEquals(rows, otherRows)).assertFalse();
      expect(TypeUtils.deepEquals(shorter, longer)).assertFalse();
      expect(TypeUtils.deepEquals(sameRows, otherRows)).assertFalse();
    });

    // ==================== 类型名称（2 条） ====================

    /*
     * @tc.number: SUB_TYPE_UTILS_2300
     * @tc.name: testTypeUtils0023
     * @tc.desc: Name the nullish values and arrays distinctly from objects.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0023', 0, () => {
      const list: string[] = [];
      const record: Record<string, number> = { 'a': 1 };
      expect(TypeUtils.getTypeName(null)).assertEqual('null');
      expect(TypeUtils.getTypeName(undefined)).assertEqual('undefined');
      expect(TypeUtils.getTypeName(list)).assertEqual('array');
      expect(TypeUtils.getTypeName(record)).assertEqual('object');
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_2400
     * @tc.name: testTypeUtils0024
     * @tc.desc: Report the JavaScript type name of every scalar value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0024', 0, () => {
      const handler: () => void = (): void => {};
      expect(TypeUtils.getTypeName('Headset')).assertEqual('string');
      expect(TypeUtils.getTypeName(12)).assertEqual('number');
      expect(TypeUtils.getTypeName(true)).assertEqual('boolean');
      expect(TypeUtils.getTypeName(handler)).assertEqual('function');
    });

    // ==================== JSON 安全解析（2 条） ====================

    /*
     * @tc.number: SUB_TYPE_UTILS_2500
     * @tc.name: testTypeUtils0025
     * @tc.desc: Parse object and array payloads into their typed shapes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testTypeUtils0025', 0, () => {
      const fallback: Record<string, number> = { 'count': 0 };
      const parsed: Record<string, number> = TypeUtils.safeParseJson<Record<string, number>>('{"count":3}', fallback);
      expect(parsed.count).assertEqual(3);
      const list: number[] = TypeUtils.safeParseJson<number[]>('[1,2,3]', []);
      expect(list.length).assertEqual(3);
      expect(list[2]).assertEqual(3);
      const scalar: number = TypeUtils.safeParseJson<number>('7', 0);
      expect(scalar).assertEqual(7);
    });

    /*
     * @tc.number: SUB_TYPE_UTILS_2600
     * @tc.name: testTypeUtils0026
     * @tc.desc: Keep the default value when the payload cannot be parsed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testTypeUtils0026', 0, () => {
      const fallback: number = 42;
      expect(TypeUtils.safeParseJson<number>('not-json', fallback)).assertEqual(42);
      expect(TypeUtils.safeParseJson<number>('', fallback)).assertEqual(42);
      expect(TypeUtils.safeParseJson<number>('{', fallback)).assertEqual(42);
      expect(TypeUtils.safeParseJson<number>('null', fallback)).assertNull();
    });
  });
}
