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

export default function invalidInputExtraTest(): void {
  describe('ReminderInvalidInputExtraTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_INVALID_INPUT_EXTRA_0100
     * @tc.name      testReminderInvalidInputExtra0001
     * @tc.desc      Verify hour 24 stays numeric and bounded.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderInvalidInputExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(24, 0);
          expect(value === value).assertTrue();
          expect(value > -86400).assertTrue();
          expect(value < 86400).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_INVALID_INPUT_EXTRA_0200
     * @tc.name      testReminderInvalidInputExtra0002
     * @tc.desc      Verify minute 60 matches hour one.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderInvalidInputExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 60);
          const expected: number = TimeConversion.timeToMillisecond(1, 0);
          expect(value === value).assertTrue();
          expect(value - expected >= -2).assertTrue();
          expect(value - expected <= 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_INVALID_INPUT_EXTRA_0300
     * @tc.name      testReminderInvalidInputExtra0003
     * @tc.desc      Verify negative hour wraps into the day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderInvalidInputExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(-1, 0);
          expect(value === value).assertTrue();
          expect(value > 0).assertTrue();
          expect(value < 86400).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_INVALID_INPUT_EXTRA_0400
     * @tc.name      testReminderInvalidInputExtra0004
     * @tc.desc      Verify large hour and minute exceed one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderInvalidInputExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(99, 99);
          expect(value === value).assertTrue();
          expect(value > 86400).assertTrue();
          expect(value < 400000).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_INVALID_INPUT_EXTRA_0500
     * @tc.name      testReminderInvalidInputExtra0005
     * @tc.desc      Verify negative minute wraps into the day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderInvalidInputExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, -1);
          expect(value === value).assertTrue();
          expect(value > 0).assertTrue();
          expect(value < 86400).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_INVALID_INPUT_EXTRA_0600
     * @tc.name      testReminderInvalidInputExtra0006
     * @tc.desc      Verify month zero differs from month twelve by twelve months.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderInvalidInputExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 0, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 12, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 31104000 - 2).assertTrue();
          expect(diff <= 31104000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_INVALID_INPUT_EXTRA_0700
     * @tc.name      testReminderInvalidInputExtra0007
     * @tc.desc      Verify month thirteen differs from month one by twelve months.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderInvalidInputExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 13, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -31104000 - 2).assertTrue();
          expect(diff <= -31104000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_INVALID_INPUT_EXTRA_0800
     * @tc.name      testReminderInvalidInputExtra0008
     * @tc.desc      Verify day zero differs from day one by one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderInvalidInputExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 0, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 86400 - 2).assertTrue();
          expect(diff <= 86400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_INVALID_INPUT_EXTRA_0900
     * @tc.name      testReminderInvalidInputExtra0009
     * @tc.desc      Verify day thirty two differs from day one by thirty one days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderInvalidInputExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 32, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -2678400 - 2).assertTrue();
          expect(diff <= -2678400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_INVALID_INPUT_EXTRA_1000
     * @tc.name      testReminderInvalidInputExtra0010
     * @tc.desc      Verify hour twenty four differs from hour zero by one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderInvalidInputExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 1, 1, 24, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 1, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= -86400 - 2).assertTrue();
          expect(diff <= -86400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

  });
}
