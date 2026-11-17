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

export default function dateMatrix6Test(): void {
  describe('ReminderDateMatrix6Test', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX6_0100
     * @tc.name      testReminderDateMatrix60001
     * @tc.desc      Verify 2023-01-01 to 2023-01-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix60001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 1, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 1, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX6_0200
     * @tc.name      testReminderDateMatrix60002
     * @tc.desc      Verify 2023-02-01 to 2023-02-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix60002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 2, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 2, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX6_0300
     * @tc.name      testReminderDateMatrix60003
     * @tc.desc      Verify 2023-03-01 to 2023-03-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix60003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 3, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX6_0400
     * @tc.name      testReminderDateMatrix60004
     * @tc.desc      Verify 2023-04-01 to 2023-04-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix60004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 4, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 4, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX6_0500
     * @tc.name      testReminderDateMatrix60005
     * @tc.desc      Verify 2023-05-01 to 2023-05-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix60005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 5, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 5, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_DATE_MATRIX6_0600
     * @tc.name      testReminderDateMatrix60006
     * @tc.desc      Verify 2023-06-01 to 2023-06-11 spans 10 days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateMatrix60006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2023, 6, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2023, 6, 11, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 864000 - 2).assertTrue();
          expect(diff <= 864000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
