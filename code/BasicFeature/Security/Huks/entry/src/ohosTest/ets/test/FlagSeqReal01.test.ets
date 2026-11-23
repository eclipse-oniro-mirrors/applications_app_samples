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

// FlagSeq 补充场景套件：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Flag } from '../../../main/ets/pages/Index';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Huks]';

export default function flagSeqReal01Test() {
  describe('FlagSeqReal01', () => {

    /**
     * @tc.name   testFlagSeq0022
     * @tc.number SUB_Huks_FLSQ_0022
     * @tc.desc   Number.MAX_VALUE 置位读回一致，再置 0 覆盖生效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0022 begin');
      Flag.set(Number.MAX_VALUE);
      const first: number = Flag.value;
      Flag.set(0);
      const second: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first), String(Number.MAX_VALUE));
      expect(first).assertEqual(Number.MAX_VALUE);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), String(0));
      expect(second).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first === second), String(false));
      expect(first === second).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0022 end');
    });

    /**
     * @tc.name   testFlagSeq0023
     * @tc.number SUB_Huks_FLSQ_0023
     * @tc.desc   主流程：入口值 1、2、3 依次置位，每次读回即当次置入值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0023 begin');
      Flag.set(1);
      const v1: number = Flag.value;
      Flag.set(2);
      const v2: number = Flag.value;
      Flag.set(3);
      const v3: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v2), String(2));
      expect(v2).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v3), String(3));
      expect(v3).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0023 end');
    });

    /**
     * @tc.name   testFlagSeq0024
     * @tc.number SUB_Huks_FLSQ_0024
     * @tc.desc   异常路径：负值 -100 可置位读回且不被钳位到 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0024 begin');
      Flag.set(-1);
      const vNeg1: number = Flag.value;
      Flag.set(-100);
      const vNeg100: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(vNeg1), String(-1));
      expect(vNeg1).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(vNeg100), String(-100));
      expect(vNeg100).assertEqual(-100);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(vNeg100 < 0), String(true));
      expect(vNeg100 < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0024 end');
    });

    /**
     * @tc.name   testFlagSeq0025
     * @tc.number SUB_Huks_FLSQ_0025
     * @tc.desc   状态：2 与 3 交替置位三轮，每次读回都是当次置入值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFlagSeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0025 begin');
      Flag.set(2);
      const r1: number = Flag.value;
      Flag.set(3);
      const r2: number = Flag.value;
      Flag.set(2);
      const r3: number = Flag.value;
      Flag.set(3);
      const r4: number = Flag.value;
      Flag.set(2);
      const r5: number = Flag.value;
      Flag.set(3);
      const r6: number = Flag.value;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r1), String(2));
      expect(r1).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r2), String(3));
      expect(r2).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r3), String(2));
      expect(r3).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r4), String(3));
      expect(r4).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r5), String(2));
      expect(r5).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(r6), String(3));
      expect(r6).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlagSeq0025 end');
    });

  });
}
