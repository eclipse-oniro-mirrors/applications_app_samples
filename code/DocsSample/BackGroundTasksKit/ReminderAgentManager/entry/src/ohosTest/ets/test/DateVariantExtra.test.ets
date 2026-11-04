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

export default function dateVariantExtraTest(): void {
  describe('ReminderDateVariantExtraTest', () => {
    /**
     * @tc.number    SUB_REMINDER_DATE_VARIANT_EXTRA_0100
     * @tc.name      testReminderDateVariantExtra0001
     * @tc.desc      Verify July day boundary spans one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateVariantExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 7, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 7, 2, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 86400 - 2).assertTrue();
          expect(diff <= 86400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_VARIANT_EXTRA_0200
     * @tc.name      testReminderDateVariantExtra0002
     * @tc.desc      Verify March day boundary spans one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateVariantExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2025, 3, 1, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2025, 3, 2, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 86400 - 2).assertTrue();
          expect(diff <= 86400 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_VARIANT_EXTRA_0300
     * @tc.name      testReminderDateVariantExtra0003
     * @tc.desc      Verify Year 2000 to 2001 spans one year.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateVariantExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2000, 12, 15, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2001, 12, 15, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 31536000 - 2).assertTrue();
          expect(diff <= 31536000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_VARIANT_EXTRA_0400
     * @tc.name      testReminderDateVariantExtra0004
     * @tc.desc      Verify Year 2010 to 2020 spans ten years.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateVariantExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2010, 5, 10, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2020, 5, 10, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 315360000 - 2).assertTrue();
          expect(diff <= 315360000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_VARIANT_EXTRA_0500
     * @tc.name      testReminderDateVariantExtra0005
     * @tc.desc      Verify Leap day to March first noon spans two and a half days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateVariantExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 2, 29, 0, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 3, 1, 12, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 216000 - 2).assertTrue();
          expect(diff <= 216000 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_DATE_VARIANT_EXTRA_0600
     * @tc.name      testReminderDateVariantExtra0006
     * @tc.desc      Verify Leap day noon to March first spans one and a half days.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderDateVariantExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const from: number = TimeConversion.dateToMillisecond(2024, 2, 29, 12, 0);
          const to: number = TimeConversion.dateToMillisecond(2024, 3, 1, 0, 0);
          const diff: number = to - from;
          expect(diff === diff).assertTrue();
          expect(diff >= 129600 - 2).assertTrue();
          expect(diff <= 129600 + 2).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
