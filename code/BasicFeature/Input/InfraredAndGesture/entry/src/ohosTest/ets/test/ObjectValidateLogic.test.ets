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
import { ObjectUtils, ValidateUtils } from 'common';
import { TextFixtureFactory, FlagCase, LengthRangeCase } from './helper/TextFixtureFactory';

/**
 * ObjectUtils + ValidateUtils 逻辑套件：覆盖 common HAR 中对象工具类的 6 个
 * 静态方法与校验工具类的 7 个静态方法。
 *
 * 覆盖策略：
 * - ObjectUtils 用 interface 声明的数据载体（SimpleBox / PairBox / OuterBox /
 *   EmptyBox）和 LinkNode 类构造循环引用，逐条验证 null / undefined / 零值 /
 *   空容器 / 深拷贝 / JSON 比较的分支。
 * - ValidateUtils 的 6 个正则/数值校验一律遍历 TextFixtureFactory 的夹具，
 *   逐条 expect(...).assertEqual(case.expected)，并对夹具做正反集合校验。
 * - isPortNumber 单独覆盖 0 / 65535 / 65536 / -1 / 1.5 / NaN 六种边界输入。
 *
 * 明确不覆盖的分支：
 * - ObjectUtils.stringify 的 JSON.stringify 抛错分支只通过 deepClone 侧覆盖
 *   （deepClone 循环引用返回 null），stringify 的循环引用分支因为返回空串会
 *   掩盖「空串」与「失败」的差异，不单独断言其日志副作用。
 * - 各方法内部的 AppLogger.warn 日志落盘行为不校验，只校验返回值。
 * - ValidateUtils.isPositiveInteger 的大数精度（超出安全整数范围）不在夹具
 *   范围内，故不覆盖。
 */

/** Hilog domain reserved for the object and validation logic suite. */
const DOMAIN: number = 0xF824;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_ObjectValidate_';
/** Highest valid TCP/UDP port number. */
const MAX_PORT: number = 65535;
/** First invalid port number right above the legal range. */
const OVER_MAX_PORT: number = 65536;
/** Sentinel used by the getOrDefault cases. */
const DEFAULT_NUMBER: number = -1;
/** Default label used by the getOrDefault cases. */
const DEFAULT_TEXT: string = 'none';
/** Fallback count sentinel used by the getOrDefault cases. */
const FALLBACK_COUNT: number = 999;
/** Lowest valid TCP/UDP port number. */
const MIN_PORT: number = 0;
/** Fractional port number rejected by isPortNumber. */
const FRACTIONAL_PORT: number = 1.5;
/** Expected own key count of a PairBox instance. */
const PAIR_KEY_COUNT: number = 2;

/** Empty data carrier used to probe empty-object handling. */
interface EmptyBox {
}

/** Simple data carrier used to probe object utilities. */
interface SimpleBox {
  name: string;
  count: number;
}

/** Two field carrier used to probe key-order sensitive comparison. */
interface PairBox {
  a: number;
  b: number;
}

/** Nested carrier used to probe deep clone of inner objects. */
interface OuterBox {
  label: string;
  inner: SimpleBox;
}

/** List carrier used to probe deep clone of arrays inside objects. */
interface ListBox {
  title: string;
  items: string[];
  flags: boolean[];
}

/** Node type used to build a circular reference on purpose. */
class LinkNode {
  public value: number = 0;
  public next: LinkNode | null = null;
}

/** 构造一个固定的 SimpleBox 实例。 */
function makeSimpleBox(name: string, count: number): SimpleBox {
  const box: SimpleBox = { name: name, count: count };
  return box;
}

/** 构造一个固定的 PairBox 实例。 */
function makePairBox(a: number, b: number): PairBox {
  const box: PairBox = { a: a, b: b };
  return box;
}

/** 构造一个嵌套两层的数据载体。 */
function makeOuterBox(label: string, name: string, count: number): OuterBox {
  const outer: OuterBox = { label: label, inner: makeSimpleBox(name, count) };
  return outer;
}

/** 构造一个两节点的循环引用链，返回头节点。 */
function makeCircularChain(): LinkNode {
  const head: LinkNode = new LinkNode();
  head.value = 1;
  const tail: LinkNode = new LinkNode();
  tail.value = 2;
  head.next = tail;
  tail.next = head;
  return head;
}

/** 造一个空载体实例，用于覆盖「无字段对象」判定。 */
function makeEmptyBox(): EmptyBox {
  const box: EmptyBox = {};
  return box;
}

/** 造一个回退数组，用于验证 getOrDefault 收到空数组时不回退。 */
function buildFallbackList(): string[] {
  const list: string[] = [];
  list.push('fallback');
  return list;
}

/** 从长度区间夹具里筛出「边界本身非法」的用例。 */
function lengthCasesWithInvalidBounds(cases: LengthRangeCase[]): LengthRangeCase[] {
  const result: LengthRangeCase[] = [];
  for (const item of cases) {
    if (item.invalidBounds) {
      result.push(item);
    }
  }
  return result;
}

/** 按 label 在校验夹具里查一条用例，查不到返回 null。 */
function flagByLabel(cases: FlagCase[], label: string): FlagCase | null {
  for (const item of cases) {
    if (item.label === label) {
      return item;
    }
  }
  return null;
}

/** 按 label 在长度区间夹具里查一条用例，查不到返回 null。 */
function lengthByLabel(cases: LengthRangeCase[], label: string): LengthRangeCase | null {
  for (const item of cases) {
    if (item.label === label) {
      return item;
    }
  }
  return null;
}

export default function objectValidateLogicTest() {
  describe('ObjectValidateLogicTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0100
     * @tc.name      testObjectValidate0001
     * @tc.desc      Verify hasValue rejects null and undefined but accepts every primitive including zero and empty text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.hasValue(null)).assertFalse();
      expect(ObjectUtils.hasValue(undefined)).assertFalse();
      expect(ObjectUtils.hasValue(0)).assertTrue();
      expect(ObjectUtils.hasValue('')).assertTrue();
      expect(ObjectUtils.hasValue(false)).assertTrue();
      expect(ObjectUtils.hasValue('a')).assertTrue();
      expect(ObjectUtils.hasValue(1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0101
     * @tc.name      testObjectValidate0002
     * @tc.desc      Verify getOrDefault returns the input itself for 0, empty text, non-empty text and an empty array, because those inputs are present.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.getOrDefault(0, DEFAULT_NUMBER)).assertEqual(0);
      expect(ObjectUtils.getOrDefault('', DEFAULT_TEXT)).assertEqual('');
      expect(ObjectUtils.getOrDefault('room', DEFAULT_TEXT)).assertEqual('room');
      const emptyList: string[] = [];
      const fallbackList: string[] = ['fallback'];
      const resolvedList: string[] = ObjectUtils.getOrDefault(emptyList, fallbackList);
      expect(resolvedList.length).assertEqual(0);
      expect(resolvedList).assertEqual(emptyList);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0102
     * @tc.name      testObjectValidate0003
     * @tc.desc      Verify getOrDefault falls back only for missing numbers and keeps every present number untouched.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.getOrDefault(null, DEFAULT_NUMBER)).assertEqual(DEFAULT_NUMBER);
      expect(ObjectUtils.getOrDefault(undefined, DEFAULT_NUMBER)).assertEqual(DEFAULT_NUMBER);
      expect(ObjectUtils.getOrDefault(7, DEFAULT_NUMBER)).assertEqual(7);
      expect(ObjectUtils.getOrDefault(-7, DEFAULT_NUMBER)).assertEqual(-7);
      expect(ObjectUtils.getOrDefault(0, DEFAULT_NUMBER) !== DEFAULT_NUMBER).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0103
     * @tc.name      testObjectValidate0004
     * @tc.desc      Verify getOrDefault falls back only for missing text and keeps empty text distinct from the default.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.getOrDefault(null, DEFAULT_TEXT)).assertEqual(DEFAULT_TEXT);
      expect(ObjectUtils.getOrDefault(undefined, DEFAULT_TEXT)).assertEqual(DEFAULT_TEXT);
      expect(ObjectUtils.getOrDefault('', DEFAULT_TEXT)).assertEqual('');
      expect(ObjectUtils.getOrDefault('', DEFAULT_TEXT) !== DEFAULT_TEXT).assertTrue();
      expect(ObjectUtils.getOrDefault('a', DEFAULT_TEXT)).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0104
     * @tc.name      testObjectValidate0005
     * @tc.desc      Verify isEmptyObject treats an empty carrier, null and undefined as empty objects.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const empty: EmptyBox = {};
      expect(ObjectUtils.isEmptyObject(empty)).assertTrue();
      expect(ObjectUtils.isEmptyObject(null)).assertTrue();
      expect(ObjectUtils.isEmptyObject(undefined)).assertTrue();
      expect(ObjectUtils.isEmptyObject({} as EmptyBox)).assertTrue();
      expect(Object.keys(empty).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0105
     * @tc.name      testObjectValidate0006
     * @tc.desc      Verify isEmptyObject reports false for carriers that own at least one field.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const simple: SimpleBox = makeSimpleBox('room', 1);
      const pair: PairBox = makePairBox(1, 2);
      expect(ObjectUtils.isEmptyObject(simple)).assertFalse();
      expect(ObjectUtils.isEmptyObject(pair)).assertFalse();
      expect(Object.keys(simple).length).assertEqual(PAIR_KEY_COUNT);
      expect(Object.keys(pair).length).assertEqual(PAIR_KEY_COUNT);
      expect(ObjectUtils.isEmptyObject(makeSimpleBox('', 0))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0106
     * @tc.name      testObjectValidate0007
     * @tc.desc      Verify stringify serialises data carriers and returns an empty string for missing input.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.stringify(null)).assertEqual('');
      expect(ObjectUtils.stringify(undefined)).assertEqual('');
      const simple: SimpleBox = makeSimpleBox('room', 2);
      const text: string = ObjectUtils.stringify(simple);
      expect(text.length > 0).assertTrue();
      expect(text.includes('room')).assertTrue();
      expect(text.includes('2')).assertTrue();
      expect(text.startsWith('{')).assertTrue();
      expect(text.endsWith('}')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0107
     * @tc.name      testObjectValidate0008
     * @tc.desc      Verify stringify keeps nested carriers and empty carriers serialisable.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const outer: OuterBox = makeOuterBox('hall', 'lamp', 3);
      const text: string = ObjectUtils.stringify(outer);
      expect(text.includes('hall')).assertTrue();
      expect(text.includes('lamp')).assertTrue();
      expect(text.includes('inner')).assertTrue();
      expect(ObjectUtils.stringify({} as EmptyBox)).assertEqual('{}');
      expect(ObjectUtils.stringify(makeSimpleBox('', 0)).includes('"name":""')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0108
     * @tc.name      testObjectValidate0009
     * @tc.desc      Verify deepClone produces an equal but independent copy for a flat carrier.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: SimpleBox = makeSimpleBox('room', 5);
      const copy: SimpleBox | null = ObjectUtils.deepClone(source);
      expect(copy !== null).assertTrue();
      if (copy !== null) {
        expect(copy.name).assertEqual(source.name);
        expect(copy.count).assertEqual(source.count);
        expect(copy === source).assertFalse();
        expect(ObjectUtils.deepEqualsByJson(copy, source)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0109
     * @tc.name      testObjectValidate0010
     * @tc.desc      Verify changing the cloned inner carrier does not affect the original nested carrier.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: OuterBox = makeOuterBox('hall', 'lamp', 3);
      const copy: OuterBox | null = ObjectUtils.deepClone(source);
      expect(copy !== null).assertTrue();
      if (copy !== null) {
        copy.inner.name = 'changed';
        copy.inner.count = 99;
        copy.label = 'changed';
        expect(source.inner.name).assertEqual('lamp');
        expect(source.inner.count).assertEqual(3);
        expect(source.label).assertEqual('hall');
        expect(copy.inner.name).assertEqual('changed');
        expect(copy.inner === source.inner).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0110
     * @tc.name      testObjectValidate0011
     * @tc.desc      Verify changing the cloned primitive field does not affect the original flat carrier.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: SimpleBox = makeSimpleBox('room', 1);
      const copy: SimpleBox | null = ObjectUtils.deepClone(source);
      expect(copy !== null).assertTrue();
      if (copy !== null) {
        copy.name = 'other';
        copy.count = 2;
        expect(source.name).assertEqual('room');
        expect(source.count).assertEqual(1);
        expect(ObjectUtils.deepEqualsByJson(source, copy)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0111
     * @tc.name      testObjectValidate0012
     * @tc.desc      Verify a circular reference makes deepClone return null instead of throwing.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const head: LinkNode = makeCircularChain();
      const copy: LinkNode | null = ObjectUtils.deepClone(head);
      expect(copy).assertNull();
      expect(copy === null).assertTrue();
      expect(head.next !== null).assertTrue();
      expect(ObjectUtils.stringify(head)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0112
     * @tc.name      testObjectValidate0013
     * @tc.desc      Verify deepClone keeps array contents independent from the original list carrier.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const items: string[] = ['a', 'b'];
      const flags: boolean[] = [true, false];
      const source: ListBox = { title: 'list', items: items, flags: flags };
      const copy: ListBox | null = ObjectUtils.deepClone(source);
      expect(copy !== null).assertTrue();
      if (copy !== null) {
        copy.items.push('c');
        copy.flags.push(true);
        expect(source.items.length).assertEqual(2);
        expect(source.flags.length).assertEqual(2);
        expect(copy.items.length).assertEqual(3);
        expect(copy.items[0]).assertEqual('a');
        expect(copy.flags[2]).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0113
     * @tc.name      testObjectValidate0014
     * @tc.desc      Verify deepEqualsByJson accepts the same reference and rejects a different reference with another value.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: SimpleBox = makeSimpleBox('room', 1);
      expect(ObjectUtils.deepEqualsByJson(first, first)).assertTrue();
      const second: SimpleBox = makeSimpleBox('room', 2);
      expect(ObjectUtils.deepEqualsByJson(first, second)).assertFalse();
      const third: SimpleBox = makeSimpleBox('room', 1);
      expect(ObjectUtils.deepEqualsByJson(first, third)).assertTrue();
      expect(first === third).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0114
     * @tc.name      testObjectValidate0015
     * @tc.desc      Verify deepEqualsByJson treats two equal PairBox values as equal, and that stringify emits the fields in declaration order, so the output differs from the reordered literal of the same length.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const forward: PairBox = makePairBox(1, 2);
      const sameOrder: PairBox = makePairBox(1, 2);
      const otherOrderJson: string = '{"b":2,"a":1}';
      expect(ObjectUtils.deepEqualsByJson(forward, sameOrder)).assertTrue();
      expect(ObjectUtils.stringify(forward) === otherOrderJson).assertFalse();
      expect(ObjectUtils.stringify(forward)).assertEqual('{"a":1,"b":2}');
      expect(ObjectUtils.stringify(forward).length).assertEqual(otherOrderJson.length);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0115
     * @tc.name      testObjectValidate0016
     * @tc.desc      Verify deepEqualsByJson treats two missing values as equal and a missing value against an object as unequal.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.deepEqualsByJson(null, null)).assertTrue();
      expect(ObjectUtils.deepEqualsByJson(undefined, undefined)).assertTrue();
      const box: SimpleBox = makeSimpleBox('room', 1);
      expect(ObjectUtils.deepEqualsByJson(null, box)).assertFalse();
      expect(ObjectUtils.deepEqualsByJson(undefined, box)).assertFalse();
      expect(ObjectUtils.deepEqualsByJson(null, undefined)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0116
     * @tc.name      testObjectValidate0017
     * @tc.desc      Verify isEmail accepts every legal fixture and rejects every illegal fixture.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.emailCases();
      for (const item of cases) {
        expect(ValidateUtils.isEmail(item.value)).assertEqual(item.expected);
      }
      expect(ValidateUtils.isEmail(null)).assertFalse();
      expect(ValidateUtils.isEmail(undefined)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0117
     * @tc.name      testObjectValidate0018
     * @tc.desc      Verify isEmail rejects malformed local parts and short or numeric top level domains.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.emailCases();
      const noAt: FlagCase | null = flagByLabel(cases, 'no-at');
      const noDomain: FlagCase | null = flagByLabel(cases, 'no-domain');
      const noLocal: FlagCase | null = flagByLabel(cases, 'no-local');
      const doubleAt: FlagCase | null = flagByLabel(cases, 'double-at');
      const innerSpace: FlagCase | null = flagByLabel(cases, 'inner-space');
      const shortTld: FlagCase | null = flagByLabel(cases, 'short-tld');
      const numericTld: FlagCase | null = flagByLabel(cases, 'numeric-tld');
      expect(noAt !== null).assertTrue();
      expect(noDomain !== null).assertTrue();
      expect(noLocal !== null).assertTrue();
      expect(doubleAt !== null).assertTrue();
      expect(innerSpace !== null).assertTrue();
      expect(shortTld !== null).assertTrue();
      expect(numericTld !== null).assertTrue();
      expect(ValidateUtils.isEmail('user.example.com')).assertFalse();
      expect(ValidateUtils.isEmail('user@')).assertFalse();
      expect(ValidateUtils.isEmail('@example.com')).assertFalse();
      expect(ValidateUtils.isEmail('user@@example.com')).assertFalse();
      expect(ValidateUtils.isEmail('user name@example.com')).assertFalse();
      expect(ValidateUtils.isEmail('user@example.c')).assertFalse();
      expect(ValidateUtils.isEmail('user@127.0.0.1')).assertFalse();
      expect(ValidateUtils.isEmail('user@example.com.')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0118
     * @tc.name      testObjectValidate0019
     * @tc.desc      Verify isEmail accepts the legal subset only, keeping the accepted count stable.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const accepted: FlagCase[] = TextFixtureFactory.acceptedCases(TextFixtureFactory.emailCases());
      const rejected: FlagCase[] = TextFixtureFactory.rejectedCases(TextFixtureFactory.emailCases());
      expect(accepted.length).assertEqual(9);
      expect(rejected.length).assertEqual(9);
      for (const item of accepted) {
        expect(ValidateUtils.isEmail(item.value)).assertTrue();
      }
      for (const item of rejected) {
        expect(ValidateUtils.isEmail(item.value)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0119
     * @tc.name      testObjectValidate0020
     * @tc.desc      Verify isPhoneCN accepts mainland mobile fixtures and rejects every illegal variant.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.phoneCases();
      for (const item of cases) {
        expect(ValidateUtils.isPhoneCN(item.value)).assertEqual(item.expected);
      }
      expect(ValidateUtils.isPhoneCN(null)).assertFalse();
      expect(ValidateUtils.isPhoneCN(undefined)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0120
     * @tc.name      testObjectValidate0021
     * @tc.desc      Verify isPhoneCN accepts the valid number and rejects wrong lengths, a second digit of 2 and variants formatted with spaces, hyphens or the +86 prefix.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPhoneCN('13812345678')).assertTrue();
      expect(ValidateUtils.isPhoneCN('1381234567')).assertFalse();
      expect(ValidateUtils.isPhoneCN('138123456789')).assertFalse();
      expect(ValidateUtils.isPhoneCN('12812345678')).assertFalse();
      expect(ValidateUtils.isPhoneCN('138 1234 5678')).assertFalse();
      expect(ValidateUtils.isPhoneCN('138-1234-5678')).assertFalse();
      expect(ValidateUtils.isPhoneCN('+8613812345678')).assertFalse();
      expect(ValidateUtils.isPhoneCN('13812345678')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0121
     * @tc.name      testObjectValidate0022
     * @tc.desc      Verify isPhoneCN accepts second digits 3, 4, 5, 6, 8 and 9 and rejects second digits 0, 1 and 2.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPhoneCN('13012345678')).assertTrue();
      expect(ValidateUtils.isPhoneCN('13912345678')).assertTrue();
      expect(ValidateUtils.isPhoneCN('14012345678')).assertTrue();
      expect(ValidateUtils.isPhoneCN('15012345678')).assertTrue();
      expect(ValidateUtils.isPhoneCN('16012345678')).assertTrue();
      expect(ValidateUtils.isPhoneCN('18012345678')).assertTrue();
      expect(ValidateUtils.isPhoneCN('19012345678')).assertTrue();
      expect(ValidateUtils.isPhoneCN('10012345678')).assertFalse();
      expect(ValidateUtils.isPhoneCN('11012345678')).assertFalse();
      expect(ValidateUtils.isPhoneCN('12012345678')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0122
     * @tc.name      testObjectValidate0023
     * @tc.desc      Verify isUrl accepts the http and https fixtures and rejects every other scheme or malformed text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.urlCases();
      for (const item of cases) {
        expect(ValidateUtils.isUrl(item.value)).assertEqual(item.expected);
      }
      expect(ValidateUtils.isUrl(null)).assertFalse();
      expect(ValidateUtils.isUrl(undefined)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0123
     * @tc.name      testObjectValidate0024
     * @tc.desc      Verify isUrl requires an http or https scheme with a host and a two to five digit port.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isUrl('http://example.com')).assertTrue();
      expect(ValidateUtils.isUrl('https://example.com:8080')).assertTrue();
      expect(ValidateUtils.isUrl('example.com')).assertFalse();
      expect(ValidateUtils.isUrl('ftp://example.com')).assertFalse();
      expect(ValidateUtils.isUrl('file:///tmp/a.txt')).assertFalse();
      expect(ValidateUtils.isUrl('http://')).assertFalse();
      expect(ValidateUtils.isUrl('http://example.com:8')).assertFalse();
      expect(ValidateUtils.isUrl('http://example.com:123456')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0124
     * @tc.name      testObjectValidate0025
     * @tc.desc      Verify isUrl keeps the scheme case sensitive and rejects text containing inner spaces.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isUrl('HTTP://example.com')).assertFalse();
      expect(ValidateUtils.isUrl('Http://example.com')).assertFalse();
      expect(ValidateUtils.isUrl('http://exa mple.com')).assertFalse();
      expect(ValidateUtils.isUrl('http:// example.com')).assertFalse();
      expect(ValidateUtils.isUrl('http://example.com ')).assertFalse();
      expect(ValidateUtils.isUrl('http://example.com/path?q=1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0125
     * @tc.name      testObjectValidate0026
     * @tc.desc      Verify isIpv4 accepts the legal address fixtures and rejects every illegal fixture.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.ipv4Cases();
      for (const item of cases) {
        expect(ValidateUtils.isIpv4(item.value)).assertEqual(item.expected);
      }
      expect(ValidateUtils.isIpv4(null)).assertFalse();
      expect(ValidateUtils.isIpv4(undefined)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0126
     * @tc.name      testObjectValidate0027
     * @tc.desc      Verify isIpv4 enforces four octets with values from zero to 255 and rejects leading zeros.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isIpv4('0.0.0.0')).assertTrue();
      expect(ValidateUtils.isIpv4('255.255.255.255')).assertTrue();
      expect(ValidateUtils.isIpv4('256.1.1.1')).assertFalse();
      expect(ValidateUtils.isIpv4('1.2.3')).assertFalse();
      expect(ValidateUtils.isIpv4('1.2.3.4.5')).assertFalse();
      expect(ValidateUtils.isIpv4('01.2.3.4')).assertFalse();
      expect(ValidateUtils.isIpv4('1..2.3')).assertFalse();
      expect(ValidateUtils.isIpv4('a.b.c.d')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0127
     * @tc.name      testObjectValidate0028
     * @tc.desc      Verify isIpv4 probes each octet boundary value around 255 independently.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isIpv4('0.255.0.255')).assertTrue();
      expect(ValidateUtils.isIpv4('250.249.100.99')).assertTrue();
      expect(ValidateUtils.isIpv4('1.1.1.256')).assertFalse();
      expect(ValidateUtils.isIpv4('1.1.256.1')).assertFalse();
      expect(ValidateUtils.isIpv4('256.0.0.1')).assertFalse();
      expect(ValidateUtils.isIpv4('-1.2.3.4')).assertFalse();
      expect(ValidateUtils.isIpv4('1.2.3.4 ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0128
     * @tc.name      testObjectValidate0029
     * @tc.desc      Verify isPortNumber accepts the boundary ports 0 and 65535 as well as 1, 8080 and 65534.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPortNumber(0)).assertTrue();
      expect(ValidateUtils.isPortNumber(MAX_PORT)).assertTrue();
      expect(ValidateUtils.isPortNumber(1)).assertTrue();
      expect(ValidateUtils.isPortNumber(8080)).assertTrue();
      expect(ValidateUtils.isPortNumber(MAX_PORT - 1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0129
     * @tc.name      testObjectValidate0030
     * @tc.desc      Verify isPortNumber rejects 65536, 131070, -1, 1.5 and NaN.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPortNumber(OVER_MAX_PORT)).assertFalse();
      expect(ValidateUtils.isPortNumber(-1)).assertFalse();
      expect(ValidateUtils.isPortNumber(1.5)).assertFalse();
      expect(ValidateUtils.isPortNumber(Number.NaN)).assertFalse();
      expect(ValidateUtils.isPortNumber(MAX_PORT + MAX_PORT)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0130
     * @tc.name      testObjectValidate0031
     * @tc.desc      Verify isPortNumber rejects non integer values inside the legal range and accepts their integer neighbours.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPortNumber(0.5)).assertFalse();
      expect(ValidateUtils.isPortNumber(8080.5)).assertFalse();
      expect(ValidateUtils.isPortNumber(65535.5)).assertFalse();
      expect(ValidateUtils.isPortNumber(8080)).assertTrue();
      expect(ValidateUtils.isPortNumber(Number.POSITIVE_INFINITY)).assertFalse();
      expect(ValidateUtils.isPortNumber(Number.NEGATIVE_INFINITY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0131
     * @tc.name      testObjectValidate0032
     * @tc.desc      Verify isPositiveInteger matches every positive integer fixture including the parseInt tolerant ones.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.positiveIntCases();
      for (const item of cases) {
        expect(ValidateUtils.isPositiveInteger(item.value)).assertEqual(item.expected);
      }
      expect(ValidateUtils.isPositiveInteger(null)).assertFalse();
      expect(ValidateUtils.isPositiveInteger(undefined)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0132
     * @tc.name      testObjectValidate0033
     * @tc.desc      Verify isPositiveInteger rejects zero, negatives and unparsable text while accepting leading zeros.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPositiveInteger('1')).assertTrue();
      expect(ValidateUtils.isPositiveInteger('007')).assertTrue();
      expect(ValidateUtils.isPositiveInteger('+5')).assertTrue();
      expect(ValidateUtils.isPositiveInteger('0')).assertFalse();
      expect(ValidateUtils.isPositiveInteger('-1')).assertFalse();
      expect(ValidateUtils.isPositiveInteger('abc')).assertFalse();
      expect(ValidateUtils.isPositiveInteger('room1')).assertFalse();
      expect(ValidateUtils.isPositiveInteger('.')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0133
     * @tc.name      testObjectValidate0034
     * @tc.desc      Verify isPositiveInteger follows parseInt so decimal text is truncated to its integer part.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPositiveInteger('1.5')).assertTrue();
      expect(Number.parseInt('1.5', 10)).assertEqual(1);
      expect(ValidateUtils.isPositiveInteger('0.9')).assertFalse();
      expect(Number.parseInt('0.9', 10)).assertEqual(0);
      expect(ValidateUtils.isPositiveInteger(' 12')).assertTrue();
      expect(ValidateUtils.isPositiveInteger('123456789')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0134
     * @tc.name      testObjectValidate0035
     * @tc.desc      Verify isLengthInRange matches every length fixture including the invalid bound variants.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: LengthRangeCase[] = TextFixtureFactory.lengthCases();
      for (const item of cases) {
        expect(ValidateUtils.isLengthInRange(item.value, item.min, item.max)).assertEqual(item.expected);
      }
      expect(ValidateUtils.isLengthInRange(null, 0, 5)).assertFalse();
      expect(ValidateUtils.isLengthInRange(undefined, 0, 5)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0135
     * @tc.name      testObjectValidate0036
     * @tc.desc      Verify isLengthInRange includes both bounds and rejects values just outside the range.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isLengthInRange('ab', 2, 5)).assertTrue();
      expect(ValidateUtils.isLengthInRange('abcde', 2, 5)).assertTrue();
      expect(ValidateUtils.isLengthInRange('a', 2, 5)).assertFalse();
      expect(ValidateUtils.isLengthInRange('abcdef', 2, 5)).assertFalse();
      expect(ValidateUtils.isLengthInRange('a', 1, 1)).assertTrue();
      expect(ValidateUtils.isLengthInRange('', 0, 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0136
     * @tc.name      testObjectValidate0037
     * @tc.desc      Verify isLengthInRange fails fast on invalid bounds even when the value would fit.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: LengthRangeCase[] = TextFixtureFactory.lengthCases();
      const negativeMin: LengthRangeCase | null = lengthByLabel(cases, 'negative-min');
      const maxBelowMin: LengthRangeCase | null = lengthByLabel(cases, 'max-below-min');
      const negativeBoth: LengthRangeCase | null = lengthByLabel(cases, 'negative-both');
      expect(negativeMin !== null).assertTrue();
      expect(maxBelowMin !== null).assertTrue();
      expect(negativeBoth !== null).assertTrue();
      if (negativeMin !== null && maxBelowMin !== null && negativeBoth !== null) {
        expect(negativeMin.invalidBounds).assertTrue();
        expect(maxBelowMin.invalidBounds).assertTrue();
        expect(negativeBoth.invalidBounds).assertTrue();
        expect(ValidateUtils.isLengthInRange(negativeMin.value, negativeMin.min, negativeMin.max)).assertFalse();
        expect(ValidateUtils.isLengthInRange(maxBelowMin.value, maxBelowMin.min, maxBelowMin.max)).assertFalse();
        expect(ValidateUtils.isLengthInRange(negativeBoth.value, negativeBoth.min, negativeBoth.max)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0137
     * @tc.name      testObjectValidate0038
     * @tc.desc      Verify the validator catalog rejects every fixture whose label marks it as illegal.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const emailBad: FlagCase[] = TextFixtureFactory.rejectedCases(TextFixtureFactory.emailCases());
      const phoneBad: FlagCase[] = TextFixtureFactory.rejectedCases(TextFixtureFactory.phoneCases());
      const urlBad: FlagCase[] = TextFixtureFactory.rejectedCases(TextFixtureFactory.urlCases());
      const ipv4Bad: FlagCase[] = TextFixtureFactory.rejectedCases(TextFixtureFactory.ipv4Cases());
      expect(emailBad.length > 0).assertTrue();
      expect(phoneBad.length > 0).assertTrue();
      expect(urlBad.length > 0).assertTrue();
      expect(ipv4Bad.length > 0).assertTrue();
      for (const item of emailBad) {
        expect(ValidateUtils.isEmail(item.value)).assertFalse();
      }
      for (const item of phoneBad) {
        expect(ValidateUtils.isPhoneCN(item.value)).assertFalse();
      }
      for (const item of urlBad) {
        expect(ValidateUtils.isUrl(item.value)).assertFalse();
      }
      for (const item of ipv4Bad) {
        expect(ValidateUtils.isIpv4(item.value)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0138
     * @tc.name      testObjectValidate0039
     * @tc.desc      Verify every ValidateUtils predicate returns a boolean for missing and present input alike.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(typeof ValidateUtils.isEmail(null)).assertEqual('boolean');
      expect(typeof ValidateUtils.isPhoneCN(null)).assertEqual('boolean');
      expect(typeof ValidateUtils.isUrl(null)).assertEqual('boolean');
      expect(typeof ValidateUtils.isIpv4(null)).assertEqual('boolean');
      expect(typeof ValidateUtils.isPortNumber(0)).assertEqual('boolean');
      expect(typeof ValidateUtils.isPositiveInteger(null)).assertEqual('boolean');
      expect(typeof ValidateUtils.isLengthInRange(null, 0, 1)).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0139
     * @tc.name      testObjectValidate0040
     * @tc.desc      Verify hasValue, getOrDefault, isEmptyObject and stringify return a boolean or a string for a null operand, deepClone returns a non-null copy and deepEqualsByJson treats two nulls as equal.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(typeof ObjectUtils.hasValue(null)).assertEqual('boolean');
      expect(typeof ObjectUtils.getOrDefault(null, DEFAULT_TEXT)).assertEqual('string');
      expect(typeof ObjectUtils.isEmptyObject(null)).assertEqual('boolean');
      expect(typeof ObjectUtils.stringify(null)).assertEqual('string');
      expect(ObjectUtils.deepClone(makeSimpleBox('a', 1)) !== null).assertTrue();
      expect(ObjectUtils.deepEqualsByJson(null, null)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0140
     * @tc.name      testObjectValidate0041
     * @tc.desc      Verify the validator fixture catalog keeps the expected accepted and rejected split per rule.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(TextFixtureFactory.emailCases().length).assertEqual(18);
      expect(TextFixtureFactory.phoneCases().length).assertEqual(13);
      expect(TextFixtureFactory.urlCases().length).assertEqual(17);
      expect(TextFixtureFactory.ipv4Cases().length).assertEqual(16);
      expect(TextFixtureFactory.positiveIntCases().length).assertEqual(14);
      expect(TextFixtureFactory.lengthCases().length).assertEqual(12);
      const acceptedPhones: FlagCase[] = TextFixtureFactory.acceptedCases(TextFixtureFactory.phoneCases());
      expect(acceptedPhones.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0141
     * @tc.name      testObjectValidate0042
     * @tc.desc      Verify a validator pipeline accepts a desk configuration only when every field is legal.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const hostOk: boolean = ValidateUtils.isIpv4('192.168.1.10');
      const portOk: boolean = ValidateUtils.isPortNumber(8080);
      const mailOk: boolean = ValidateUtils.isEmail('ops@example.com');
      const nameOk: boolean = ValidateUtils.isLengthInRange('A3会议室', 1, 16);
      expect(hostOk).assertTrue();
      expect(portOk).assertTrue();
      expect(mailOk).assertTrue();
      expect(nameOk).assertTrue();
      expect(hostOk && portOk && mailOk && nameOk).assertTrue();
      expect(hostOk && ValidateUtils.isPortNumber(OVER_MAX_PORT)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0142
     * @tc.name      testObjectValidate0043
     * @tc.desc      Verify ObjectUtils and ValidateUtils results compose into a serialisable desk description.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const box: SimpleBox = makeSimpleBox('A3', 8080);
      const clone: SimpleBox | null = ObjectUtils.deepClone(box);
      expect(clone !== null).assertTrue();
      if (clone !== null) {
        expect(ObjectUtils.isEmptyObject(clone)).assertFalse();
        expect(ObjectUtils.hasValue(clone.count)).assertTrue();
        expect(ValidateUtils.isPortNumber(clone.count)).assertTrue();
        expect(ValidateUtils.isLengthInRange(clone.name, 1, 8)).assertTrue();
        expect(ObjectUtils.stringify(clone)).assertEqual(ObjectUtils.stringify(box));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0143
     * @tc.name      testObjectValidate0044
     * @tc.desc      Verify getOrDefault keeps a zero, an empty text and an empty array exactly as given.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zero: number = ObjectUtils.getOrDefault(0, FALLBACK_COUNT);
      const emptyText: string = ObjectUtils.getOrDefault('', 'fallback');
      const emptyList: string[] = ObjectUtils.getOrDefault([], buildFallbackList());
      expect(zero).assertEqual(0);
      expect(emptyText).assertEqual('');
      expect(emptyList.length).assertEqual(0);
      expect(ObjectUtils.hasValue(zero)).assertTrue();
      expect(ObjectUtils.hasValue(emptyText)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0144
     * @tc.name      testObjectValidate0045
     * @tc.desc      Verify a deep clone of the nested box keeps the inner values identical but a separate reference.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0045';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const outer: OuterBox = makeOuterBox('A3', 'inner', 1);
      const clone: OuterBox | null = ObjectUtils.deepClone(outer);
      expect(clone !== null).assertTrue();
      if (clone !== null) {
        // The JSON round-trip rebuilds the inner box as a separate reference.
        expect(clone.inner === outer.inner).assertFalse();
        expect(clone.label).assertEqual('A3');
        expect(clone.inner.count).assertEqual(1);
        expect(ObjectUtils.deepEqualsByJson(clone, outer)).assertTrue();
        expect(ObjectUtils.stringify(clone).length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0145
     * @tc.name      testObjectValidate0046
     * @tc.desc      Verify isLengthInRange reports false when the bounds are inverted or negative.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0046';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: LengthRangeCase[] = TextFixtureFactory.lengthCases();
      const invalid: LengthRangeCase[] = lengthCasesWithInvalidBounds(cases);
      expect(invalid.length).assertEqual(3);
      for (const item of invalid) {
        expect(item.invalidBounds).assertTrue();
        expect(ValidateUtils.isLengthInRange(item.value, item.min, item.max)).assertEqual(item.expected);
      }
      expect(ValidateUtils.isLengthInRange('abc', 5, 2)).assertFalse();
      expect(ValidateUtils.isLengthInRange('abc', -1, 5)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0146
     * @tc.name      testObjectValidate0047
     * @tc.desc      Verify isPortNumber separates the whole number range into legal and illegal halves.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0047';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPortNumber(0)).assertTrue();
      expect(ValidateUtils.isPortNumber(1)).assertTrue();
      expect(ValidateUtils.isPortNumber(80)).assertTrue();
      expect(ValidateUtils.isPortNumber(8080)).assertTrue();
      expect(ValidateUtils.isPortNumber(32768)).assertTrue();
      expect(ValidateUtils.isPortNumber(MAX_PORT)).assertTrue();
      expect(ValidateUtils.isPortNumber(OVER_MAX_PORT)).assertFalse();
      expect(ValidateUtils.isPortNumber(MIN_PORT - 1)).assertFalse();
      expect(ValidateUtils.isPortNumber(FRACTIONAL_PORT)).assertFalse();
      expect(ValidateUtils.isPortNumber(NaN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0147
     * @tc.name      testObjectValidate0048
     * @tc.desc      Verify the accepted and rejected flag helpers split every validator fixture without loss.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0048';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const emailAll: FlagCase[] = TextFixtureFactory.emailCases();
      const emailOk: FlagCase[] = TextFixtureFactory.acceptedCases(emailAll);
      const emailBad: FlagCase[] = TextFixtureFactory.rejectedCases(emailAll);
      expect(emailOk.length + emailBad.length).assertEqual(emailAll.length);
      expect(emailOk.length).assertEqual(9);
      expect(emailBad.length).assertEqual(9);
      for (const item of emailOk) {
        expect(ValidateUtils.isEmail(item.value)).assertTrue();
      }
      for (const item of emailBad) {
        expect(ValidateUtils.isEmail(item.value)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0148
     * @tc.name      testObjectValidate0049
     * @tc.desc      Verify isEmail, isPhoneCN, isUrl, isIpv4, isPositiveInteger and isLengthInRange with a minimum of 1 reject the empty text, while isLengthInRange with a minimum of 0 and hasValue accept it.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0049';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isEmail('')).assertFalse();
      expect(ValidateUtils.isPhoneCN('')).assertFalse();
      expect(ValidateUtils.isUrl('')).assertFalse();
      expect(ValidateUtils.isIpv4('')).assertFalse();
      expect(ValidateUtils.isPositiveInteger('')).assertFalse();
      expect(ValidateUtils.isLengthInRange('', 1, 3)).assertFalse();
      expect(ValidateUtils.isLengthInRange('', 0, 3)).assertTrue();
      expect(ObjectUtils.hasValue('')).assertTrue();
      expect(ObjectUtils.hasValue('').valueOf()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0149
     * @tc.name      testObjectValidate0050
     * @tc.desc      Verify deepEqualsByJson compares nested objects and arrays by their full JSON text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0050';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: OuterBox = makeOuterBox('A3', 'inner', 2);
      const same: OuterBox = makeOuterBox('A3', 'inner', 2);
      const other: OuterBox = makeOuterBox('A3', 'inner', 3);
      expect(ObjectUtils.deepEqualsByJson(first, same)).assertTrue();
      expect(ObjectUtils.deepEqualsByJson(first, other)).assertFalse();
      expect(ObjectUtils.deepEqualsByJson(first, null)).assertFalse();
      expect(ObjectUtils.deepEqualsByJson(null, first)).assertFalse();
      expect(ObjectUtils.stringify(first)).assertEqual(ObjectUtils.stringify(same));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0150
     * @tc.name      testObjectValidate0051
     * @tc.desc      Verify deepClone of an empty carrier yields an empty carrier that still counts as empty.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0051';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const empty: EmptyBox = makeEmptyBox();
      const clone: EmptyBox | null = ObjectUtils.deepClone(empty);
      expect(ObjectUtils.isEmptyObject(empty)).assertTrue();
      expect(clone !== null).assertTrue();
      if (clone !== null) {
        expect(ObjectUtils.isEmptyObject(clone)).assertTrue();
        expect(ObjectUtils.stringify(clone)).assertEqual('{}');
        expect(ObjectUtils.deepEqualsByJson(empty, clone)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0151
     * @tc.name      testObjectValidate0052
     * @tc.desc      Verify hasValue accepts every falsy but present value and rejects only missing ones.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testObjectValidate0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testObjectValidate0052';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.hasValue(0)).assertTrue();
      expect(ObjectUtils.hasValue('')).assertTrue();
      expect(ObjectUtils.hasValue(false)).assertTrue();
      expect(ObjectUtils.hasValue(null)).assertFalse();
      expect(ObjectUtils.hasValue(undefined)).assertFalse();
      expect(ObjectUtils.hasValue(0)).assertEqual(!ObjectUtils.hasValue(null));
      expect(ObjectUtils.hasValue('')).assertEqual(!ObjectUtils.hasValue(undefined));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0152
     * @tc.name      testObjectValidate0053
     * @tc.desc      Verify deepEqualsByJson treats two independently built PairBox(1, 2) values as equal and PairBox(2, 1) as different, matching their stringify output.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0053';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const left: PairBox = makePairBox(1, 2);
      const right: PairBox = makePairBox(1, 2);
      const swapped: PairBox = makePairBox(2, 1);
      expect(ObjectUtils.deepEqualsByJson(left, right)).assertTrue();
      expect(ObjectUtils.deepEqualsByJson(left, swapped)).assertFalse();
      expect(ObjectUtils.stringify(left)).assertEqual('{"a":1,"b":2}');
      expect(ObjectUtils.stringify(swapped)).assertEqual('{"a":2,"b":1}');
      expect(ObjectUtils.stringify(left) === ObjectUtils.stringify(right)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0153
     * @tc.name      testObjectValidate0054
     * @tc.desc      Verify getOrDefault returns the default only for missing values and never for present zero values.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0054';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.getOrDefault(null, FALLBACK_COUNT)).assertEqual(FALLBACK_COUNT);
      expect(ObjectUtils.getOrDefault(undefined, FALLBACK_COUNT)).assertEqual(FALLBACK_COUNT);
      expect(ObjectUtils.getOrDefault(0, FALLBACK_COUNT)).assertEqual(0);
      expect(ObjectUtils.getOrDefault(0, FALLBACK_COUNT) !== FALLBACK_COUNT).assertTrue();
      expect(ObjectUtils.getOrDefault(5, FALLBACK_COUNT)).assertEqual(5);
      expect(ObjectUtils.getOrDefault(null, DEFAULT_TEXT)).assertEqual(DEFAULT_TEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0154
     * @tc.name      testObjectValidate0055
     * @tc.desc      Verify the port fixtures used by the boundary case stay consistent with the helper constants.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testObjectValidate0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testObjectValidate0055';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(MAX_PORT).assertEqual(65535);
      expect(OVER_MAX_PORT).assertEqual(MAX_PORT + 1);
      expect(OVER_MAX_PORT).assertEqual(65536);
      expect(MIN_PORT).assertEqual(0);
      expect(MIN_PORT - 1).assertEqual(-1);
      expect(ValidateUtils.isPortNumber(OVER_MAX_PORT)).assertFalse();
      expect(ValidateUtils.isPortNumber(MIN_PORT - 1)).assertFalse();
      expect(Number.isInteger(FRACTIONAL_PORT)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0155
     * @tc.name      testObjectValidate0056
     * @tc.desc      Verify every validator rejects the missing operands while ObjectUtils still tolerates them.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0056';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const nullText: string | null = null;
      const undefinedText: string | undefined = undefined;
      expect(ValidateUtils.isEmail(nullText)).assertFalse();
      expect(ValidateUtils.isEmail(undefinedText)).assertFalse();
      expect(ValidateUtils.isPhoneCN(nullText)).assertFalse();
      expect(ValidateUtils.isPhoneCN(undefinedText)).assertFalse();
      expect(ValidateUtils.isUrl(nullText)).assertFalse();
      expect(ValidateUtils.isUrl(undefinedText)).assertFalse();
      expect(ValidateUtils.isIpv4(nullText)).assertFalse();
      expect(ValidateUtils.isIpv4(undefinedText)).assertFalse();
      expect(ValidateUtils.isPositiveInteger(nullText)).assertFalse();
      expect(ValidateUtils.isPositiveInteger(undefinedText)).assertFalse();
      expect(ValidateUtils.isLengthInRange(nullText, 0, 3)).assertFalse();
      expect(ValidateUtils.isLengthInRange(undefinedText, 0, 3)).assertFalse();
      expect(ObjectUtils.isEmptyObject(null)).assertTrue();
      const nullBox: object | null = null;
      const undefinedBox: object | undefined = undefined;
      expect(ObjectUtils.isEmptyObject(nullBox)).assertTrue();
      expect(ObjectUtils.isEmptyObject(undefinedBox)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_OBJECT_0156
     * @tc.name      testObjectValidate0057
     * @tc.desc      Verify deepClone result is a distinct reference so nested mutation cannot leak back.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testObjectValidate0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testObjectValidate0057';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: SimpleBox = makeSimpleBox('before', 1);
      const clone: SimpleBox | null = ObjectUtils.deepClone(source);
      expect(clone !== null).assertTrue();
      if (clone !== null) {
        clone.name = 'after';
        clone.count = 99;
        expect(clone.name).assertEqual('after');
        expect(source.name).assertEqual('before');
        expect(clone.count).assertEqual(99);
        expect(source.count).assertEqual(1);
        expect(clone === source).assertFalse();
        expect(ObjectUtils.deepEqualsByJson(source, clone)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

  });
}
