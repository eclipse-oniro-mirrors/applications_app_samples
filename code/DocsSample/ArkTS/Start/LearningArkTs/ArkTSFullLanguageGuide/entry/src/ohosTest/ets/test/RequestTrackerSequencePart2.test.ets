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

export default function RequestTrackerSequencePart2Test(): void {
  describe('RequestTrackerSequencePart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP2_7600
     * @tc.name      testTrackerSequence0076
     * @tc.desc      Verify RequestTracker final status for sequence failed-success-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0076 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('success');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0076 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP2_7700
     * @tc.name      testTrackerSequence0077
     * @tc.desc      Verify RequestTracker final status for sequence failed-failed-idle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0077 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('failed');
      tracker.setStatus('idle');
      expect(tracker.getStatus()).assertEqual('idle');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0077 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP2_7800
     * @tc.name      testTrackerSequence0078
     * @tc.desc      Verify RequestTracker final status for sequence failed-failed-loading.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0078 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('failed');
      tracker.setStatus('loading');
      expect(tracker.getStatus()).assertEqual('loading');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0078 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP2_7900
     * @tc.name      testTrackerSequence0079
     * @tc.desc      Verify RequestTracker final status for sequence failed-failed-success.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0079 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('failed');
      tracker.setStatus('success');
      expect(tracker.getStatus()).assertEqual('success');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0079 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_TRACKSEQP2_8000
     * @tc.name      testTrackerSequence0080
     * @tc.desc      Verify RequestTracker final status for sequence failed-failed-failed.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testTrackerSequence0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0080 begin');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      tracker.setStatus('failed');
      tracker.setStatus('failed');
      expect(tracker.getStatus()).assertEqual('failed');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTrackerSequence0080 end');
    })

  })
}
