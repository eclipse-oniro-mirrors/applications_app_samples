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

// FlagSeq 补充场景套件二：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Flag } from '../../../main/ets/pages/Index';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Huks]';

export default function flagSeqReal02Test() {
  describe('FlagSeqReal02', () => {
    beforeEach(() => {
      Flag.set(0);
    });

    afterEach(() => {
      Flag.set(0);
    });

    /**
     * @tc.name   testFlagSeq0306
     * @tc.number SUB_Huks_FLSQ_0306
     * @tc.desc   异常路径：负零写入后取倒数得负无穷，读回值等于数值零
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0306 begin');
      const negZero: number = -0;
      Flag.set(negZero);
      const inv: number = 1 / Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(inv === Number.NEGATIVE_INFINITY), String(true));
      expect(inv === Number.NEGATIVE_INFINITY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Flag.value), String(0));
      expect(Flag.value).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number.isFinite(Flag.value)), String(true));
      expect(Number.isFinite(Flag.value)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0306 end');
    });

    /**
     * @tc.name   testFlagSeq0307
     * @tc.number SUB_Huks_FLSQ_0307
     * @tc.desc   状态：连续置位 5/6/7/8 四次读回逐档递增且值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0307 begin');
      Flag.set(5);
      const v5: number = Flag.value;
      Flag.set(6);
      const v6: number = Flag.value;
      Flag.set(7);
      const v7: number = Flag.value;
      Flag.set(8);
      const vLast: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v5), String(5));
      expect(v5).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v6), String(6));
      expect(v6).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v7), String(7));
      expect(v7).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(vLast), String(8));
      expect(vLast).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(v5 < v6 && v6 < v7 && v7 < vLast), String(true));
      expect(v5 < v6 && v6 < v7 && v7 < vLast).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0307 end');
    });

    /**
     * @tc.name   testFlagSeq0308
     * @tc.number SUB_Huks_FLSQ_0308
     * @tc.desc   极值：正无穷写入后读回仍为无穷，且不小于任何有限值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0308 begin');
      Flag.set(Number.POSITIVE_INFINITY);
      const readBack: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack === Number.POSITIVE_INFINITY), String(true));
      expect(readBack === Number.POSITIVE_INFINITY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number.isFinite(readBack)), String(false));
      expect(Number.isFinite(readBack)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack > Number.MAX_VALUE), String(true));
      expect(readBack > Number.MAX_VALUE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0308 end');
    });

    /**
     * @tc.name   testFlagSeq0309
     * @tc.number SUB_Huks_FLSQ_0309
     * @tc.desc   主流程：0.1 加 0.2 的舍入结果写入后按 IEEE 754 冻结常量读回
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0309 begin');
      Flag.set(0.1 + 0.2);
      const readBack: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack === 0.30000000000000004), String(true));
      expect(readBack === 0.30000000000000004).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack === 0.3), String(false));
      expect(readBack === 0.3).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack > 0.3), String(true));
      expect(readBack > 0.3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0309 end');
    });

    /**
     * @tc.name   testFlagSeq0310
     * @tc.number SUB_Huks_FLSQ_0310
     * @tc.desc   状态：正负无穷交替置位，读回符号随写入翻转
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0310 begin');
      Flag.set(Number.POSITIVE_INFINITY);
      const pos: number = Flag.value;
      Flag.set(Number.NEGATIVE_INFINITY);
      const neg: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(pos === Number.POSITIVE_INFINITY), String(true));
      expect(pos === Number.POSITIVE_INFINITY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(neg === Number.NEGATIVE_INFINITY), String(true));
      expect(neg === Number.NEGATIVE_INFINITY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(pos !== neg), String(true));
      expect(pos !== neg).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0310 end');
    });

    /**
     * @tc.name   testFlagSeq0311
     * @tc.number SUB_Huks_FLSQ_0311
     * @tc.desc   状态：连续置位 -1/-2/-3/-4 四次读回逐档递减且值一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0311 begin');
      Flag.set(-1);
      const v1: number = Flag.value;
      Flag.set(-2);
      const v2: number = Flag.value;
      Flag.set(-3);
      const v3: number = Flag.value;
      Flag.set(-4);
      const v4: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v1), String(-1));
      expect(v1).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v2), String(-2));
      expect(v2).assertEqual(-2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v3), String(-3));
      expect(v3).assertEqual(-3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v4), String(-4));
      expect(v4).assertEqual(-4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(v1 > v2 && v2 > v3 && v3 > v4), String(true));
      expect(v1 > v2 && v2 > v3 && v3 > v4).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0311 end');
    });

    /**
     * @tc.name   testFlagSeq0312
     * @tc.number SUB_Huks_FLSQ_0312
     * @tc.desc   极值：最小正数 5e-324 写入后读回无损且大于零
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0312 begin');
      Flag.set(Number.MIN_VALUE);
      const readBack: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack === Number.MIN_VALUE), String(true));
      expect(readBack === Number.MIN_VALUE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack === 5e-324), String(true));
      expect(readBack === 5e-324).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack > 0), String(true));
      expect(readBack > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0312 end');
    });

    /**
     * @tc.name   testFlagSeq0313
     * @tc.number SUB_Huks_FLSQ_0313
     * @tc.desc   主流程：十六进制常量 0xFF 写入后读回等于十进制 255
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0313 begin');
      Flag.set(0xFF);
      const readBack: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(readBack), String(255));
      expect(readBack).assertEqual(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack === 0xFF), String(true));
      expect(readBack === 0xFF).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack > 0), String(true));
      expect(readBack > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0313 end');
    });

    /**
     * @tc.name   testFlagSeq0314
     * @tc.number SUB_Huks_FLSQ_0314
     * @tc.desc   极值：1e308 写入后读回介于 1e307 与最大有限值之间
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0314 begin');
      Flag.set(1e308);
      const readBack: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(readBack), String(1e308));
      expect(readBack).assertEqual(1e308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack > 1e307), String(true));
      expect(readBack > 1e307).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack < Number.MAX_VALUE), String(true));
      expect(readBack < Number.MAX_VALUE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0314 end');
    });

    /**
     * @tc.name   testFlagSeq0315
     * @tc.number SUB_Huks_FLSQ_0315
     * @tc.desc   主流程：科学计数常量 2.5e3 写入后读回等于十进制 2500
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0315 begin');
      Flag.set(2.5e3);
      const readBack: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(readBack), String(2500));
      expect(readBack).assertEqual(2500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack === 2.5e3), String(true));
      expect(readBack === 2.5e3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number.isInteger(readBack)), String(true));
      expect(Number.isInteger(readBack)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0315 end');
    });

    /**
     * @tc.name   testFlagSeq0316
     * @tc.number SUB_Huks_FLSQ_0316
     * @tc.desc   主流程：八进制常量 0o17 写入后读回等于十进制 15
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0316 begin');
      Flag.set(0o17);
      const readBack: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(readBack), String(15));
      expect(readBack).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack === 0o17), String(true));
      expect(readBack === 0o17).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack < 16), String(true));
      expect(readBack < 16).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0316 end');
    });

    /**
     * @tc.name   testFlagSeq0317
     * @tc.number SUB_Huks_FLSQ_0317
     * @tc.desc   状态：置位读回后再置相同值读回，两次读回一致且稳定
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0317 begin');
      Flag.set(7);
      const first: number = Flag.value;
      Flag.set(7);
      const second: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first), String(7));
      expect(first).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), String(7));
      expect(second).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(first === second), String(true));
      expect(first === second).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0317 end');
    });

  });
}
