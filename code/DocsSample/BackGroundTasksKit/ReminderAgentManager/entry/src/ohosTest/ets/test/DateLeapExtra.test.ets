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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import TimeConversion from '../../../main/ets/util/TimeConversion';
import { installCaseIsolation } from './TestRuntime';

export default function dateLeapExtraTest(): void {
  describe('ReminderDateLeapExtraTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_DATE_LEAP_EXTRA_0100
     * @tc.name      testReminderDateLeapExtra0001
     * @tc.desc      Verify March first is two days after leap day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateLeapExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 2, 29, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -172800 - 2).assertTrue();
          expect(diff <= -172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_LEAP_EXTRA_0200
     * @tc.name      testReminderDateLeapExtra0002
     * @tc.desc      Verify Year 2020 leap day follows February 28.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateLeapExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2020, 2, 28, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2020, 2, 29, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 86400 - 2).assertTrue();
          expect(diff <= 86400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_LEAP_EXTRA_0300
     * @tc.name      testReminderDateLeapExtra0003
     * @tc.desc      Verify Year 2020 leap day precedes March first.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateLeapExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2020, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2020, 2, 29, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -172800 - 2).assertTrue();
          expect(diff <= -172800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_LEAP_EXTRA_0400
     * @tc.name      testReminderDateLeapExtra0004
     * @tc.desc      Verify Year 1900 February boundary follows monthly convention.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateLeapExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(1900, 2, 28, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(1900, 3, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_LEAP_EXTRA_0500
     * @tc.name      testReminderDateLeapExtra0005
     * @tc.desc      Verify Year 2100 February boundary follows monthly convention.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateLeapExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2100, 2, 28, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2100, 3, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_LEAP_EXTRA_0600
     * @tc.name      testReminderDateLeapExtra0006
     * @tc.desc      Verify Year 2023 February boundary follows monthly convention.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateLeapExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 2, 28, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 3, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 259200 - 2).assertTrue();
          expect(diff <= 259200 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_LEAP_EXTRA_0700
     * @tc.name      testReminderDateLeapExtra0007
     * @tc.desc      Verify Six hour forward offset.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateLeapExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 6, 15, 6, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 6, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -21600 - 2).assertTrue();
          expect(diff <= -21600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_LEAP_EXTRA_0800
     * @tc.name      testReminderDateLeapExtra0008
     * @tc.desc      Verify Six hour backward offset.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateLeapExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 6, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 6, 15, 6, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 21600 - 2).assertTrue();
          expect(diff <= 21600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_LEAP_EXTRA_0900
     * @tc.name      testReminderDateLeapExtra0009
     * @tc.desc      Verify Twenty three hour offset.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateLeapExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 6, 15, 23, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 6, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -82800 - 2).assertTrue();
          expect(diff <= -82800 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_LEAP_EXTRA_1000
     * @tc.name      testReminderDateLeapExtra0010
     * @tc.desc      Verify One hour before next midnight.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateLeapExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 6, 16, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 6, 15, 23, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -3600 - 2).assertTrue();
          expect(diff <= -3600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

  });
}
