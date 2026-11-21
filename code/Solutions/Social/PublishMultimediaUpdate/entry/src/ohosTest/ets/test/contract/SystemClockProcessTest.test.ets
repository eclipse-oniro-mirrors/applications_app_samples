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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import systemDateTime from '@ohos.systemDateTime';
import process from '@ohos.process';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Device clock and identity of the running process.
 * A published row is stamped with the wall clock and a test can only be
 * repeated when the clock source and the process identity are stable. The
 * cases pin those two sources without touching the UI.
 */
const CLOCK_TOLERANCE_MS: number = 60000;
export default function systemClockProcessTest() {
  describe('SystemClockProcessTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_CLOCK_0100
     * @tc.name CurrentTimeFollowsDateNow001
     * @tc.desc Verify the system clock and the runtime clock agree within a minute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CurrentTimeFollowsDateNow_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'CurrentTimeFollowsDateNow_001 begin');
      const systemMs: number = await systemDateTime.getCurrentTime();
      const runtimeMs: number = Date.now();
      expect(Math.abs(systemMs - runtimeMs) < CLOCK_TOLERANCE_MS).assertTrue();
      Logger.info(TAG, 'CurrentTimeFollowsDateNow_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_CLOCK_0200
     * @tc.name CurrentTimeAdvances002
     * @tc.desc Verify two clock reads taken apart do not go backwards
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CurrentTimeAdvances_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'CurrentTimeAdvances_002 begin');
      const first: number = await systemDateTime.getCurrentTime();
      const second: number = await systemDateTime.getCurrentTime();
      expect(second >= first).assertTrue();
      Logger.info(TAG, 'CurrentTimeAdvances_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_CLOCK_0300
     * @tc.name TimezoneNamePresent003
     * @tc.desc Verify the reported timezone is a named zone
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TimezoneNamePresent_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'TimezoneNamePresent_003 begin');
      const zone: string = await systemDateTime.getTimezone();
      expect(zone.length !== 0).assertTrue();
      Logger.info(TAG, 'TimezoneNamePresent_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_CLOCK_0400
     * @tc.name TimezoneStableAcrossReads004
     * @tc.desc Verify two timezone reads report the same zone name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TimezoneStableAcrossReads_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'TimezoneStableAcrossReads_004 begin');
      const first: string = await systemDateTime.getTimezone();
      const second: string = await systemDateTime.getTimezone();
      expect(second).assertEqual(first);
      Logger.info(TAG, 'TimezoneStableAcrossReads_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_CLOCK_0500
     * @tc.name DateWrapsCurrentTime005
     * @tc.desc Verify the date object carries the same instant as the clock read
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DateWrapsCurrentTime_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DateWrapsCurrentTime_005 begin');
      const moment: Date = await systemDateTime.getDate();
      const systemMs: number = await systemDateTime.getCurrentTime();
      expect(Math.abs(moment.getTime() - systemMs) < CLOCK_TOLERANCE_MS).assertTrue();
      Logger.info(TAG, 'DateWrapsCurrentTime_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_CLOCK_0600
     * @tc.name ProcessPidPositive006
     * @tc.desc Verify the running process reports a positive pid
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ProcessPidPositive_006', 0, (): void => {
      Logger.info(TAG, 'ProcessPidPositive_006 begin');
      expect(process.pid > 0).assertTrue();
      Logger.info(TAG, 'ProcessPidPositive_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_CLOCK_0700
     * @tc.name ProcessUidPositive007
     * @tc.desc Verify the running process reports a positive uid
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ProcessUidPositive_007', 0, (): void => {
      Logger.info(TAG, 'ProcessUidPositive_007 begin');
      expect(process.uid > 0).assertTrue();
      Logger.info(TAG, 'ProcessUidPositive_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_CLOCK_0800
     * @tc.name ProcessTidPositive008
     * @tc.desc Verify the running process reports a positive main thread id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ProcessTidPositive_008', 0, (): void => {
      Logger.info(TAG, 'ProcessTidPositive_008 begin');
      expect(process.tid > 0).assertTrue();
      Logger.info(TAG, 'ProcessTidPositive_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_CLOCK_0900
     * @tc.name UptimeAndStartTimePositive009
     * @tc.desc Verify both the process uptime and the boot reference time are positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UptimeAndStartTimePositive_009', 0, (): void => {
      Logger.info(TAG, 'UptimeAndStartTimePositive_009 begin');
      const processUp: number = process.uptime();
      const bootReference: number = process.getStartRealtime();
      expect(processUp > 0).assertTrue();
      expect(bootReference > 0).assertTrue();
      Logger.info(TAG, 'UptimeAndStartTimePositive_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_CLOCK_1000
     * @tc.name PastCpuTimeNonNegative010
     * @tc.desc Verify the consumed cpu time is reported as a non negative value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PastCpuTimeNonNegative_010', 0, (): void => {
      Logger.info(TAG, 'PastCpuTimeNonNegative_010 begin');
      const cpuMs: number = process.getPastCpuTime();
      expect(cpuMs >= 0).assertTrue();
      Logger.info(TAG, 'PastCpuTimeNonNegative_010 end');
    });
  });
}
