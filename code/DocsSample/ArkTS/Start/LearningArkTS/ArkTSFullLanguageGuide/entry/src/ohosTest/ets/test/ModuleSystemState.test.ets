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

import { describe, beforeEach, it, expect } from '@ohos/hypium';
import { initializeLogger, isLoggerInitialized, RequestTracker, RequestStatus } from '../../../main/ets/pages/ModuleSystem';
import { logBegin, logEnd } from './ArkTSGuideUiSupport';

function statusRoundTrip(values: RequestStatus[]): number {
  const tracker: RequestTracker = new RequestTracker();
  let matched: number = 0;
  for (let i = 0; i < values.length; i++) {
    tracker.setStatus(values[i]);
    if (tracker.getStatus() === values[i]) {
      matched++;
    }
  }
  return matched;
}

/**
 * 模块私有状态（module_private_state）与请求状态联合类型的行为。
 */
export default function ArkTSModuleStateTest(): void {
  describe('ArkTSModuleStateTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_STATE_testLoggerInitializedIsBoolean0001
     * @tc.name      testLoggerInitializedIsBoolean0001
     * @tc.desc      Verify isLoggerInitialized always returns a boolean, never undefined
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testLoggerInitializedIsBoolean0001', 0, () => {
      logBegin('testLoggerInitializedIsBoolean0001');
      const value: boolean = isLoggerInitialized();
      expect(typeof value).assertEqual('boolean');
      expect(value === true || value === false).assertTrue();
      logEnd('testLoggerInitializedIsBoolean0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_STATE_testInitializeLoggerFlipsState0002
     * @tc.name      testInitializeLoggerFlipsState0002
     * @tc.desc      Verify initializeLogger turns the module state to true and keeps it
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testInitializeLoggerFlipsState0002', 0, () => {
      logBegin('testInitializeLoggerFlipsState0002');
      initializeLogger();
      expect(isLoggerInitialized()).assertTrue();
      initializeLogger();
      expect(isLoggerInitialized()).assertTrue();
      logEnd('testInitializeLoggerFlipsState0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_STATE_testLoggerStateIsMonotonic0003
     * @tc.name      testLoggerStateIsMonotonic0003
     * @tc.desc      Verify the state never reverts from true to false across repeated reads
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testLoggerStateIsMonotonic0003', 0, () => {
      logBegin('testLoggerStateIsMonotonic0003');
      initializeLogger();
      let flips: number = 0;
      for (let i = 0; i < 20; i++) {
        if (!isLoggerInitialized()) {
          flips++;
        }
      }
      expect(flips).assertEqual(0);
      expect(isLoggerInitialized()).assertTrue();
      logEnd('testLoggerStateIsMonotonic0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_STATE_testLoggerStateSurvivesStatusWork0004
     * @tc.name      testLoggerStateSurvivesStatusWork0004
     * @tc.desc      Verify unrelated module activity does not reset the module-private logger flag
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testLoggerStateSurvivesStatusWork0004', 0, () => {
      logBegin('testLoggerStateSurvivesStatusWork0004');
      initializeLogger();
      statusRoundTrip(['loading', 'success', 'failed']);
      expect(isLoggerInitialized()).assertTrue();
      logEnd('testLoggerStateSurvivesStatusWork0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_STATE_testTrackerDefaultStatusIsIdle0005
     * @tc.name      testTrackerDefaultStatusIsIdle0005
     * @tc.desc      Verify the request tracker initial status literal is idle
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testTrackerDefaultStatusIsIdle0005', 0, () => {
      logBegin('testTrackerDefaultStatusIsIdle0005');
      const tracker: RequestTracker = new RequestTracker();
      expect(tracker.getStatus()).assertEqual('idle');
      expect(tracker.getStatus().length).assertEqual(4);
      logEnd('testTrackerDefaultStatusIsIdle0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_STATE_testStatusRoundTripAllLiterals0006
     * @tc.name      testStatusRoundTripAllLiterals0006
     * @tc.desc      Verify every literal round-trips through setStatus/getStatus
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStatusRoundTripAllLiterals0006', 0, () => {
      logBegin('testStatusRoundTripAllLiterals0006');
      const values: RequestStatus[] = ['idle', 'loading', 'success', 'failed'];
      expect(statusRoundTrip(values)).assertEqual(4);
      expect(statusRoundTrip(['failed', 'loading'])).assertEqual(2);
      logEnd('testStatusRoundTripAllLiterals0006');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_STATE_testStatusLiteralsAreLowerCase0007
     * @tc.name      testStatusLiteralsAreLowerCase0007
     * @tc.desc      Verify the union literals keep their documented lower-case spelling
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStatusLiteralsAreLowerCase0007', 0, () => {
      logBegin('testStatusLiteralsAreLowerCase0007');
      const values: RequestStatus[] = ['idle', 'loading', 'success', 'failed'];
      let lowerCase: number = 0;
      for (let i = 0; i < values.length; i++) {
        if (values[i] === values[i].toLowerCase()) {
          lowerCase++;
        }
      }
      expect(lowerCase).assertEqual(values.length);
      expect(values[1]).assertEqual('loading');
      logEnd('testStatusLiteralsAreLowerCase0007');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_STATE_testStatusLiteralsAreDistinct0008
     * @tc.name      testStatusLiteralsAreDistinct0008
     * @tc.desc      Verify the four status literals are pairwise distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStatusLiteralsAreDistinct0008', 0, () => {
      logBegin('testStatusLiteralsAreDistinct0008');
      const values: RequestStatus[] = ['idle', 'loading', 'success', 'failed'];
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < values.length; i++) {
        unique.add(values[i]);
      }
      expect(unique.size).assertEqual(4);
      expect(values.indexOf('success')).assertEqual(2);
      logEnd('testStatusLiteralsAreDistinct0008');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_STATE_testStatusOverwriteMany0009
     * @tc.name      testStatusOverwriteMany0009
     * @tc.desc      Verify rapid overwrites keep only the last literal
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStatusOverwriteMany0009', 0, () => {
      logBegin('testStatusOverwriteMany0009');
      const tracker: RequestTracker = new RequestTracker();
      const sequence: RequestStatus[] = ['idle', 'loading', 'loading', 'success', 'failed', 'success'];
      for (let i = 0; i < sequence.length; i++) {
        tracker.setStatus(sequence[i]);
      }
      expect(tracker.getStatus()).assertEqual('success');
      expect(tracker.getStatus() === 'failed').assertFalse();
      logEnd('testStatusOverwriteMany0009');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_MODULE_STATE_testLoggerAndTrackerAreIndependent0010
     * @tc.name      testLoggerAndTrackerAreIndependent0010
     * @tc.desc      Verify the logger flag and tracker status do not influence each other
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testLoggerAndTrackerAreIndependent0010', 0, () => {
      logBegin('testLoggerAndTrackerAreIndependent0010');
      const tracker: RequestTracker = new RequestTracker();
      tracker.setStatus('failed');
      const before: boolean = isLoggerInitialized();
      initializeLogger();
      expect(isLoggerInitialized()).assertTrue();
      expect(tracker.getStatus()).assertEqual('failed');
      expect(before && !isLoggerInitialized()).assertFalse();
      logEnd('testLoggerAndTrackerAreIndependent0010');
    });

  });
}
