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
import { Flag } from '../../../main/ets/pages/Index';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flagSeqVolume06Test() {
  describe('FlagSeqVolume06', () => {

    /**
     * @tc.name   testFlagSeq0266
     * @tc.number SUB_Huks_FLSQ_0266
     * @tc.desc   极值：Number.MAX_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0266 begin');
      Flag.set(Number.MAX_SAFE_INTEGER);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(Number.MAX_SAFE_INTEGER));
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(Number.MAX_SAFE_INTEGER));
      expect(Flag.value).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0266 end');
    });

    /**
     * @tc.name   testFlagSeq0267
     * @tc.number SUB_Huks_FLSQ_0267
     * @tc.desc   极值：Number.MIN_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0267 begin');
      Flag.set(Number.MIN_SAFE_INTEGER);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(Number.MIN_SAFE_INTEGER));
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(Number.MIN_SAFE_INTEGER));
      expect(Flag.value).assertEqual(Number.MIN_SAFE_INTEGER);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0267 end');
    });

    /**
     * @tc.name   testFlagSeq0268
     * @tc.number SUB_Huks_FLSQ_0268
     * @tc.desc   极值：2^53 精确表示
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0268 begin');
      Flag.set(9007199254740992);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(9007199254740992));
      expect(result).assertEqual(9007199254740992);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(9007199254740992));
      expect(Flag.value).assertEqual(9007199254740992);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0268 end');
    });

    /**
     * @tc.name   testFlagSeq0269
     * @tc.number SUB_Huks_FLSQ_0269
     * @tc.desc   极值：2^53+1 与 2^53 同值（双精度舍入）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0269 begin');
      Flag.set(9007199254740993);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(9007199254740992));
      expect(result).assertEqual(9007199254740992);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(9007199254740992));
      expect(Flag.value).assertEqual(9007199254740992);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0269 end');
    });

    /**
     * @tc.name   testFlagSeq0270
     * @tc.number SUB_Huks_FLSQ_0270
     * @tc.desc   极值：2^53+2 精确表示
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0270 begin');
      Flag.set(9007199254740994);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(9007199254740994));
      expect(result).assertEqual(9007199254740994);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(9007199254740994));
      expect(Flag.value).assertEqual(9007199254740994);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0270 end');
    });

    /**
     * @tc.name   testFlagSeq0271
     * @tc.number SUB_Huks_FLSQ_0271
     * @tc.desc   极值：1e21 超出安全整数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0271 begin');
      Flag.set(1e21);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1e21));
      expect(result).assertEqual(1e21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(1e21));
      expect(Flag.value).assertEqual(1e21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0271 end');
    });

    /**
     * @tc.name   testFlagSeq0272
     * @tc.number SUB_Huks_FLSQ_0272
     * @tc.desc   极值：-1e21 超出安全整数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0272 begin');
      Flag.set(-1e21);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1e21));
      expect(result).assertEqual(-1e21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-1e21));
      expect(Flag.value).assertEqual(-1e21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0272 end');
    });

    /**
     * @tc.name   testFlagSeq0273
     * @tc.number SUB_Huks_FLSQ_0273
     * @tc.desc   极值：极小正数 1e-21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0273 begin');
      Flag.set(1e-21);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1e-21));
      expect(result).assertEqual(1e-21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(1e-21));
      expect(Flag.value).assertEqual(1e-21);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0273 end');
    });

    /**
     * @tc.name   testFlagSeq0274
     * @tc.number SUB_Huks_FLSQ_0274
     * @tc.desc   极值：Number.MIN_VALUE 5e-324
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0274 begin');
      Flag.set(5e-324);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(5e-324));
      expect(result).assertEqual(5e-324);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(5e-324));
      expect(Flag.value).assertEqual(5e-324);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0274 end');
    });

    /**
     * @tc.name   testFlagSeq0275
     * @tc.number SUB_Huks_FLSQ_0275
     * @tc.desc   极值：Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0275 begin');
      Flag.set(1.7976931348623157e308);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(1.7976931348623157e308));
      expect(result).assertEqual(1.7976931348623157e308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(1.7976931348623157e308));
      expect(Flag.value).assertEqual(1.7976931348623157e308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0275 end');
    });

    /**
     * @tc.name   testFlagSeq0276
     * @tc.number SUB_Huks_FLSQ_0276
     * @tc.desc   极值：负 Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0276 begin');
      Flag.set(-1.7976931348623157e308);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(-1.7976931348623157e308));
      expect(result).assertEqual(-1.7976931348623157e308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(-1.7976931348623157e308));
      expect(Flag.value).assertEqual(-1.7976931348623157e308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0276 end');
    });

    /**
     * @tc.name   testFlagSeq0277
     * @tc.number SUB_Huks_FLSQ_0277
     * @tc.desc   极值：正无穷
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0277 begin');
      Flag.set(Number.POSITIVE_INFINITY);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(Number.POSITIVE_INFINITY));
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(Number.POSITIVE_INFINITY));
      expect(Flag.value).assertEqual(Number.POSITIVE_INFINITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0277 end');
    });

    /**
     * @tc.name   testFlagSeq0278
     * @tc.number SUB_Huks_FLSQ_0278
     * @tc.desc   极值：负无穷
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0278 begin');
      Flag.set(Number.NEGATIVE_INFINITY);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(Number.NEGATIVE_INFINITY));
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(Number.NEGATIVE_INFINITY));
      expect(Flag.value).assertEqual(Number.NEGATIVE_INFINITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0278 end');
    });

    /**
     * @tc.name   testFlagSeq0279
     * @tc.number SUB_Huks_FLSQ_0279
     * @tc.desc   极值：NaN 的 isNaN 语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0279 begin');
      Flag.set(Number.NaN);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isNaN(result)));
      expect(Number.isNaN(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isNaN(Flag.value)));
      expect(Number.isNaN(Flag.value)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result));
      expect(result === result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0279 end');
    });

    /**
     * @tc.name   testFlagSeq0280
     * @tc.number SUB_Huks_FLSQ_0280
     * @tc.desc   边界：零值输入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0280 begin');
      Flag.set(0);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(0));
      expect(Flag.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0280 end');
    });

    /**
     * @tc.name   testFlagSeq0281
     * @tc.number SUB_Huks_FLSQ_0281
     * @tc.desc   边界：负零输入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0281 begin');
      Flag.set(-0);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-0));
      expect(result).assertEqual(-0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-0));
      expect(Flag.value).assertEqual(-0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0281 end');
    });

    /**
     * @tc.name   testFlagSeq0282
     * @tc.number SUB_Huks_FLSQ_0282
     * @tc.desc   边界：int32 溢出到 int64 域
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0282 begin');
      Flag.set(2147483648);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(2147483648));
      expect(result).assertEqual(2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(2147483648));
      expect(Flag.value).assertEqual(2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0282 end');
    });

    /**
     * @tc.name   testFlagSeq0283
     * @tc.number SUB_Huks_FLSQ_0283
     * @tc.desc   边界：uint32 最大值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0283 begin');
      Flag.set(4294967295);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4294967295));
      expect(result).assertEqual(4294967295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(4294967295));
      expect(Flag.value).assertEqual(4294967295);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0283 end');
    });

    /**
     * @tc.name   testFlagSeq0284
     * @tc.number SUB_Huks_FLSQ_0284
     * @tc.desc   边界：uint32 溢出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0284 begin');
      Flag.set(4294967296);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(4294967296));
      expect(result).assertEqual(4294967296);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(4294967296));
      expect(Flag.value).assertEqual(4294967296);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0284 end');
    });

    /**
     * @tc.name   testFlagSeq0285
     * @tc.number SUB_Huks_FLSQ_0285
     * @tc.desc   边界：int32 下溢
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0285 begin');
      Flag.set(-2147483649);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-2147483649));
      expect(result).assertEqual(-2147483649);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-2147483649));
      expect(Flag.value).assertEqual(-2147483649);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0285 end');
    });

    /**
     * @tc.name   testFlagSeq0286
     * @tc.number SUB_Huks_FLSQ_0286
     * @tc.desc   边界：float32 最大值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0286 begin');
      Flag.set(3.402823466e38);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3.402823466e38));
      expect(result).assertEqual(3.402823466e38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(3.402823466e38));
      expect(Flag.value).assertEqual(3.402823466e38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0286 end');
    });

    /**
     * @tc.name   testFlagSeq0287
     * @tc.number SUB_Huks_FLSQ_0287
     * @tc.desc   边界：负 float32 最大值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0287 begin');
      Flag.set(-3.402823466e38);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-3.402823466e38));
      expect(result).assertEqual(-3.402823466e38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(-3.402823466e38));
      expect(Flag.value).assertEqual(-3.402823466e38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0287 end');
    });

    /**
     * @tc.name   testFlagSeq0288
     * @tc.number SUB_Huks_FLSQ_0288
     * @tc.desc   边界：float32 最小正规数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0288 begin');
      Flag.set(1.175494351e-38);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1.175494351e-38));
      expect(result).assertEqual(1.175494351e-38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(1.175494351e-38));
      expect(Flag.value).assertEqual(1.175494351e-38);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0288 end');
    });

    /**
     * @tc.name   testFlagSeq0289
     * @tc.number SUB_Huks_FLSQ_0289
     * @tc.desc   小数：0.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0289 begin');
      Flag.set(0.1);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.1));
      expect(result).assertEqual(0.1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(0.1));
      expect(Flag.value).assertEqual(0.1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0289 end');
    });

    /**
     * @tc.name   testFlagSeq0290
     * @tc.number SUB_Huks_FLSQ_0290
     * @tc.desc   小数：0.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0290 begin');
      Flag.set(0.2);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0.2));
      expect(result).assertEqual(0.2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(0.2));
      expect(Flag.value).assertEqual(0.2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0290 end');
    });

    /**
     * @tc.name   testFlagSeq0291
     * @tc.number SUB_Huks_FLSQ_0291
     * @tc.desc   极值：0.1+0.2 的 IEEE 754 舍入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0291 begin');
      Flag.set(0.1 + 0.2);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(0.30000000000000004));
      expect(result).assertEqual(0.30000000000000004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(0.30000000000000004));
      expect(Flag.value).assertEqual(0.30000000000000004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0291 end');
    });

    /**
     * @tc.name   testFlagSeq0292
     * @tc.number SUB_Huks_FLSQ_0292
     * @tc.desc   极值：1/3 的 IEEE 754 舍入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0292 begin');
      Flag.set(1 / 3);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(0.3333333333333333));
      expect(result).assertEqual(0.3333333333333333);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(0.3333333333333333));
      expect(Flag.value).assertEqual(0.3333333333333333);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0292 end');
    });

    /**
     * @tc.name   testFlagSeq0293
     * @tc.number SUB_Huks_FLSQ_0293
     * @tc.desc   极值：2/3 的 IEEE 754 舍入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0293 begin');
      Flag.set(2 / 3);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(0.6666666666666666));
      expect(result).assertEqual(0.6666666666666666);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(0.6666666666666666));
      expect(Flag.value).assertEqual(0.6666666666666666);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0293 end');
    });

    /**
     * @tc.name   testFlagSeq0294
     * @tc.number SUB_Huks_FLSQ_0294
     * @tc.desc   极值：1e308
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0294 begin');
      Flag.set(1e308);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1e308));
      expect(result).assertEqual(1e308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(1e308));
      expect(Flag.value).assertEqual(1e308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0294 end');
    });

    /**
     * @tc.name   testFlagSeq0295
     * @tc.number SUB_Huks_FLSQ_0295
     * @tc.desc   极值：1e309 溢出为正无穷
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0295 begin');
      Flag.set(1e309);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(Number.POSITIVE_INFINITY));
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(Number.POSITIVE_INFINITY));
      expect(Flag.value).assertEqual(Number.POSITIVE_INFINITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0295 end');
    });

    /**
     * @tc.name   testFlagSeq0296
     * @tc.number SUB_Huks_FLSQ_0296
     * @tc.desc   极值：-1e309 溢出为负无穷
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0296 begin');
      Flag.set(-1e309);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(Number.NEGATIVE_INFINITY));
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(Number.NEGATIVE_INFINITY));
      expect(Flag.value).assertEqual(Number.NEGATIVE_INFINITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0296 end');
    });

    /**
     * @tc.name   testFlagSeq0297
     * @tc.number SUB_Huks_FLSQ_0297
     * @tc.desc   极值：18 位整数舍入到相邻偶数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0297 begin');
      Flag.set(123456789012345678);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(123456789012345680));
      expect(result).assertEqual(123456789012345680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(123456789012345680));
      expect(Flag.value).assertEqual(123456789012345680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0297 end');
    });

    /**
     * @tc.name   testFlagSeq0298
     * @tc.number SUB_Huks_FLSQ_0298
     * @tc.desc   极值：舍入后的相邻偶数原样读回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0298 begin');
      Flag.set(123456789012345680);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(123456789012345680));
      expect(result).assertEqual(123456789012345680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(123456789012345680));
      expect(Flag.value).assertEqual(123456789012345680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0298 end');
    });

    /**
     * @tc.name   testFlagSeq0299
     * @tc.number SUB_Huks_FLSQ_0299
     * @tc.desc   极值：2^53-0.5 舍入到 2^53
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0299 begin');
      Flag.set(9007199254740991.5);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(9007199254740992));
      expect(result).assertEqual(9007199254740992);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(9007199254740992));
      expect(Flag.value).assertEqual(9007199254740992);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0299 end');
    });

    /**
     * @tc.name   testFlagSeq0300
     * @tc.number SUB_Huks_FLSQ_0300
     * @tc.desc   小数：3.14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0300 begin');
      Flag.set(3.14);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(3.14));
      expect(result).assertEqual(3.14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(3.14));
      expect(Flag.value).assertEqual(3.14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0300 end');
    });

    /**
     * @tc.name   testFlagSeq0301
     * @tc.number SUB_Huks_FLSQ_0301
     * @tc.desc   小数：-3.14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0301 begin');
      Flag.set(-3.14);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-3.14));
      expect(result).assertEqual(-3.14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Flag.value), String(-3.14));
      expect(Flag.value).assertEqual(-3.14);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0301 end');
    });

    /**
     * @tc.name   testFlagSeq0302
     * @tc.number SUB_Huks_FLSQ_0302
     * @tc.desc   小数：e 近似值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0302 begin');
      Flag.set(2.718281828459045);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(2.718281828459045));
      expect(result).assertEqual(2.718281828459045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(2.718281828459045));
      expect(Flag.value).assertEqual(2.718281828459045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0302 end');
    });

    /**
     * @tc.name   testFlagSeq0303
     * @tc.number SUB_Huks_FLSQ_0303
     * @tc.desc   极值：浮点相邻值 1+2^-52
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0303 begin');
      Flag.set(1.0000000000000002);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(1.0000000000000002));
      expect(result).assertEqual(1.0000000000000002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(1.0000000000000002));
      expect(Flag.value).assertEqual(1.0000000000000002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0303 end');
    });

    /**
     * @tc.name   testFlagSeq0304
     * @tc.number SUB_Huks_FLSQ_0304
     * @tc.desc   极值：float32 epsilon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0304 begin');
      Flag.set(1.1920928955078125e-7);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String(1.1920928955078125e-7));
      expect(result).assertEqual(1.1920928955078125e-7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(1.1920928955078125e-7));
      expect(Flag.value).assertEqual(1.1920928955078125e-7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === Flag.value));
      expect(result === Flag.value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0304 end');
    });


    /**
     * @tc.name   testFlagSeq0305
     * @tc.number SUB_Huks_FLSQ_0305
     * @tc.desc   NaN 读回保持 NaN 语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0305 begin');
      Flag.set(Number.NaN);
      const result: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isNaN(result)));
      expect(Number.isNaN(result)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Number.isNaN(Flag.value)));
      expect(Number.isNaN(Flag.value)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === result));
      expect(result === result).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0305 end');
    });

  });
}
