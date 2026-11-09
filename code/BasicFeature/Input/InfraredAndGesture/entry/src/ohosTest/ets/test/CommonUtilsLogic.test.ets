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
import {
  StringUtils, NumberUtils, DateUtils, ArrayUtils, ObjectUtils,
  ValidateUtils, SecurityUtils, DigestAlgorithm, FileUtils
} from 'common';

/**
 * Common 工具类逻辑套件：覆盖 common HAR 中纯逻辑工具类的真实分支与边界。
 * 范围：StringUtils / NumberUtils / DateUtils / ArrayUtils / ObjectUtils /
 *       ValidateUtils / SecurityUtils（digest 与 Base64）/ FileUtils.joinPath。
 * 明确不覆盖：AppLogger（无返回值）、StringResources（依赖 EntryAbility 注入），
 * DeviceUtils / AppInfoUtils / NetworkUtils（系统运行时探测），
 * FileUtils 其余 IO 方法（需要沙箱文件系统与 context）。
 */

/** Hilog domain reserved for the common utils logic tests. */
const DOMAIN: number = 0xF812;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_CommonUtils_';
/** One hour in milliseconds, used by duration and same-day comparisons. */
const ONE_HOUR_MS: number = 3600000;
/** One day in milliseconds, used by same-day comparisons. */
const ONE_DAY_MS: number = 86400000;
/** Bytes of one kilobyte. */
const ONE_KB: number = 1024;
/** Bytes of one megabyte. */
const ONE_MB: number = 1024 * 1024;
/** Bytes of one gigabyte. */
const ONE_GB: number = 1024 * 1024 * 1024;
/** Bytes of one terabyte. */
const ONE_TB: number = 1024 * 1024 * 1024 * 1024;

/** Pads a numeric time component to at least two digits, mirroring DateUtils output. */
function padTwo(value: number): string {
  if (value < 10) {
    return '0' + value.toString();
  }
  return value.toString();
}

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

/** Node type used to build a circular reference on purpose. */
class LinkNode {
  public value: number = 0;
  public next: LinkNode | null = null;
}

export default function commonUtilsLogicTest() {
  describe('CommonUtilsLogicTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0100
     * @tc.name      testCommonUtils0001
     * @tc.desc      null、undefined 与空串判定为空，非空串判定为非空，两个方法结果互逆。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.isEmpty(null)).assertTrue();
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      expect(StringUtils.isEmpty('')).assertTrue();
      expect(StringUtils.isEmpty('room-a')).assertFalse();
      expect(StringUtils.isNotEmpty('room-a')).assertTrue();
      expect(StringUtils.isNotEmpty('')).assertFalse();
      expect(StringUtils.isEmpty('room-a') !== StringUtils.isNotEmpty('room-a')).assertTrue();
      expect(StringUtils.isEmpty('') !== StringUtils.isNotEmpty('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0101
     * @tc.name      testCommonUtils0002
     * @tc.desc      缺失输入与纯空白串（空格、制表符）判定为空白，有效内容判定为非空白。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.isBlank(null)).assertTrue();
      expect(StringUtils.isBlank(undefined)).assertTrue();
      expect(StringUtils.isBlank(' ')).assertTrue();
      expect(StringUtils.isBlank('\t')).assertTrue();
      expect(StringUtils.isNotBlank('会议纪要')).assertTrue();
      expect(StringUtils.isNotBlank(' ')).assertFalse();
      expect(StringUtils.isBlank('会议纪要') !== StringUtils.isNotBlank('会议纪要')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0102
     * @tc.name      testCommonUtils0003
     * @tc.desc      含非空白字符的内容不是空白串，纯控制空白仍是空白串，两方法互逆。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.isBlank('a b')).assertFalse();
      expect(StringUtils.isNotBlank('  x  ')).assertTrue();
      expect(StringUtils.isBlank('\t\n')).assertTrue();
      expect(StringUtils.isNotBlank('\t\n') !== StringUtils.isBlank('\t\n')).assertTrue();
      expect(StringUtils.isNotBlank('0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0103
     * @tc.name      testCommonUtils0004
     * @tc.desc      缺失输入归一为空串，去首尾空白但保留内部空格。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.trimToEmpty(null)).assertEqual('');
      expect(StringUtils.trimToEmpty(undefined)).assertEqual('');
      expect(StringUtils.trimToEmpty('  a b  ')).assertEqual('a b');
      expect(StringUtils.trimToEmpty('\t\tab\t')).assertEqual('ab');
      expect(StringUtils.trimToEmpty('  ').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0104
     * @tc.name      testCommonUtils0005
     * @tc.desc      两个缺失值相等，缺失值与具体内容不相等，相同与不同内容的判定准确。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.equals(null, null)).assertTrue();
      expect(StringUtils.equals(undefined, undefined)).assertTrue();
      expect(StringUtils.equals(null, 'a')).assertFalse();
      expect(StringUtils.equals('a', null)).assertFalse();
      expect(StringUtils.equals('a', 'a')).assertTrue();
      expect(StringUtils.equals('a', 'b')).assertFalse();
      expect(StringUtils.equals('ab', 'ab')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0105
     * @tc.name      testCommonUtils0006
     * @tc.desc      忽略大小写比较相同内容，任一输入缺失即不相等（双侧缺失也不相等）。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.equalsIgnoreCase('ABC', 'abc')).assertTrue();
      expect(StringUtils.equalsIgnoreCase('Meeting', 'MEETING')).assertTrue();
      expect(StringUtils.equalsIgnoreCase(null, 'abc')).assertFalse();
      expect(StringUtils.equalsIgnoreCase('abc', null)).assertFalse();
      expect(StringUtils.equalsIgnoreCase(undefined, undefined)).assertFalse();
      expect(StringUtils.equalsIgnoreCase('abc', 'abd')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0106
     * @tc.name      testCommonUtils0007
     * @tc.desc      缺失与空输入返回空串，其余输入仅首字母大写、大小写其余保持不变。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.capitalize(null)).assertEqual('');
      expect(StringUtils.capitalize(undefined)).assertEqual('');
      expect(StringUtils.capitalize('')).assertEqual('');
      expect(StringUtils.capitalize('abc')).assertEqual('Abc');
      expect(StringUtils.capitalize('a')).assertEqual('A');
      expect(StringUtils.capitalize('abcDef')).assertEqual('AbcDef');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0107
     * @tc.name      testCommonUtils0008
     * @tc.desc      已是大写开头的内容重复调用结果不变（幂等），首字符无大小写时原样返回。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.capitalize('Abc')).assertEqual('Abc');
      expect(StringUtils.capitalize(StringUtils.capitalize('abc'))).assertEqual('Abc');
      expect(StringUtils.capitalize('Abc')).assertEqual(StringUtils.capitalize('abc'));
      expect(StringUtils.capitalize('会议')).assertEqual('会议');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0108
     * @tc.name      testCommonUtils0009
     * @tc.desc      模板占位符按序替换，重复占位符全部替换，占位符顺序与参数顺序可不同。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.format('{0} 和 {1}', '甲', '乙')).assertEqual('甲 和 乙');
      expect(StringUtils.format('{0}-{0}', 'x')).assertEqual('x-x');
      expect(StringUtils.format('{1}{0}', 'b', 'a')).assertEqual('ab');
      expect(StringUtils.format('{0}号会议室', 'A3')).assertEqual('A3号会议室');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0109
     * @tc.name      testCommonUtils0010
     * @tc.desc      占位符多于参数时多余占位符保留原文，无占位符原样返回，空模板返回空串。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.format('{0} 和 {2}', 'a', 'b')).assertEqual('a 和 {2}');
      expect(StringUtils.format('plain text', 'x')).assertEqual('plain text');
      expect(StringUtils.format('', 'x')).assertEqual('');
      expect(StringUtils.format('{0}', 'a')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0110
     * @tc.name      testCommonUtils0011
     * @tc.desc      长度限制非正数或输入缺失时直接返回空串，空串输入无需截断。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.truncate('abcdef', 0)).assertEqual('');
      expect(StringUtils.truncate('abcdef', -1)).assertEqual('');
      expect(StringUtils.truncate(null, 5)).assertEqual('');
      expect(StringUtils.truncate(undefined, 5)).assertEqual('');
      expect(StringUtils.truncate('', 5)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0111
     * @tc.name      testCommonUtils0012
     * @tc.desc      长度恰等于上限时原样返回不加后缀，超长时截断并追加省略号。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.truncate('abcde', 5)).assertEqual('abcde');
      expect(StringUtils.truncate('abcdef', 3)).assertEqual('abc...');
      const trimmed: string = StringUtils.truncate('abcdefg', 4);
      expect(trimmed.length).assertEqual(7);
      expect(trimmed.endsWith('...')).assertTrue();
      expect(trimmed.startsWith('abcd')).assertTrue();
      expect(trimmed.substring(0, 4)).assertEqual('abcd');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0112
     * @tc.name      testCommonUtils0013
     * @tc.desc      正常拼接各片段，缺失与空片段被跳过，全空片段与空列表返回空串。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.join('-', ['a', 'b', 'c'])).assertEqual('a-b-c');
      expect(StringUtils.join('-', ['a', null, undefined, '', 'b'])).assertEqual('a-b');
      expect(StringUtils.join('-', ['', '', ''])).assertEqual('');
      expect(StringUtils.join('', ['a', 'b'])).assertEqual('ab');
      expect(StringUtils.join(',', [])).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0113
     * @tc.name      testCommonUtils0014
     * @tc.desc      缺失或不可解析的输入返回默认值，可解析前缀仍取前缀数值。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const fallback: number = -7;
      expect(StringUtils.toIntOrDefault(null, fallback)).assertEqual(fallback);
      expect(StringUtils.toIntOrDefault(undefined, fallback)).assertEqual(fallback);
      expect(StringUtils.toIntOrDefault('abc', fallback)).assertEqual(fallback);
      expect(StringUtils.toIntOrDefault('', fallback)).assertEqual(fallback);
      expect(StringUtils.toIntOrDefault('12x', fallback)).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0114
     * @tc.name      testCommonUtils0015
     * @tc.desc      十进制字符串正常解析为整数，负数与带前导零输入解析正确，小数截断。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.toIntOrDefault('42', 0)).assertEqual(42);
      expect(StringUtils.toIntOrDefault('-5', 0)).assertEqual(-5);
      expect(StringUtils.toIntOrDefault('007', 0)).assertEqual(7);
      expect(StringUtils.toIntOrDefault('3.9', 0)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0115
     * @tc.name      testCommonUtils0016
     * @tc.desc      仅 ASCII 数字串判定为数字，缺失、空串、小数点、正负号、空白均判定失败。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(StringUtils.isNumeric(null)).assertFalse();
      expect(StringUtils.isNumeric(undefined)).assertFalse();
      expect(StringUtils.isNumeric('')).assertFalse();
      expect(StringUtils.isNumeric('123')).assertTrue();
      expect(StringUtils.isNumeric('007')).assertTrue();
      expect(StringUtils.isNumeric('12a')).assertFalse();
      expect(StringUtils.isNumeric('1.5')).assertFalse();
      expect(StringUtils.isNumeric('-1')).assertFalse();
      expect(StringUtils.isNumeric('+1')).assertFalse();
      expect(StringUtils.isNumeric(' ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0116
     * @tc.name      testCommonUtils0017
     * @tc.desc      缺失或不可解析的输入返回默认值，首个字符即不可解析时解析失败。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const fallback: number = -1;
      expect(NumberUtils.parseIntSafe(null, fallback)).assertEqual(fallback);
      expect(NumberUtils.parseIntSafe(undefined, fallback)).assertEqual(fallback);
      expect(NumberUtils.parseIntSafe('abc', fallback)).assertEqual(fallback);
      expect(NumberUtils.parseIntSafe('', fallback)).assertEqual(fallback);
      expect(NumberUtils.parseIntSafe('x9', fallback)).assertEqual(fallback);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0117
     * @tc.name      testCommonUtils0018
     * @tc.desc      整数字符串正常解析，小数输入截断为整数，前导零按十进制处理。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.parseIntSafe('42', 0)).assertEqual(42);
      expect(NumberUtils.parseIntSafe('-5', 0)).assertEqual(-5);
      expect(NumberUtils.parseIntSafe('3.9', 0)).assertEqual(3);
      expect(NumberUtils.parseIntSafe('007', 0)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0118
     * @tc.name      testCommonUtils0019
     * @tc.desc      浮点字符串正常解析并保留小数，缺失或非法输入返回默认值，可解析前缀生效。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const fallback: number = -1;
      expect(NumberUtils.parseFloatSafe(null, fallback)).assertEqual(fallback);
      expect(NumberUtils.parseFloatSafe(undefined, fallback)).assertEqual(fallback);
      expect(NumberUtils.parseFloatSafe('abc', fallback)).assertEqual(fallback);
      expect(NumberUtils.parseFloatSafe('3.9', 0)).assertEqual(3.9);
      expect(NumberUtils.parseFloatSafe('42', 0)).assertEqual(42);
      expect(NumberUtils.parseFloatSafe('2.5x', 0)).assertEqual(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0119
     * @tc.name      testCommonUtils0020
     * @tc.desc      普通数值与零为有限数，NaN 与正负无穷均不是有限数。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.isFiniteNumber(0)).assertTrue();
      expect(NumberUtils.isFiniteNumber(1.5)).assertTrue();
      expect(NumberUtils.isFiniteNumber(-100)).assertTrue();
      expect(NumberUtils.isFiniteNumber(Number.NaN)).assertFalse();
      expect(NumberUtils.isFiniteNumber(Number.POSITIVE_INFINITY)).assertFalse();
      expect(NumberUtils.isFiniteNumber(Number.NEGATIVE_INFINITY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0120
     * @tc.name      testCommonUtils0021
     * @tc.desc      区间内的数值原样返回，恰等于上下边界的数值返回边界值本身。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.clamp(5, 1, 10)).assertEqual(5);
      expect(NumberUtils.clamp(1, 1, 10)).assertEqual(1);
      expect(NumberUtils.clamp(10, 1, 10)).assertEqual(10);
      expect(NumberUtils.clamp(7.5, 7, 8)).assertEqual(7.5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0121
     * @tc.name      testCommonUtils0022
     * @tc.desc      低于下界返回下界，高于上界返回上界，上下界互换时按交换后区间夹紧。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.clamp(0, 1, 10)).assertEqual(1);
      expect(NumberUtils.clamp(15, 1, 10)).assertEqual(10);
      const swapped: number = NumberUtils.clamp(5, 10, 0);
      expect(swapped).assertEqual(5);
      expect(swapped >= 0 && swapped <= 10).assertTrue();
      expect(NumberUtils.clamp(5, 5, 5)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0122
     * @tc.name      testCommonUtils0023
     * @tc.desc      区间内与恰等边界判定为在范围内，越界与退化单点区间判定准确。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.isInRange(5, 1, 10)).assertTrue();
      expect(NumberUtils.isInRange(1, 1, 10)).assertTrue();
      expect(NumberUtils.isInRange(10, 1, 10)).assertTrue();
      expect(NumberUtils.isInRange(0, 1, 10)).assertFalse();
      expect(NumberUtils.isInRange(11, 1, 10)).assertFalse();
      expect(NumberUtils.isInRange(7, 7, 7)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0123
     * @tc.name      testCommonUtils0024
     * @tc.desc      按指定位数四舍五入输出，零、负数与整数输入格式化正确。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.toFixedString(3.14159, 2)).assertEqual('3.14');
      expect(NumberUtils.toFixedString(0, 2)).assertEqual('0.00');
      expect(NumberUtils.toFixedString(-2.5, 1)).assertEqual('-2.5');
      expect(NumberUtils.toFixedString(7, 0)).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0124
     * @tc.name      testCommonUtils0025
     * @tc.desc      负数与非数位数按 0 位处理，超过 100 位时按 100 位封顶输出。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.toFixedString(3.14159, -1)).assertEqual('3');
      expect(NumberUtils.toFixedString(3.14159, Number.NaN)).assertEqual('3');
      const many: string = NumberUtils.toFixedString(2, 101);
      expect(many.length).assertEqual(102);
      expect(many.charAt(0)).assertEqual('2');
      expect(many.charAt(1)).assertEqual('.');
      expect(many.charAt(101)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0125
     * @tc.name      testCommonUtils0026
     * @tc.desc      字节量级保持 B 单位两位小数，恰满 1024 字节进位为 KB。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.formatFileSize(0)).assertEqual('0.00B');
      expect(NumberUtils.formatFileSize(1)).assertEqual('1.00B');
      expect(NumberUtils.formatFileSize(1023)).assertEqual('1023.00B');
      expect(NumberUtils.formatFileSize(1024)).assertEqual('1.00KB');
      expect(NumberUtils.formatFileSize(2048)).assertEqual('2.00KB');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0126
     * @tc.name      testCommonUtils0027
     * @tc.desc      各级单位换算正确，1024 进位边界输出 1.00 单位，非整数换算保留两位小数。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.formatFileSize(ONE_MB)).assertEqual('1.00MB');
      expect(NumberUtils.formatFileSize(ONE_GB)).assertEqual('1.00GB');
      expect(NumberUtils.formatFileSize(10 * ONE_TB)).assertEqual('10.00TB');
      expect(NumberUtils.formatFileSize(1536)).assertEqual('1.50KB');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0127
     * @tc.name      testCommonUtils0028
     * @tc.desc      比满级单位差一字节仍在低一级单位，恰满 1024 的幂次进位到 TB。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.formatFileSize(ONE_TB - 1)).assertEqual('1024.00GB');
      expect(NumberUtils.formatFileSize(ONE_TB)).assertEqual('1.00TB');
      expect(NumberUtils.formatFileSize(2 * ONE_TB)).assertEqual('2.00TB');
      expect(NumberUtils.formatFileSize(ONE_TB / 2)).assertEqual('512.00GB');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0128
     * @tc.name      testCommonUtils0029
     * @tc.desc      超大字节数单位封顶在 TB，负数、NaN 与无穷输入归一为零字节输出。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.formatFileSize(Number.MAX_SAFE_INTEGER)).assertEqual('8192.00TB');
      expect(NumberUtils.formatFileSize(-1)).assertEqual('0.00B');
      expect(NumberUtils.formatFileSize(Number.NaN)).assertEqual('0.00B');
      expect(NumberUtils.formatFileSize(Number.POSITIVE_INFINITY)).assertEqual('0.00B');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0129
     * @tc.name      testCommonUtils0030
     * @tc.desc      当前毫秒时间戳与系统时钟读取值单调一致，两次调用间隔小于 1 秒。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const before: number = DateUtils.nowMillis();
      const middle: number = Date.now();
      const after: number = DateUtils.nowMillis();
      expect(middle >= before).assertTrue();
      expect(middle <= after).assertTrue();
      expect(after >= before).assertTrue();
      expect(after - before < 1000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0130
     * @tc.name      testCommonUtils0031
     * @tc.desc      默认格式输出总长 19 位，年月日与时分秒之间的分隔符位置和字符正确。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const text: string = DateUtils.formatTimestamp(Date.now());
      expect(text.length).assertEqual(19);
      expect(text.charAt(4)).assertEqual('-');
      expect(text.charAt(7)).assertEqual('-');
      expect(text.charAt(10)).assertEqual(' ');
      expect(text.charAt(13)).assertEqual(':');
      expect(text.charAt(16)).assertEqual(':');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0131
     * @tc.name      testCommonUtils0032
     * @tc.desc      输出各字段与本地时间字段拼接结果完全一致，同一时间戳重复格式化结果相同。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const millis: number = Date.now();
      const date: Date = new Date(millis);
      const expected: string = date.getFullYear().toString() + '-'
        + padTwo(date.getMonth() + 1) + '-' + padTwo(date.getDate()) + ' '
        + padTwo(date.getHours()) + ':' + padTwo(date.getMinutes()) + ':'
        + padTwo(date.getSeconds());
      const actual: string = DateUtils.formatTimestamp(millis);
      expect(actual).assertEqual(expected);
      expect(actual.length).assertEqual(19);
      expect(actual.substring(0, 4)).assertEqual(date.getFullYear().toString());
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0132
     * @tc.name      testCommonUtils0033
     * @tc.desc      自定义分隔符按 pattern 输出年月日与时分秒，默认 pattern 结果与固定本地时间一致。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const base: number = new Date(2024, 2, 15, 9, 5, 3).getTime();
      expect(DateUtils.formatTimestampWithPattern(base, 'yyyy/MM/dd')).assertEqual('2024/03/15');
      expect(DateUtils.formatTimestampWithPattern(base, 'HH:mm:ss')).assertEqual('09:05:03');
      expect(DateUtils.formatTimestampWithPattern(base, 'yyyy-MM-dd HH:mm:ss'))
        .assertEqual('2024-03-15 09:05:03');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0133
     * @tc.name      testCommonUtils0034
     * @tc.desc      pattern 中的非 token 文本原样保留，无 token 的文本原样返回，token 重复替换。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const base: number = new Date(2024, 2, 15, 9, 5, 3).getTime();
      expect(DateUtils.formatTimestampWithPattern(base, 'yyyy年MM月dd日')).assertEqual('2024年03月15日');
      expect(DateUtils.formatTimestampWithPattern(base, 'abc')).assertEqual('abc');
      expect(DateUtils.formatTimestampWithPattern(base, 'HH-HH')).assertEqual('09-09');
      expect(DateUtils.formatTimestampWithPattern(base, 'mm:ss')).assertEqual('05:03');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0134
     * @tc.name      testCommonUtils0035
     * @tc.desc      负数、NaN 与无穷时间戳返回空串，空 pattern 回退默认格式输出。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatTimestampWithPattern(-1, 'yyyy/MM/dd')).assertEqual('');
      expect(DateUtils.formatTimestampWithPattern(Number.NaN, 'yyyy/MM/dd')).assertEqual('');
      expect(DateUtils.formatTimestampWithPattern(Number.POSITIVE_INFINITY, 'yyyy/MM/dd')).assertEqual('');
      const fallback: string = DateUtils.formatTimestampWithPattern(
        new Date(2024, 2, 15, 9, 5, 3).getTime(), '');
      expect(fallback.length).assertEqual(19);
      expect(fallback).assertEqual('2024-03-15 09:05:03');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0135
     * @tc.name      testCommonUtils0036
     * @tc.desc      不足一秒归零显示，恰满一秒进位，秒位满 59 秒后归零不进位错误。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(0)).assertEqual('00:00:00');
      expect(DateUtils.formatDuration(999)).assertEqual('00:00:00');
      expect(DateUtils.formatDuration(1000)).assertEqual('00:00:01');
      expect(DateUtils.formatDuration(59999)).assertEqual('00:00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0136
     * @tc.name      testCommonUtils0037
     * @tc.desc      分钟与小时按六十进制进位，时分秒组合输出逐位正确。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(60000)).assertEqual('00:01:00');
      expect(DateUtils.formatDuration(3600000)).assertEqual('01:00:00');
      expect(DateUtils.formatDuration(3661000)).assertEqual('01:01:01');
      expect(DateUtils.formatDuration(7322000)).assertEqual('02:02:02');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0137
     * @tc.name      testCommonUtils0038
     * @tc.desc      负数与 NaN 返回空串，超大时长的小时段可超过两位正常显示。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.formatDuration(-1)).assertEqual('');
      expect(DateUtils.formatDuration(Number.NaN)).assertEqual('');
      expect(DateUtils.formatDuration(Number.POSITIVE_INFINITY)).assertEqual('');
      expect(DateUtils.formatDuration(100 * ONE_HOUR_MS)).assertEqual('100:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0138
     * @tc.name      testCommonUtils0039
     * @tc.desc      起点为负数、NaN 与负无穷时耗时按 0 处理，不产生负耗时。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(DateUtils.elapsedSince(-1)).assertEqual(0);
      expect(DateUtils.elapsedSince(Number.NaN)).assertEqual(0);
      expect(DateUtils.elapsedSince(Number.NEGATIVE_INFINITY)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0139
     * @tc.name      testCommonUtils0040
     * @tc.desc      以刚采集的时间点为起点耗时非负且小于 1 秒，自纪元起点的耗时为正。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const start: number = Date.now();
      const elapsed: number = DateUtils.elapsedSince(start);
      expect(elapsed >= 0).assertTrue();
      expect(elapsed < 1000).assertTrue();
      expect(DateUtils.elapsedSince(0) > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0140
     * @tc.name      testCommonUtils0041
     * @tc.desc      同一时刻与同日不同时刻判定同日，跨日与前一日的边界时刻判定不同日。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const now: Date = new Date();
      const midnight: number = new Date(now.getFullYear(), now.getMonth(), now.getDate()).getTime();
      expect(DateUtils.isSameDay(midnight, midnight)).assertTrue();
      expect(DateUtils.isSameDay(midnight, midnight + ONE_HOUR_MS)).assertTrue();
      expect(DateUtils.isSameDay(midnight, midnight + 1000)).assertTrue();
      expect(DateUtils.isSameDay(midnight, midnight - ONE_DAY_MS)).assertFalse();
      expect(DateUtils.isSameDay(midnight, midnight - 1000)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0141
     * @tc.name      testCommonUtils0042
     * @tc.desc      任一时刻为负数即判定不同日，双侧均为非法值同样返回 false。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const nowMillis: number = Date.now();
      expect(DateUtils.isSameDay(-1, nowMillis)).assertFalse();
      expect(DateUtils.isSameDay(nowMillis, -1)).assertFalse();
      expect(DateUtils.isSameDay(Number.NaN, Number.NaN)).assertFalse();
      expect(DateUtils.isSameDay(-1, -1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0142
     * @tc.name      testCommonUtils0043
     * @tc.desc      缺失与空数组判定为空，单元素数组判定为非空，两方法结果互逆。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.isEmpty<number>(null)).assertTrue();
      expect(ArrayUtils.isEmpty<number>(undefined)).assertTrue();
      expect(ArrayUtils.isEmpty<number>([])).assertTrue();
      expect(ArrayUtils.isNotEmpty<number>([1])).assertTrue();
      expect(ArrayUtils.isEmpty<number>([1])).assertFalse();
      expect(ArrayUtils.isEmpty<number>([]) !== ArrayUtils.isNotEmpty<number>([])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0143
     * @tc.name      testCommonUtils0044
     * @tc.desc      缺失输入与空数组取首尾元素均返回默认值。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const empty: Array<number> = [];
      expect(ArrayUtils.firstOrDefault<number>(null, -1)).assertEqual(-1);
      expect(ArrayUtils.firstOrDefault<number>(undefined, -1)).assertEqual(-1);
      expect(ArrayUtils.firstOrDefault<number>(empty, -1)).assertEqual(-1);
      expect(ArrayUtils.lastOrDefault<number>(null, -1)).assertEqual(-1);
      expect(ArrayUtils.lastOrDefault<number>(empty, -1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0144
     * @tc.name      testCommonUtils0045
     * @tc.desc      多元素数组取首尾元素正确，单元素数组首尾均为该元素。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0045';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: Array<number> = [1, 2, 3];
      expect(ArrayUtils.firstOrDefault<number>(values, -1)).assertEqual(1);
      expect(ArrayUtils.lastOrDefault<number>(values, -1)).assertEqual(3);
      const single: Array<number> = [7];
      expect(ArrayUtils.firstOrDefault<number>(single, -1)).assertEqual(7);
      expect(ArrayUtils.lastOrDefault<number>(single, -1)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0145
     * @tc.name      testCommonUtils0046
     * @tc.desc      缺失与空数组不包含任何元素，命中与未命中的判定准确。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0046';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: Array<number> = [1, 2, 3];
      expect(ArrayUtils.contains<number>(null, 1)).assertFalse();
      expect(ArrayUtils.contains<number>([], 1)).assertFalse();
      expect(ArrayUtils.contains<number>(values, 2)).assertTrue();
      expect(ArrayUtils.contains<number>(values, 4)).assertFalse();
      expect(ArrayUtils.contains<number>(values, 1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0146
     * @tc.name      testCommonUtils0047
     * @tc.desc      缺失与空数组求和为 0，多元素与单元素数组求和正确。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0047';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.sum([])).assertEqual(0);
      expect(ArrayUtils.sum(null)).assertEqual(0);
      expect(ArrayUtils.sum([1, 2, 3])).assertEqual(6);
      expect(ArrayUtils.sum([5])).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0147
     * @tc.name      testCommonUtils0048
     * @tc.desc      正负抵消求和为 0，全负数组求和为负值，混合正负求和正确。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0048';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.sum([-1, 1])).assertEqual(0);
      expect(ArrayUtils.sum([-5])).assertEqual(-5);
      expect(ArrayUtils.sum([2, -3, 4])).assertEqual(3);
      expect(ArrayUtils.sum([-1, -2, -3])).assertEqual(-6);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0148
     * @tc.name      testCommonUtils0049
     * @tc.desc      缺失与空数组均值为 0，多元素、单元素与小数均值计算正确。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0049';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.average([])).assertEqual(0);
      expect(ArrayUtils.average(null)).assertEqual(0);
      expect(ArrayUtils.average([2, 4])).assertEqual(3);
      expect(ArrayUtils.average([1])).assertEqual(1);
      expect(ArrayUtils.average([1, 2])).assertEqual(1.5);
      expect(ArrayUtils.average([-2, 2])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0149
     * @tc.name      testCommonUtils0050
     * @tc.desc      缺失与空数组取最值为 null，乱序数组的最小值与最大值正确。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0050';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ArrayUtils.minOrNull(null)).assertNull();
      expect(ArrayUtils.minOrNull([])).assertNull();
      expect(ArrayUtils.maxOrNull([])).assertNull();
      const values: Array<number> = [3, 1, 4, 1, 5];
      expect(ArrayUtils.minOrNull(values)).assertEqual(1);
      expect(ArrayUtils.maxOrNull(values)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0150
     * @tc.name      testCommonUtils0051
     * @tc.desc      全负数组的最小值是数值最小者，单元素数组的最值即该元素。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0051';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const negatives: Array<number> = [-5, -2, -9];
      expect(ArrayUtils.minOrNull(negatives)).assertEqual(-9);
      expect(ArrayUtils.maxOrNull(negatives)).assertEqual(-2);
      const single: Array<number> = [7];
      expect(ArrayUtils.minOrNull(single)).assertEqual(7);
      expect(ArrayUtils.maxOrNull(single)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0151
     * @tc.name      testCommonUtils0052
     * @tc.desc      元素数恰为分块大小整数倍时块数正确且各块内容按序切分。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0052';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const values: Array<number> = [1, 2, 3, 4];
      const chunks: Array<Array<number>> = ArrayUtils.chunk<number>(values, 2);
      expect(chunks.length).assertEqual(2);
      expect(chunks[0].length).assertEqual(2);
      expect(chunks[1].length).assertEqual(2);
      expect(chunks[0][0]).assertEqual(1);
      expect(chunks[0][1]).assertEqual(2);
      expect(chunks[1][0]).assertEqual(3);
      expect(chunks[1][1]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0152
     * @tc.name      testCommonUtils0053
     * @tc.desc      元素数不是分块大小整数倍时最后一块只装剩余元素。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0053';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const chunks: Array<Array<number>> = ArrayUtils.chunk<number>([1, 2, 3], 2);
      expect(chunks.length).assertEqual(2);
      expect(chunks[0].length).assertEqual(2);
      expect(chunks[1].length).assertEqual(1);
      expect(chunks[1][0]).assertEqual(3);
      expect(chunks[0][1]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0153
     * @tc.name      testCommonUtils0054
     * @tc.desc      分块大小为 0 或负数时回退为逐元素分块，缺失输入返回空结果。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0054';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zeroSize: Array<Array<number>> = ArrayUtils.chunk<number>([1, 2, 3], 0);
      expect(zeroSize.length).assertEqual(3);
      expect(zeroSize[0].length).assertEqual(1);
      expect(zeroSize[2][0]).assertEqual(3);
      const negativeSize: Array<Array<number>> = ArrayUtils.chunk<number>([1, 2, 3], -2);
      expect(negativeSize.length).assertEqual(3);
      expect(ArrayUtils.chunk<number>(null, 2).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0154
     * @tc.name      testCommonUtils0055
     * @tc.desc      分块大小大于元素数时只产生一个包含全部元素的块。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0055';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const chunks: Array<Array<number>> = ArrayUtils.chunk<number>([1, 2], 5);
      expect(chunks.length).assertEqual(1);
      expect(chunks[0].length).assertEqual(2);
      expect(chunks[0][0]).assertEqual(1);
      expect(chunks[0][1]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0155
     * @tc.name      testCommonUtils0056
     * @tc.desc      去重后保留首次出现顺序，无重复数组长度不变，缺失输入返回空数组。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0056';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const unique: Array<number> = ArrayUtils.unique<number>([1, 1, 2]);
      expect(unique.length).assertEqual(2);
      expect(unique[0]).assertEqual(1);
      expect(unique[1]).assertEqual(2);
      expect(ArrayUtils.unique<number>([3, 3, 3]).length).assertEqual(1);
      expect(ArrayUtils.unique<number>([1, 2, 3]).length).assertEqual(3);
      expect(ArrayUtils.unique<number>(null).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0156
     * @tc.name      testCommonUtils0057
     * @tc.desc      删除存在的元素返回 true 且只删第一个匹配，未命中、空数组与缺失输入返回 false。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0057';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const list: Array<number> = [1, 2, 2, 3];
      const removed: boolean = ArrayUtils.removeElement<number>(list, 2);
      expect(removed).assertTrue();
      expect(list.length).assertEqual(3);
      expect(list[0]).assertEqual(1);
      expect(list[1]).assertEqual(2);
      expect(list[2]).assertEqual(3);
      expect(ArrayUtils.removeElement<number>(list, 9)).assertFalse();
      expect(ArrayUtils.removeElement<number>([], 1)).assertFalse();
      expect(ArrayUtils.removeElement<number>(null, 1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0157
     * @tc.name      testCommonUtils0058
     * @tc.desc      仅 null 与 undefined 视为无值，0、false 与空串等假值仍视为有效值。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0058';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.hasValue(null)).assertFalse();
      expect(ObjectUtils.hasValue(undefined)).assertFalse();
      expect(ObjectUtils.hasValue(0)).assertTrue();
      expect(ObjectUtils.hasValue(false)).assertTrue();
      expect(ObjectUtils.hasValue('')).assertTrue();
      expect(ObjectUtils.hasValue('x')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0158
     * @tc.name      testCommonUtils0059
     * @tc.desc      缺失输入返回默认值，有值输入原样返回且假值 0 不被默认值替换。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0059';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.getOrDefault<string>(null, 'fallback')).assertEqual('fallback');
      expect(ObjectUtils.getOrDefault<string>(undefined, 'fallback')).assertEqual('fallback');
      expect(ObjectUtils.getOrDefault<string>('real', 'fallback')).assertEqual('real');
      expect(ObjectUtils.getOrDefault<number>(0, 9)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0159
     * @tc.name      testCommonUtils0060
     * @tc.desc      空对象与缺失输入判定为空对象，含键对象判定为非空对象。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0060';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const emptyBox: EmptyBox = {};
      const filled: SimpleBox = { name: 'a', count: 1 };
      expect(ObjectUtils.isEmptyObject(emptyBox)).assertTrue();
      expect(ObjectUtils.isEmptyObject(null)).assertTrue();
      expect(ObjectUtils.isEmptyObject(undefined)).assertTrue();
      expect(ObjectUtils.isEmptyObject(filled)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0160
     * @tc.name      testCommonUtils0061
     * @tc.desc      缺失输入序列化为空串，普通对象按字段顺序输出标准 JSON 文本。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0061';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ObjectUtils.stringify(null)).assertEqual('');
      expect(ObjectUtils.stringify(undefined)).assertEqual('');
      const filled: SimpleBox = { name: 'a', count: 1 };
      expect(ObjectUtils.stringify(filled)).assertEqual('{"name":"a","count":1}');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0161
     * @tc.name      testCommonUtils0062
     * @tc.desc      自引用的循环结构序列化失败返回空串，普通对象序列化正常，两者结果不同。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0062';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const node: LinkNode = new LinkNode();
      node.value = 1;
      node.next = node;
      expect(ObjectUtils.stringify(node)).assertEqual('');
      const plain: SimpleBox = { name: 'b', count: 2 };
      expect(ObjectUtils.stringify(plain)).assertEqual('{"name":"b","count":2}');
      expect(ObjectUtils.stringify(node) !== ObjectUtils.stringify(plain)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0162
     * @tc.name      testCommonUtils0063
     * @tc.desc      克隆内容与原对象一致，修改副本字段不影响原对象。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0063';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const original: SimpleBox = { name: 'src', count: 5 };
      const copy: SimpleBox | null = ObjectUtils.deepClone<SimpleBox>(original);
      expect(copy !== null).assertTrue();
      if (copy !== null) {
        expect(copy.name).assertEqual('src');
        expect(copy.count).assertEqual(5);
        copy.count = 99;
        expect(original.count).assertEqual(5);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0163
     * @tc.name      testCommonUtils0064
     * @tc.desc      数组克隆内容一致，向副本追加元素不影响原数组长度。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0064';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const source: Array<number> = [1, 2, 3];
      const copy: Array<number> | null = ObjectUtils.deepClone<Array<number>>(source);
      expect(copy !== null).assertTrue();
      if (copy !== null) {
        expect(copy.length).assertEqual(3);
        expect(copy[0]).assertEqual(1);
        copy.push(4);
        expect(source.length).assertEqual(3);
        expect(copy.length).assertEqual(4);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0164
     * @tc.name      testCommonUtils0065
     * @tc.desc      循环引用结构克隆失败返回 null，嵌套对象克隆后内层字段修改互不影响。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0065';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const node: LinkNode = new LinkNode();
      node.value = 1;
      node.next = node;
      expect(ObjectUtils.deepClone<LinkNode>(node) === null).assertTrue();
      const leaf: SimpleBox = { name: 'leaf', count: 1 };
      const outer: OuterBox = { label: 'root', inner: leaf };
      const cloned: OuterBox | null = ObjectUtils.deepClone<OuterBox>(outer);
      expect(cloned !== null).assertTrue();
      if (cloned !== null) {
        expect(cloned.inner.count).assertEqual(1);
        cloned.inner.count = 42;
        expect(outer.inner.count).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0165
     * @tc.name      testCommonUtils0066
     * @tc.desc      同引用与同内容对象判定相等，键序不同与缺失输入对空对象判定不等。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.level     Level 0
     * @tc.type      Function
     */
    it('testCommonUtils0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0066';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: SimpleBox = { name: 'a', count: 1 };
      const second: SimpleBox = { name: 'a', count: 1 };
      expect(ObjectUtils.deepEqualsByJson(first, first)).assertTrue();
      expect(ObjectUtils.deepEqualsByJson(first, second)).assertTrue();
      const ordered: PairBox = { a: 1, b: 2 };
      const swapped: PairBox = { b: 2, a: 1 };
      expect(ObjectUtils.deepEqualsByJson(ordered, swapped)).assertFalse();
      const emptyBox: EmptyBox = {};
      expect(ObjectUtils.deepEqualsByJson(null, emptyBox)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0166
     * @tc.name      testCommonUtils0067
     * @tc.desc      含顶级域的合法邮箱判定通过，缺顶级域、含空格与缺域名后缀判定不通过。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0067';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isEmail('user@example.com')).assertTrue();
      expect(ValidateUtils.isEmail('first.last@sub.domain.org')).assertTrue();
      expect(ValidateUtils.isEmail('a@b')).assertFalse();
      expect(ValidateUtils.isEmail('a b@c.com')).assertFalse();
      expect(ValidateUtils.isEmail('user@example')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0167
     * @tc.name      testCommonUtils0068
     * @tc.desc      缺失与空串判定失败，缺 @ 与缺本地部分的输入判定失败。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0068';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isEmail(null)).assertFalse();
      expect(ValidateUtils.isEmail(undefined)).assertFalse();
      expect(ValidateUtils.isEmail('')).assertFalse();
      expect(ValidateUtils.isEmail('userexample.com')).assertFalse();
      expect(ValidateUtils.isEmail('@example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0168
     * @tc.name      testCommonUtils0069
     * @tc.desc      合法手机号判定通过，第二位非法、位数不足或超长、含字母判定不通过。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0069';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPhoneCN('13800138000')).assertTrue();
      expect(ValidateUtils.isPhoneCN('19912345678')).assertTrue();
      expect(ValidateUtils.isPhoneCN('12345678901')).assertFalse();
      expect(ValidateUtils.isPhoneCN('1380013800')).assertFalse();
      expect(ValidateUtils.isPhoneCN('138001380001')).assertFalse();
      expect(ValidateUtils.isPhoneCN('138abc00138')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0169
     * @tc.name      testCommonUtils0070
     * @tc.desc      缺失与空串判定失败，带分隔符的号码不作为手机号识别。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0070';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPhoneCN(null)).assertFalse();
      expect(ValidateUtils.isPhoneCN(undefined)).assertFalse();
      expect(ValidateUtils.isPhoneCN('')).assertFalse();
      expect(ValidateUtils.isPhoneCN('138-0013-8000')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0170
     * @tc.name      testCommonUtils0071
     * @tc.desc      http 与 https 地址判定通过，支持端口与查询参数，非 http 协议与无协议判定失败。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0071';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isUrl('http://example.com')).assertTrue();
      expect(ValidateUtils.isUrl('https://a.b:8080/path?q=1')).assertTrue();
      expect(ValidateUtils.isUrl('http://example.com:8080/deep/path')).assertTrue();
      expect(ValidateUtils.isUrl('ftp://a.com')).assertFalse();
      expect(ValidateUtils.isUrl('example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0171
     * @tc.name      testCommonUtils0072
     * @tc.desc      缺失与空串判定失败，协议分隔符残缺与主机含空格判定失败。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0072';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isUrl(null)).assertFalse();
      expect(ValidateUtils.isUrl(undefined)).assertFalse();
      expect(ValidateUtils.isUrl('')).assertFalse();
      expect(ValidateUtils.isUrl('http:/example.com')).assertFalse();
      expect(ValidateUtils.isUrl('http://exa mple.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0172
     * @tc.name      testCommonUtils0073
     * @tc.desc      合法地址段判定通过，含最大值 255 的地址通过，段值超界与前导零判定失败。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0073';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isIpv4('1.1.1.1')).assertTrue();
      expect(ValidateUtils.isIpv4('255.255.255.255')).assertTrue();
      expect(ValidateUtils.isIpv4('192.168.1.100')).assertTrue();
      expect(ValidateUtils.isIpv4('256.0.0.1')).assertFalse();
      expect(ValidateUtils.isIpv4('01.1.1.1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0173
     * @tc.name      testCommonUtils0074
     * @tc.desc      段数不足或超长、非数字内容、缺失与空串均判定失败。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0074';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isIpv4('1.1.1')).assertFalse();
      expect(ValidateUtils.isIpv4('1.1.1.1.1')).assertFalse();
      expect(ValidateUtils.isIpv4('abc')).assertFalse();
      expect(ValidateUtils.isIpv4('1.1.1.a')).assertFalse();
      expect(ValidateUtils.isIpv4(null)).assertFalse();
      expect(ValidateUtils.isIpv4('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0174
     * @tc.name      testCommonUtils0075
     * @tc.desc      边界端口 0 与 65535 合法，超界、负数与非整数端口判定非法。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0075';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPortNumber(0)).assertTrue();
      expect(ValidateUtils.isPortNumber(80)).assertTrue();
      expect(ValidateUtils.isPortNumber(65535)).assertTrue();
      expect(ValidateUtils.isPortNumber(65536)).assertFalse();
      expect(ValidateUtils.isPortNumber(-1)).assertFalse();
      expect(ValidateUtils.isPortNumber(1.5)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0175
     * @tc.name      testCommonUtils0076
     * @tc.desc      正整数字符串判定通过，零、负数与非法文本判定失败；小数输入按整数截断
     *               现状锁定（'3.5' 截断为 3 判定为正整数）。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0076';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isPositiveInteger('1')).assertTrue();
      expect(ValidateUtils.isPositiveInteger('007')).assertTrue();
      expect(ValidateUtils.isPositiveInteger('0')).assertFalse();
      expect(ValidateUtils.isPositiveInteger('-1')).assertFalse();
      expect(ValidateUtils.isPositiveInteger('abc')).assertFalse();
      expect(ValidateUtils.isPositiveInteger('3.5')).assertTrue();
      expect(ValidateUtils.isPositiveInteger(null)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0176
     * @tc.name      testCommonUtils0077
     * @tc.desc      长度在区间内与恰等上下界判定通过，越界、缺失输入与非法边界判定不通过。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0077';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(ValidateUtils.isLengthInRange('abc', 1, 5)).assertTrue();
      expect(ValidateUtils.isLengthInRange('abc', 3, 3)).assertTrue();
      expect(ValidateUtils.isLengthInRange('abc', 1, 2)).assertFalse();
      expect(ValidateUtils.isLengthInRange('abc', 4, 6)).assertFalse();
      expect(ValidateUtils.isLengthInRange(null, 1, 5)).assertFalse();
      expect(ValidateUtils.isLengthInRange('abc', -1, 5)).assertFalse();
      expect(ValidateUtils.isLengthInRange('abc', 5, 2)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0177
     * @tc.name      testCommonUtils0078
     * @tc.desc      SHA-256 摘要与标准测试向量一致，输出 64 位且保持小写十六进制。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testCommonUtils0078';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const digest: string = await SecurityUtils.sha256Hex('abc');
      expect(digest).assertEqual('ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad');
      expect(digest.length).assertEqual(64);
      expect(digest).assertEqual(digest.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0178
     * @tc.name      testCommonUtils0079
     * @tc.desc      SHA-1 与 MD5 摘要同各自标准测试向量一致，长度分别为 40 与 32 位小写十六进制。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCommonUtils0079';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const sha1: string = await SecurityUtils.sha1Hex('abc');
      expect(sha1).assertEqual('a9993e364706816aba3e25717850c26c9cd0d89d');
      expect(sha1.length).assertEqual(40);
      const md5: string = await SecurityUtils.md5Hex('abc');
      expect(md5).assertEqual('900150983cd24fb0d6963f7d28e17f72');
      expect(md5.length).assertEqual(32);
      expect(md5).assertEqual(md5.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0179
     * @tc.name      testCommonUtils0080
     * @tc.desc      空输入的摘要直接返回空串，快捷方法与通用方法对同一输入结果一致。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCommonUtils0080';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(await SecurityUtils.digestHex('', DigestAlgorithm.SHA256)).assertEqual('');
      expect(await SecurityUtils.digestHex('', DigestAlgorithm.SHA1)).assertEqual('');
      expect(await SecurityUtils.digestHex('', DigestAlgorithm.MD5)).assertEqual('');
      const viaWrapper: string = await SecurityUtils.sha256Hex('abc');
      const viaCore: string = await SecurityUtils.digestHex('abc', DigestAlgorithm.SHA256);
      expect(viaCore).assertEqual(viaWrapper);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0180
     * @tc.name      testCommonUtils0081
     * @tc.desc      Base64 编码结果符合标准表，解码还原原文，编解码往返一致，空输入返回空串。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0081';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(SecurityUtils.base64Encode('hello')).assertEqual('aGVsbG8=');
      expect(SecurityUtils.base64Decode('aGVsbG8=')).assertEqual('hello');
      expect(SecurityUtils.base64Decode(SecurityUtils.base64Encode('hello'))).assertEqual('hello');
      expect(SecurityUtils.base64Encode('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0181
     * @tc.name      testCommonUtils0082
     * @tc.desc      空串与含非法字符的 Base64 文本解码失败返回空串。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0082';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(SecurityUtils.base64Decode('')).assertEqual('');
      expect(SecurityUtils.base64Decode('!!!')).assertEqual('');
      expect(SecurityUtils.base64Decode('not base64')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0182
     * @tc.name      testCommonUtils0083
     * @tc.desc      中文文本按 UTF-8 编码输出标准 Base64，解码还原原文，往返一致。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0083';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const encoded: string = SecurityUtils.base64Encode('会议');
      expect(encoded).assertEqual('5Lya6K6u');
      expect(SecurityUtils.base64Decode('5Lya6K6u')).assertEqual('会议');
      expect(SecurityUtils.base64Decode(encoded)).assertEqual('会议');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0183
     * @tc.name      testCommonUtils0084
     * @tc.desc      多段路径以斜杠拼接，空段被跳过，全空段返回空串。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCommonUtils0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testCommonUtils0084';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(FileUtils.joinPath(['a', 'b', 'c'])).assertEqual('a/b/c');
      expect(FileUtils.joinPath(['a', '', 'b'])).assertEqual('a/b');
      expect(FileUtils.joinPath(['dir', 'sub', 'file.txt'])).assertEqual('dir/sub/file.txt');
      expect(FileUtils.joinPath(['', '', ''])).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_COMMON_0184
     * @tc.name      testCommonUtils0085
     * @tc.desc      单段路径原样返回，空列表与纯空段返回空串。
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCommonUtils0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCommonUtils0085';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(FileUtils.joinPath(['single'])).assertEqual('single');
      expect(FileUtils.joinPath([])).assertEqual('');
      expect(FileUtils.joinPath(['root', 'logs'])).assertEqual('root/logs');
      expect(FileUtils.joinPath([''])).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });
  });
}
