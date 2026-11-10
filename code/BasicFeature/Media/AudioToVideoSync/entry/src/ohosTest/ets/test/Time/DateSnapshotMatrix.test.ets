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

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { systemDateTime } from '@kit.BasicServicesKit';
import { paceTurn } from '../Shared/TestPace';

const NANOS_PER_MILLI: number = 1000000;
const CLOCK_TOLERANCE_MS: number = 2000;

export default function dateSnapshotMatrixTest() {
  describe('dateSnapshotMatrixTest', () => {
    beforeAll(() => {
      console.info('dateSnapshotMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('dateSnapshotMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_TIME_DATE_0100
     * @tc.name      testDateSnapshot0001
     * @tc.desc      Verify the wall clock and the JavaScript Date clock agree within tolerance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateSnapshot0001', 0, () => {
      const wall: number = systemDateTime.getTime(false);
      const dateNow: number = Date.now();
      expect(wall).assertLarger(0);
      expect(dateNow).assertLarger(0);
      expect(Math.abs(wall - dateNow)).assertLess(CLOCK_TOLERANCE_MS * 2);
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_0200
     * @tc.name      testDateSnapshot0002
     * @tc.desc      Verify the nanosecond clock and millisecond clock agree within tolerance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateSnapshot0002', 0, () => {
      const millis: number = systemDateTime.getTime(false);
      const nanos: number = systemDateTime.getTime(true);
      expect(nanos).assertLarger(0);
      expect(Math.abs(nanos / NANOS_PER_MILLI - millis)).assertLess(CLOCK_TOLERANCE_MS);
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_0300
     * @tc.name      testDateSnapshot0003
     * @tc.desc      Verify the asynchronous date snapshot reports a legal calendar date
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateSnapshot0003', 0, async () => {
      const current: Date = await systemDateTime.getDate();
      expect(current.getFullYear()).assertLargerOrEqual(2000);
      expect(current.getFullYear()).assertLessOrEqual(2100);
      expect(current.getMonth()).assertLargerOrEqual(0);
      expect(current.getMonth()).assertLessOrEqual(11);
      expect(current.getDate()).assertLargerOrEqual(1);
      expect(current.getDate()).assertLessOrEqual(31);
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_0400
     * @tc.name      testDateSnapshot0004
     * @tc.desc      Verify the date snapshot and the wall clock describe the same day
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateSnapshot0004', 0, async () => {
      const wall: Date = new Date(systemDateTime.getTime(false));
      const snapshot: Date = await systemDateTime.getDate();
      expect(snapshot.getFullYear()).assertEqual(wall.getFullYear());
      expect(snapshot.getMonth()).assertEqual(wall.getMonth());
      expect(snapshot.getDate()).assertEqual(wall.getDate());
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_0500
     * @tc.name      testDateSnapshot0005
     * @tc.desc      Verify converting a date snapshot back to milliseconds preserves its fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateSnapshot0005', 0, async () => {
      const snapshot: Date = await systemDateTime.getDate();
      const millis: number = snapshot.getTime();
      const restored: Date = new Date(millis);
      expect(millis).assertLarger(0);
      expect(restored.getFullYear()).assertEqual(snapshot.getFullYear());
      expect(restored.getMonth()).assertEqual(snapshot.getMonth());
      expect(restored.getDate()).assertEqual(snapshot.getDate());
      expect(restored.getHours()).assertEqual(snapshot.getHours());
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_0600
     * @tc.name      testDateSnapshot0006
     * @tc.desc      Verify the synchronous and asynchronous timezone reads agree
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateSnapshot0006', 0, async () => {
      const syncZone: string = systemDateTime.getTimezoneSync();
      const asyncZone: string = await systemDateTime.getTimezone();
      expect(syncZone.length).assertLarger(0);
      expect(asyncZone.length).assertLarger(0);
      expect(asyncZone).assertEqual(syncZone);
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_0700
     * @tc.name      testDateSnapshot0007
     * @tc.desc      Verify the active uptime never exceeds the startup uptime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateSnapshot0007', 0, () => {
      const startup: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      const active: number = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, false);
      expect(startup).assertLarger(0);
      expect(active).assertLarger(0);
      expect(active).assertLessOrEqual(startup + 1);
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_0800
     * @tc.name      testDateSnapshot0008
     * @tc.desc      Verify repeated date snapshots never move backwards in time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateSnapshot0008', 0, async () => {
      let previous: number = (await systemDateTime.getDate()).getTime();
      for (let i = 0; i < 5; i++) {
        const current: number = (await systemDateTime.getDate()).getTime();
        expect(current).assertLargerOrEqual(previous);
        previous = current;
      }
      expect(previous).assertLarger(0);
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_0900
     * @tc.name      testDateSnapshot0009
     * @tc.desc      Verify the date snapshot hour, minute and second fields are inside their legal ranges
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateSnapshot0009', 0, async () => {
      const snapshot: Date = await systemDateTime.getDate();
      expect(snapshot.getHours()).assertLargerOrEqual(0);
      expect(snapshot.getHours()).assertLessOrEqual(23);
      expect(snapshot.getMinutes()).assertLargerOrEqual(0);
      expect(snapshot.getMinutes()).assertLessOrEqual(59);
      expect(snapshot.getSeconds()).assertLargerOrEqual(0);
      expect(snapshot.getSeconds()).assertLessOrEqual(60);
      expect(snapshot.getMilliseconds()).assertLargerOrEqual(0);
      expect(snapshot.getMilliseconds()).assertLessOrEqual(999);
    })

    /**
     * @tc.number    SUB_AVS_TIME_DATE_1000
     * @tc.name      testDateSnapshot0010
     * @tc.desc      Verify the wall clock stays ahead of the startup uptime across repeated reads
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateSnapshot0010', 0, () => {
      for (let i = 0; i < 20; i++) {
        const wall: number = systemDateTime.getTime(false);
        const uptime: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
        expect(wall).assertLarger(0);
        expect(uptime).assertLarger(0);
        expect(uptime).assertLessOrEqual(wall);
      }
    })
  });
}
