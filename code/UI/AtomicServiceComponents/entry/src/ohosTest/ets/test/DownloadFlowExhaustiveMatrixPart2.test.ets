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
import { DownloadState, DownloadTarget, supportsDocumentPicker, resolveDownloadTarget, beginAttempt, isStaleAttempt, shouldFallbackOnTimeout, nextDownloadState } from '../../../main/ets/model/DownloadFlow';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function DownloadFlowExhaustiveMatrixPart2Test(): void {
  describe('DownloadFlowExhaustiveMatrixPart2', () => {

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_4100
     * @tc.name      testFallback0041
     * @tc.desc      Verify shouldFallbackOnTimeout(false, -1, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0041 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(false, -1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0041 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_4200
     * @tc.name      testFallback0042
     * @tc.desc      Verify shouldFallbackOnTimeout(false, -1, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0042 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(false, -1, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0042 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_4300
     * @tc.name      testFallback0043
     * @tc.desc      Verify shouldFallbackOnTimeout(false, 0, -1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0043 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(false, 0, -1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0043 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_4400
     * @tc.name      testFallback0044
     * @tc.desc      Verify shouldFallbackOnTimeout(false, 0, 0) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0044 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(false, 0, 0)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0044 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_4500
     * @tc.name      testFallback0045
     * @tc.desc      Verify shouldFallbackOnTimeout(false, 0, 1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0045 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(false, 0, 1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0045 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_4600
     * @tc.name      testFallback0046
     * @tc.desc      Verify shouldFallbackOnTimeout(false, 1, -1) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0046 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(false, 1, -1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0046 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_4700
     * @tc.name      testFallback0047
     * @tc.desc      Verify shouldFallbackOnTimeout(false, 1, 0) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0047 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(false, 1, 0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0047 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_4800
     * @tc.name      testFallback0048
     * @tc.desc      Verify shouldFallbackOnTimeout(false, 1, 1) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFallback0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0048 begin');
      await delayTick();
      expect(shouldFallbackOnTimeout(false, 1, 1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFallback0048 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_4900
     * @tc.name      testNextState0049
     * @tc.desc      Verify nextDownloadState(IDLE, true) is DownloadState.SUCCESS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextState0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0049 begin');
      await delayTick();
      expect(nextDownloadState(DownloadState.IDLE, true)).assertEqual(DownloadState.SUCCESS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0049 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_5000
     * @tc.name      testNextState0050
     * @tc.desc      Verify nextDownloadState(IDLE, false) is DownloadState.FALLBACK.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextState0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0050 begin');
      await delayTick();
      expect(nextDownloadState(DownloadState.IDLE, false)).assertEqual(DownloadState.FALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0050 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_5100
     * @tc.name      testNextState0051
     * @tc.desc      Verify nextDownloadState(PICKING, true) is DownloadState.SUCCESS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextState0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0051 begin');
      await delayTick();
      expect(nextDownloadState(DownloadState.PICKING, true)).assertEqual(DownloadState.SUCCESS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0051 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_5200
     * @tc.name      testNextState0052
     * @tc.desc      Verify nextDownloadState(PICKING, false) is DownloadState.FALLBACK.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextState0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0052 begin');
      await delayTick();
      expect(nextDownloadState(DownloadState.PICKING, false)).assertEqual(DownloadState.FALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0052 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_5300
     * @tc.name      testNextState0053
     * @tc.desc      Verify nextDownloadState(SUCCESS, true) is DownloadState.SUCCESS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextState0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0053 begin');
      await delayTick();
      expect(nextDownloadState(DownloadState.SUCCESS, true)).assertEqual(DownloadState.SUCCESS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0053 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_5400
     * @tc.name      testNextState0054
     * @tc.desc      Verify nextDownloadState(SUCCESS, false) is DownloadState.FALLBACK.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextState0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0054 begin');
      await delayTick();
      expect(nextDownloadState(DownloadState.SUCCESS, false)).assertEqual(DownloadState.FALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0054 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_5500
     * @tc.name      testNextState0055
     * @tc.desc      Verify nextDownloadState(FALLBACK, true) is DownloadState.SUCCESS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextState0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0055 begin');
      await delayTick();
      expect(nextDownloadState(DownloadState.FALLBACK, true)).assertEqual(DownloadState.SUCCESS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0055 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_5600
     * @tc.name      testNextState0056
     * @tc.desc      Verify nextDownloadState(FALLBACK, false) is DownloadState.FALLBACK.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextState0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0056 begin');
      await delayTick();
      expect(nextDownloadState(DownloadState.FALLBACK, false)).assertEqual(DownloadState.FALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0056 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_5700
     * @tc.name      testNextState0057
     * @tc.desc      Verify nextDownloadState(FAILED, true) is DownloadState.SUCCESS.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextState0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0057 begin');
      await delayTick();
      expect(nextDownloadState(DownloadState.FAILED, true)).assertEqual(DownloadState.SUCCESS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0057 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DFEP2_5800
     * @tc.name      testNextState0058
     * @tc.desc      Verify nextDownloadState(FAILED, false) is DownloadState.FALLBACK.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextState0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0058 begin');
      await delayTick();
      expect(nextDownloadState(DownloadState.FAILED, false)).assertEqual(DownloadState.FALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextState0058 end');
    })

  })
}
