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
import { myparseInt } from '../../../main/ets/common/Logger';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

export default function parseIntReal() {
  describe('ParseIntRealTest', () => {
    /**
     * @tc.number SUB_ASSET_PARSEINT_0301
     * @tc.name testParseInt0301
     * @tc.desc 合法值：十进制数字串解析为数值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseInt0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0301 begin');
      const result: number = myparseInt('42', 10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 42);
      expect(result).assertEqual(42);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0301 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0302
     * @tc.name testParseInt0302
     * @tc.desc 合法值：十六进制串解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseInt0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0302 begin');
      const result: number = myparseInt('ff', 16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 255);
      expect(result).assertEqual(255);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('255');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0302 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0303
     * @tc.name testParseInt0303
     * @tc.desc 合法值：二进制串解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseInt0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0303 begin');
      const result: number = myparseInt('1010', 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 10);
      expect(result).assertEqual(10);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0303 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0304
     * @tc.name testParseInt0304
     * @tc.desc 合法值：八进制串解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseInt0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0304 begin');
      const result: number = myparseInt('17', 8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 15);
      expect(result).assertEqual(15);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0304 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0305
     * @tc.name testParseInt0305
     * @tc.desc 边界值：零字符串解析为零
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseInt0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0305 begin');
      const result: number = myparseInt('0', 10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 0);
      expect(result).assertEqual(0);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0305 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0306
     * @tc.name testParseInt0306
     * @tc.desc 边界值：空串解析为 NaN
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0306 begin');
      const result: number = myparseInt('', 10);
      hilog.info(DOMAIN, TAG, 'isNaN=%{public}s', String(Number.isNaN(result)));
      expect(Number.isNaN(result)).assertTrue();
      expect(Number.isFinite(result)).assertFalse();
      expect(String(result)).assertEqual('NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0306 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0307
     * @tc.name testParseInt0307
     * @tc.desc 边界值：radix 36 上界字符 z 解析为 35
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0307 begin');
      const result: number = myparseInt('z', 36);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 35);
      expect(result).assertEqual(35);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0307 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0308
     * @tc.name testParseInt0308
     * @tc.desc 非法值：radix 37 超上界解析为 NaN
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0308 begin');
      const result: number = myparseInt('1', 37);
      hilog.info(DOMAIN, TAG, 'isNaN=%{public}s', String(Number.isNaN(result)));
      expect(Number.isNaN(result)).assertTrue();
      expect(Number.isFinite(result)).assertFalse();
      expect(String(result)).assertEqual('NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0308 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0309
     * @tc.name testParseInt0309
     * @tc.desc 非法值：尾部非法字符截断解析前缀数字
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0309 begin');
      const result: number = myparseInt('12a', 10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 12);
      expect(result).assertEqual(12);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0309 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0310
     * @tc.name testParseInt0310
     * @tc.desc 组合值：0x 前缀十六进制解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0310 begin');
      const result: number = myparseInt('0x1F', 16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 31);
      expect(result).assertEqual(31);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0310 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0311
     * @tc.name testParseInt0311
     * @tc.desc 组合值：0b 前缀不被 parseInt 识别，解析为 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0311 begin');
      const result: number = myparseInt('0b101', 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 0);
      expect(result).assertEqual(0);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0311 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0312
     * @tc.name testParseInt0312
     * @tc.desc 组合值：0o 前缀不被 parseInt 识别，解析为 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0312 begin');
      const result: number = myparseInt('0o17', 8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 0);
      expect(result).assertEqual(0);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0312 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0313
     * @tc.name testParseInt0313
     * @tc.desc 非法值：0x 前缀与十进制 radix 冲突时解析为 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0313 begin');
      const result: number = myparseInt('0x1F', 10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 0);
      expect(result).assertEqual(0);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0313 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0314
     * @tc.name testParseInt0314
     * @tc.desc 合法值：负号前缀解析为负数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0314 begin');
      const result: number = myparseInt('-42', 10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, -42);
      expect(result).assertEqual(-42);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('-42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0314 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0315
     * @tc.name testParseInt0315
     * @tc.desc 合法值：前导空白被忽略后解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0315 begin');
      const result: number = myparseInt(' 42 ', 10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 42);
      expect(result).assertEqual(42);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0315 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0316
     * @tc.name testParseInt0316
     * @tc.desc 边界值：radix 1 非法解析为 NaN
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0316 begin');
      const result: number = myparseInt('1', 1);
      hilog.info(DOMAIN, TAG, 'isNaN=%{public}s', String(Number.isNaN(result)));
      expect(Number.isNaN(result)).assertTrue();
      expect(Number.isFinite(result)).assertFalse();
      expect(String(result)).assertEqual('NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0316 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0317
     * @tc.name testParseInt0317
     * @tc.desc 边界值：radix 0 十进制串按十进制解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0317 begin');
      const result: number = myparseInt('42', 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 42);
      expect(result).assertEqual(42);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0317 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0318
     * @tc.name testParseInt0318
     * @tc.desc 极值：最大安全整数串解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0318 begin');
      const result: number = myparseInt('9007199254740991', 10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 9007199254740991);
      expect(result).assertEqual(9007199254740991);
      expect(Number.isFinite(result)).assertTrue();
      expect(Number.isSafeInteger(result)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0318 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0319
     * @tc.name testParseInt0319
     * @tc.desc 组合值：大写十六进制字母解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0319 begin');
      const result: number = myparseInt('FF', 16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 255);
      expect(result).assertEqual(255);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('255');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0319 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0320
     * @tc.name testParseInt0320
     * @tc.desc 状态值：连续两次解析同一输入结果一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0320 begin');
      const first: number = myparseInt('7f', 16);
      const second: number = myparseInt('7f', 16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', first, 127);
      expect(first).assertEqual(127);
      expect(second).assertEqual(first);
      expect(Number.isFinite(second)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0320 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0321
     * @tc.name testParseInt0321
     * @tc.desc 合法值：正号前缀解析为正数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0321 begin');
      const result: number = myparseInt('+42', 10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 42);
      expect(result).assertEqual(42);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0321 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0322
     * @tc.name testParseInt0322
     * @tc.desc 非法值：纯字母十进制解析为 NaN
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0322 begin');
      const result: number = myparseInt('abc', 10);
      hilog.info(DOMAIN, TAG, 'isNaN=%{public}s', String(Number.isNaN(result)));
      expect(Number.isNaN(result)).assertTrue();
      expect(Number.isFinite(result)).assertFalse();
      expect(String(result)).assertEqual('NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0322 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0323
     * @tc.name testParseInt0323
     * @tc.desc 组合值：科学计数法按截断语义解析前缀数字
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0323 begin');
      const result: number = myparseInt('1e3', 10);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 1);
      expect(result).assertEqual(1);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0323 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0324
     * @tc.name testParseInt0324
     * @tc.desc 边界值：radix 0 十六进制前缀自动识别
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0324 begin');
      const result: number = myparseInt('0x10', 0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 16);
      expect(result).assertEqual(16);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0324 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0325
     * @tc.name testParseInt0325
     * @tc.desc 组合值：0b 前缀后非法数字，parseInt 不识别 0b 前缀解析为 0
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0325 begin');
      const result: number = myparseInt('0b102', 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 0);
      expect(result).assertEqual(0);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0325 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0326
     * @tc.name testParseInt0326
     * @tc.desc 极值：52 位十六进制串解析，不超出安全整数精度
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0326 begin');
      const result: number = myparseInt('fedcba9876543', 16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, 4483583629026627);
      expect(result).assertEqual(4483583629026627);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('4483583629026627');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0326 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0327
     * @tc.name testParseInt0327
     * @tc.desc 状态值：解析结果为有限数值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0327 begin');
      const result: number = myparseInt('100', 10);
      hilog.info(DOMAIN, TAG, 'isFinite=%{public}s', String(Number.isFinite(result)));
      expect(Number.isFinite(result)).assertTrue();
      expect(result).assertEqual(100);
      expect(typeof result === 'number').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0327 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0328
     * @tc.name testParseInt0328
     * @tc.desc 边界值：radix 2 下数字 2 非法解析为 NaN
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0328 begin');
      const result: number = myparseInt('2', 2);
      hilog.info(DOMAIN, TAG, 'isNaN=%{public}s', String(Number.isNaN(result)));
      expect(Number.isNaN(result)).assertTrue();
      expect(Number.isFinite(result)).assertFalse();
      expect(String(result)).assertEqual('NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0328 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0329
     * @tc.name testParseInt0329
     * @tc.desc 组合值：负号十六进制解析为负数
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0329 begin');
      const result: number = myparseInt('-ff', 16);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result, -255);
      expect(result).assertEqual(-255);
      expect(Number.isFinite(result)).assertTrue();
      expect(String(result)).assertEqual('-255');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0329 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEINT_0330
     * @tc.name testParseInt0330
     * @tc.desc 状态值：NaN 结果的字符串表现为 NaN
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseInt0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0330 begin');
      const result: number = myparseInt('xyz', 10);
      hilog.info(DOMAIN, TAG, 'str=%{public}s, expected=%{public}s', String(result), 'NaN');
      expect(String(result)).assertEqual('NaN');
      expect(Number.isNaN(result)).assertTrue();
      expect(Number.isFinite(result)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseInt0330 end');
    });
  });
}


