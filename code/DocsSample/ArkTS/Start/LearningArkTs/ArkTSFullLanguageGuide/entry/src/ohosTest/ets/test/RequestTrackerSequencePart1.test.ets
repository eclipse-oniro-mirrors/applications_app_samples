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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RequestTracker, RequestStatus } from '../../../main/ets/pages/ModuleSystem';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

export default function RequestTrackerSequencePart1Test(): void {
  describe('RequestTrackerSequencePart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_0100
     * @tc.name      testTrackerSequence0001
     * @tc.desc      Verify RequestTracker final status for sequence idle-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0001 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_0200
     * @tc.name      testTrackerSequence0002
     * @tc.desc      Verify RequestTracker final status for sequence idle-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0002 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_0300
     * @tc.name      testTrackerSequence0003
     * @tc.desc      Verify RequestTracker final status for sequence idle-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0003 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_0400
     * @tc.name      testTrackerSequence0004
     * @tc.desc      Verify RequestTracker final status for sequence idle-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0004 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_0500
     * @tc.name      testTrackerSequence0005
     * @tc.desc      Verify RequestTracker final status for sequence loading-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0005 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_0600
     * @tc.name      testTrackerSequence0006
     * @tc.desc      Verify RequestTracker final status for sequence loading-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0006 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_0700
     * @tc.name      testTrackerSequence0007
     * @tc.desc      Verify RequestTracker final status for sequence loading-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0007 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_0800
     * @tc.name      testTrackerSequence0008
     * @tc.desc      Verify RequestTracker final status for sequence loading-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0008 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_0900
     * @tc.name      testTrackerSequence0009
     * @tc.desc      Verify RequestTracker final status for sequence success-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0009 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_1000
     * @tc.name      testTrackerSequence0010
     * @tc.desc      Verify RequestTracker final status for sequence success-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0010 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_1100
     * @tc.name      testTrackerSequence0011
     * @tc.desc      Verify RequestTracker final status for sequence success-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0011 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_1200
     * @tc.name      testTrackerSequence0012
     * @tc.desc      Verify RequestTracker final status for sequence success-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0012 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_1300
     * @tc.name      testTrackerSequence0013
     * @tc.desc      Verify RequestTracker final status for sequence failed-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0013 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_1400
     * @tc.name      testTrackerSequence0014
     * @tc.desc      Verify RequestTracker final status for sequence failed-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0014 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_1500
     * @tc.name      testTrackerSequence0015
     * @tc.desc      Verify RequestTracker final status for sequence failed-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0015 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_1600
     * @tc.name      testTrackerSequence0016
     * @tc.desc      Verify RequestTracker final status for sequence failed-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0016 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_1700
     * @tc.name      testTrackerSequence0017
     * @tc.desc      Verify RequestTracker final status for sequence idle-idle-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0017 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('idle');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_1800
     * @tc.name      testTrackerSequence0018
     * @tc.desc      Verify RequestTracker final status for sequence idle-idle-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0018 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('idle');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_1900
     * @tc.name      testTrackerSequence0019
     * @tc.desc      Verify RequestTracker final status for sequence idle-idle-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0019 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('idle');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_2000
     * @tc.name      testTrackerSequence0020
     * @tc.desc      Verify RequestTracker final status for sequence idle-idle-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0020 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('idle');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_2100
     * @tc.name      testTrackerSequence0021
     * @tc.desc      Verify RequestTracker final status for sequence idle-loading-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0021 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('loading');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_2200
     * @tc.name      testTrackerSequence0022
     * @tc.desc      Verify RequestTracker final status for sequence idle-loading-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0022 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('loading');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_2300
     * @tc.name      testTrackerSequence0023
     * @tc.desc      Verify RequestTracker final status for sequence idle-loading-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0023 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('loading');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_2400
     * @tc.name      testTrackerSequence0024
     * @tc.desc      Verify RequestTracker final status for sequence idle-loading-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0024 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('loading');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_2500
     * @tc.name      testTrackerSequence0025
     * @tc.desc      Verify RequestTracker final status for sequence idle-success-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0025 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('success');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_2600
     * @tc.name      testTrackerSequence0026
     * @tc.desc      Verify RequestTracker final status for sequence idle-success-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0026 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('success');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_2700
     * @tc.name      testTrackerSequence0027
     * @tc.desc      Verify RequestTracker final status for sequence idle-success-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0027 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('success');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_2800
     * @tc.name      testTrackerSequence0028
     * @tc.desc      Verify RequestTracker final status for sequence idle-success-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0028 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('success');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_2900
     * @tc.name      testTrackerSequence0029
     * @tc.desc      Verify RequestTracker final status for sequence idle-failed-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0029 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('failed');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_3000
     * @tc.name      testTrackerSequence0030
     * @tc.desc      Verify RequestTracker final status for sequence idle-failed-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0030 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('failed');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_3100
     * @tc.name      testTrackerSequence0031
     * @tc.desc      Verify RequestTracker final status for sequence idle-failed-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0031 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('failed');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_3200
     * @tc.name      testTrackerSequence0032
     * @tc.desc      Verify RequestTracker final status for sequence idle-failed-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0032 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('idle');
      tracker.setStatus('failed');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_3300
     * @tc.name      testTrackerSequence0033
     * @tc.desc      Verify RequestTracker final status for sequence loading-idle-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0033 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('idle');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_3400
     * @tc.name      testTrackerSequence0034
     * @tc.desc      Verify RequestTracker final status for sequence loading-idle-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0034 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('idle');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_3500
     * @tc.name      testTrackerSequence0035
     * @tc.desc      Verify RequestTracker final status for sequence loading-idle-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0035 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('idle');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_3600
     * @tc.name      testTrackerSequence0036
     * @tc.desc      Verify RequestTracker final status for sequence loading-idle-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0036 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('idle');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_3700
     * @tc.name      testTrackerSequence0037
     * @tc.desc      Verify RequestTracker final status for sequence loading-loading-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0037 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('loading');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_3800
     * @tc.name      testTrackerSequence0038
     * @tc.desc      Verify RequestTracker final status for sequence loading-loading-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0038 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('loading');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_3900
     * @tc.name      testTrackerSequence0039
     * @tc.desc      Verify RequestTracker final status for sequence loading-loading-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0039 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('loading');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_4000
     * @tc.name      testTrackerSequence0040
     * @tc.desc      Verify RequestTracker final status for sequence loading-loading-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0040 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('loading');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_4100
     * @tc.name      testTrackerSequence0041
     * @tc.desc      Verify RequestTracker final status for sequence loading-success-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0041 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('success');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_4200
     * @tc.name      testTrackerSequence0042
     * @tc.desc      Verify RequestTracker final status for sequence loading-success-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0042 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('success');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_4300
     * @tc.name      testTrackerSequence0043
     * @tc.desc      Verify RequestTracker final status for sequence loading-success-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0043 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('success');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_4400
     * @tc.name      testTrackerSequence0044
     * @tc.desc      Verify RequestTracker final status for sequence loading-success-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0044 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('success');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_4500
     * @tc.name      testTrackerSequence0045
     * @tc.desc      Verify RequestTracker final status for sequence loading-failed-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0045 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('failed');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_4600
     * @tc.name      testTrackerSequence0046
     * @tc.desc      Verify RequestTracker final status for sequence loading-failed-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0046 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('failed');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_4700
     * @tc.name      testTrackerSequence0047
     * @tc.desc      Verify RequestTracker final status for sequence loading-failed-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0047 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('failed');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_4800
     * @tc.name      testTrackerSequence0048
     * @tc.desc      Verify RequestTracker final status for sequence loading-failed-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0048 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('loading');
      tracker.setStatus('failed');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_4900
     * @tc.name      testTrackerSequence0049
     * @tc.desc      Verify RequestTracker final status for sequence success-idle-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0049 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('idle');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_5000
     * @tc.name      testTrackerSequence0050
     * @tc.desc      Verify RequestTracker final status for sequence success-idle-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0050 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('idle');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0050 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_5100
     * @tc.name      testTrackerSequence0051
     * @tc.desc      Verify RequestTracker final status for sequence success-idle-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0051 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('idle');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0051 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_5200
     * @tc.name      testTrackerSequence0052
     * @tc.desc      Verify RequestTracker final status for sequence success-idle-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0052 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('idle');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0052 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_5300
     * @tc.name      testTrackerSequence0053
     * @tc.desc      Verify RequestTracker final status for sequence success-loading-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0053 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('loading');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0053 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_5400
     * @tc.name      testTrackerSequence0054
     * @tc.desc      Verify RequestTracker final status for sequence success-loading-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0054 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('loading');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0054 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_5500
     * @tc.name      testTrackerSequence0055
     * @tc.desc      Verify RequestTracker final status for sequence success-loading-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0055 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('loading');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0055 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_5600
     * @tc.name      testTrackerSequence0056
     * @tc.desc      Verify RequestTracker final status for sequence success-loading-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0056 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('loading');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0056 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_5700
     * @tc.name      testTrackerSequence0057
     * @tc.desc      Verify RequestTracker final status for sequence success-success-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0057 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('success');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0057 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_5800
     * @tc.name      testTrackerSequence0058
     * @tc.desc      Verify RequestTracker final status for sequence success-success-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0058 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('success');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0058 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_5900
     * @tc.name      testTrackerSequence0059
     * @tc.desc      Verify RequestTracker final status for sequence success-success-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0059 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('success');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0059 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_6000
     * @tc.name      testTrackerSequence0060
     * @tc.desc      Verify RequestTracker final status for sequence success-success-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0060 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('success');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0060 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_6100
     * @tc.name      testTrackerSequence0061
     * @tc.desc      Verify RequestTracker final status for sequence success-failed-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0061 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('failed');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0061 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_6200
     * @tc.name      testTrackerSequence0062
     * @tc.desc      Verify RequestTracker final status for sequence success-failed-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0062 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('failed');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0062 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_6300
     * @tc.name      testTrackerSequence0063
     * @tc.desc      Verify RequestTracker final status for sequence success-failed-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0063 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('failed');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0063 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_6400
     * @tc.name      testTrackerSequence0064
     * @tc.desc      Verify RequestTracker final status for sequence success-failed-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0064 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('success');
      tracker.setStatus('failed');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0064 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_6500
     * @tc.name      testTrackerSequence0065
     * @tc.desc      Verify RequestTracker final status for sequence failed-idle-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0065 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('idle');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0065 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_6600
     * @tc.name      testTrackerSequence0066
     * @tc.desc      Verify RequestTracker final status for sequence failed-idle-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0066 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('idle');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0066 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_6700
     * @tc.name      testTrackerSequence0067
     * @tc.desc      Verify RequestTracker final status for sequence failed-idle-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0067 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('idle');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0067 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_6800
     * @tc.name      testTrackerSequence0068
     * @tc.desc      Verify RequestTracker final status for sequence failed-idle-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0068 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('idle');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0068 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_6900
     * @tc.name      testTrackerSequence0069
     * @tc.desc      Verify RequestTracker final status for sequence failed-loading-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0069 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('loading');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0069 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_7000
     * @tc.name      testTrackerSequence0070
     * @tc.desc      Verify RequestTracker final status for sequence failed-loading-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0070 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('loading');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0070 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_7100
     * @tc.name      testTrackerSequence0071
     * @tc.desc      Verify RequestTracker final status for sequence failed-loading-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0071 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('loading');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0071 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_7200
     * @tc.name      testTrackerSequence0072
     * @tc.desc      Verify RequestTracker final status for sequence failed-loading-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0072 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('loading');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0072 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_7300
     * @tc.name      testTrackerSequence0073
     * @tc.desc      Verify RequestTracker final status for sequence failed-success-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0073 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('success');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0073 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_7400
     * @tc.name      testTrackerSequence0074
     * @tc.desc      Verify RequestTracker final status for sequence failed-success-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0074 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('success');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0074 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP1_7500
     * @tc.name      testTrackerSequence0075
     * @tc.desc      Verify RequestTracker final status for sequence failed-success-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0075 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('success');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0075 end');
    })

  })
}
