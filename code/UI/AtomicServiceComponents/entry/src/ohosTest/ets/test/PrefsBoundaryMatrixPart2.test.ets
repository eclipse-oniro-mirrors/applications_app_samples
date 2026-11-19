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
import { delayTick } from './shared/AsyncYield';
import { PREFS_MAX_LENGTH, normalizePrefsText, canSaveText, nextCount, readCount, readText, buildPrefsSummary } from '../../../main/ets/model/PrefsStore';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function PrefsBoundaryMatrixPart2Test(): void {
  describe('PrefsBoundaryMatrixPart2', () => {

    /**
     * @tc.number    SUB_ATOMIC_PBMP2_4100
     * @tc.name      testReadTextBoolean0041
     * @tc.desc      Verify readText boolean returns empty.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadTextBoolean0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadTextBoolean0041 begin');
      await delayTick();
      expect(readText(true)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadTextBoolean0041 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP2_4200
     * @tc.name      testSummary0042
     * @tc.desc      Verify buildPrefsSummary('', -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSummary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0042 begin');
      await delayTick();
      expect(buildPrefsSummary('', -1)).assertEqual('No content yet, read -1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0042 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP2_4300
     * @tc.name      testSummary0043
     * @tc.desc      Verify buildPrefsSummary('', 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSummary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0043 begin');
      await delayTick();
      expect(buildPrefsSummary('', 0)).assertEqual('No content yet, read 0 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0043 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP2_4400
     * @tc.name      testSummary0044
     * @tc.desc      Verify buildPrefsSummary('', 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSummary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0044 begin');
      await delayTick();
      expect(buildPrefsSummary('', 5)).assertEqual('No content yet, read 5 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0044 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP2_4500
     * @tc.name      testSummary0045
     * @tc.desc      Verify buildPrefsSummary('x', -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSummary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0045 begin');
      await delayTick();
      expect(buildPrefsSummary('x', -1)).assertEqual('Saved "x", read -1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0045 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP2_4600
     * @tc.name      testSummary0046
     * @tc.desc      Verify buildPrefsSummary('x', 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSummary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0046 begin');
      await delayTick();
      expect(buildPrefsSummary('x', 0)).assertEqual('Saved "x", read 0 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0046 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP2_4700
     * @tc.name      testSummary0047
     * @tc.desc      Verify buildPrefsSummary('x', 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSummary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0047 begin');
      await delayTick();
      expect(buildPrefsSummary('x', 5)).assertEqual('Saved "x", read 5 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0047 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP2_4800
     * @tc.name      testSummary0048
     * @tc.desc      Verify buildPrefsSummary('中文', -1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSummary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0048 begin');
      await delayTick();
      expect(buildPrefsSummary('中文', -1)).assertEqual('Saved "中文", read -1 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0048 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP2_4900
     * @tc.name      testSummary0049
     * @tc.desc      Verify buildPrefsSummary('中文', 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSummary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0049 begin');
      await delayTick();
      expect(buildPrefsSummary('中文', 0)).assertEqual('Saved "中文", read 0 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0049 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP2_5000
     * @tc.name      testSummary0050
     * @tc.desc      Verify buildPrefsSummary('中文', 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSummary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0050 begin');
      await delayTick();
      expect(buildPrefsSummary('中文', 5)).assertEqual('Saved "中文", read 5 times');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSummary0050 end');
    })

  })
}
