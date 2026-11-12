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
import { StringUtils } from 'common';
import {
  TextFixtureFactory,
  FlagCase,
  PairCase,
  FormatCase,
  TruncateCase,
  CapitalizeCase,
  JoinCase
} from './helper/TextFixtureFactory';

/**
 * StringUtils 逻辑套件：覆盖 common HAR 中 StringUtils 全部 13 个静态方法的
 * 合法输入、边界输入、非法输入与缺失输入（null / undefined）。
 * 夹具来自 TextFixtureFactory，套件本身只做「取值 - 调用 - 断言」，
 * 不在测试里重复推导实现规则。
 *
 * 明确不覆盖的分支：
 * - format 的模板为 null / undefined：实现签名声明 template: string（非可选、
 *   非 nullable），传入 null 属于类型违规，因此只用空串覆盖「模板缺失归一」分支。
 * - truncate 的 AppLogger.warn 副作用：只验证返回值，不验证日志落盘。
 * - toIntOrDefault 的 AppLogger.warn 副作用：同上，只验证回退值。
 * - capitalize 的 value.length === 0 分支内部对 trimToEmpty 的复用：该分支与
 *   空串输入走同一出口，已用 capitalize('') 覆盖。
 */

/** Hilog domain reserved for the StringUtils logic suite. */
const DOMAIN: number = 0xF823;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_StringUtils_';
/** Suffix that truncate appends when the input is actually shortened. */
const TRUNCATE_SUFFIX: string = '...';
/** Decimal radix used by the integer parsing cases. */
const RADIX_DECIMAL: number = 10;
/** Default value used by the toIntOrDefault fallback cases. */
const FALLBACK_INT: number = -1;
/** Long text used by the truncation length assertions. */
const LONG_TEXT: string = 'abcdefghijklmnopqrstuvwxyz';
/** Template used by the placeholder replacement cases. */
const ROOM_TEMPLATE: string = '{0}号会议室-{1}';

/**
 * 累计 TextFixtureFactory 里所有夹具的总条数，用于「夹具规模」这一条哨兵断言。
 * 该函数不参与业务断言，只保证夹具目录本身没有被裁剪。
 */
function countFixtureWeight(): number {
  let total: number = 0;
  total += TextFixtureFactory.emptyCases().length;
  total += TextFixtureFactory.blankCases().length;
  total += TextFixtureFactory.numericTextCases().length;
  total += TextFixtureFactory.formatCases().length;
  total += TextFixtureFactory.truncateCases().length;
  total += TextFixtureFactory.capitalizeCases().length;
  total += TextFixtureFactory.joinCases().length;
  total += TextFixtureFactory.equalsPairs().length;
  total += TextFixtureFactory.ignoreCasePairs().length;
  return total;
}

/**
 * 把若干段文本拼成逗号分隔的标签串，只在日志里使用，
 * 便于失败时从 hilog 里直接看出本轮遍历了哪些夹具。
 */
function joinLabels(labels: string[]): string {
  return labels.join(',');
}

/**
 * 构建一个只含 null 片段的拼接入参，用显式声明 + push 的方式避免
 * 数组字面量直接传 null 引起的类型告警。
 */
function buildNullableParts(nullCount: number): Array<string | null | undefined> {
  const parts: Array<string | null | undefined> = [];
  for (let i = 0; i < nullCount; i++) {
    parts.push(null);
  }
  return parts;
}

/** 按 label 在大写化夹具里查一条用例，查不到返回 null。 */
function capitalizeByLabel(cases: CapitalizeCase[], label: string): CapitalizeCase | null {
  for (const item of cases) {
    if (item.label === label) {
      return item;
    }
  }
  return null;
}

/** 按 label 在格式化夹具里查一条用例，查不到返回 null。 */
function formatByLabel(cases: FormatCase[], label: string): FormatCase | null {
  for (const item of cases) {
    if (item.label === label) {
      return item;
    }
  }
  return null;
}

/** 按 label 在截断夹具里查一条用例，查不到返回 null。 */
function truncateByLabel(cases: TruncateCase[], label: string): TruncateCase | null {
  for (const item of cases) {
    if (item.label === label) {
      return item;
    }
  }
  return null;
}

/** 按 label 在拼接夹具里查一条用例，查不到返回 null。 */
function joinByLabel(cases: JoinCase[], label: string): JoinCase | null {
  for (const item of cases) {
    if (item.label === label) {
      return item;
    }
  }
  return null;
}

/** 按 label 在成对比较夹具里查一条用例，查不到返回 null。 */
function pairByLabel(cases: PairCase[], label: string): PairCase | null {
  for (const item of cases) {
    if (item.label === label) {
      return item;
    }
  }
  return null;
}

export default function stringUtilsLogicTest() {
  describe('StringUtilsLogicTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0100
     * @tc.name      testStringUtils0001
     * @tc.desc      Verify isEmpty treats null, undefined and empty text as empty through fixtures.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.emptyCases();
      const labels: string[] = [];
      expect(cases.length > 0).assertTrue();
      for (const item of cases) {
        labels.push(item.label);
        hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' case=' + item.label);
        expect(StringUtils.isEmpty(item.value)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' labels=' + joinLabels(labels));
      expect(StringUtils.isEmpty(null)).assertTrue();
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0101
     * @tc.name      testStringUtils0002
     * @tc.desc      Verify isEmpty rejects whitespace-only text so that only zero length counts as empty.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.isEmpty(' ')).assertFalse();
      expect(StringUtils.isEmpty('\t')).assertFalse();
      expect(StringUtils.isEmpty('\n')).assertFalse();
      expect(StringUtils.isEmpty('\r')).assertFalse();
      expect(StringUtils.isEmpty('\t\n\r')).assertFalse();
      expect(StringUtils.isEmpty('        ')).assertFalse();
      const singleSpace: FlagCase | null = TextFixtureFactory.flagCase(TextFixtureFactory.emptyCases(), 'single-space');
      expect(singleSpace !== null).assertTrue();
      if (singleSpace !== null) {
        expect(StringUtils.isEmpty(singleSpace.value)).assertEqual(singleSpace.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0102
     * @tc.name      testStringUtils0003
     * @tc.desc      Verify isNotEmpty accepts every fixture flagged as non empty.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.emptyCases();
      expect(cases.length).assertEqual(9);
      for (const item of cases) {
        expect(StringUtils.isNotEmpty(item.value)).assertEqual(!item.expected);
      }
      expect(StringUtils.isNotEmpty('room-a')).assertTrue();
      expect(StringUtils.isNotEmpty('0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0103
     * @tc.name      testStringUtils0004
     * @tc.desc      Verify isNotEmpty is the exact inverse of isEmpty over every fixture and the missing inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.emptyCases();
      for (const item of cases) {
        const emptyFlag: boolean = StringUtils.isEmpty(item.value);
        const notEmptyFlag: boolean = StringUtils.isNotEmpty(item.value);
        expect(notEmptyFlag).assertEqual(!emptyFlag);
        expect(emptyFlag !== notEmptyFlag).assertTrue();
      }
      expect(StringUtils.isNotEmpty(null)).assertFalse();
      expect(StringUtils.isNotEmpty(undefined)).assertFalse();
      expect(StringUtils.isEmpty(null) !== StringUtils.isNotEmpty(null)).assertTrue();
      expect(StringUtils.isEmpty(undefined) !== StringUtils.isNotEmpty(undefined)).assertTrue();
      expect(StringUtils.isEmpty('x') !== StringUtils.isNotEmpty('x')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0104
     * @tc.name      testStringUtils0005
     * @tc.desc      Verify isBlank accepts whitespace only fixtures and the missing inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.blankCases();
      expect(cases.length).assertEqual(12);
      for (const item of cases) {
        hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' blank=' + item.label);
        expect(StringUtils.isBlank(item.value)).assertEqual(item.expected);
      }
      expect(StringUtils.isBlank(null)).assertTrue();
      expect(StringUtils.isBlank(undefined)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0106
     * @tc.name      testStringUtils0006
     * @tc.desc      Verify isBlank keeps visible characters including CJK text and digits as non blank.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.isBlank('a b')).assertFalse();
      expect(StringUtils.isBlank('  x  ')).assertFalse();
      expect(StringUtils.isBlank('0')).assertFalse();
      expect(StringUtils.isBlank('投影仪')).assertFalse();
      expect(StringUtils.isBlank('\troom\t')).assertFalse();
      const cjk: FlagCase | null = TextFixtureFactory.flagCase(TextFixtureFactory.blankCases(), 'cjk-text');
      expect(cjk !== null).assertTrue();
      if (cjk !== null) {
        expect(StringUtils.isBlank(cjk.value)).assertEqual(cjk.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0107
     * @tc.name      testStringUtils0007
     * @tc.desc      Verify isNotBlank accepts the non blank fixtures and rejects pure whitespace.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.blankCases();
      for (const item of cases) {
        expect(StringUtils.isNotBlank(item.value)).assertEqual(!item.expected);
      }
      expect(StringUtils.isNotBlank('会议纪要')).assertTrue();
      expect(StringUtils.isNotBlank(' ')).assertFalse();
      expect(StringUtils.isNotBlank('\t\n')).assertFalse();
      expect(StringUtils.isNotBlank(null)).assertFalse();
      expect(StringUtils.isNotBlank(undefined)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0108
     * @tc.name      testStringUtils0008
     * @tc.desc      Verify isNotBlank is the exact inverse of isBlank over every fixture and the missing inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.blankCases();
      for (const item of cases) {
        const blankFlag: boolean = StringUtils.isBlank(item.value);
        const notBlankFlag: boolean = StringUtils.isNotBlank(item.value);
        expect(notBlankFlag).assertEqual(!blankFlag);
        expect(blankFlag !== notBlankFlag).assertTrue();
      }
      expect(StringUtils.isBlank(null) !== StringUtils.isNotBlank(null)).assertTrue();
      expect(StringUtils.isBlank(undefined) !== StringUtils.isNotBlank(undefined)).assertTrue();
      expect(StringUtils.isBlank(' \t\n\r ') !== StringUtils.isNotBlank(' \t\n\r ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0109
     * @tc.name      testStringUtils0009
     * @tc.desc      Verify isEmpty and isBlank differ on whitespace so blank is a superset of empty.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.isEmpty(' ')).assertFalse();
      expect(StringUtils.isBlank(' ')).assertTrue();
      expect(StringUtils.isEmpty('   ')).assertFalse();
      expect(StringUtils.isBlank('   ')).assertTrue();
      const whitespace: string[] = [' ', '\t', '\n', '\r', ' \t\n\r '];
      let blankCount: number = 0;
      let emptyCount: number = 0;
      for (const text of whitespace) {
        if (StringUtils.isBlank(text)) {
          blankCount = blankCount + 1;
        }
        if (StringUtils.isEmpty(text)) {
          emptyCount = emptyCount + 1;
        }
      }
      expect(blankCount).assertEqual(5);
      expect(emptyCount).assertEqual(0);
      expect(blankCount > emptyCount).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0110
     * @tc.name      testStringUtils0010
     * @tc.desc      Verify trimToEmpty normalizes null and undefined to an empty text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.trimToEmpty(null)).assertEqual('');
      expect(StringUtils.trimToEmpty(undefined)).assertEqual('');
      expect(StringUtils.trimToEmpty(null).length).assertEqual(0);
      expect(StringUtils.trimToEmpty(undefined).length).assertEqual(0);
      expect(StringUtils.trimToEmpty('')).assertEqual('');
      expect(StringUtils.trimToEmpty(null)).assertEqual(StringUtils.trimToEmpty(undefined));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0111
     * @tc.name      testStringUtils0011
     * @tc.desc      Verify trimToEmpty strips leading and trailing whitespace but keeps the inner space.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.trimToEmpty('  a b  ')).assertEqual('a b');
      expect(StringUtils.trimToEmpty('\t\tab\t')).assertEqual('ab');
      expect(StringUtils.trimToEmpty('\n ab \r')).assertEqual('ab');
      expect(StringUtils.trimToEmpty('  ').length).assertEqual(0);
      expect(StringUtils.trimToEmpty('\t').length).assertEqual(0);
      expect(StringUtils.trimToEmpty('  a b  ').length).assertEqual(3);
      expect(StringUtils.trimToEmpty('no-pad')).assertEqual('no-pad');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0112
     * @tc.name      testStringUtils0012
     * @tc.desc      Verify trimToEmpty is idempotent so trimming an already trimmed text changes nothing.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const once: string = StringUtils.trimToEmpty('  会议室  ');
      const twice: string = StringUtils.trimToEmpty(once);
      expect(once).assertEqual('会议室');
      expect(twice).assertEqual(once);
      expect(StringUtils.trimToEmpty(StringUtils.trimToEmpty(' x '))).assertEqual('x');
      expect(StringUtils.trimToEmpty(StringUtils.trimToEmpty(null))).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0113
     * @tc.name      testStringUtils0013
     * @tc.desc      Verify equals treats two identically missing operands as equal, mixed null and undefined or a missing operand against text as unequal.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.equals(null, null)).assertTrue();
      expect(StringUtils.equals(undefined, undefined)).assertTrue();
      expect(StringUtils.equals(null, undefined)).assertFalse();
      expect(StringUtils.equals(undefined, null)).assertFalse();
      expect(StringUtils.equals(null, 'a')).assertFalse();
      expect(StringUtils.equals('a', null)).assertFalse();
      expect(StringUtils.equals(undefined, 'a')).assertFalse();
      expect(StringUtils.equals('a', undefined)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0114
     * @tc.name      testStringUtils0014
     * @tc.desc      Verify equals compares text case sensitively against every equality fixture.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const pairs: PairCase[] = TextFixtureFactory.equalsPairs();
      expect(pairs.length).assertEqual(7);
      for (const item of pairs) {
        hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' equals=' + item.label);
        expect(StringUtils.equals(item.first, item.second)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0115
     * @tc.name      testStringUtils0015
     * @tc.desc      Verify equals is symmetric for both equal and unequal text pairs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const pairs: PairCase[] = TextFixtureFactory.equalsPairs();
      for (const item of pairs) {
        const forward: boolean = StringUtils.equals(item.first, item.second);
        const backward: boolean = StringUtils.equals(item.second, item.first);
        expect(forward).assertEqual(backward);
        expect(forward).assertEqual(item.expected);
      }
      expect(StringUtils.equals('room', 'room')).assertTrue();
      expect(StringUtils.equals('room', 'Room')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0116
     * @tc.name      testStringUtils0016
     * @tc.desc      Verify equalsIgnoreCase accepts any case variant and rejects missing operands.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.equalsIgnoreCase(null, null)).assertFalse();
      expect(StringUtils.equalsIgnoreCase(undefined, undefined)).assertFalse();
      expect(StringUtils.equalsIgnoreCase(null, 'abc')).assertFalse();
      expect(StringUtils.equalsIgnoreCase('abc', null)).assertFalse();
      expect(StringUtils.equalsIgnoreCase(undefined, 'abc')).assertFalse();
      expect(StringUtils.equalsIgnoreCase('abc', undefined)).assertFalse();
      expect(StringUtils.equalsIgnoreCase('ABC', 'abc')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0117
     * @tc.name      testStringUtils0017
     * @tc.desc      Verify equalsIgnoreCase covers every case insensitive fixture pair.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const pairs: PairCase[] = TextFixtureFactory.ignoreCasePairs();
      expect(pairs.length).assertEqual(7);
      for (const item of pairs) {
        hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' ignore-case=' + item.label);
        expect(StringUtils.equalsIgnoreCase(item.first, item.second)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0118
     * @tc.name      testStringUtils0018
     * @tc.desc      Verify equalsIgnoreCase is looser than equals on case mismatch and identical on case match.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.equals('Room', 'room')).assertFalse();
      expect(StringUtils.equalsIgnoreCase('Room', 'room')).assertTrue();
      expect(StringUtils.equals('room', 'room')).assertTrue();
      expect(StringUtils.equalsIgnoreCase('room', 'room')).assertTrue();
      expect(StringUtils.equalsIgnoreCase('MEETING', 'meeting')).assertTrue();
      expect(StringUtils.equals('MEETING', 'meeting')).assertFalse();
      expect(StringUtils.equalsIgnoreCase('MEETING', 'meeting')).assertEqual(!StringUtils.equals('MEETING', 'meeting'));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0119
     * @tc.name      testStringUtils0019
     * @tc.desc      Verify capitalize returns an empty text for null, undefined and empty input.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.capitalize(null)).assertEqual('');
      expect(StringUtils.capitalize(undefined)).assertEqual('');
      expect(StringUtils.capitalize('')).assertEqual('');
      expect(StringUtils.capitalize(null).length).assertEqual(0);
      expect(StringUtils.capitalize(undefined).length).assertEqual(0);
      expect(StringUtils.capitalize('')).assertEqual(StringUtils.capitalize(null));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0120
     * @tc.name      testStringUtils0020
     * @tc.desc      Verify capitalize uppercases only the first character against every fixture.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: CapitalizeCase[] = TextFixtureFactory.capitalizeCases();
      expect(cases.length).assertEqual(9);
      for (const item of cases) {
        hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' capitalize=' + item.label);
        expect(StringUtils.capitalize(item.value)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0121
     * @tc.name      testStringUtils0021
     * @tc.desc      Verify capitalize keeps the tail characters untouched so inner capitals survive.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.capitalize('abcDef')).assertEqual('AbcDef');
      expect(StringUtils.capitalize('roomKey')).assertEqual('RoomKey');
      expect(StringUtils.capitalize('aBC')).assertEqual('ABC');
      expect(StringUtils.capitalize('a').length).assertEqual(1);
      expect(StringUtils.capitalize('abc').substring(1)).assertEqual('bc');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0122
     * @tc.name      testStringUtils0022
     * @tc.desc      Verify capitalize is idempotent because the first character stays uppercase.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.capitalize(StringUtils.capitalize('abc'))).assertEqual('Abc');
      expect(StringUtils.capitalize('Abc')).assertEqual('Abc');
      expect(StringUtils.capitalize('ABC')).assertEqual('ABC');
      const cases: CapitalizeCase[] = TextFixtureFactory.capitalizeCases();
      for (const item of cases) {
        expect(StringUtils.capitalize(item.expected)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0123
     * @tc.name      testStringUtils0023
     * @tc.desc      Verify capitalize leaves non letter leading characters such as digits and spaces unchanged.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.capitalize('1abc')).assertEqual('1abc');
      expect(StringUtils.capitalize(' abc')).assertEqual(' abc');
      expect(StringUtils.capitalize('投影仪')).assertEqual('投影仪');
      expect(StringUtils.capitalize('_a')).assertEqual('_a');
      const digitFirst: CapitalizeCase | null = TextFixtureFactory.capitalizeCase('digit-first');
      expect(digitFirst !== null).assertTrue();
      if (digitFirst !== null) {
        expect(StringUtils.capitalize(digitFirst.value)).assertEqual(digitFirst.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0124
     * @tc.name      testStringUtils0024
     * @tc.desc      Verify formatWithArgs replaces placeholders in order against every formatting fixture.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FormatCase[] = TextFixtureFactory.formatCases();
      expect(cases.length).assertEqual(12);
      for (const item of cases) {
        hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' format=' + item.label);
        expect(StringUtils.formatWithArgs(item.template, item.args)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0125
     * @tc.name      testStringUtils0025
     * @tc.desc      Verify format replaces every occurrence of a repeated placeholder.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.format('{0}{0}', 'x')).assertEqual('xx');
      expect(StringUtils.format('{0}-{0}-{0}', 'a')).assertEqual('a-a-a');
      expect(StringUtils.format('{0}{0}{0}{0}', 'ab')).assertEqual('abababab');
      expect(StringUtils.format('{0}{0}', 'x').length).assertEqual(2);
      expect(StringUtils.format('{0}-{0}', 'a').split('a').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0126
     * @tc.name      testStringUtils0026
     * @tc.desc      Verify format keeps placeholders that have no matching argument.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.format('{2}', 'a', 'b')).assertEqual('{2}');
      expect(StringUtils.format('{0}-{1}', 'a')).assertEqual('a-{1}');
      expect(StringUtils.format('{0} 和 {2}', 'a', 'b')).assertEqual('a 和 {2}');
      expect(StringUtils.format('{5}', 'a')).assertEqual('{5}');
      expect(StringUtils.format('{0}-{1}', 'a').includes('{1}')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0127
     * @tc.name      testStringUtils0027
     * @tc.desc      Verify format returns an empty text for an empty template and keeps a template without holes.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.format('', 'a')).assertEqual('');
      expect(StringUtils.format('', 'a').length).assertEqual(0);
      expect(StringUtils.format('room', 'a')).assertEqual('room');
      expect(StringUtils.format('room')).assertEqual('room');
      expect(StringUtils.format('{0}', '')).assertEqual('');
      expect(StringUtils.format('{0}', ' ')).assertEqual(' ');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0128
     * @tc.name      testStringUtils0028
     * @tc.desc      Verify format supports out of order and CJK replacement arguments.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.format('{1}{0}', 'a', 'b')).assertEqual('ba');
      expect(StringUtils.format(ROOM_TEMPLATE, 'A3', '投影')).assertEqual('A3号会议室-投影');
      expect(StringUtils.format('{0}/{1}/{2}', 'x', 'y', 'z')).assertEqual('x/y/z');
      expect(StringUtils.format('{0}的{1}', '会议室', '灯')).assertEqual('会议室的灯');
      expect(StringUtils.format('{2}{1}{0}', 'a', 'b', 'c')).assertEqual('cba');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0129
     * @tc.name      testStringUtils0029
     * @tc.desc      Verify truncate returns an empty text for a non-positive limit and for missing input.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.truncate('abcdef', 0)).assertEqual('');
      expect(StringUtils.truncate('abcdef', -1)).assertEqual('');
      expect(StringUtils.truncate('abcdef', -100)).assertEqual('');
      expect(StringUtils.truncate(null, 3)).assertEqual('');
      expect(StringUtils.truncate(undefined, 3)).assertEqual('');
      expect(StringUtils.truncate(null, 5)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0130
     * @tc.name      testStringUtils0030
     * @tc.desc      Verify truncate covers every truncation fixture including invalid limits.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: TruncateCase[] = TextFixtureFactory.truncateCases();
      expect(cases.length).assertEqual(10);
      for (const item of cases) {
        hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' truncate=' + item.label);
        expect(StringUtils.truncate(item.value, item.maxLength)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0131
     * @tc.name      testStringUtils0031
     * @tc.desc      Verify truncate appends the three dot suffix only when the input is really shortened.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.truncate('abc', 3)).assertEqual('abc');
      expect(StringUtils.truncate('abcde', 5)).assertEqual('abcde');
      expect(StringUtils.truncate('abcd', 3)).assertEqual('abc...');
      expect(StringUtils.truncate('abcdef', 3).endsWith(TRUNCATE_SUFFIX)).assertTrue();
      expect(StringUtils.truncate('abc', 3).endsWith(TRUNCATE_SUFFIX)).assertFalse();
      expect(StringUtils.truncate('abcdef', 3).length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0132
     * @tc.name      testStringUtils0032
     * @tc.desc      Verify the truncated text keeps exactly maxLength source characters before the suffix.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const oneChar: string = StringUtils.truncate(LONG_TEXT, 1);
      const fiveChars: string = StringUtils.truncate(LONG_TEXT, 5);
      expect(oneChar).assertEqual('a...');
      expect(fiveChars).assertEqual('abcde...');
      expect(oneChar.startsWith('a')).assertTrue();
      expect(fiveChars.startsWith('abcde')).assertTrue();
      expect(oneChar.length).assertEqual(4);
      expect(fiveChars.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0133
     * @tc.name      testStringUtils0033
     * @tc.desc      Verify truncate returns the original empty text and tolerates a very large limit.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.truncate('', 5)).assertEqual('');
      expect(StringUtils.truncate('', 0)).assertEqual('');
      expect(StringUtils.truncate('abcdef', 1000)).assertEqual('abcdef');
      expect(StringUtils.truncate('abcdef', 1000).length).assertEqual(6);
      expect(StringUtils.truncate('abcdef', 6)).assertEqual('abcdef');
      expect(StringUtils.truncate('abcdef', 5)).assertEqual('abcde...');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0134
     * @tc.name      testStringUtils0034
     * @tc.desc      Verify join covers every join fixture and drops empty fragments.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: JoinCase[] = TextFixtureFactory.joinCases();
      expect(cases.length).assertEqual(10);
      for (const item of cases) {
        hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' join=' + item.label);
        const parts: Array<string | null | undefined> = [];
        for (const part of item.parts) {
          parts.push(part);
        }
        expect(StringUtils.join(item.separator, parts)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0135
     * @tc.name      testStringUtils0035
     * @tc.desc      Verify join drops null and undefined fragments declared explicitly as nullable parts.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const parts: Array<string | null | undefined> = [];
      parts.push('a');
      parts.push(null);
      parts.push('b');
      parts.push(undefined);
      parts.push('c');
      expect(parts.length).assertEqual(5);
      expect(StringUtils.join('-', parts)).assertEqual('a-b-c');
      const nullsOnly: Array<string | null | undefined> = [];
      nullsOnly.push(null);
      nullsOnly.push(undefined);
      nullsOnly.push(null);
      expect(StringUtils.join('-', nullsOnly)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0136
     * @tc.name      testStringUtils0036
     * @tc.desc      Verify join with a leading null fragment does not produce a duplicated separator.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const leadingNull: Array<string | null | undefined> = [];
      leadingNull.push(null);
      leadingNull.push('a');
      leadingNull.push('b');
      expect(StringUtils.join(',', leadingNull)).assertEqual('a,b');
      expect(StringUtils.join(',', leadingNull).startsWith(',')).assertFalse();
      const trailingNull: Array<string | null | undefined> = [];
      trailingNull.push('a');
      trailingNull.push('b');
      trailingNull.push(undefined);
      expect(StringUtils.join(',', trailingNull)).assertEqual('a,b');
      expect(StringUtils.join(',', trailingNull).endsWith(',')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0137
     * @tc.name      testStringUtils0037
     * @tc.desc      Verify join returns an empty text for an empty list and for an all empty list.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const none: Array<string | null | undefined> = [];
      const allEmpty: Array<string | null | undefined> = [];
      allEmpty.push('');
      allEmpty.push('');
      allEmpty.push('');
      expect(StringUtils.join('/', none)).assertEqual('');
      expect(StringUtils.join('/', allEmpty)).assertEqual('');
      expect(StringUtils.join('/', none).length).assertEqual(0);
      expect(StringUtils.join('/', allEmpty).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0138
     * @tc.name      testStringUtils0038
     * @tc.desc      Verify join keeps a single fragment unchanged and supports multi character separators.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const single: Array<string | null | undefined> = [];
      single.push('a');
      expect(StringUtils.join('::', single)).assertEqual('a');
      const two: Array<string | null | undefined> = [];
      two.push('a');
      two.push('b');
      expect(StringUtils.join('::', two)).assertEqual('a::b');
      expect(StringUtils.join('', two)).assertEqual('ab');
      expect(StringUtils.join(' ', two)).assertEqual('a b');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0139
     * @tc.name      testStringUtils0039
     * @tc.desc      Verify toIntOrDefault parses decimal text and falls back for missing or unparsable input.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.toIntOrDefault(null, FALLBACK_INT)).assertEqual(FALLBACK_INT);
      expect(StringUtils.toIntOrDefault(undefined, FALLBACK_INT)).assertEqual(FALLBACK_INT);
      expect(StringUtils.toIntOrDefault('42', FALLBACK_INT)).assertEqual(42);
      expect(StringUtils.toIntOrDefault('0', FALLBACK_INT)).assertEqual(0);
      expect(StringUtils.toIntOrDefault('-7', FALLBACK_INT)).assertEqual(-7);
      expect(StringUtils.toIntOrDefault('abc', FALLBACK_INT)).assertEqual(FALLBACK_INT);
      expect(StringUtils.toIntOrDefault('', FALLBACK_INT)).assertEqual(FALLBACK_INT);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0140
     * @tc.name      testStringUtils0040
     * @tc.desc      Verify toIntOrDefault mimics parseInt so trailing and leading noise are tolerated.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.toIntOrDefault('12abc', FALLBACK_INT)).assertEqual(12);
      expect(StringUtils.toIntOrDefault('  12', FALLBACK_INT)).assertEqual(12);
      expect(StringUtils.toIntOrDefault('1.5', FALLBACK_INT)).assertEqual(1);
      expect(StringUtils.toIntOrDefault('007', FALLBACK_INT)).assertEqual(7);
      expect(StringUtils.toIntOrDefault('9', FALLBACK_INT)).assertEqual(9);
      expect(StringUtils.toIntOrDefault('0x10', FALLBACK_INT)).assertEqual(0);
      expect(StringUtils.toIntOrDefault('10', 0)).assertEqual(10);
      expect(Number.parseInt('42', RADIX_DECIMAL)).assertEqual(StringUtils.toIntOrDefault('42', 0));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0141
     * @tc.name      testStringUtils0041
     * @tc.desc      Verify toIntOrDefault returns the caller supplied default untouched on failure.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.toIntOrDefault('abc', 0)).assertEqual(0);
      expect(StringUtils.toIntOrDefault('abc', 100)).assertEqual(100);
      expect(StringUtils.toIntOrDefault(null, 7)).assertEqual(7);
      expect(StringUtils.toIntOrDefault(undefined, 7)).assertEqual(7);
      expect(StringUtils.toIntOrDefault('', 7)).assertEqual(7);
      expect(StringUtils.toIntOrDefault('NaN', -1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0142
     * @tc.name      testStringUtils0042
     * @tc.desc      Verify isNumeric accepts ASCII digit text against every numeric fixture.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStringUtils0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FlagCase[] = TextFixtureFactory.numericTextCases();
      expect(cases.length).assertEqual(15);
      for (const item of cases) {
        hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' numeric=' + item.label);
        expect(StringUtils.isNumeric(item.value)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0143
     * @tc.name      testStringUtils0043
     * @tc.desc      Verify isNumeric rejects null and undefined and only accepts pure ASCII digits.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.isNumeric(null)).assertFalse();
      expect(StringUtils.isNumeric(undefined)).assertFalse();
      expect(StringUtils.isNumeric('0')).assertTrue();
      expect(StringUtils.isNumeric('0123456789')).assertTrue();
      expect(StringUtils.isNumeric('-1')).assertFalse();
      expect(StringUtils.isNumeric('1.5')).assertFalse();
      expect(StringUtils.isNumeric(' 1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0144
     * @tc.name      testStringUtils0044
     * @tc.desc      Verify the accepted numeric fixtures are all non empty while rejected ones may be any text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const accepted: FlagCase[] = TextFixtureFactory.acceptedCases(TextFixtureFactory.numericTextCases());
      const rejected: FlagCase[] = TextFixtureFactory.rejectedCases(TextFixtureFactory.numericTextCases());
      expect(accepted.length).assertEqual(5);
      expect(rejected.length).assertEqual(10);
      for (const item of accepted) {
        expect(StringUtils.isNumeric(item.value)).assertTrue();
        expect(StringUtils.isEmpty(item.value)).assertFalse();
      }
      for (const item of rejected) {
        expect(StringUtils.isNumeric(item.value)).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0145
     * @tc.name      testStringUtils0045
     * @tc.desc      Verify the fixture catalog is intact so every suite case keeps a stable input set.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0045';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const total: number = countFixtureWeight();
      expect(total).assertEqual(91);
      expect(total > 0).assertTrue();
      expect(TextFixtureFactory.emptyCases().length).assertEqual(9);
      expect(TextFixtureFactory.blankCases().length).assertEqual(12);
      expect(TextFixtureFactory.numericTextCases().length).assertEqual(15);
      expect(TextFixtureFactory.formatCases().length).assertEqual(12);
      expect(TextFixtureFactory.truncateCases().length).assertEqual(10);
      expect(TextFixtureFactory.capitalizeCases().length).assertEqual(9);
      expect(TextFixtureFactory.joinCases().length).assertEqual(10);
      expect(TextFixtureFactory.equalsPairs().length).assertEqual(7);
      expect(TextFixtureFactory.ignoreCasePairs().length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0146
     * @tc.name      testStringUtils0046
     * @tc.desc      Verify a small pipeline of trim, capitalize and truncate produces the expected display text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0046';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const raw: string | null = '  meeting room  ';
      const trimmed: string = StringUtils.trimToEmpty(raw);
      const titled: string = StringUtils.capitalize(trimmed);
      const short: string = StringUtils.truncate(titled, 7);
      expect(trimmed).assertEqual('meeting room');
      expect(titled).assertEqual('Meeting room');
      expect(short).assertEqual('Meeting...');
      expect(StringUtils.isBlank(raw)).assertFalse();
      expect(StringUtils.isNumeric(trimmed)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0147
     * @tc.name      testStringUtils0047
     * @tc.desc      Verify format and join cooperate when building a room label from nullable fragments.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0047';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const parts: Array<string | null | undefined> = [];
      parts.push('A3');
      parts.push(null);
      parts.push('投影');
      const joined: string = StringUtils.join('/', parts);
      const label: string = StringUtils.format('{0}@{1}', joined, '会议室');
      expect(joined).assertEqual('A3/投影');
      expect(label).assertEqual('A3/投影@会议室');
      expect(StringUtils.isBlank(label)).assertFalse();
      expect(label.includes('null')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0148
     * @tc.name      testStringUtils0048
     * @tc.desc      Verify the tolerance difference between isNumeric and toIntOrDefault on the same inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0048';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.isNumeric('1.5')).assertFalse();
      expect(StringUtils.toIntOrDefault('1.5', FALLBACK_INT)).assertEqual(1);
      expect(StringUtils.isNumeric('12abc')).assertFalse();
      expect(StringUtils.toIntOrDefault('12abc', FALLBACK_INT)).assertEqual(12);
      expect(StringUtils.isNumeric('42')).assertTrue();
      expect(StringUtils.toIntOrDefault('42', FALLBACK_INT)).assertEqual(42);
      expect(StringUtils.isNumeric(' 42')).assertFalse();
      expect(StringUtils.toIntOrDefault(' 42', FALLBACK_INT)).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0149
     * @tc.name      testStringUtils0049
     * @tc.desc      Verify join drops every nullable fragment when the whole part list contains only nulls.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0049';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const allNull: Array<string | null | undefined> = buildNullableParts(3);
      const joined: string = StringUtils.join('-', allNull);
      expect(joined).assertEqual('');
      expect(joined.length).assertEqual(0);
      expect(allNull.length).assertEqual(3);
      expect(StringUtils.isBlank(joined)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0150
     * @tc.name      testStringUtils0050
     * @tc.desc      Verify join keeps the separator single when nullable fragments sit between real parts.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0050';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const parts: Array<string | null | undefined> = [];
      parts.push('A');
      parts.push(undefined);
      parts.push('B');
      parts.push(null);
      parts.push('C');
      const joined: string = StringUtils.join('+', parts);
      expect(joined).assertEqual('A+B+C');
      expect(joined.split('+').length).assertEqual(3);
      expect(joined.includes('++')).assertFalse();
      expect(joined.startsWith('+')).assertFalse();
      expect(joined.endsWith('+')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0151
     * @tc.name      testStringUtils0051
     * @tc.desc      Verify nullable variants of isEmpty and isBlank agree with their literal equivalents.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0051';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const nullValue: string | null = null;
      const undefinedValue: string | undefined = undefined;
      const spaceValue: string = '  ';
      expect(StringUtils.isEmpty(nullValue)).assertTrue();
      expect(StringUtils.isEmpty(undefinedValue)).assertTrue();
      expect(StringUtils.isEmpty(null)).assertEqual(StringUtils.isEmpty(nullValue));
      expect(StringUtils.isEmpty(undefined)).assertEqual(StringUtils.isEmpty(undefinedValue));
      expect(StringUtils.isBlank(nullValue)).assertTrue();
      expect(StringUtils.isBlank(undefinedValue)).assertTrue();
      expect(StringUtils.isBlank(spaceValue)).assertTrue();
      expect(StringUtils.isEmpty(spaceValue)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0152
     * @tc.name      testStringUtils0052
     * @tc.desc      Verify trimToEmpty normalises undefined and null while leaving internal text untouched.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0052';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const nullValue: string | null = null;
      const undefinedValue: string | undefined = undefined;
      expect(StringUtils.trimToEmpty(nullValue)).assertEqual('');
      expect(StringUtils.trimToEmpty(undefinedValue)).assertEqual('');
      expect(StringUtils.trimToEmpty('a')).assertEqual('a');
      expect(StringUtils.trimToEmpty(' a ')).assertEqual('a');
      expect(StringUtils.trimToEmpty('a b')).assertEqual('a b');
      expect(StringUtils.trimToEmpty('a b').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0153
     * @tc.name      testStringUtils0053
     * @tc.desc      Verify a pipeline of trim, join and parse keeps nullable inputs safe end to end.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0053';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const parts: Array<string | null | undefined> = [];
      parts.push(' 12 ');
      parts.push(null);
      parts.push(undefined);
      const joined: string = StringUtils.join('', parts);
      const parsed: number = StringUtils.toIntOrDefault(StringUtils.trimToEmpty(joined), FALLBACK_INT);
      expect(joined).assertEqual(' 12 ');
      expect(StringUtils.trimToEmpty(joined)).assertEqual('12');
      expect(parsed).assertEqual(12);
      expect(StringUtils.isNumeric(StringUtils.trimToEmpty(joined))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0154
     * @tc.name      testStringUtils0054
     * @tc.desc      Verify capitalize turns the lower case and upper case single character fixtures into 'A'.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0054';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: CapitalizeCase[] = TextFixtureFactory.capitalizeCases();
      const single: CapitalizeCase | null = capitalizeByLabel(cases, 'single');
      const singleUpper: CapitalizeCase | null = capitalizeByLabel(cases, 'single-upper');
      expect(single !== null).assertTrue();
      expect(singleUpper !== null).assertTrue();
      if (single !== null && singleUpper !== null) {
        expect(StringUtils.capitalize(single.value)).assertEqual(single.expected);
        expect(StringUtils.capitalize(singleUpper.value)).assertEqual(singleUpper.expected);
        expect(StringUtils.capitalize(singleUpper.value).length).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0155
     * @tc.name      testStringUtils0055
     * @tc.desc      Verify equalsIgnoreCase applies only to letters and keeps every punctuation comparison exact.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0055';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.equalsIgnoreCase('room-a', 'ROOM-A')).assertTrue();
      expect(StringUtils.equalsIgnoreCase('room_a', 'ROOM-A')).assertFalse();
      expect(StringUtils.equalsIgnoreCase('a1', 'A1')).assertTrue();
      expect(StringUtils.equalsIgnoreCase('1', '1')).assertTrue();
      expect(StringUtils.equalsIgnoreCase('-', '-')).assertTrue();
      expect(StringUtils.equals('a1', 'A1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0156
     * @tc.name      testStringUtils0056
     * @tc.desc      Verify format leaves text that merely looks like a placeholder untouched.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0056';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.format('{}', 'a')).assertEqual('{}');
      expect(StringUtils.format('{a}', 'b')).assertEqual('{a}');
      expect(StringUtils.format('{-1}', 'c')).assertEqual('{-1}');
      expect(StringUtils.format('{0', 'd')).assertEqual('{0');
      expect(StringUtils.format('0}', 'e')).assertEqual('0}');
      expect(StringUtils.format('{00}', 'f')).assertEqual('{00}');
      expect(StringUtils.format('{0}', 'g')).assertEqual('g');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0157
     * @tc.name      testStringUtils0057
     * @tc.desc      Verify truncate counts the suffix separately and never returns a text shorter than the limit.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0057';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const short: string = StringUtils.truncate('abcdef', 2);
      expect(short).assertEqual('ab' + TRUNCATE_SUFFIX);
      expect(short.length).assertEqual(5);
      expect(short.indexOf(TRUNCATE_SUFFIX)).assertEqual(2);
      expect(short.substring(0, 2)).assertEqual('ab');
      expect(StringUtils.truncate('abcdef', 6)).assertEqual('abcdef');
      expect(StringUtils.truncate('abcdef', 6).includes(TRUNCATE_SUFFIX)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0158
     * @tc.name      testStringUtils0058
     * @tc.desc      Verify the runtime type of every StringUtils return value matches its declared signature.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0058';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(typeof StringUtils.isEmpty('a')).assertEqual('boolean');
      expect(typeof StringUtils.isNotEmpty('a')).assertEqual('boolean');
      expect(typeof StringUtils.isBlank('a')).assertEqual('boolean');
      expect(typeof StringUtils.isNotBlank('a')).assertEqual('boolean');
      expect(typeof StringUtils.trimToEmpty(' a ')).assertEqual('string');
      expect(typeof StringUtils.equals('a', 'a')).assertEqual('boolean');
      expect(typeof StringUtils.equalsIgnoreCase('a', 'A')).assertEqual('boolean');
      expect(typeof StringUtils.capitalize('abc')).assertEqual('string');
      expect(typeof StringUtils.format('{0}', 'a')).assertEqual('string');
      expect(typeof StringUtils.truncate('abcdef', 2)).assertEqual('string');
      const parts: Array<string | null | undefined> = [];
      parts.push('a');
      expect(typeof StringUtils.join('-', parts)).assertEqual('string');
      expect(typeof StringUtils.toIntOrDefault('1', FALLBACK_INT)).assertEqual('number');
      expect(typeof StringUtils.isNumeric('1')).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0159
     * @tc.name      testStringUtils0059
     * @tc.desc      Verify format expands the three-holes fixture and the CJK argument fixture in placeholder order.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0059';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FormatCase[] = TextFixtureFactory.formatCases();
      const threeHoles: FormatCase | null = formatByLabel(cases, 'three-holes');
      const cjkArgs: FormatCase | null = formatByLabel(cases, 'cjk-args');
      expect(threeHoles !== null).assertTrue();
      expect(cjkArgs !== null).assertTrue();
      if (threeHoles !== null) {
        expect(StringUtils.format(threeHoles.template, 'x', 'y', 'z')).assertEqual(threeHoles.expected);
      }
      if (cjkArgs !== null) {
        expect(StringUtils.format(cjkArgs.template, '会议室', '灯')).assertEqual(cjkArgs.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0160
     * @tc.name      testStringUtils0060
     * @tc.desc      Verify the truncate fixtures that keep the text intact never grow the returned length.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0060';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: TruncateCase[] = TextFixtureFactory.truncateCases();
      const shorter: TruncateCase | null = truncateByLabel(cases, 'shorter-than-limit');
      const equal: TruncateCase | null = truncateByLabel(cases, 'equal-to-limit');
      const large: TruncateCase | null = truncateByLabel(cases, 'large-limit');
      expect(shorter !== null).assertTrue();
      expect(equal !== null).assertTrue();
      expect(large !== null).assertTrue();
      if (shorter !== null && equal !== null && large !== null) {
        expect(StringUtils.truncate(shorter.value, shorter.maxLength)).assertEqual(shorter.expected);
        expect(StringUtils.truncate(equal.value, equal.maxLength)).assertEqual(equal.expected);
        expect(StringUtils.truncate(large.value, large.maxLength)).assertEqual(large.expected);
        expect(StringUtils.truncate(equal.value, equal.maxLength).length).assertEqual(equal.value.length);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0161
     * @tc.name      testStringUtils0061
     * @tc.desc      Verify join concatenates the parts without a gap for an empty separator and with '::' for a multi character separator.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0061';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: JoinCase[] = TextFixtureFactory.joinCases();
      const emptySeparator: JoinCase | null = joinByLabel(cases, 'empty-separator');
      const multiChar: JoinCase | null = joinByLabel(cases, 'multi-char-separator');
      expect(emptySeparator !== null).assertTrue();
      expect(multiChar !== null).assertTrue();
      if (emptySeparator !== null) {
        expect(StringUtils.join(emptySeparator.separator, emptySeparator.parts))
          .assertEqual(emptySeparator.expected);
        expect(StringUtils.join(emptySeparator.separator, emptySeparator.parts).length).assertEqual(2);
      }
      if (multiChar !== null) {
        expect(StringUtils.join(multiChar.separator, multiChar.parts)).assertEqual(multiChar.expected);
        expect(StringUtils.join(multiChar.separator, multiChar.parts).length).assertEqual(4);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0162
     * @tc.name      testStringUtils0062
     * @tc.desc      Verify pairing the equals and equalsIgnoreCase fixtures by index yields exactly one disagreement, and that 'Room' differs from 'room' case sensitively but equals 'ROOM' ignoring case.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0062';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const exact: PairCase[] = TextFixtureFactory.equalsPairs();
      const loose: PairCase[] = TextFixtureFactory.ignoreCasePairs();
      expect(exact.length).assertEqual(loose.length);
      let differences: number = 0;
      for (let i = 0; i < exact.length; i++) {
        const sensitive: boolean = StringUtils.equals(exact[i].first, exact[i].second);
        const insensitive: boolean = StringUtils.equalsIgnoreCase(loose[i].first, loose[i].second);
        if (sensitive !== insensitive) {
          differences = differences + 1;
        }
      }
      expect(differences).assertEqual(1);
      expect(StringUtils.equals('Room', 'room')).assertFalse();
      expect(StringUtils.equalsIgnoreCase('Room', 'ROOM')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0163
     * @tc.name      testStringUtils0063
     * @tc.desc      Verify isEmpty and isBlank agree on '' and '0' and differ on whitespace, and that every non-empty entry of the empty catalog is not empty.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStringUtils0063';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.isEmpty('')).assertTrue();
      expect(StringUtils.isBlank('')).assertTrue();
      expect(StringUtils.isEmpty(' ')).assertFalse();
      expect(StringUtils.isBlank(' ')).assertTrue();
      expect(StringUtils.isEmpty('\t')).assertFalse();
      expect(StringUtils.isBlank('\t')).assertTrue();
      expect(StringUtils.isEmpty('0')).assertFalse();
      expect(StringUtils.isBlank('0')).assertFalse();
      const emptyRejects: FlagCase[] = TextFixtureFactory.rejectedCases(TextFixtureFactory.emptyCases());
      for (const item of emptyRejects) {
        expect(StringUtils.isEmpty(item.value)).assertFalse();
      }
      expect(emptyRejects.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_STRING_0164
     * @tc.name      testStringUtils0064
     * @tc.desc      Verify toIntOrDefault always returns a usable number for missing, blank and text inputs.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStringUtils0064';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.toIntOrDefault(null, FALLBACK_INT)).assertEqual(FALLBACK_INT);
      expect(StringUtils.toIntOrDefault(undefined, FALLBACK_INT)).assertEqual(FALLBACK_INT);
      expect(StringUtils.toIntOrDefault('', FALLBACK_INT)).assertEqual(FALLBACK_INT);
      expect(StringUtils.toIntOrDefault('   ', FALLBACK_INT)).assertEqual(FALLBACK_INT);
      expect(StringUtils.toIntOrDefault('abc', FALLBACK_INT)).assertEqual(FALLBACK_INT);
      expect(StringUtils.toIntOrDefault('abc', 0)).assertEqual(0);
      expect(Number.isNaN(StringUtils.toIntOrDefault('abc', FALLBACK_INT))).assertFalse();
      expect(Number.isInteger(StringUtils.toIntOrDefault('42', FALLBACK_INT))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

  });
}
