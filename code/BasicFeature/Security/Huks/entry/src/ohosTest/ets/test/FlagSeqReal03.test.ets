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

// FlagSeq 补充场景套件三：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Flag } from '../../../main/ets/pages/Index';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Huks]';

export default function flagSeqReal03Test() {
  describe('FlagSeqReal03', () => {
    beforeEach(() => {
      Flag.set(0);
    });

    afterEach(() => {
      Flag.set(0);
    });

    /**
     * @tc.name   testFlagSeq0318
     * @tc.number SUB_Huks_FLSQ_0318
     * @tc.desc   边界：int32 下限 -2147483648 写入读回无损，随后归零复位
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0318 begin');
      Flag.set(-2147483648);
      const readBack: number = Flag.value;
      Flag.set(0);
      const zeroed: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(readBack), String(-2147483648));
      expect(readBack).assertEqual(-2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack < 0), String(true));
      expect(readBack < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(zeroed), String(0));
      expect(zeroed).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0318 end');
    });

    /**
     * @tc.name   testFlagSeq0319
     * @tc.number SUB_Huks_FLSQ_0319
     * @tc.desc   边界：越过 int32 上限的 2147483648 写入读回无损且为正
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0319 begin');
      Flag.set(2147483648);
      const readBack: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(readBack), String(2147483648));
      expect(readBack).assertEqual(2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack > 2147483647), String(true));
      expect(readBack > 2147483647).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack > 0), String(true));
      expect(readBack > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0319 end');
    });

    /**
     * @tc.name   testFlagSeq0320
     * @tc.number SUB_Huks_FLSQ_0320
     * @tc.desc   状态：负浮点 -2.75 写入后读回，再以 2.75 覆盖读回符号翻转
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0320 begin');
      Flag.set(-2.75);
      const negative: number = Flag.value;
      Flag.set(2.75);
      const positive: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(negative), String(-2.75));
      expect(negative).assertEqual(-2.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(positive), String(2.75));
      expect(positive).assertEqual(2.75);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(negative + positive === 0), String(true));
      expect(negative + positive === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0320 end');
    });

    /**
     * @tc.name   testFlagSeq0321
     * @tc.number SUB_Huks_FLSQ_0321
     * @tc.desc   状态：0/1/2/0/1 五次置位序列读回逐次精确匹配
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0321 begin');
      Flag.set(0);
      const v0a: number = Flag.value;
      Flag.set(1);
      const v1a: number = Flag.value;
      Flag.set(2);
      const v2: number = Flag.value;
      Flag.set(0);
      const v0b: number = Flag.value;
      Flag.set(1);
      const v1b: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v0a), String(0));
      expect(v0a).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v1a), String(1));
      expect(v1a).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v2), String(2));
      expect(v2).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v0b), String(0));
      expect(v0b).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v1b), String(1));
      expect(v1b).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(v1a === v1b), String(true));
      expect(v1a === v1b).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0321 end');
    });

    /**
     * @tc.name   testFlagSeq0322
     * @tc.number SUB_Huks_FLSQ_0322
     * @tc.desc   主流程：圆周率写入后读回等于冻结常量 3.141592653589793
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0322 begin');
      Flag.set(Math.PI);
      const readBack: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack === 3.141592653589793), String(true));
      expect(readBack === 3.141592653589793).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack > 3.14), String(true));
      expect(readBack > 3.14).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack < 3.15), String(true));
      expect(readBack < 3.15).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0322 end');
    });

    /**
     * @tc.name   testFlagSeq0323
     * @tc.number SUB_Huks_FLSQ_0323
     * @tc.desc   状态：1e-10 与 1e-9 交替置位读回逐次精确且互不相等
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0323 begin');
      Flag.set(1e-10);
      const small: number = Flag.value;
      Flag.set(1e-9);
      const large: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(small === 1e-10), String(true));
      expect(small === 1e-10).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(large === 1e-9), String(true));
      expect(large === 1e-9).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(small < large), String(true));
      expect(small < large).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0323 end');
    });

    /**
     * @tc.name   testFlagSeq0324
     * @tc.number SUB_Huks_FLSQ_0324
     * @tc.desc   极值：负最大有限值写入读回保持负号且仍为有限数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0324 begin');
      Flag.set(-Number.MAX_VALUE);
      const readBack: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack === -Number.MAX_VALUE), String(true));
      expect(readBack === -Number.MAX_VALUE).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(readBack < 0), String(true));
      expect(readBack < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(Number.isFinite(readBack)), String(true));
      expect(Number.isFinite(readBack)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0324 end');
    });

    /**
     * @tc.name   testFlagSeq0325
     * @tc.number SUB_Huks_FLSQ_0325
     * @tc.desc   状态：正零取倒数得正无穷，负零取倒数得负无穷，符号语义随写入切换
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0325 begin');
      Flag.set(0);
      const posInv: number = 1 / Flag.value;
      Flag.set(-0);
      const negInv: number = 1 / Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(posInv === Number.POSITIVE_INFINITY), String(true));
      expect(posInv === Number.POSITIVE_INFINITY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(negInv === Number.NEGATIVE_INFINITY), String(true));
      expect(negInv === Number.NEGATIVE_INFINITY).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(posInv !== negInv), String(true));
      expect(posInv !== negInv).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0325 end');
    });

  });
}
